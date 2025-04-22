# PowerShell script to commit recent changes
$gitPath = 'C:\Program Files\Git\bin\git.exe'

Write-Host "Committing recent changes..."
Write-Host "----------------------------------------"

# Add all changes
Write-Host "Adding files..."
& $gitPath add .

# Create commit
Write-Host "Creating commit..."
$commitMessage = "Update: Add widget trees and project structure documentation"
& $gitPath commit -m $commitMessage

# Push changes
Write-Host "Pushing to GitHub..."
& $gitPath push origin master

Write-Host "`nPress any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") 