FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl

WORKDIR /app

COPY app.sh .

RUN chmod +x app.sh

EXPOSE 3000

CMD ["./app.sh"]
