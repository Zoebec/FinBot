# Bootstraps the FinBot virtual environment when run from PowerShell.

$ErrorActionPreference = "Stop"

python -m venv venv
. .\venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
