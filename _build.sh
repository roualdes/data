#!/bin/sh

python3 convert_notebooks.py && gitbook install && gitbook build
