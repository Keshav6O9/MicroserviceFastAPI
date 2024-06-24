install:
	#install commands
	pip install --upgrade pip &&\
	pip install -r requirements.txt
format:
	#format code
	black *.py mylib/*.py
lint:
	#flaske8 or #pylint
test:
	#test
deploy:
	#deploy
all: install lint test deploy
