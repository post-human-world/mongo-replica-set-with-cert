# Build up Mongo replica set

This repository need you run a few commands to set up replica set and it uses *docker compose* to launch the replica set. The *docker compose* file will deploy 3 separate containers:

- mongo1
    - set as primary with priority 7
    - map container port `27017` to localhost `27021`
    - use *ssl1* folder and *mongo.pem* is renamed from *mongo1.pem*
- mongo2
- mongo3

All container are using one internal network so that them can connect to each other. Also they use same *mongod.cfg* and enabled X509 authentication.

In order to make my config file and bash script reusable, i decide to split `/mongodb/keys/ssl/` folder into three folder. Each folder remain files that container need and rename mongoX.pem (X represent container number) to mongo.pem. If you wonder how to generate certificate and key files, you can watch reference section.

# Usage

1. Build up all containers

```bash
docker compose up -d --build 
```

2. Run script in mongo1 terminal. The script will initialize replica configuration and create a root user. This script may cost 30 seconds, because it need to wait node to become primary

```bash
/config/init.sh
```

3. Access mongodb with url: `mongodb://tom-rs:jerry@localhost:27021/?directConnection=true&authMechanism=DEFAULT`

# Reference

- [Deploy a 3-Node MongoDB 4.0 Replica Set with X.509 Authentication + Self Signed Certificates](https://rossbulat.medium.com/deploy-a-3-node-mongodb-3-6-replica-set-with-x-509-authentication-self-signed-certificates-d539fda94db4)