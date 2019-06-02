# prometheus-test
Figuring out how to use Prometheus...

## set-up
Docker needs to be configured to output Prometheus-style metrics:
- Run `sudo touch /etc/docker/daemon.json` is the file is not already present.
- Paste ```{
  "metrics-addr" : "127.0.0.1:9323",
  "experimental" : true
}```, and save the file.
- Run `service docker restart`.
