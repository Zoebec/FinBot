# Setup script for the FinBot project

# Start the python virutal environment and install dependencies
function venv_Setup() {
    Write-Host "[Setup] Setting up Python virtual environment and installing dependencies..."  -ForegroundColor Cyan
    try {
        # Check if venv directory already exists
        if (Test-Path -Path "venv") {
            Write-Host "[Setup] Virtual environment already exists. Skipping creation." -ForegroundColor Yellow
        }
        else {
            Write-Host "[Setup] Creating virtual environment..." -ForegroundColor Yellow
            python -m venv venv
        }
        Write-Host "[Setup] Activating virtual environment and installing dependencies..." -ForegroundColor Yellow
        .\venv\Scripts\Activate.ps1
        Write-Host "[Setup] Installing dependencies from requirements.txt..." -ForegroundColor Yellow
        pip install -r requirements.txt
    }
    catch {
        Write-Host "[Setup] An error occurred while setting up the environment: $($_.Exception.Message)" -ForegroundColor Red
    }
}

function ollama_Setup() {
    Write-Host "`n[Setup] Setting up Ollama..." -ForegroundColor Cyan
    try {
        Write-Host "[Setup] Checking if Ollama is installed..." -ForegroundColor Yellow
        $ollamaPath = (Get-Command ollama -ErrorAction SilentlyContinue).Source
        if ($ollamaPath) {
            Write-Host "[Setup] Ollama is already installed at $ollamaPath. Skipping installation." -ForegroundColor Yellow
        }
        else {
            Write-Host "[Setup] Installing Ollama..." -ForegroundColor Yellow
            # Install Ollama using winget (Windows Package Manager)
            winget install --id=Ollama.Ollama -e --source=winget
        }
    }
    catch {
        Write-Host "[Setup] An error occurred while setting up Ollama: $($_.Exception.Message)" -ForegroundColor Red
    }
}

function finbot_Setup() {
    # Check if finbot is already created with ollama
    Write-Host "`n[Setup] Setting up FinBot Ollama model..." -ForegroundColor Cyan
    try {
        $models = ollama list
        if ($models -match "finbot") {
            Write-Host "[Setup] FinBot model already exists in Ollama. Skipping creation." -ForegroundColor Yellow
        }
        else {
            Write-Host "[Setup] Creating FinBot model in Ollama..." -ForegroundColor Yellow
            ollama create FinBot -f .\Modelfile
        }
    }
    catch {
        Write-Host "[Setup] An error occurred while setting up the FinBot model: $($_.Exception.Message)" -ForegroundColor Red
    }
    Write-Host "`n[Setup] FinBot setup is complete! You can now run the main script." -ForegroundColor Green
}
# Main
Write-Host "[Setup] Starting setup for FinBot project..." -ForegroundColor Green
venv_Setup
ollama_Setup
finbot_Setup