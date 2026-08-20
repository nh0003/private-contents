# 栄冠ナイン 攻略ビュー（パワプロ2026）

隠し日程・スケジュールカード・戦術試合・能力説明（基礎／金・青・赤特）を、同じ画面のタブで確認できる非公式ビューです。

- 単一 HTML（`index.html`）のみで動作します（ビルド不要）
- PC・スマホ両対応（レスポンシブ）

## ローカルで見る

`index.html` をブラウザで開くか、フォルダで簡易サーバを立ててください。

```powershell
cd "C:\Users\Naoya Hirota\Documents\Cursor\2026-08-20_栄冠ナイン攻略ビュー"
# 例: Python がある場合
python -m http.server 8080
```

ブラウザで `http://localhost:8080` を開きます。

## GitHub / Pages

手順は [GITHUB_GUIDE.md](./GITHUB_GUIDE.md) を参照。

想定リポジトリ名: `eikan-nine-guide`  
（トレーニング管理アプリ `training-manager` とは別リポジトリ）

公開後の URL 例:

```
https://nh0003.github.io/eikan-nine-guide/
```

## 社内ネットでの git

プロキシ切り替えは `git-proxy.ps1`（トレーニング管理アプリと同じ方式）を使えます。

```powershell
.\git-proxy.ps1 status
.\git-proxy.ps1 off          # GitHub へ直接
.\git-proxy.ps1 once push -u origin main
```

## 注意

ゲーム公式ではありません。攻略サイト情報を再構成した個人用ビューです。
