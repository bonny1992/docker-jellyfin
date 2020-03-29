IMAGE := bonny1992/jellyfin-rclone
$(eval RELEASE = $(shell curl -sX GET "https://api.github.com/repos/jellyfin/jellyfin/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]'))

echo:
	@echo RELEASE is $(RELEASE)

test:
	true

image:
	docker build -t $(IMAGE):latest -t $(IMAGE):$(RELEASE) .

push-image:
	docker push $(IMAGE):$(RELEASE)
	docker push $(IMAGE):latest


.PHONY: all image push-image test