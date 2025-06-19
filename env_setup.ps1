<#
  open-conda.ps1

  → Hardcode your Anaconda install location, target Conda env name, and working directory below.
  → Save this file and double-click (or run in PowerShell) to launch a new shell
    with your env activated and your project folder loaded.
#>

# ─────────── EDIT THESE ───────────
# Full path to your Anaconda or Miniconda root folder:
$AnacondaRoot = 'C:\Users\cococ\anaconda3'

# Name of the Conda environment you want to activate:
$EnvName       = 'LLMafia-env'

# Directory you want to cd into after activation:
$TargetDir     = 'C:\Users\cococ\Documents\GitHub\LLMafia'
# ───────────────────────────────────

# (No further edits needed below.)

# Build path to the Conda PowerShell hook script
$hookScript = Join-Path $AnacondaRoot 'shell\condabin\conda-hook.ps1'

# Construct the commands for the new PowerShell window
$psCommand = @"
# Enable `conda` in this shell
& '$hookScript'

# Activate the hard-coded environment
conda activate '$EnvName'

# Change to your project directory
Set-Location -Path '$TargetDir'
"@

# Launch a new PowerShell window, keep it open after running the commands
Start-Process wt.exe -ArgumentList @(
    'new-tab',
    'powershell.exe',
    '-NoExit',
    '-ExecutionPolicy', 'Bypass',
    '-Command', $psCommand
)
