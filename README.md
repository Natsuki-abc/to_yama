![commit activity](https://img.shields.io/github/commit-activity/w/Natsuki-abc/to_yama?color=red&style=for-the-badge)

# 環境構築

### 前提

* Rubyがインストールされていること
* Railsがインストールされていること

### 起動

```bash
rails s
```

# To Yama

登山できる山を探すサイトです。</br>
地域、都道府県、キーワード等での山の検索が可能です。アカウントを作成し、口コミの投稿も行えます。</br>
レスポンシブ対応しているため、スマホからもご確認いただけます。

<img width="1429" alt="TOP画面(PC)" src="https://user-images.githubusercontent.com/106907064/212603038-f391e6f6-9084-469e-b4b4-63077f2621ee.png">

<img width="496" alt="mountain#search(スマホ)" src="https://user-images.githubusercontent.com/106907064/212539987-82d26c44-8bec-41ec-9ab1-09f6ad18bb23.png">

# ポートフォリオURL

[To Yama](https://morning-falls-86384.herokuapp.com/)

画面右上の「ゲストログイン」ボタンより、アカウントを作成せずにログインできます。

また、管理者ページ(rails_admin)につきましては</br>
下記ユーザーにてログイン後、ヘッダー部分「管理者ページ」ボタンよりアクセス可能です。

<img width="462" alt="管理者ページ" src="https://user-images.githubusercontent.com/106907064/212645931-8f7ac7bd-eabf-4691-a062-9a739a57cd2f.png">

* 管理者ログイン情報

メールアドレス:to_yama_admin@icloud.com
パスワード:yama1234

* 管理者の機能
  * 山の追加、削除、編集
  * 全ユーザー、口コミの管理

# 目次

* 使用技術
* 目的
* 機能一覧
* テストフレームワーク
* 今後追加したい機能

# 使用技術

* Ruby version 2.7.6p219
* Ruby on Rails version 6.1.7
* Rspec
* Rubocop
* Google Maps API
* Carrier Wave(開発環境)
* Heroku
* AWS S3(本番環境)

# 目的

登山に行く際にアクセスや登山ルートを調べることにとても時間がかかるため</br>
必要な情報がまとまっているサイトがあれば便利だと思い、作成しました。

# 機能一覧

* ユーザー新規登録、ログイン機能(devise)
* 山の新規追加、編集、削除機能の制限(rails_admin)
  * 管理者ユーザーのみ可能
    * 山の追加、削除、編集
    * 全ユーザー、口コミの管理
* 山の詳細情報閲覧
* 口コミ投稿機能
* 山の検索機能(ransack)

# テストフレームワーク

* Rspec
  * 単体テスト(model)
  * 機能テスト(request)
  * 統合テスト(system)

# 今後追加したい機能

* 山のお気に入り機能
* 山の評価機能
* 山にタグの追加機能
* 利用者の評価に基づいた山のランキング機能
