all: build

build: convert
	gitbook build

serve: convert
	gitbook serve

convert:
	python convert_notebooks.py
