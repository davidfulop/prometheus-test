# prometheus-test
Figuring out how to use Prometheus...

## set-up
Docker needs to be configured to output Prometheus-style metrics:
- Run `echo '{ "metrics-addr" : "127.0.0.1:9323", "experimental" : true }' > /etc/docker/daemon.json` is the file is not already present.
- Run `systemctl restart docker`.
