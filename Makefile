TAG:=8.0.287
IMAGE:=andreburgaud/d8

default: help

help:
	@echo 'V8/D8 ${TAG} Docker image build file'
	@echo
	@echo 'Usage:'
	@echo '    make clean           Delete dangling images and d8 images'
	@echo '    make build           Build the d8 image using local Dockerfile'
	@echo '    make push            Push an existing image to Docker Hub'
	@echo '    make deploy          Clean, build and push image to Docker Hub'
	@echo '    make github          Tag the project in GitHub'
	@echo

build:
	docker build --build-arg V8_VERSION=${TAG} -t ${IMAGE}:${TAG} .

clean:
	# Remove containers with exited status:
	docker rm `docker ps -a -f status=exited -q` || true
	docker rmi ${IMAGE}:latest || true
	docker rmi ${IMAGE}:${TAG} || true
	# Delete dangling images
	docker rmi `docker images -f dangling=true -q` || true

push:
	docker push docker.io/${IMAGE}:${TAG}
	docker tag ${IMAGE}:${TAG} docker.io/${IMAGE}:latest
	docker push docker.io/${IMAGE}:latest

deploy: clean build push

github:
	git push
	git tag -a ${TAG} -m 'Version ${TAG}'
	git push origin --tags


.PHONY: help build clean push deploy github
