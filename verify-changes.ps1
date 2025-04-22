# PowerShell script to verify repository status
$gitPath = 'C:\Program Files\Git\bin\git.exe'

Write-Host "Checking repository status..."
Write-Host "----------------------------------------"

# Check current branch
Write-Host "Current branch:"
& $gitPath branch --show-current

Write-Host "`nRecent commits:"
& $gitPath log --oneline -n 5

Write-Host "`nRemote repository status:"
& $gitPath remote -v

Write-Host "`nWorking directory status:"
& $gitPath status

Write-Host "`nPress any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") 