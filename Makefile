build-app:
	docker build -t testapp .
.PHONY: build-app

run-app: build-app
	docker run -t -p 80:80 testapp
.PHONY: run-app
