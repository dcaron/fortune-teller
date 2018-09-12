# Prerequisites

## Build app

* git
* JDK
* Maven
* IntelliJ


## Dockerize app
* Install Docker 
* Sign up for docker hub [https://hub.docker.com/]

## Deploy app
* sign up for Pivotal Network [https://account.run.pivotal.io/z/uaa/sign-up]
* Install pks CLI [https://docs.pivotal.io/runtimes/pks/1-1/installing-pks-cli.html]
* Install kubectl [https://docs.pivotal.io/runtimes/pks/1-1/installing-kubectl-cli.html]

# Exercise 1

## Goal

* Adapt the existing Spring Boot/Cloud Fortune Teller fortune-service to a Docker container and push to docker hub

## Steps 

* Clone https://github.com/dcaron/fortune-teller.git

### Main ```pom.xml```:
* Add the Spotify docker maven plugin to the main pom.xml so it creates a Docker container on ```mvn build``` 
* Add ```spring-cloud-starter-kubernetes``` dependency
* Remove ```spring-cloud-services-dependencies``` dependencyManagement

### fortune-service ```pom.xml```:
* Remove dependencies related to Spring Cloud and database drivers
* Add ```mysql-connector-java```

### Dockerfile
* Add Dockerfile to modules ```fortune-teller-fortune-service```

### bootstrap.yml
* Make sure appname is ```fortune-service```

### build and push
* mvn clean package
* docker push

# Exercise 2

## Goal

* Externalise config and deploy the fortune-service with a backing MySQL to k8s


## Steps

* create ```ConfigMap``` for database name
* create ```Secret``` for username/password

* create database ```Deployment``` injecting config and put a ```Service``` in front of it
* check the log of the database pod
* create fortune-service ```Deployment``` injecting config
* check the log of the fortune-service
* create fortune-service ```Service```
* kubectl port-forward --namespace default $POD 8080:8080
* check in browser

## Bring up k8s dashboard
* create kubeconfig.txt
* kubectl proxy
* http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/#!/secret?namespace=default

# Exercise 3

## Goal

* Dockerize and deploy the ```fortune-teller-ui``` and connect it to the ```fortune-service``` 

## Prerequisites

## Steps

### fortune-teller-ui ```pom.xml```:

* Remove dependencies related to ```spring-cloud-services```
* Add ```spring-cloud-starter-netflix-ribbon```, ```spring-cloud-starter-netflix-hystrix```, ```spring-cloud-starter-kubernetes-ribbon```

### FortuneService.java:
* make RestTemplate loadbalanced
* rename service in rest url to ```fortune-service```

### bootstrap.yml:
* Make appname ```fortune-teller-ui```

### application.yml:
* Remove ```pact``` profile config

### build and push
* mvn clean package
* docker push

## deploy to k8s

* create ```ConfigMap``` for default fortune

* create fortune-teller-ui ```Deployment``` injecting config
* check the log of the fortune-teller-ui
* kubectl port-forward --namespace default $POD 8080:8080
* create fortune-teller-ui ```Service``` with loadbalancer
* get external ip and check in browser


## Additional exercises

* look through actuators
* scale out
* remove fortune-service







