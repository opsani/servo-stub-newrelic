IMG_NAME ?= opsani/servo-stub-newrelic
IMG_TAG ?= latest
GIT_DIR ?= servo-newrelic

container:
	rm -rvf $(GIT_DIR)
	git clone --depth=1 https://github.com/opsani/servo-stub-newrelic.git $(GIT_DIR)
	mv $(GIT_DIR)/measure .
	rm -rvf $(GIT_DIR)
	docker build . -t $(IMG_NAME):$(IMG_TAG)

push:
	docker push $(IMG_NAME):$(IMG_TAG)
