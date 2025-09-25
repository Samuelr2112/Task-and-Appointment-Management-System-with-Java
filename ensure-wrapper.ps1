<#
ensure-wrapper.ps1

If this repo's Maven wrapper files are missing, run this script to either:
- generate the wrapper (if system `mvn` is installed), or
- print clear instructions to install Maven or to generate wrapper on another machine.

Usage (PowerShell):
  .\ensure-wrapper.ps1
#>

Write-Host "Checking for .mvn/wrapper/maven-wrapper.properties..." -ForegroundColor Cyan
$wrapperProps = Join-Path (Get-Location) '.mvn\wrapper\maven-wrapper.properties'
if (Test-Path $wrapperProps) {
    Write-Host "Maven wrapper properties already present: $wrapperProps" -ForegroundColor Green
    exit 0
}

Write-Host "Maven wrapper files are missing." -ForegroundColor Yellow

# Check for system mvn
Write-Host "Checking for system 'mvn'..." -ForegroundColor Cyan
$mvn = Get-Command mvn -ErrorAction SilentlyContinue
if ($null -ne $mvn) {
    Write-Host "Found system mvn at: $($mvn.Path). Generating wrapper..." -ForegroundColor Green
    try {
        & mvn -N wrapper:wrapper
        Write-Host "Wrapper generation attempted. Verify .mvn/wrapper exists." -ForegroundColor Green
    } catch {
        Write-Host "Failed to run 'mvn -N wrapper:wrapper': $_" -ForegroundColor Red
    }
    exit 0
}

Write-Host "No system Maven found. Two options:" -ForegroundColor Cyan
Write-Host "1) Install Maven locally and run: mvn -N wrapper:wrapper" -ForegroundColor White
Write-Host "   On Windows you can install via winget: winget install Apache.Maven" -ForegroundColor White
Write-Host "2) Generate the wrapper on another machine with Maven and copy .mvn/wrapper into this repo." -ForegroundColor White

Write-Host "If you want, I can add the .mvn/wrapper files to the repo for you (committing the wrapper jar)." -ForegroundColor Cyan

exit 0
