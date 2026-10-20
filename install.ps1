# Run in PowerShell as Administrator, from the folder containing the .vst3
$dest = "$env:CommonProgramFiles\VST3"
$src  = Get-ChildItem -Directory -Filter *.vst3 -Path $PSScriptRoot | Select-Object -First 1
if (-not $src) { Write-Error "No .vst3 bundle found next to this script."; exit 1 }
New-Item -ItemType Directory -Force $dest | Out-Null
Copy-Item -Recurse -Force $src.FullName $dest
Write-Host "Installed $($src.Name) to $dest. Rescan plugins in your DAW."
