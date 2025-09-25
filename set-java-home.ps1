<#
set-java-home.ps1

Usage: run from project root in PowerShell (requires admin only to change Machine env; this changes User env)
  powershell -NoProfile -ExecutionPolicy Bypass -File .\set-java-home.ps1

What it does:
- Detects the first JDK under 'C:\Program Files\Eclipse Adoptium' and sets it as the user's JAVA_HOME.
- Prepends the JDK's bin to the user's PATH if not already present.
- Prints instructions to restart shells.
#>

Write-Host "Setting JAVA_HOME from Eclipse Adoptium (if present)..." -ForegroundColor Cyan

$adoptiumRoot = 'C:\Program Files\Eclipse Adoptium'
if (-not (Test-Path $adoptiumRoot)) {
    Write-Host "Eclipse Adoptium folder not found at $adoptiumRoot. Please install Temurin 17 or adjust the script." -ForegroundColor Yellow
    exit 1
}

$jdkDir = Get-ChildItem -Path $adoptiumRoot -Directory | Where-Object { $_.Name -like 'jdk-17*' } | Select-Object -First 1
if (-not $jdkDir) {
    Write-Host "No JDK 17 installation found under $adoptiumRoot." -ForegroundColor Yellow
    exit 1
}

$jdkPath = $jdkDir.FullName
Write-Host "Found JDK: $jdkPath" -ForegroundColor Green

try {
    [Environment]::SetEnvironmentVariable('JAVA_HOME', $jdkPath, 'User')
    Write-Host "Set user JAVA_HOME = $jdkPath" -ForegroundColor Green
} catch {
    Write-Host "Failed to set JAVA_HOME: $_" -ForegroundColor Red
    exit 1
}

# Update user PATH to include the JDK bin at the front
$binPath = Join-Path $jdkPath 'bin'
$userPath = [Environment]::GetEnvironmentVariable('Path', 'User')
if ($userPath -notlike "*${binPath}*") {
    $newUserPath = $binPath + ';' + $userPath
    try {
        [Environment]::SetEnvironmentVariable('Path', $newUserPath, 'User')
        Write-Host "Prepended $binPath to user PATH" -ForegroundColor Green
    } catch {
        Write-Host "Failed to update user PATH: $_" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "User PATH already contains $binPath" -ForegroundColor Yellow
}

Write-Host "\nDirectly invoking the JDK's java executable (no restart required):" -ForegroundColor Cyan
& (Join-Path $binPath 'java.exe') -version

Write-Host "\nNote: Changes to User environment variables apply to new shells. Restart your terminal/IDE to pick up JAVA_HOME and updated PATH." -ForegroundColor Cyan

exit 0
