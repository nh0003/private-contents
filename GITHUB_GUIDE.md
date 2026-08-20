# GitHub / Pages ガイド（栄冠ナイン攻略ビュー）

トレーニング管理アプリ（Web版）と同じ流れです。**リポジトリは別**にしてください。

---

## このプロジェクトの特徴

- **静的 HTML 1枚**（`index.html`）だけ
- Vite / npm / GitHub Actions は不要
- Pages は「ブランチからデプロイ」で十分

---

## 手順 1: GitHub に空リポジトリを作る

1. [https://github.com](https://github.com) にログイン（アカウント例: `nh0003`）
2. 右上 **＋** → **New repository**
3. 設定:
   - **Repository name:** `private-contents`
   - **Private**
   - **Add a README** は **チェックしない**（空のまま）
4. **Create repository**

作成リンク（ログイン済みなら）:  
https://github.com/new?name=private-contents

> `training-manager` とは別名にしてください。

---

## 手順 2: このフォルダを push

PowerShell:

```powershell
cd "C:\Users\Naoya Hirota\Documents\Cursor\2026-08-20_栄冠ナイン攻略ビュー"

# 社内プロキシがある場合は一度 OFF（または once）
.\git-proxy.ps1 off

# remote は設定済みの想定。未設定なら:
# git remote add origin https://github.com/nh0003/private-contents.git
git push -u origin main
```

※ すでに `git init`・初回コミット・`origin` 設定済みなら `git push -u origin main` だけでOKです。

### 認証

初回 push でログインを求められたら、Password 欄には **Personal Access Token** を使います（GitHub → Settings → Developer settings → Tokens）。

---

## 手順 3: GitHub Pages を有効化

1. リポジトリの **Settings** → **Pages**
2. **Build and deployment**
   - **Source:** `Deploy from a branch`
   - **Branch:** `main` / `/ (root)`
3. **Save**

数分待つと公開 URL が表示されます。

```
https://nh0003.github.io/eikan-nine-guide/
```

（リポジトリ名を変えた場合は URL の末尾も変わります）

---

## スマホで見る

1. Safari / Chrome で上記 URL を開く
2. 必要なら「ホーム画面に追加」

---

## 更新したとき

```powershell
cd "C:\Users\Naoya Hirota\Documents\Cursor\2026-08-20_栄冠ナイン攻略ビュー"
.\git-proxy.ps1 off   # 必要なら
git add .
git commit -m "更新内容の説明"
git push
```

Pages は通常、数分以内に反映されます。

---

## よくあるトラブル

| 症状 | 対処 |
|------|------|
| push 認証エラー | PAT を使う／`.\git-proxy.ps1 off` |
| 404 | Pages の Branch が `main` / root か確認。`index.html` があるか確認 |
| 白い画面 | ほぼ起きない（JS のみ）。キャッシュ削除して再読込 |
| remote が既にある | `git remote -v` で確認。別名なら `git remote set-url origin <URL>` |

---

## 全体の流れ

```
1. GitHub で eikan-nine-guide を新規作成（空）
2. このフォルダで git remote add → git push
3. Settings → Pages → main / root
4. 表示された URL をスマホ・PC で開く
```
