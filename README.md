# What it does  
This script will look for .torrent files into a given folder.
Then it will randomly select a file and simulate sending a part of this file.
Sending simulation is done by telling tracker a chunk of 250 MiB has been sent and 
waiting for 2400 seconds (resulting in a uploading rate of 100 kiB/s).


**Note** : It is recommended to have at least one file larger than 1 Gib in torrents folder.

This sequence will be scheduled to start at 18:00 UTC each day.

Multiple configurations are ready-to-use and modifying uploading rate:
- Sweet - in order to slowly increment uploaded amount
- Standard - the one I recommended 
- Aggressive - you maybe want to avoid this one

# Requirements  

## Working with docker  
You just need to install :
- docker
- docker compose (whichever version)
- make

## Working in native environment  
I could do the effort to list all dependancies to run this application natively.
But if you don't want to use docker as I recommend, I assume you are familiar with computer science.
So you will find by yourself everything you need to run without docker.

# Setup  

## Docker installation  
If you want to use the good way and run this application with docker you just need to :
- `nano ratiomaster.env`  
  Modify ratiomaster.env file to match your need (configuration file and number of consecutive runs)
- `make build`  
  Build image
- `TORRENTS_DIR=/path/to/torrents/dir/ make install`  
  Install image linking to torrent repository
- `docker start ratiomaster_services_1`  
  Run docker

Optionnally you can schedule an auto restart with  
`docker update --restart unless-stopped ratiomaster_services_1`

## Native installation  
You should'nt do this.
