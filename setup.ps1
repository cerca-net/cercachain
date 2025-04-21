# Install dependencies
npm install

# Create necessary directories if they don't exist
$directories = @(
    "src/components/common",
    "src/components/layout",
    "src/pages",
    "src/hooks",
    "src/services/api",
    "src/services/utils",
    "src/types",
    "src/store",
    "src/styles",
    "src/config",
    "public/assets"
)

foreach ($dir in $directories) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force
    }
}

Write-Host "Setup completed successfully!" 