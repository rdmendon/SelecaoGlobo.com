git clone https://github.com/dockersamples/docker-pets.git
cd docker-pets/web
docker build -t docker-pets .
docker run -it -p 5000:5000 docker-pets