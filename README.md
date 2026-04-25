# FinBot Setup Notes

## Start working in the virtual environment

From the `FinBot` folder, activate the virtual environment in PowerShell:

```powershell
. .\venv\Scripts\Activate.ps1
```

If it worked, your prompt should show `(venv)`.

## Run the project

After the environment is active, use:

```powershell
python .\gdelt_lookup.py
```

Install or refresh dependencies with:

```powershell
pip install -r requirements.txt
```

## Why this matters

The virtual environment keeps this project's Python packages separate from the rest of your computer. That makes installs more predictable and avoids conflicts with other projects.

## When you are done

Leave the virtual environment with:

```powershell
deactivate
```

## Reminder

Running `.\start.ps1` does not usually leave your current PowerShell session activated after the script ends. If you want to write code, test, and run commands interactively, activate the environment yourself with:

```powershell
. .\venv\Scripts\Activate.ps1
```
