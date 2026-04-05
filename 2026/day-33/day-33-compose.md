# Day 33 – Docker Compose: Multi-Container Basics

## Task
Today's goal is to **run multi-container applications with a single command**.

Yesterday I manually created networks and volumes and ran containers one by one. Docker Compose does all of that in one YAML file.

---

## Challenge Tasks

### Task 1: Install & Verify
1. Check if Docker Compose is available on your machine
2. Verify the version

![img](images/11.png)  


---

### Task 2: Your First Compose File
1. Create a folder `compose-basics`
2. Write a `docker-compose.yml` that runs a single **Nginx** container with port mapping
3. Start it with `docker compose up`
4. Access it in your browser
5. Stop it with `docker compose down`

![img](images/21.png) 
![img](images/211.png)   
![img](images/22.png)   

---

### Task 3: Two-Container Setup
Write a `docker-compose.yml` that runs:
- A **WordPress** container
- A **MySQL** container

They should:
- Be on the same network (Compose does this automatically)
- MySQL should have a named volume for data persistence
- WordPress should connect to MySQL using the service name

Start it, access WordPress in your browser, and set it up.

**Verify:** Stop and restart with `docker compose down` and `docker compose up` — is your WordPress data still there?

![img](images/31.png)   

![img](images/32.png)   

![img](images/33.png)   

![img](images/34.png)    

![img](images/35.png)    

---

### Task 4: Compose Commands
Practice and document these:
1. Start services in **detached mode**
  - docker compose up -d
    ![img](images/41-compose-up.png)
    
2. View running services
  - docker compose ps
    ![img](images/42-compose-ps.png)
    
3. View **logs** of all services
  - docker compose logs -f
    ![img](images/43-compose-logs-all.png)
    
4. View logs of a **specific** service
  - docker compose logs -f <service_name>
    eg: docker compose logs -f wordpress
    ![img](images/44-compose-logs-specific.png)
    
5. **Stop** services without removing
  - docker compose stop
    ![img](images/45-compose-stop.png)
    
6. **Remove** everything (containers, networks)
  - docker compose down
    ![img](images/46-compose-down.png)   

7. **Rebuild** images if you make a change
  - docker compose up --build
    ![img](images/47-compose-rebuild-images.png)   


---

### Task 5: Environment Variables
1. Add environment variables directly in your `docker-compose.yml`
  ![img](images/51.png)

2. Create a `.env` file and reference variables from it in your compose file
  ![img](images/52.png)

3. Verify the variables are being picked up
  - docker compose config
  ![img](images/53.png)   

---

## Hints
- Start: `docker compose up -d`
- Stop: `docker compose down`
- Logs: `docker compose logs -f`
- Compose creates a default network for all services automatically
- Service names in compose are the DNS names containers use to talk to each other

---
