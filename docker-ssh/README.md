

## Docker SSH

### Build
    
    docker build -t mcarr/sshd .

### Run

    docker run -d -t mcarr/sshd

### Example connection:

    ssh root@localhost -p 49156

