# Workflow

1. docker-compose up
2. run `/config/init.sh` in mongo1 terminal
3. Access mongodb with url: `mongodb://tom-rs:jerry@localhost:27021/?directConnection=true&authMechanism=DEFAULT` 

# Introduction

In order to make my config file and bash script reusable, i decide to split `/mongodb/keys/ssl/` folder into three folder. Each folder remain files that container need and rename mongoX.pem (X represent container number) to mongo.pem. If you wonder how to generate certificate and key files, you can watch reference section.

# Reference

- [Create a replica set in MongoDB with Docker Compose](https://blog.tericcabrel.com/mongodb-replica-set-docker-compose/)
- [Deploy a 3-Node MongoDB 4.0 Replica Set with X.509 Authentication + Self Signed Certificates](https://rossbulat.medium.com/deploy-a-3-node-mongodb-3-6-replica-set-with-x-509-authentication-self-signed-certificates-d539fda94db4)