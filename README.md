## Tumieku（ツミエク）

<a href="https://gyazo.com/4cdfc2da7ff509bedf64432a3b951309"><img src="https://i.gyazo.com/4cdfc2da7ff509bedf64432a3b951309.gif" alt="Image from Gyazo" width="600"/></a>

## アプリの特徴

<font color="Red">**『エクササイズを楽しく継続したい』**</font>をテーマにしたSNS型記録アプリです。

- SNSにはお馴染みの投稿、コメント、いいね、フォロ-４つの機能
- 目標にそって、好きなエクササイズを設定
- 積み上げ時間によって、どんどんレベルがアップしていく仕組み
- レベルが上位３名になると、ランクインする
## アプリ作成背景

私自身、健康のために毎日運動に取り組んでいます。
しかし、孤独な環境では楽しさを感じず、モチベーションを維持するのが大変でした。

そこで、同じ様に「エクササイズを楽しく継続したい」と感じているユーザーと積極的にコミュニケーションをとりながら、励まし合うことのできるツールがあれば、今よりももっと楽しくエクササイズを継続できるのではないかと考え、本アプリを作成しました。
また、本アプリにはゲームフィケーション要素を取り入れ、「楽しさ」を感じて頂けるように工夫しました。
（アプリ名は、「ツミエク」と呼びます。”エクササイズを積み上げる”ので、コレにしました。）

### URL

- URL:https://tumieku-app.herokuapp.com
- ホーム画面・ヘッダーから、ゲストログインボタンで簡単にログインできます。（その他、アカウント登録・ログイン画面でもゲストログインが可能です。）

<img width="600" alt="スクリーンショット 2021-07-26 23.01.19.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/9c7e856c-bd96-01f0-0131-219757d9b427.png">

Qiitaに詳細を執筆しています。
『[【Rails】『エクササイズを楽しく継続したい』をテーマに、ポートフォリオを作成してみた](https://qiita.com/miya1221/items/ee1cb245ebcbcfc8fcce)』

### 機能一覧

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

### ER図
![ER図.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/d69b8393-f81e-35ac-f2b9-683924f195a7.png)
### 使用技術

- 言語：Ruby (2.7.2)
- フレームワーク：Ruby on Rails (6.1.3.2)
- フロントエンド：HTML&CSS/Bootstrap/JavaScript/jQuey
- DB：PostgreSQL
- テスト：Rspec
- インフラ：Heroku(ステージング環境→本番環境)+AWS(S3)
- ソースコード管理：GitHub(Projectsのカンバン方式でタスクを管理)
- その他使用ツール&素材等
  - Visual Studio Code
  - draw.io
  - unDraw(イラスト素材)
  - Color Hunt(カラーパレットツール)
  - Material Design Icon(アイコン)
  - ロゴメーカー / STORES(ロゴ)

## エクササイズ登録画面
### 工夫点

①好きなエクササイズを簡単に登録できる

- 自身の目標にあった、エクササイズを登録できます。
- 登録したエクササイズ一覧は、マイページからいつでも確認・編集・削除ができます。

<a href="https://gyazo.com/d4252fbc82b9d18967a2a5734a1c015e"><img src="https://i.gyazo.com/d4252fbc82b9d18967a2a5734a1c015e.gif" alt="Image from Gyazo" width="600"/></a>


## 投稿画面
### 工夫点

①デフォルトで日付を表示。

②毎日継続しやすいように、投稿を簡単にしました。


<a href="https://gyazo.com/a2a61c0a2b1d1291d36ad5bf36a5c122"><img src="https://i.gyazo.com/a2a61c0a2b1d1291d36ad5bf36a5c122.gif" alt="Image from Gyazo" width="600"/></a>

## コメント投稿・いいね機能

### 工夫点

①投稿をクリックするだけで、簡単に詳細ページへ移行できます。

②いいね機能は、Ajax（非同期）で実装しています。

③モチベーションがアップするように、コメント数といいね数が表示されます。


<a href="https://gyazo.com/5e36949b68dbe8d026bf5bfca983e3b5"><img src="https://i.gyazo.com/5e36949b68dbe8d026bf5bfca983e3b5.gif" alt="Image from Gyazo" width="600"/></a>


## ゲームフィーション要素（レベルアップ機能・ランキング機能）

<img width="550" alt="スクリーンショット 2021-08-13 8.27.40.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/6d5cb368-a704-965e-05ef-24569ed16441.png">

### 工夫点

毎日楽しくエクササイズを継続できるように、エクササイズの合計時間によって、レベルがアップする機能を取り入れ、上位3名になるとランクインする仕組みを作りました。

## 工夫したこと

### ①チーム開発を意識

実務でのチーム開発を想定した開発を行いました。

① Git, GitHubを用いたソース管理

② Projects のカンバン方式でタスクを管理

③ ブランチ運用は、「管理のしやすさ・リリースの頻度・複雑さ」を比較し、Gitflowを採用

④ こまめにcommitし、プルリクエストを出しマージする流れで開発


| ブランチ名 |     本番用       | 備考      |
|:----:|:---------------:|:--------------:|
| master | 本番用 | 本番リリース用のブランチ |
| develop | 開発用 | 機能実装用のブランチはここから切る|
| feature | 機能実装用 | 派生元は develop ブランチ|
| release | リリース用 | develop ブランチから分岐、タグ付けを行う|


### ②ゲストユーザーは、編集・削除できないように設定

- 下記のように設定し、誤って「更新」や「削除」をクリックしても、フラッシュメッセージが表示され、ホーム画面にリダイレクトされるようにしました。

```routes.rb
Rails.application.routes.draw do
  root 'homes#index'
  devise_for :user, controllers: {
    registrations: 'users/registrations'
  }
(略)
end
```

```app/controllers/users/registrations_controller.rb

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]

  def ensure_normal_user
    if resource.email == "guest@example.com"
      redirect_to root_path, alert: "ゲストユーザーの更新・削除はできません。"
    end
  end
end

```
### ③UI/UX

- ファーストビューは、何のアプリなのかが伝わるように作成。
- アイコンやロゴを積極的に使用し、全体的にシンプルなデザインへ。
- アプリのカラーは、TumiekuがSNS的な要素を持ち、｢人との繋がり｣｢励まし合い｣といった要素も含むため、メインカラ−のオレンジに設定。
- 統一感をだすため、下記の配色を参考にデザインしました。

![Color Hunt Palette (1).png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/ff422b65-25c4-0b7a-88fd-32c8a81f355b.png)