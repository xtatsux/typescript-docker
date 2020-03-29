# typescript-docker

TypescriptのDocker開発環境を構築する試み。

## 参考
以下を参考に、環境構築を行う。

[TypeScriptでExpress.js開発するときにやることまとめ (docker/lint/format/tsのまま実行/autoreload) - Qiita](https://qiita.com/techneconn/items/012bdf1b9ff3881546b3)

## 記事に沿って実際にやったこと

* Dockerfileを書く
* docker-compose.ymlを書く
* VSCodeのRemote Developmentで`Reopen in Container`を選択して、コンテナ起動＞コンテナ内でエディタを起動
* `src/index.js`を書いて保存。統合ターミナルを開いて、`npm run dev`してサンプルを起動
→一旦ここまではOK

ソースコードを書き換えたら自動で変更をウォッチしてほしい
* `ts-node`と`ts-node-dev`をインストールして利用

```
$ npm install -D ts-node
$ npm install -D ts-node-dev
```

package.jsonを以下のように書き換え
```
  "scripts": {
    "dev": "ts-node src/index.ts",
    "dev:watch": "ts-node-dev --respawn src/index.ts"
  },
```
→これでソースの更新をウォッチして反映してくれるようになった。ブラウザ側のリロードは必要。
　ブラウザのリロードの自動化はできないだろうか。。。
