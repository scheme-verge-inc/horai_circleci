REGISTRY := asia-northeast1-docker.pkg.dev/horai-dev-scheme-verge-v2/circleci

PYTHON_VERSION_TAG := $(or $(PYTHON_VERSION),latest)
PYTHON_VERSION_BUILD_ARG := $(if $(PYTHON_VERSION),--build-arg PYTHON_VERSION=$(PYTHON_VERSION))
NODE_VERSION_BUILD_ARG := $(if $(NODE_VERSION),--build-arg NODE_VERSION=$(NODE_VERSION))

docker-build-python:
	docker build \
		--no-cache \
		--platform linux/amd64 \
		$(PYTHON_VERSION_BUILD_ARG) \
		$(NODE_VERSION_BUILD_ARG) \
		-t $(REGISTRY)/python:$(PYTHON_VERSION_TAG) \
		-f .circleci/images/Dockerfile.python \
		.circleci/images

docker-push-python:
	docker push $(REGISTRY)/python:$(PYTHON_VERSION_TAG)
