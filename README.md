# What it does  
This script will look for .torrent files into a given folder.
Then it will randomly select a file and simulate sending a part of this file.
Sending simulation is done by telling tracker a chunk of 250 MiB has been sent and 
waiting for 2400 seconds (resulting in a uploading rate of 100 kiB/s).


**Note** : It is recommended to have at least one file larger than 1 Gib in torrents folder.

# Requirements  

## Working with docker  


## Working in native environment  
I could do the effort to list all dependancies to run this application natively.
But if you don't want to use docker as I recommend, I assume you are familiar with computer science.
So you will find by yourself everything you need to run without docker.

# Setup  

## Docker installation  


## Native installation  
You should'nt do this.
