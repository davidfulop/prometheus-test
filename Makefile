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
