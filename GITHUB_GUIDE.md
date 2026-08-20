# GitHub / Pages ガイド（栄冠ナイン攻略ビュー）

リポジトリ: `nh0003/private-contents`（**Public** 想定）  
デプロイ: **GitHub Actions** → GitHub Pages

---

## 初回セットアップ（まだなら）

### 1. リポジトリを Public にする

1. https://github.com/nh0003/private-contents/settings
2. 一番下 **Danger Zone** → **Change repository visibility** → **Public**

### 2. Pages の Source を Actions にする

1. https://github.com/nh0003/private-contents/settings/pages
2. **Build and deployment** → **Source:** `GitHub Actions`
3. 保存（初回は workflow 実行後に URL が出ることが多い）

### 3. デプロイを走らせる

`main` に push 済みなら **Actions** タブで「Deploy to GitHub Pages」が動きます。  
動かないときは Actions から **Run workflow**。

成功後の URL:

```
https://nh0003.github.io/private-contents/
```

---

## iPhone で見る

1. Safari で上記 URL を開く
2. 共有 → **ホーム画面に追加**（任意）

URL は共有しなければ他人は知りにくいです。ただし **知られれば誰でも開けます**（Public Pages）。

---

## 更新したとき

```powershell
cd "C:\Users\Naoya Hirota\Documents\Cursor\2026-08-20_栄冠ナイン攻略ビュー"
.\git-proxy.ps1 off   # 社内プロキシがあるとき
git add .
git commit -m "更新内容の説明"
git push
```

数分で Pages に反映されます。

---

## よくあるトラブル

| 症状 | 対処 |
|------|------|
| Actions が灰色／動かない | リポが Private のまま → Public に。Pages Source が Actions か確認 |
| Actions が赤い | Actions タブのログを確認。Pages の権限承認を求められたら Allow |
| 404 | デプロイ成功を待ってから再読込。URL 末尾の `/` 付きも試す |
| 古い画面 | Safari で再読み込み（キャッシュ） |

---

## 全体の流れ

```
1. リポを Public にする
2. Settings → Pages → Source: GitHub Actions
3. push（または Actions で手動実行）
4. https://nh0003.github.io/private-contents/ を iPhone で開く
```
