# RZX installer for Windows.
#   irm https://raw.githubusercontent.com/RegplayzOg/rzx/main/install.ps1 | iex
# Downloads the latest installer from the RZX releases and runs it silently.
# RZX updates itself from inside the app. To remove it, use Settings > Apps.
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$repo = 'RegplayzOg/rzx'
Write-Host 'Looking up the latest version...'
$latest = Invoke-RestMethod "https://github.com/$repo/releases/latest/download/latest.json"
$version = $latest.version
if (-not $version) { throw 'Could not work out the latest version.' }

$url = "https://github.com/$repo/releases/download/v$version/RZX_${version}_x64-setup.exe"
$file = Join-Path $env:TEMP "RZX_${version}_x64-setup.exe"
Write-Host "Downloading RZX $version..."
Invoke-WebRequest -Uri $url -OutFile $file -UseBasicParsing

Write-Host 'Installing...'
Start-Process -FilePath $file -ArgumentList '/S' -Wait
Remove-Item $file -Force -ErrorAction SilentlyContinue
Write-Host "RZX $version installed. Open it from the Start menu."
