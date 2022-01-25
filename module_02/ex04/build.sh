#!/bin/bash

python -m venv tmp_env && source tmp_env/bin/activate

python3 -m pip install --upgrade pip wheel setuptools build

python3 -m build

pip install ./dist/my_minipack-1.0.0.tar.gz
pip install ./dist/my_minipack-1.0.0-py3-none-any.whl