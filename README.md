## Node.js app with SQL Server on Docker
Use this service to practise https://labs.play-with-docker.com or install Docker on your machine.


## Prerequisites:

You will need:

- a copy of the application source code
- a Docker ID

Clone the source code from GitHub:

```git 
git clone https://github.com/eugenZab/lunch-learn.git
```

This will make a copy of the lab’s repo in a new sub-directory called lunch-learn
And browse to the source code folder:

```shell
cd lunch-learn
```

Save your Docker ID
You need a Docker ID to push your images to Docker Hub. If you don’t have one, create a free Docker ID at Docker Hub.

Now save your Docker ID in an environment variable - you need to type this command manually with your own Docker ID:

```shell
export dockerId='eugz'
```

Be sure to use your own Docker ID.
Check your Docker ID gets displayed when you read the variable:

```shell
echo $dockerId
```

## Example 1
#### Node.js APP Docker image build and run

Now build the Docker image, which uses lunch-and-learn-app/Dockerfile to package the source code on top of the official Node.js image:
```shell
docker image build --tag $dockerId/lunch-and-learn-app:v1 --file lunch-and-learn-app/Dockerfile ./lunch-and-learn-app
```
Run a container from that image to start the app:
```shell
docker container run --detach --publish 8080:8080 $dockerId/lunch-and-learn-app:v1
```
Docker will start a container from the application image, which runs npm start to start the app. You can browse to the application on port 8080:

If you make some changes and refresh the browser, you’ll see your changes get lost. That’s because the events are only stored in memory on the client.

In the next step you’ll fix that.

Now clear up all the containers from the previous part:
```shell
docker container rm --force $(docker container ls --quiet)
```

## Example 2
#### Node.js APP + SQL Server Docker compose build and run

You’ll use Docker Compose to build and run the application. The compose file specifies the database and application containers to run, and how to configure them.

The compose file also contains the path to the application Dockerfile and to the database Dockerfile, so you can build the database and application images with one command:

```shell
docker-compose build
```
When that completes, you’ll have two Docker images:

- <your-docker-id>/lunch-and-learn-db:v2 - which is based on Microsoft’s SQL Server image and packages the database schema for the event board

- <your-docker-id>/lunch-and-learn-app:v2 - which is the new version of the Node.js application, using SQL Server to store events

You can start the whole app with Docker Compose:
```shell
docker-compose up -d
```
You’ll see compose starts the database first, because it’s specified as a dependency for the application container. Then it starts the app container.

If you list all containers, you’ll see there are two instances of the app container.
```shell
docker container ls --all
```

You’ll see it’s the same user interface, but now you can add and delete events and when you refresh the page they’re still there. The data is persisted in SQL Server.

The SQL Server database is not publicly available. In the docker-compose.yml file, the web container, the port 8080 is published so you can send traffic in, but no ports are published for the database. It’s only available to other containers and to Docker.
