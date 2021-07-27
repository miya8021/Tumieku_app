<a href="https://gyazo.com/b427740a6c11ac0de1c2aa4fb1934285"><img src="https://i.gyazo.com/b427740a6c11ac0de1c2aa4fb1934285.gif" alt="Image from Gyazo" width="1000"/></a>

## アプリ作成背景
### ①課題
日頃の運動不足に加えて、最近はこんなご時世なので、気軽に外に出れないから、家で過ごす方が多くなったため、さらに運動不足を感じています。
運動には、心身ともに良い効果があると理解できていますが、モチベーションを維持できない原因を以下にまとめました。

① 楽しくない
② すぐに効果がでないため

  - 達成感がない
  - 長期で取り組む必要がある

### ②目的
アプリを用いて、「楽しく運動を継続できる仕組み」づくりを行い、課題を解決する
### ③解決方法

- 「楽しく運動を継続できる仕組み」という方向性で、解決法を考えてみました。

① 楽しくない

- 日々の頑張りを共有できる「投稿機能」
- 一緒に運動を頑張る仲間をつくれる「フォロー機能」
- 仲間と励まし合うことができる「いいね・コメント機能」
- レベルがUPする楽しさ「レベル機能」

② すぐに効果がでない

- 達成感を感じていただくため、目標を設定できる「目標設定機能」
- 長期でモチベーション維持できる「レベル・ランキング表示機能」

そして、私と同じ様に、<font color="Red">**「健康のために毎日運動をしたいけど、継続できない」**</font>悩みを抱えている方は、少なからずいるのではないかと考えました。
そのような考えから、<font color="Red">**『Tumieku』**</font>を開発しました。
（「ツミエク」と呼びます。”エクササイズを積み上げる”ので、コレにしました。）


### URL

- URL:https://tumieku-app.herokuapp.com
- ホーム画面・ヘッダーから、ゲストログインボタンで簡単にログインできます。（その他、アカウント登録・ログイン画面でもゲストログインが可能です。）

<img width="600" alt="スクリーンショット 2021-07-26 23.01.19.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/9c7e856c-bd96-01f0-0131-219757d9b427.png">

Qiitaに詳細を執筆しています。
『[【Rails】『エクササイズを楽しく継続したい』をテーマに、ポートフォリオを作成してみた](https://qiita.com/miya1221/items/ee1cb245ebcbcfc8fcce)』
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

## アプリの使用イメージ
### ①ホーム画面

<a href="https://gyazo.com/b427740a6c11ac0de1c2aa4fb1934285"><img src="https://i.gyazo.com/b427740a6c11ac0de1c2aa4fb1934285.gif" alt="Image from Gyazo" width="1000"/></a>

- ホーム画面に、アプリの特徴をまとめています。
- ヘッダーのロゴ（Tumieku）を押すとホーム画面へリダイレクト。
- トップへ戻るアイコンも設置しています。

### ②マイページ（目標・レベル表示）

<img width="700" alt="スクリーンショット 2021-07-27 8.09.01.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/46423366-49af-6e93-86ad-04c11608a938.png">

- アイコン(①)の編集から、目標とアカウントの編集ができます。
- エクササイズの合計時間によって、レベルアップしていきます。

<img width="600" alt="スクリーンショット 2021-07-27 8.34.35.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/65c7f276-8e0d-550f-74ed-270d66337070.png">

- 自身の過去の投稿がみれます。
- 3件以上の投稿となると、ページネーションし見やすくしています。

### ③エクササイズ登録画面
<img width="600" alt="スクリーンショット 2021-07-27 8.39.10.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/b9008646-6b00-dfcb-7229-d2fd0c4cf575.png">
<img width="600" alt="スクリーンショット 2021-07-27 8.39.46.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/e0f7d887-1739-a537-953e-71a05f3c2998.png">

- 自身の取り組みたいエクササイズを登録できます。

<img width="600" alt="スクリーンショット 2021-07-27 8.40.28.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/196ee690-d0dc-9692-728d-193f00488252.png">

- 登録したエクササイズは、一覧表示から編集・削除ができます。
- 編集・削除は、ログイン中のuser.idとexerciseのuseer.idが一致していないと、編集・削除のアイコンが表示されないようにしています。

### ④投稿ページ（今日のTumieku）

<a href="https://gyazo.com/935988ba5f0d1bb13a5a96193c7d9953"><img src="https://i.gyazo.com/935988ba5f0d1bb13a5a96193c7d9953.gif" alt="Image from Gyazo" width="960"/></a>

- ヘッダーの「今日のTumieku」から、投稿画面へ移動します。
- 日付は、カレンダーをクリックで選択できます。
- 登録したエクササイズを選択し、実施時間と感想を入力できます。
### ⑤投稿一覧とランキング機能

<img width="600" alt="0D0ABA8B-C59D-400A-96B4-3DB669677852_1_105_c.jpeg" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/e46761d3-1dff-dd36-c95b-644e6fa2d1b9.jpeg">

- 各ユーザーの投稿一覧画面になります。
- レベルが上位３名になると、ランキングにユーザー名とレベルがのります。ランキングにのるのは、楽しいですよね。モチベーション上がります！同率順位の場合も表示されます。

<img alt="スクリーンショット 2021-07-27 11.18.22.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/2c0b4276-5a63-4f2c-bb2b-a610045055d1.png">

### ⑥投稿詳細、コメント一覧

<img width="600" alt="スクリーンショット 2021-07-27 9.04.08.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/c6f04d08-4a27-fe45-27d5-d51b0f54c4c1.png">

- 投稿に対して、アイコン①又は②から、コメントを投稿できます。

<img width="600" alt="スクリーンショット 2021-07-27 9.50.29.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/ca1b76a6-0cf4-bd1a-b894-b46eedfaf36f.png">

- ログイン中のuser.idとcommentのuseer.idが一致していないと、削除のアイコンが表示されないようにしています。

### ⑦いいね機能(Ajax)

<a href="https://gyazo.com/35e6bdc22807684e500ae04c54077396"><img src="https://i.gyazo.com/35e6bdc22807684e500ae04c54077396.gif" alt="Image from Gyazo" width="960"/></a>

- 非同期で、いいね選択・解除ができます。
- いいねの数もカウントされます。

### ⑧レスポンシブ対応

<a href="https://gyazo.com/0c550bca6c4a9967804eae507b471644"><img src="https://i.gyazo.com/0c550bca6c4a9967804eae507b471644.gif" alt="Image from Gyazo" width="510"/></a>

- スマートフォンユーザーへも対応しています。
- デバイスによって、ハンバーガーメニューも実装しています。

## 工夫したこと

### ①チーム開発を意識

実務でのチーム開発を想定した開発を行いました。
① Git, GitHubを用いたソース管理
② Projects のカンバン方式でタスクを管理
③ ブランチ運用は、Gitflowを採用し、プルリクベースで開発


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

- 視覚で直感的にわかりやすいように、アイコンやロゴを積極的に使用し、シンプルにしました。
- アプリのカラーは、TumiekuがSNS的な要素を持ち、｢人との繋がり｣｢励まし合い｣といった要素も含むため、メインカラ−のオレンジに設定。
- 統一感をだすため、下記の配色を参考にデザインしました。

![Color Hunt Palette (1).png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/923146/ff422b65-25c4-0b7a-88fd-32c8a81f355b.png)