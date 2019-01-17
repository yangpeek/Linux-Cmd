5. the way I run the Docker file
   5.0.  docker-machine create --virtualbox-cpu-count "6" --virtualbox-memory "8192" -d virtualbox default // creae docker machine for the right cpu and memory config
   5.1.  eval "$(docker-machine env default)" // set docker machine environment virable
   5.2.  docker build -t TAG -f Dockerfile . // build docker image
   5.3.  docker run -tid image_id     // start a docker container
   5.4.  docker exec -it TAG / id bash // get into container 
   5.5.  docker stop container_id     // stop docker container
   5.6.  docker ps | docker ps -a     // list all docker containers
   5.7.  docker rm container_id       // remove a docker container
   5.8.  docker images                // list all docker images
   5.9.  docker rmi image_id          // remove a docker image
   5.10. docker rm -v $(docker ps -a -q -f status=exited)  // remove all exited docker containers
   5.11. docker system prune          // prune all dangling images, containers, network, etc

1. AWS command support:

  1.1 eb cli docker container
  
   - all documents to install eb cli on-line almost not good)
   
   - https://hub.docker.com/r/paulodiovani/aws-eb-cli/

   ```
   alias eb='docker run --rm -t $(tty &>/dev/null && echo "-i") -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" -v "$(pwd):/project" -v "${HOME}/.ssh:/root/.ssh" paulodiovani/aws-eb-cli'
   ```
   
   - eb init 
   
   - eb XXX
