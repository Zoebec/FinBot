#!/usr/bin/env bash
# Bootstraps the FinBot virtual environment when run from bash.

set -e

python -m venv venv
source venv/Scripts/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
