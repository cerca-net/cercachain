# PowerShell script to verify recent commits
$gitPath = 'C:\Program Files\Git\bin\git.exe'

Write-Host "Checking recent commits..."
Write-Host "----------------------------------------"

# Show all commits with dates
Write-Host "Recent commits with dates:"
& $gitPath log --pretty=format:"%h - %s (%cr)" --date=relative -n 10

Write-Host "`nDetailed changes in last commit:"
& $gitPath show --name-status HEAD

Write-Host "`nPress any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") 