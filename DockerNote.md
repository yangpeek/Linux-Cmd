### 0. the way I run the Docker file

   *  docker-machine create --virtualbox-cpu-count "6" --virtualbox-memory "8192" -d virtualbox default // creae docker machine for the right cpu and memory config
   *  eval "$(docker-machine env default)" // set docker machine environment virable
   *  docker build -t TAG -f Dockerfile . // build docker image
   *  docker run -tid image_id     // start a docker container
   *  docker exec -it TAG / id bash // get into container 
   *  docker stop container_id     // stop docker container
   *  docker ps | docker ps -a     // list all docker containers
   *  docker rm container_id       // remove a docker container
   *  docker images                // list all docker images
   *  docker rmi image_id          // remove a docker image
   * docker rm -v $(docker ps -a -q -f status=exited)  // remove all exited docker containers
   * docker stop $(docker ps -a -q)
   * docker rm $(docker ps -a -q)
   * docker system prune          // prune all dangling images, containers, network, etc

### 1. Docker Tools:

##### 1.1 eb cli docker container
  
   * all documents to install eb cli on-line almost not good)
   * https://hub.docker.com/r/paulodiovani/aws-eb-cli/
   ```
   alias eb='docker run --rm -t $(tty &>/dev/null && echo "-i") -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" -v "$(pwd):/project" -v "${HOME}/.ssh:/root/.ssh" paulodiovani/aws-eb-cli'
   ```   
   * eb init 
   * eb XXX
   
### 1.2 avro-cli coker container

   ```
   docker run -v `pwd`:/share coderfi/avro-tools tojson --pretty /share/${file} > ${file}.json
   ```
