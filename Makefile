IMG_NAME ?= opsani/servo-stub-newrelic
IMG_TAG ?= latest

container:
	docker build . -t $(IMG_NAME):$(IMG_TAG)

push:
	docker push $(IMG_NAME):$(IMG_TAG)
