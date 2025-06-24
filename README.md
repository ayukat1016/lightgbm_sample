# LightGBM予測モデル実装ハンドブック
書籍 [LightGBM予測モデル実装ハンドブック](https://www.amazon.co.jp/dp/479806761X) のサポートサイトです。本書籍で使用するサンプルコードを提供します。

<img width="184" alt="lightgbm_cover" src="https://github.com/ayukat1016/lightgbm_sample/assets/40778791/ac373ff9-d220-402a-ad3e-fb86e0ddb3ed"></a>


## 章の構成
- 第1章：予測モデルの概要
- 第2章：回帰の予測モデル
- 第3章：分類の予測モデル
- 第4章：回帰の予測モデル改善
- 第5章：LightGBMへの発展

## サンプルコードの構成
コードは章に合わせて、`chapter`ごとに分けて管理しています。なお、`.ipynb_checkpoints` や `chapter5/exoTrain.csv` は `.gitignore` により Git 管理から除外されています。

## 正誤表
| No | ページ | 誤 | 正 | 補足 |
|:--:|:-----------|:------------|:------------|:------------|
| 1  | p4 謝辞 | 株式会社ウェブフォーマ ー| 株式会社ウェブファーマー| 会社名の記載ミス  |
| 2  | p17 上部  | 当月の月末までの取引量を | 今月の月末までの取引量を | 誤字  |
| 3  | p60 回帰係数  | $`\mathbf{w}^{*T}=(w_{0}^{*},w_{1}^{*},\cdots ,w_{m}^{*})`$ | $`\mathbf{w}^{*T}=(w_{1}^{*},w_{2}^{*},\cdots ,w_{m}^{*})`$ | 数式の誤記載  |
| 4  | p112～232 SHAPの引数 | feature_pertubation | feature_perturbation | GitHubコードの2_4、3_3、4_3の引数は修正済み |
| 5  | p129 前処理後のincome件数内訳の実行結果 | <=50K   24720、>50K      7841 | <=50K   21999、>50K      7171 | 誤って前処理前の件数を記載  |
| 6  | p306 中央 | インデックスj関係は以下の関係になります。 | インデックスjは以下の関係になります。 | 誤字  |
| 7  | p340 1本目の木の可視化 | figsize=(20,20) | figsize=(20, 20) | スペースを追加  |

## エラー発生時の問い合わせ
サンプルコードの間違いや動作不具合は本リポジトリのIssuesに投稿してください。

動作不具合についての投稿では、以下を記載してください。

- 実行プログラム名
- エラーメッセージ
- ライブラリのバージョン

その他問い合わせはメールアドレス ayukat101699@gmail.com までお願いします。

## ライブラリのバージョン
動作確認したライブラリのバージョンは執筆時点の[Google Colaboratory](https://colab.google/)の最新バージョンになります。Colab環境は定期的にバージョン更新するので、プログラム実行時にエラーが発生する場合、記載のバージョンに戻して実行してください。Docker環境及びPoetry環境は記載のバージョンでライブラリを固定してます。
- Python:3.10.11
- pandas:1.5.3
- numpy:1.22.4
- matplotlib:3.7.1
- seaborn:0.12.2
- scikit-learn:1.2.2
- graphviz:0.20.1
- xgboost:1.7.5
- lightgbm:3.3.5
- shap:0.41.0
- optuna:3.1.1
- plotly:5.13.1

## Google Colaboratoryの実行環境
[Google Colaboratory](https://colab.google/)はクラウドのJupyter Notebook環境を提供します。1.3節の手順を参考に初期設定して、Googleドライブにサンプルコードを格納して、Notebookを開いて実行してください。

## Dockerコンテナの実行環境
PCのDockerコンテナ環境でサンプルコードを実行できるよう`Dockerfile`を用意しました。以下の手順を参考に環境構築して、[Jupyter Lab](https://jupyterlab.readthedocs.io/en/latest/#)のNotebookを開いて実行してください。

- 前提条件
    - Windows(WSL2)やMacなどコマンドライン実行が可能なPC
    - [Git](https://git-scm.com/)がインストール済み
    - [Docker](https://www.docker.com/ja-jp/)がインストール済み
    - [Pyenv](https://github.com/pyenv/pyenv)と[Poetry](https://python-poetry.org/)がインストール済み（ただし、ライブラリを変更しないのであればインストール不要。）
      - [Pyenv](https://github.com/pyenv/pyenv)はPythonのバージョンを管理します。
      - [Poetry](https://python-poetry.org/)はライブラリバージョンの依存関係を解決し、`requirements.txt`を出力します。`requirements.txt`はビルドで使用します。

- コマンドラインでリポジトリをgit cloneし、ディレクトリ`lightgbm_sample`に移動します。
```sh
# リポジトリの取得
$ git clone https://github.com/ayukat1016/lightgbm_sample.git

# ディレクトリの移動
$ cd lightgbm_sample/

# ディレクトリの確認(`/xxx/repository`のディレクトリはユーザーにより異なります。)
$ pwd
/home/xxx/repository/lightgbm_sample

# ファイルの確認
$ ls
Dockerfile  LICENSE  README.md  chapter2  chapter3  chapter4  chapter5  poetry.lock  pyproject.toml  requirements.txt
```

- `Dockerfile`を指定して、imageをビルドします。

```sh
# ビルド
$ docker build --platform linux/amd64 -t lightgbm_sample:lightgbm_sample_1.0.0 -f Dockerfile .
```

- imageを指定してコンテナを起動、コンテナ内でJupyter Labのコマンドを実行します。サンプルコードのNotebookは`-v`オプションでコンテナ内にマウントします。

```sh
# コンテナ起動＋Jupyter Lab実行
$ docker run -it --rm --name lightgbm_sample -v $PWD:/opt -p 8888:8888 lightgbm_sample:lightgbm_sample_1.0.0 jupyter lab --ip=0.0.0.0 --allow-root --NotebookApp.token=''
```

- webブラウザのURL [http://localhost:8888](http://localhost:8888) にアクセスし、サンプルコードを実行します。

- 終了するには Ctrlキー + C を押下してください。このとき、コンテナは自動的に停止、削除されます。

## Poetryを使用したPython実行環境
PCの仮想環境でサンプルコードを実行できるよう`pyproject.toml`を用意しました。以下の手順を参考に環境構築して、[Jupyter Lab](https://jupyterlab.readthedocs.io/en/latest/#)のNotebookを開いて実行してください。

- 前提条件
    - Windows(WSL2)やMacなどコマンドラインの実行が可能なPC    
    - [Git](https://git-scm.com/)がインストール済み
    - [Pyenv](https://github.com/pyenv/pyenv)がインストール済み
    - [Poetry](https://python-poetry.org/)がインストール済み

- コマンドラインでリポジトリをgit cloneし、ディレクトリ`lightgbm_sample`に移動します。
```sh
# リポジトリの取得
$ git clone https://github.com/ayukat1016/lightgbm_sample.git

# ディレクトリの移動
$ cd lightgbm_sample/

# ディレクトリの確認(`/xxx/repository`のディレクトリはユーザーにより異なります。)
$ pwd
/home/xxx/repository/lightgbm_sample

# ファイルの確認
$ ls
Dockerfile  LICENSE  README.md  chapter2  chapter3  chapter4  chapter5  poetry.lock  pyproject.toml  requirements.txt
```

- PyenvでPythonのバージョンを指定します。
```sh
# Pythonのインストール
$ pyenv install 3.10.11

# バージョンの指定
$ pyenv local 3.10.11

# バージョンの確認
$ pyenv versions
  system
* 3.10.11
```

- Poetryの仮想環境を構築し、仮想環境に`pyproject.toml`で指定したライブラリをインストールします。
```sh
# 仮想環境の構築
$ poetry install

# 仮想環境の確認
$ poetry env list
lightgbm-sample-qPUWcycm-py3.10 (Activated)
```

- 決定木の可視化に使用するGraphvizをインストールします。Pythonパッケージだけでなく、システムの graphviz CLI も必要です

```sh
# graphvizのインストール(実行時にsudoパスワードを入力)
$ sudo apt update
$ sudo apt install -y graphviz

# graphvizの確認
$ dot -V
dot - graphviz version 2.43.0 (0)
```
- poetryの仮想環境で、Jupyter Labのコマンドを実行します。

```sh
# 仮想環境起動＋Jupyter Lab実行
$ poetry run jupyter lab --NotebookApp.token='' --port=8888
```

- webブラウザのURL [http://localhost:8888](http://localhost:8888) にアクセスし、サンプルコードを実行します。

- 終了するには Ctrlキー + C を押下してください。

- Docker コンテナで Jupyter Notebook を使用した後は、以下のように `.ipynb_checkpoints` を削除してください。これらは root 権限で作成されるため、Poetry 環境（通常ユーザー）でアクセスするとエラーになります。

```sh
$ sudo find . -type d -name ".ipynb_checkpoints" -exec rm -rf {} +
```

## 変更履歴
| 日付          | 変更内容                                                             |
| :------------ | :------------------------------------------------------------------- |
| 2023/06/17 　 | 初版　                                                               |
| 2023/08/16 　 | 初版の正誤表を追加 　                                                 |
| 2024/03/19 　 | Dockerコンテナの実行環境を追加                                |
| 2024/05/05 　 | 正誤表の更新                                |
| 2024/05/07 　 | Poetryを使用したPython実行環境を追加                               |
| 2024/07/17 　 | 記載の見直し                               |
| 2024/08/01 　 | Issues#9,#10を正誤表に反映                               |
| 2025/03/04 　 | 正誤表のNo列の追加                               |
| 2025/06/24 　 | DockerでJupyter Notebookを実行した後のPoetry実行手順を追記        |