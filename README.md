# LightGBM予測モデル実装ハンドブック

<img width="184" alt="lightgbm_cover" src="https://github.com/ayukat1016/lightgbm_sample/assets/40778791/ac373ff9-d220-402a-ad3e-fb86e0ddb3ed"></a>

書籍「[LightGBM予測モデル実装ハンドブック](https://www.amazon.co.jp/dp/479806761X)」のサポートサイトです。本書籍で使用するサンプルコードがまとめてあります。

## 章の構成
- 第1章：予測モデルの概要
- 第2章：回帰の予測モデル
- 第3章：分類の予測モデル
- 第4章：回帰の予測モデル改善
- 第5章：LightGBMへの発展

## エラー発生時の問い合わせ
サンプルコードの間違いや動作不具合は本リポジトリのIssuesに投稿ください。

動作不具合についての投稿では、以下を記載ください。

- 実行プログラム名
- エラーメッセージ
- ライブラリバージョン

その他問い合わせは筆者メールアドレス ayukat101699@gmail.com までお願いします。

## ライブラリのバージョン
ライブラリは執筆時点のGoogle Colaboratoryの最新バージョンになります。Colabのライブラリは定期的に更新するので、プログラム実行時にエラーが発生する場合はバージョンを戻して実行してください。
- Python 3.10.11
- pandas 1.5.3
- numpy 1.22.4
- matplotlib 3.7.1
- seaborn 0.12.2
- scikit-learn 1.2.2
- graphviz 0.20.1
- xgboost 1.7.5
- lightgbm 3.3.5
- shap 0.41.0
- optuna 3.1.1
- plotly 5.13.1


## 正誤表
| ページ | 誤 | 正 | 補足 |
|:-----------|:------------|:------------|:------------|
| p4 謝辞 | 株式会社ウェブフォーマ ー| 株式会社ウェブファーマー| 会社名の記載ミス  |
| p17 上部  |当月の月末までの取引量を| 今月の月末までの取引量を| 誤字  |
| p306 中央 | インデックスj関係は以下の関係になります。| インデックスjは以下の関係になります。| 誤字  |
| p340 1本目の木の可視化 | figsize=(20,20)| figsize=(20, 20)| スペースを追加  |


## 変更履歴
| 日付          | 変更内容                                                             |
| :------------ | :------------------------------------------------------------------- |
| 2023/06/17 　 | 初版　                                                               |
| 2023/08/16 　 | 初版の正誤表を追加 　                                                 |
| 2024/03/19 　 | Docker環境でのjupyterlab実行手順を追加                                |

## Docker環境での実行
Colab環境とは別にPCのローカル実行できるようDocker環境の実行手順を記載します。

- 前提条件
    - WSL2やMACなどのPC実行環境
    - Gitがインストール済み
    - Dockerがインストール済み
    - pyenv/poetryがインストール済み（ただし、ライブラリのバージョンを変更しないのであればインストール不要。pyenvはPythonのバージョン管理、poetryはライブラリのバージョンの依存関係を解決し、Dockerfileで読み込むrequirements.txtを出力）

- コマンドラインでリポジトリをgit cloneし、ディレクトリ「lightgbm_sample」に移動します。(「/xxx/repository」はユーザにより異なります。)
```sh
$ git clone https://github.com/ayukat1016/lightgbm_sample.git

$ cd lightgbm_sample/

$ pwd
/home/xxx/repository/lightgbm_sample
```

- Dockerfileを指定して、imageをビルドします。

```sh
$ docker build --platform linux/amd64 -t lightgbm_sample:lightgbm_sample_1.0.0 -f $PWD/Dockerfile .
```

- imageを指定してコンテナを起動し、その中でjupyterlabを実行します。notebookはコンテナにマウントします。

```sh
$ docker run -it --rm --name ligthgbm_sample -v $PWD:/opt -p 8888:8888 lightgbm_sample:lightgbm_sample_1.0.0 jupyter lab --ip=0.0.0.0 --allow-root --NotebookApp.token='' --port=8888
```

- webブラウザのURLにアクセスします。URL: http://localhost:8888

- 利用終了時はコマンドラインで Ctrlキー + C を押下してください。