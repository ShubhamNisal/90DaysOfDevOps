const express = require("express");
const { Client } = require("pg");
const { createClient } = require("redis");
const os = require("os");

const app = express();
const PORT = 3000;

const DATABASE_URL = process.env.DATABASE_URL;
const REDIS_HOST = process.env.REDIS_HOST;

/* ---------------- DB INIT ---------------- */
async function initDb() {
  const client = new Client({ connectionString: DATABASE_URL });
  await client.connect();

  await client.query(`
    CREATE TABLE IF NOT EXISTS traffic (
      id SERIAL PRIMARY KEY,
      hits INTEGER NOT NULL
    );
  `);

  await client.end();
}

/* ---------------- ROUTE ---------------- */
app.get("/", async (req, res) => {
  const db = new Client({ connectionString: DATABASE_URL });
  const redis = createClient({ url: `redis://${REDIS_HOST}:6379` });

  try {
    await db.connect();
    if (!redis.isOpen) await redis.connect();

    // Fetch traffic
    const result = await db.query("SELECT hits FROM traffic WHERE id=1");

    let hits;
    if (result.rows.length > 0) {
      hits = result.rows[0].hits + 1;
      await db.query("UPDATE traffic SET hits=$1 WHERE id=1", [hits]);
    } else {
      hits = 1;
      await db.query("INSERT INTO traffic (id, hits) VALUES (1, $1)", [hits]);
    }

    // Cache
    await redis.set("snapshot", hits);
    const cached = await redis.get("snapshot");

    const redisStatus = redis.isOpen ? "#3fb950" : "#f85149";
    const hostname = os.hostname();

    await db.end();
    await redis.quit();

    /* ---------------- UI ---------------- */
    res.send(`
<!DOCTYPE html>
<html>
<head>
<title>Runtime Metrics</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;500;700&display=swap" rel="stylesheet">
<style>
body {
  margin:0;
  font-family: 'Inter', sans-serif;
  background:#0d1117;
  color:#e6edf3;
  display:flex;
}

/* Sidebar */
.sidebar {
  width:220px;
  background:#161b22;
  height:100vh;
  padding:20px;
}
.sidebar h2 {
  font-size:18px;
}
.sidebar small {
  opacity:0.6;
}

/* Main */
.main {
  flex:1;
  padding:30px;
}

/* Header */
.header {
  display:flex;
  justify-content:space-between;
  margin-bottom:25px;
}

/* Grid */
.grid {
  display:grid;
  grid-template-columns: repeat(2, 1fr);
  gap:20px;
}

/* Cards */
.card {
  background:#161b22;
  padding:20px;
  border-radius:12px;
}

/* Metric */
.metric {
  font-size:40px;
  margin-top:10px;
}

/* Bar */
.bar {
  height:6px;
  background:#30363d;
  margin-top:10px;
  border-radius:10px;
  overflow:hidden;
}
.fill {
  height:100%;
  width:0%;
  background:#2f81f7;
  transition:1s;
}

/* Status */
.dot {
  width:10px;
  height:10px;
  border-radius:50%;
  display:inline-block;
  margin-left:8px;
}

/* Footer */
.footer {
  margin-top:30px;
  font-size:12px;
  opacity:0.5;
}
</style>
</head>

<body>

<div class="sidebar">
  <h2>⚙️ Control Panel</h2>
  <small>Live system metrics</small>
</div>

<div class="main">

  <div class="header">
    <h2>📊 Runtime Dashboard</h2>
    <div>Instance: <b>${hostname}</b></div>
  </div>

  <div class="grid">

    <div class="card">
      <div>Total Requests</div>
      <div id="count" class="metric">0</div>
      <div class="bar"><div id="bar1" class="fill"></div></div>
    </div>

    <div class="card">
      <div>Cached Snapshot</div>
      <div class="metric">${cached}</div>
      <div class="bar"><div id="bar2" class="fill"></div></div>
    </div>

    <div class="card">
      <div>Database</div>
      <div>Connected <span class="dot" style="background:#3fb950"></span></div>
    </div>

    <div class="card">
      <div>Cache</div>
      <div>Active <span class="dot" style="background:${redisStatus}"></span></div>
    </div>

  </div>

  <div class="footer">
    Express • PostgreSQL • Redis • Dockerized
  </div>

</div>

<script>
let target = ${hits};
let current = 0;

function animate(){
  current += Math.ceil(target/25);
  if(current >= target) current = target;

  document.getElementById("count").innerText = current;
  document.getElementById("bar1").style.width = (current/target)*100 + "%";

  if(current < target){
    requestAnimationFrame(animate);
  }
}
animate();

setTimeout(()=>{
  document.getElementById("bar2").style.width = "70%";
},300);
</script>

</body>
</html>
    `);

  } catch (err) {
    res.status(500).send("Error: " + err.message);
  }
});

/* ---------------- START SERVER ---------------- */
app.listen(PORT, "0.0.0.0", async () => {
  console.log("Starting server...");
  await initDb();
  console.log(`Running on port ${PORT}`);
});
