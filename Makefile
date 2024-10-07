# Variables
REGISTRY = localhost:5000
MY_SERVER_IMAGE = my-server
FRONT_END_IMAGE = front-end
TAG = latest

# Build image
.PHONY: build
build:
	docker build -t $(MY_SERVER_IMAGE) ./my-server
	docker build -t $(FRONT_END_IMAGE) ./front-end

# Tag images
.PHONY: tag
tag:
	docker tag $(MY_SERVER_IMAGE):$(TAG) $(REGISTRY)/$(MY_SERVER_IMAGE):$(TAG)
	docker tag $(FRONT_END_IMAGE):$(TAG) $(REGISTRY)/$(FRONT_END_IMAGE):$(TAG)

# Push images
.PHONY: push
push:
	docker push $(REGISTRY)/$(MY_SERVER_IMAGE):$(TAG)
	docker push $(REGISTRY)/$(FRONT_END_IMAGE):$(TAG)

# All
.PHONY: all
all: build tag push