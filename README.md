

# Docker projects


Optional Switches

-p 8080:80				: Used for port forwarding
-b /vagrant/scratch/html:/var/www	: expose a directory from the filesystem on the host


Here is a sample syntax to mount /home/data folder to a docker container as /data
docker run -v /home/data:/data ubuntu bash
