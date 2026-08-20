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

リポジトリ名: `private-contents`（`training-manager` とは別）  
remote: `https://github.com/nh0003/private-contents.git`

プライベートリポジトリ想定。GitHub Pages を使う場合はプラン制約に注意（無料枠では private からの Pages に制限あり）。
## 社内ネットでの git

プロキシ切り替えは `git-proxy.ps1`（トレーニング管理アプリと同じ方式）を使えます。

```powershell
.\git-proxy.ps1 status
.\git-proxy.ps1 off          # GitHub へ直接
.\git-proxy.ps1 once push -u origin main
```

## 注意

ゲーム公式ではありません。攻略サイト情報を再構成した個人用ビューです。
