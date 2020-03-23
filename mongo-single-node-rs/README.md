# MongoDB Single Node Replica Set For Dev Environment

This folder contains an example of a single node RS that is automatically setup and ready to use in docker-compose.

# How to do this without docker-compose?

Add the following aliases in your `.bashrc` or `.bash_aliases` file.

```sh
alias mdb='docker run --rm -d -p 27017:27017 --name mongo mongo:4.2.3 --replSet=test && sleep 3 && docker exec mongo mongo --eval "rs.initiate();"'
alias m='docker exec -it mongo mongo --quiet'
```

Use `mdb` to start a single node RS quickly and `m` to connect to it.

When you are done. Just `docker stop mongo` to kill this instance definitely.

# Author

- Maxime BEUGNET <maxime.beugnet@gmail.com>
