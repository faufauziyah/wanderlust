# Interactive GitHub Publisher for WanderPulse Travel App
param(
    [string]$RepoUrl = ""
)

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " WanderPulse - Push to GitHub" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan

# Check if Git is installed
$gitCmd = Get-Command git -ErrorAction SilentlyContinue
if (-not $gitCmd) {
    Write-Host "[!] Git is not installed on this machine." -ForegroundColor Yellow
    Write-Host "Install Git quickly by running in PowerShell:" -ForegroundColor White
    Write-Host "   winget install --id Git.Git -e --source winget" -ForegroundColor Cyan
    Write-Host "Or download Git from: https://git-scm.com/download/win" -ForegroundColor White
    exit 1
}

if ([string]::IsNullOrWhiteSpace($RepoUrl)) {
    Write-Host "Enter your GitHub repository URL:" -ForegroundColor White
    Write-Host "(Default: https://github.com/faufauziyah/wanderlust.git - Press Enter to use default)" -ForegroundColor DarkGray
    $inputUrl = Read-Host "GitHub Repo URL"
    if ([string]::IsNullOrWhiteSpace($inputUrl)) {
        $RepoUrl = "https://github.com/faufauziyah/wanderlust.git"
    } else {
        $RepoUrl = $inputUrl.Trim()
    }
}

if ([string]::IsNullOrWhiteSpace($RepoUrl)) {
    Write-Host "No URL provided. Exiting." -ForegroundColor Red
    exit 1
}

# Change directory to project root
Set-Location $PSScriptRoot

# Initialize git if not already initialized
if (-not (Test-Path ".git")) {
    Write-Host "Initializing new Git repository..." -ForegroundColor Cyan
    git init -b main
}

Write-Host "Staging and committing files..." -ForegroundColor Cyan
git add .
git commit -m "Initial commit: WanderPulse travel discovery web app"

Write-Host "Setting remote origin to $RepoUrl..." -ForegroundColor Cyan
git remote remove origin -ErrorAction SilentlyContinue
git remote add origin $RepoUrl
git branch -M main

Write-Host "Pushing to GitHub (main branch)..." -ForegroundColor Green
git push -u origin main

Write-Host "`nSUCCESS! Your project is now on GitHub at:" -ForegroundColor Green
Write-Host "   $RepoUrl" -ForegroundColor Yellow
Write-Host "`nTo enable free live website hosting (GitHub Pages):" -ForegroundColor Cyan
Write-Host "   1. Open your repository on GitHub." -ForegroundColor White
Write-Host "   2. Go to Settings > Pages." -ForegroundColor White
Write-Host "   3. Under 'Build and deployment' > Source, select 'GitHub Actions'." -ForegroundColor White
Write-Host "   4. Your site will be live at: https://<username>.github.io/<repo-name>/" -ForegroundColor Green
