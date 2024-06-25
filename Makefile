install:
	#install commands
	pip install --upgrade pip &&\
	pip install -r requirements.txt
format:
	#format code
	black *.py mylib/*.py
lint:
	#flaske8 or #pylint
	pylint --disable=R,C *.py mylib/*.py
test:
	#test
	python -m pytest -vv --cov=mylib test_logic.py
build:
	#build container
	docker build -t deploy-fastapi .
run:
	#run docker
	docker run -p 127.0.0.1:8080:8080 70258f566b1d
deploy:
	#deploy
	aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 851725287143.dkr.ecr.ap-south-1.amazonaws.com
	docker build -t wiki .
	docker tag wiki:latest 851725287143.dkr.ecr.ap-south-1.amazonaws.com/wiki:latest
	docker push 851725287143.dkr.ecr.ap-south-1.amazonaws.com/wiki:latest
all: install lint test deploy
