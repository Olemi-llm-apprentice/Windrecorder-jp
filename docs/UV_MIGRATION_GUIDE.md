# Poetryからuvへの移行ガイド

## 概要

このプロジェクトはPoetryからuvへの移行を完了しました。uvはRustで書かれた高速なPythonパッケージマネージャーで、pip、pip-tools、pipx、poetry、pyenv、twine、virtualenvなどの機能を統合したツールです。

## uvの主な特徴

- **10-100倍高速**: pipと比較して10-100倍高速
- **統合ツール**: pip、poetry、virtualenvなどの機能を1つのツールで提供
- **自動仮想環境管理**: `.venv`を自動的に検出・使用
- **プロジェクト管理**: lockfile、workspace、スクリプト実行などをサポート
- **pip互換インターフェース**: 既存のワークフローと互換性あり

## 公式ドキュメント

- **公式サイト**: https://docs.astral.sh/uv/
- **GitHub**: https://github.com/astral-sh/uv
- **インストール**: https://docs.astral.sh/uv/getting-started/installation/

## インストール方法

### Windows

```powershell
powershell -Command "irm https://astral.sh/uv/install.ps1 | iex"
```

または、`install_update.bat`を実行すると自動的にインストールされます。

## 基本的な使い方

### 仮想環境の作成

```bash
uv venv
```

デフォルトで`.venv`ディレクトリに仮想環境が作成されます。

### 依存関係のインストール

```bash
# プロジェクトをeditableモードでインストール（推奨）
uv pip install -e .

# pyproject.tomlから依存関係をインストール
uv pip install -r pyproject.toml

# 個別のパッケージをインストール
uv pip install package_name
```

### スクリプトの実行

```bash
# uv runを使用（推奨）
uv run python script.py

# streamlitアプリの実行
uv run streamlit run app.py
```

`uv run`は自動的に`.venv`を検出して使用します。`activate`は不要です。

### 仮想環境の自動検出

uvは以下の順序で仮想環境を検出します：

1. `VIRTUAL_ENV`環境変数で指定された仮想環境
2. `CONDA_PREFIX`環境変数で指定されたConda環境
3. 現在のディレクトリまたは親ディレクトリの`.venv`

## 移行で変更した内容

### 1. バッチファイルの変更

#### `start_app.bat`
- **変更前**: `call .venv\Scripts\activate.bat` → `python main.py`
- **変更後**: `uv run python main.py`

#### `install_update.bat`
- **変更前**: Poetryコマンドを使用
- **変更後**: `uv venv`と`uv pip install -e .`を使用
- **修正**: `uv.exe`の存在チェックを`where uv`コマンドに変更

#### 拡張機能の`.bat`ファイル
すべての拡張機能の`.bat`ファイルで以下を変更：

- **変更前**: `for /F "tokens=* USEBACKQ" %%A in (\`python -m poetry env info --path\`) do call "%%A\Scripts\activate.bat"`
- **変更後**: 削除（`uv run`が自動的に仮想環境を使用）

- **変更前**: `poetry run pip install/uninstall`
- **変更後**: `uv pip install/uninstall`

- **変更前**: `python script.py`または`streamlit run app.py`
- **変更後**: `uv run python script.py`または`uv run streamlit run app.py`

### 2. ファイル構造

- `pyproject.toml`: 変更なし（uvは標準的な`pyproject.toml`をサポート）
- `poetry.lock`: `archive_poetry`ディレクトリに移動
- `.venv`: uvで作成された仮想環境（Poetryのものと同じ構造）

## uvのコマンドリファレンス

### 仮想環境管理

```bash
# 仮想環境を作成
uv venv

# 特定のPythonバージョンで仮想環境を作成
uv venv --python 3.11

# 仮想環境をアクティブ化（通常は不要）
# Windows: .venv\Scripts\activate.bat
# Unix: source .venv/bin/activate
```

### パッケージ管理（pip互換インターフェース）

```bash
# パッケージをインストール
uv pip install package_name

# プロジェクトをeditableモードでインストール
uv pip install -e .

# pyproject.tomlから依存関係をインストール
uv pip install -r pyproject.toml

# パッケージをアンインストール
uv pip uninstall package_name

# インストール済みパッケージをリスト表示
uv pip list

# パッケージ情報を表示
uv pip show package_name
```

### スクリプト実行

```bash
# Pythonスクリプトを実行
uv run python script.py

# Streamlitアプリを実行
uv run streamlit run app.py

# 任意のコマンドを実行
uv run command_name
```

### プロジェクト管理（将来の拡張用）

```bash
# プロジェクトを初期化
uv init project_name

# 依存関係を追加
uv add package_name

# 依存関係を削除
uv remove package_name

# ロックファイルを生成
uv lock

# 依存関係を同期
uv sync
```

## 重要なポイント

1. **`activate`は不要**: `uv run`を使用すれば、仮想環境を自動的に検出・使用します
2. **`.venv`の自動検出**: 現在のディレクトリまたは親ディレクトリの`.venv`を自動的に検出します
3. **pip互換性**: `uv pip`コマンドは既存のpipワークフローと互換性があります
4. **高速**: pipと比較して10-100倍高速です

## トラブルシューティング

### uvが見つからない場合

```bash
# WindowsでPATHを確認
where uv

# 再インストール
powershell -Command "irm https://astral.sh/uv/install.ps1 | iex"
```

### 仮想環境が見つからない場合

```bash
# 仮想環境を作成
uv venv

# 依存関係をインストール
uv pip install -e .
```

## 参考リンク

- [uv公式ドキュメント](https://docs.astral.sh/uv/)
- [uv GitHub](https://github.com/astral-sh/uv)
- [uv pipインターフェース](https://docs.astral.sh/uv/pip/)
- [uv環境管理](https://docs.astral.sh/uv/pip/environments/)
- [uvパッケージ管理](https://docs.astral.sh/uv/pip/packages/)
- [Poetryからuvプロジェクトへの移行](https://docs.astral.sh/uv/guides/migration/pip-to-project/)

## 更新履歴

- 2025-01-XX: Poetryからuvへの移行を完了

