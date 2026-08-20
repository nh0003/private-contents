# Git プロキシ切り替えスクリプト
# 使い方:
#   .\git-proxy.ps1 on      → プロキシ経由（社内ネット等）
#   .\git-proxy.ps1 off     → 直接接続（GitHub 等）
#   .\git-proxy.ps1 status  → 現在の状態を表示
#   .\git-proxy.ps1 once    → 今の1コマンドだけプロキシなしで実行（例: once push）

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
        Write-Host "状態: プロキシ ON" -ForegroundColor Yellow
        Write-Host "  http.proxy  = $http"
        Write-Host "  https.proxy = $https"
    } else {
        Write-Host "状態: 直接接続（プロキシ OFF）" -ForegroundColor Green
    }
    if (Test-Path $SavedProxyFile) {
        Write-Host "保存済みプロキシ: $(Get-Content $SavedProxyFile -Raw)"
    }
}

switch ($Action) {
    'on' {
        $ProxyUrl | Set-Content $SavedProxyFile -NoNewline
        git config --global http.proxy $ProxyUrl
        git config --global https.proxy $ProxyUrl
        Write-Host "プロキシを ON にしました: $ProxyUrl" -ForegroundColor Yellow
        Show-Status
    }
    'off' {
        # プロキシ URL はファイルに保存したまま、Git 設定だけ外す
        if (-not (Test-Path $SavedProxyFile)) {
            $ProxyUrl | Set-Content $SavedProxyFile -NoNewline
        }
        git config --global --unset http.proxy 2>$null
        git config --global --unset https.proxy 2>$null
        Write-Host "プロキシを OFF にしました（直接接続）" -ForegroundColor Green
        Write-Host "URL は $SavedProxyFile に保存済みです。on で復元できます。"
        Show-Status
    }
    'status' {
        Show-Status
    }
    'once' {
        if ($GitArgs.Count -eq 0) {
            Write-Host "使い方: .\git-proxy.ps1 once push -u origin main"
            exit 1
        }
        Write-Host "プロキシなしで実行: git $($GitArgs -join ' ')" -ForegroundColor Cyan
        & git -c http.proxy= -c https.proxy= @GitArgs
    }
}
