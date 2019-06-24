[CmdletBinding()]
param ([string]$ApiKey)

# Logging
Write-Information "Saving configuration for package 'sendgrid'"

# Save configuration
$context.SavePackageText("apiKey.txt", $ApiKey)
