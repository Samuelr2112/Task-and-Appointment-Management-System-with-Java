<#
verify-environment.ps1

Checks common prerequisites for this repository on Windows PowerShell:
- Java (JDK 17) availability and version
- Maven wrapper presence and version (`mvnw.cmd`)
- Port 8080 availability (useful to know if the app can bind)

Run from the project root in PowerShell:
  .\verify-environment.ps1

#>

Write-Host "Repository environment check for apptaskmanager" -ForegroundColor Cyan
Write-Host "Project root: $(Get-Location)" -ForegroundColor DarkCyan

# 1) Java
Write-Host "`n1) Checking Java..." -ForegroundColor Yellow
$javaCmd = Get-Command java -ErrorAction SilentlyContinue
if ($null -eq $javaCmd) {
    Write-Host "  java executable not found in PATH." -ForegroundColor Red
    Write-Host "  Install a JDK 17 (e.g. Temurin/OpenJDK 17) and ensure 'java' is on PATH." -ForegroundColor Red
} else {
    try {
        $verOutput = & java -version 2>&1
        Write-Host "  java detected:" -ForegroundColor Green
        $verOutput | ForEach-Object { Write-Host "    $_" }
    } catch {
        Write-Host "  Failed to run 'java -version' (exit code: $LASTEXITCODE)" -ForegroundColor Red
    }
}

# 2) Maven wrapper
Write-Host "`n2) Checking Maven wrapper (mvnw.cmd)..." -ForegroundColor Yellow
if (Test-Path -Path .\mvnw.cmd) {
    Write-Host "  mvnw.cmd found." -ForegroundColor Green
    try {
        & .\mvnw.cmd -v 2>&1 | ForEach-Object { Write-Host "    $_" }
    } catch {
        Write-Host "  Failed to run .\mvnw.cmd -v" -ForegroundColor Red
    }
} else {
    Write-Host "  mvnw.cmd not found in project root. Use a local Maven installation or add the wrapper." -ForegroundColor Red
}

# 3) Port availability (8080)
Write-Host "`n3) Checking TCP port 8080 on localhost..." -ForegroundColor Yellow
try {
    $test = Test-NetConnection -ComputerName localhost -Port 8080 -WarningAction SilentlyContinue
    if ($test.TcpTestSucceeded) {
        Write-Host "  Port 8080 is reachable (something may already be listening)." -ForegroundColor Yellow
    } else {
        Write-Host "  Port 8080 appears free (can bind)." -ForegroundColor Green
    }
} catch {
    Write-Host "  Could not test port 8080 (Test-NetConnection not available?)." -ForegroundColor Yellow
}

# 4) Quick action hints
Write-Host "`nNext steps (copy/paste):" -ForegroundColor Cyan
Write-Host "  # Run the app (PowerShell, from repo root):" -ForegroundColor DarkCyan
Write-Host "    .\\mvnw.cmd spring-boot:run" -ForegroundColor White
Write-Host "  # Run unit tests:" -ForegroundColor DarkCyan
Write-Host "    .\\mvnw.cmd test" -ForegroundColor White
Write-Host "  # Build a jar and run it:" -ForegroundColor DarkCyan
Write-Host "    .\\mvnw.cmd package; java -jar target\\apptaskmanager-0.0.1-SNAPSHOT.jar" -ForegroundColor White

Write-Host "`nIf you need, I can add an automated PowerShell check that fails the script when critical prerequisites are missing." -ForegroundColor Cyan
