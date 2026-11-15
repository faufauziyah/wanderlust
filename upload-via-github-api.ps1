# Upload project files directly to GitHub using the GitHub REST API (No git.exe required!)
param(
    [string]$Owner = "faufauziyah",
    [string]$Repo = "wanderlust",
    [string]$Branch = "main"
)

Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host " Direct GitHub API Uploader (faufauziyah/wanderlust)" -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Cyan

Write-Host "To push directly via API without Git installed, you need a GitHub Personal Access Token (classic or fine-grained with repo write permissions)." -ForegroundColor White
Write-Host "Generate one here if needed: https://github.com/settings/tokens" -ForegroundColor Cyan
$Token = Read-Host "Enter your GitHub Token"

if ([string]::IsNullOrWhiteSpace($Token)) {
    Write-Host "No token provided. Exiting." -ForegroundColor Red
    exit 1
}

$headers = @{
    "Authorization" = "Bearer $Token"
    "Accept"        = "application/vnd.github.v3+json"
    "User-Agent"    = "PowerShell-Uploader"
}

$baseDir = $PSScriptRoot
$files = Get-ChildItem -Path $baseDir -Recurse -File | Where-Object {
    $_.FullName -notmatch "\\\.git\\" -and
    $_.Name -notmatch "\.log$"
}

Write-Host "`nFound $($files.Count) files to sync to $Owner/$Repo ($Branch)..." -ForegroundColor Yellow

foreach ($file in $files) {
    $relativePath = $file.FullName.Substring($baseDir.Length).TrimStart('\', '/').Replace('\', '/')
    $apiUrl = "https://api.github.com/repos/$Owner/$Repo/contents/$relativePath"

    # Get file content in Base64
    $bytes = [System.IO.File]::ReadAllBytes($file.FullName)
    $base64Content = [Convert]::ToBase64String($bytes)

    # Check if file already exists to get SHA
    $sha = $null
    try {
        $existing = Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Get -ErrorAction Stop
        $sha = $existing.sha
    } catch {
        # File doesn't exist yet, proceed with creation
    }

    $bodyObj = @{
        message = "Add/update $relativePath"
        content = $base64Content
        branch  = $Branch
    }
    if ($sha) {
        $bodyObj["sha"] = $sha
    }

    $bodyJson = $bodyObj | ConvertTo-Json

    try {
        $resp = Invoke-RestMethod -Uri $apiUrl -Headers $headers -Method Put -Body $bodyJson -ContentType "application/json" -ErrorAction Stop
        Write-Host "  [OK] Uploaded: $relativePath" -ForegroundColor Green
    } catch {
        Write-Host "  [FAIL] Failed: $relativePath - $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "`nAll files processed for https://github.com/$Owner/$Repo!" -ForegroundColor Green
Write-Host "Your GitHub Pages site will be available at: https://$Owner.github.io/$Repo/" -ForegroundColor Yellow
