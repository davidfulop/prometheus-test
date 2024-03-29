build-app:
	docker build -t testapp .
.PHONY: build-app

run-app: build-app
	docker run -t -p 80:80 testapp
.PHONY: run-app

run-system: build-app
	docker-compose up
.PHONY: run-system

clean-up:
	docker-compose down
.PHONY: clean-up


run-app-swarm: build-app
	docker service create --replicas 1 --publish published=80,target=80,protocol=tcp --name testapp testapp:latest
.PHONY: run-app-swarm

run-prom-swarm:
	docker service create --replicas 1 --name prometheus \
	--mount type=bind,source=$(shell pwd)/prometheus/prometheus.yml,destination=/etc/prometheus/prometheus.yml \
	--publish published=9090,target=9090,protocol=tcp \
	prom/prometheus:v2.9.2
.PHONY: run-prom-swarm

run-swarm: run-prom-swarm run-app-swarm
.PHONY: run-swarm

clean-up-swarm:
	docker service remove testapp
.PHONY: clean-up-swarm


run-prom-kube:
	eval $$(minikube docker-env); \
	kubectl delete configmap cfg-prom; \
	kubectl create configmap cfg-prom --from-file=prometheus/prometheus.yml; \
	kubectl apply -f k-prometheus.yml;
.PHONY: run-prom-kube

run-app-kube:
	eval $$(minikube docker-env); \
	docker build -t testapp .; \
	kubectl apply -f k-testapp.yml;
.PHONY: run-app-kube

update-prom-cfg:
	kubectl delete configmap cfg-prom; \
	kubectl create configmap cfg-prom --from-file=prometheus/prometheus.yml; \
	kubectl delete pod $(shell kubectl get pod --selector=app=prometheus --output=jsonpath={.items..metadata.name})
.PHONY: update-prom-cfg

unset-docker-vars:
	unset `env|grep DOCKER|cut -d\= -f1`
.PHONY: unset-docker-vars
