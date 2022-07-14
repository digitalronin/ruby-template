TAG := ruby-template

build: .built

.built: Dockerfile Gemfile Gemfile.lock
	docker build -t $(TAG) .
	touch .built

shell: .built
	docker run --rm \
		-w /app \
		-v $$(pwd):/app \
		-it $(TAG) bash
