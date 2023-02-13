.PHONY: all run rm

all:
	docker build -t bao-cc .

run:
	docker run --name bao-cc-inst -v /home/vov/Git:/home/vov/Git:z --rm -it bao-cc

rm:
	docker rm bao-cc
