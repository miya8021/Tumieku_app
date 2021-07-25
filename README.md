# Tumieku
『エクササイズ（運動）を楽しく継続したい』をテーマにしたSNS型記録アプリです。

## アプリ作成背景
日頃の運動不足に加えて、30代になってから、自身の健康について考えるようになりました。
運動には、心身ともに良い効果があると理解はできていますが、モチベーションを維持できなくて、続けれない。
特に最近はこんなご時世なので、気軽に外に出れないから、家で過ごす方が多くなったため、さらに運動不足を感じている現状を解決したいと思いました。

そして、私と同じ様に、「健康のために毎日運動をしたいけど、継続できない」悩みを抱えている方は、少なからずいるのではないかと考えました。

そのような考えから、楽しく運動を継続できる仕組みを考え、『Tumieku』を開発しました。

（「ツミエク」と呼びます。”エクササイズを積み上げる”ので、コレにしました。）


## 使用技術

- 言語：Ruby (2.7.2)
- フレームワーク：Ruby on Rails (6.1.3.2)
- フロントエンド：HTML&CSS/Bootstrap/JavaScript/jQuey
- DB：PostgreSQL
- テスト：Rspec
- インフラ：Heroku(ステージング環境→本番環境)
- ソースコード管理：GitHub(Projectsのカンバン方式でタスクを管理)
- その他使用ツール&素材等
  - Visual Studio Code
  - draw.io
  - unDraw(イラスト素材)
  - Color Hunt(カラーパレットツール)
  - Material Design Icon(アイコン)
  - ロゴメーカー / STORES(ロゴ)

## 機能一覧

Tumiekuにつけたすべての機能は、以下の16機能です。

|  |     機能         | Gem          |
|:-|:---------------:|:--------------:|
| ① | ログイン・ログアウト機能 | [devise](https://github.com/heartcombo/devise)  |
| ② | アカウント登録、プロフィール編集機能 | [devise](https://github.com/heartcombo/devise)|
| ③ | ゲストログイン機能 | ☓|
| ④ | 目標登録・編集機能 | ☓|
| ⑤ | いいね機能(Ajax) | ☓|
| ⑥ | コメント機能 | ☓ |
| ⑦ | 投稿機能(CRUD)| ☓ |
| ⑧ | エクササイズ登録機能(CRUD)| ☓ |
| ⑨ | フォロー機能 | ☓|
| ⑩ | ページネーション機能 | [kaminari](https://github.com/kaminari/kaminari) |
| ⑪ | レベル表示機能| ☓ |
| ⑫ | ランキング機能| ☓ |
| ⑬ | 画像アップロード機能| [carrierwave](https://github.com/carrierwaveuploader/carrierwave) |
| ⑭ | フラッシュメッセージ表示機能| ☓ |
| ⑮ | レスポンシブWebデザイン| [Bootstrap](https://getbootstrap.jp/docs/4.2/layout/grid/) |
| ⑯ | Rspecテスト実装| [rspec-rails](https://github.com/rspec/rspec-rails) / [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails) / [faker](https://github.com/faker-ruby/faker) |

※アプリに、[RuboCop](https://github.com/rubocop/rubocop) を導入し、適宜コーディングを修正しています。

## このアプリの特徴

基本的にはtwitterのような投稿、コメント、いいね、フォロー機能のあるSNSですが、その他に以下のような特徴のあるアプリです。

- ユーザー別に、目標設定・編集できる
- エクササイズ合計時間によって、レベルがアップしていく
- レベルが上位３名になると、ランキングにユーザー名とレベルがのる

## DB設計
![ER図.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/d69b8393-f81e-35ac-f2b9-683924f195a7.png)

## GitHub 運用方法

実務でのチーム開発を想定した開発を行いました。

① Git, GitHubを用いたソース管理

② Projects のカンバン方式でタスクを管理

③ ブランチ運用は、Gitflowを採用し、プルリクベースで開発


| ブランチ名 | 本番用 | 備考 |
| :----------: | :-------------: |:-------------: |
| master   | 本番用  | 本番リリース用のブランチ|
| develop  | 開発用  | 機能実装用のブランチはここから切る|
| feature  | 機能実装用  | 派生元は develop ブランチ|
| release | リリース用 | develop ブランチから分岐、タグ付けを行う|
