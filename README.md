![commit activity](https://img.shields.io/github/commit-activity/w/Natsuki-abc/to_yama?color=red&style=for-the-badge)

# To Yama

登山できる山を探すサイトです。</br>
地域、都道府県、キーワード等での山の検索が可能です。アカウントを作成し、口コミの投稿も行えます。</br>
レスポンシブ対応しているため、スマホからもご確認いただけます。

[PC Page](https://user-images.githubusercontent.com/106907064/212540888-cf3f1e77-693f-43d1-8c6a-20893627c877.mov)

<img width="496" alt="mountain#search(スマホ)" src="https://user-images.githubusercontent.com/106907064/212539987-82d26c44-8bec-41ec-9ab1-09f6ad18bb23.png">

# ポートフォリオURL

[To Yama](https://morning-falls-86384.herokuapp.com/)

画面右上の「ゲストログイン」ボタンより、アカウントを作成せずにログインできます。

# 目次



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
* 山の閲覧
* 口コミ投稿機能
* 山の検索機能(ransack)

# テスト

* Rspec1
* 単体テスト(model)1-2
* 機能テスト(request)1-3
* 統合テスト(system)1-4

# 今後追加したい機能

* 山のお気に入り機能
* 山の評価機能
* 利用者の評価に基づいた山のランキング機能
