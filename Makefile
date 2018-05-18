TAG:=6.8.246

default: help

help:
	@echo 'V8/D8 ${TAG} Docker image build file'
	@echo
	@echo 'Usage:'
	@echo '    make clean           Delete dandling and d8 images'
	@echo '    make build           Build the d8 image using local Dockerfile'
	@echo '    make push            Push an existing image to Docker Hub'
	@echo

build:
	docker build --build-arg V8_VERSION=${TAG} -t d8:${TAG} .

clean:
	# Remove containers with exited status:
	docker rm `docker ps -a -f status=exited -q` || true
	docker rmi d8:latest || true
	docker rmi d8:${TAG} || true
	# Delete dangling images
	docker rmi `docker images -f dangling=true -q` || true

push:
	docker tag d8:${TAG} docker.io/andreburgaud/d8:${TAG}
	docker push docker.io/andreburgaud/d8:${TAG}
