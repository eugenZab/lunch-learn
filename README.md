# lunch-learn


https://labs.play-with-docker.com

# Docker image build and run

- git clone https://github.com/eugenZab/lunch-learn.git

- cd lunch-learn

- export dockerId='eugz'

- echo $dockerId

- docker image build --tag $dockerId/lunch-and-learn-app:v1 --file lunch-and-learn-app/Dockerfile ./lunch-and-learn-app

- docker container run --detach --publish 8080:8080 $dockerId/lunch-and-learn-app:v1

- docker container rm --force $(docker container ls --quiet)


# Docker compose build and run

- git clone https://github.com/eugenZab/lunch-learn.git

- cd lunch-learn

- export dockerId='eugz'

- echo $dockerId

- docker-compose build

- docker-compose up -d

- docker container ls --all
