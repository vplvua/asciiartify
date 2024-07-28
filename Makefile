APP=$(shell basename $(shell git remote get-url origin) .git)
VERSION=$(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
REGISTRY=gcr.io/prometheus-429509
TAG=$(REGISTRY)/$(APP):$(VERSION)

image:
	docker buildx build -t $(TAG) .

run:
	docker run -it --rm -p 8080:80 $(TAG)

clean:
	rm -rf build
	docker rmi $(TAG)

push:
	docker push $(TAG)