# TaskApp

RubyonRailsの学習目的として作成したタスク管理アプリ。

## Get Started

Docker Application is requirement for developing.

```bash
$ git clone git@github.com:ShutaTakeuchi0410/TaskApp.git
$ cd TaskApp
$ touch .env # And set some secret keys.
$ docker-compose up
$ rails db:migrate # In the rails container.
```

## App Page
Release

https://frozen-hollows-69945.herokuapp.com/

Development

https://localhost:3000

## ERD

There is no dialogs but show my schema.rb for this application.

[db/schema.rb](https://github.com/ShutaTakeuchi0410/TaskApp/blob/main/db/schema.rb)

## Test
以下の入力でテスト用アカウントにログイン可能です。（テストデータ有）

- `test@test.com` : email
- `password` : password

## Usage
- インボックス、本日のタスク、今後のタスクでタスクを分別できる。
- タスク追加後に詳細設定やコメントを残すことができる。
- プロジェクトへの追加や、関連するタグを付属することができる。
- 未実行のタスクを検索ができる。
- 過去一週間内に実行済みのタスクを日付ごとにグラフで確認することができる。
- ショートカットキーが使用できる
  - Ctrl + N：タスクの追加
  - Ctrl + P：プロジェクトの追加
  - Ctrl + T：タグの追加
  - Ctrl + F：検索
- 毎朝９時に本日のタスクと締め切りを過ぎたタスク内容をメールで受信できる。
