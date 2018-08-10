CID_FILE = /tmp/lzh-redis-cluster.cid
CID =`cat $(CID_FILE)`
IMAGE_NAME = lzh/redis-cluster:v1
PORTS = -p 7000:7000 -p 17000:17000 -p 7001:7001 -p 17001:17001 -p 7002:7002 -p 17002:17002 -p 7003:7003 -p 17003:17003 -p 7004:7004 -p 17004:17004 -p 7005:7005 -p 17005:17005
#PORTB = -p 17000:17000 -p 17001:17001 -p 17002:17002 -p 17003:17003 -p 17004:17004 -p 17005:17005

help:
	@echo "Please use 'make <target>' where <target> is one of"
	@echo "  build           build the docker image containing a redis cluster"
	@echo "  rebuild         rebuilds the image from scratch without using any cached layers"
	@echo "  run             run the built docker image"
	@echo "  bash            starts bash inside a running container."
	@echo "  clean           removes the tmp cid file on disk"
	@echo "  cli             run redis-cli inside the container on the server with port 7000"

build:
	@echo "Building docker image..."
	docker build -t ${IMAGE_NAME} .

rebuild:
	@echo "Rebuilding docker image..."
	docker build --no-cache=true -t ${IMAGE_NAME} .

run:
	@echo "Running docker image..."
	docker run $(PORTS) --cidfile $(CID_FILE) -i -t --privileged=true ${IMAGE_NAME}

bash:
	docker exec -it $(CID) /bin/sh

stop:
	docker stop $(CID)
	-make clean

clean:
	# Cleanup cidfile on disk
	-rm $(CID_FILE)

cli:
	docker exec -it $(CID) /redis/src/redis-cli -p 7000
