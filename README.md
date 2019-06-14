# prometheus-test
Figuring out how to use Prometheus...

## setup
Docker needs to be configured to output Prometheus-style metrics:
- Run `echo '{ "metrics-addr" : "127.0.0.1:9323", "experimental" : true }' > /etc/docker/daemon.json` if the file is not already present.
- Run `systemctl restart docker`.

## Run in Swarm
- Run `make run-swarm`. You can test the server by calling `localhost/values`, and Prometheus by calling `localhost:9090/targets`.
