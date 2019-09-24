IMG_NAME ?= opsani/servo-stub-newrelic
IMG_TAG ?= latest
GIT_DIR ?= servo-newrelic

container:
	docker build . -t $(IMG_NAME):$(IMG_TAG)

push:
	docker push $(IMG_NAME):$(IMG_TAG)
