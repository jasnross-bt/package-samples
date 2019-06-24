[CmdletBinding()]
param (
    $ApiKey,
    $FromAddress,
    $ToAddress,
    $Subject,
    $Body
)

# Logging
Write-Information "Submitting email from='$FromAddress' to='$ToAddress' subject='$Subject'."

# If API key is not passed as input parameter, use the value in the package configuration
if (!$ApiKey) {
    $ApiKey = $context.GetPackageText("apiKey.txt")
}
Write-Debug "apiKey='$ApiKey'."
if (!$ApiKey) {
    Write-Error "SendGrid API key is missing. It must be either provided to the task explicitly or stored in the sendgrid package configuration."
    exit
}

# Invoke SendGrid API
$headers = @{
    "authorization" = "Bearer $ApiKey";
    "content-type" = "application/json"
}

$request = @{
    "personalizations" = @(
        @{
            "to" = @(
                @{ "email" = $ToAddress; "name" = $ToAddress }
            );
            "subject" = $Subject
        }
    );
    "from" = @{
        "email" = $FromAddress;
        "name" = $FromAddress
    };
    "content" = @(
        @{
            "type" = "text/html";
            "value" = $Body
        }
    )
}
$requestText = $request | ConvertTo-Json -Depth 10

$ok = $false
try {
    Invoke-RestMethod -Uri "https://api.sendgrid.com/v3/mail/send" -Method Post -Headers $headers -Body $requestText
    $ok = $true
}
catch {
    Write-Host "Exception: $_"
}

# Set task outputs
if ($context) {
    $context.Outputs.ok = $ok
}
