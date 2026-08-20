# Git proxy switcher
# Usage:
#   .\git-proxy.ps1 on      -> use proxy
#   .\git-proxy.ps1 off     -> direct (GitHub etc.)
#   .\git-proxy.ps1 status  -> show status
#   .\git-proxy.ps1 once    -> run one git command without proxy (e.g. once push)

param(
    [Parameter(Position = 0)]
    [ValidateSet('on', 'off', 'status', 'once')]
    [string]$Action = 'status',

    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$GitArgs
)

$ProxyUrl = 'http://10.99.181.104:8080'
$SavedProxyFile = Join-Path $env:USERPROFILE '.git-proxy-url.txt'

function Show-Status {
    $http = git config --global --get http.proxy 2>$null
    $https = git config --global --get https.proxy 2>$null
    if ($http -or $https) {
        Write-Host "Status: proxy ON" -ForegroundColor Yellow
        Write-Host "  http.proxy  = $http"
        Write-Host "  https.proxy = $https"
    } else {
        Write-Host "Status: direct (proxy OFF)" -ForegroundColor Green
    }
    if (Test-Path $SavedProxyFile) {
        Write-Host "Saved proxy: $(Get-Content $SavedProxyFile -Raw)"
    }
}

switch ($Action) {
    'on' {
        $ProxyUrl | Set-Content $SavedProxyFile -NoNewline
        git config --global http.proxy $ProxyUrl
        git config --global https.proxy $ProxyUrl
        Write-Host "Proxy ON: $ProxyUrl" -ForegroundColor Yellow
        Show-Status
    }
    'off' {
        if (-not (Test-Path $SavedProxyFile)) {
            $ProxyUrl | Set-Content $SavedProxyFile -NoNewline
        }
        git config --global --unset http.proxy 2>$null
        git config --global --unset https.proxy 2>$null
        Write-Host "Proxy OFF (direct). URL saved at $SavedProxyFile" -ForegroundColor Green
        Show-Status
    }
    'status' {
        Show-Status
    }
    'once' {
        if ($GitArgs.Count -eq 0) {
            Write-Host "Usage: .\git-proxy.ps1 once push -u origin main"
            exit 1
        }
        Write-Host ("Running without proxy: git " + ($GitArgs -join ' ')) -ForegroundColor Cyan
        & git -c http.proxy= -c https.proxy= @GitArgs
    }
}
