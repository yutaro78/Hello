# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* ## usersテーブル
|Column|Type|Options|
|------|----|-------|
|username|string|null: false|
|email|string|null: false|
|encryptted_password|string|null: false|
|profile|text|
### Association
- has_many :jobs


### jobsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|user|references|null:false, foreign_key:true|
|title|string|null:false|
|body|text|null:false|

### Association
- belongs_to :user

アプリ名　Hello

新規登録、ログイン、ログアウト
仕事の投稿
仕事の一覧確認
仕事の詳細確認
企業の一覧確認
一覧確認からその企業の投稿している求人確認


このアプリでは在留外国人の雇用を考えている企業が在留外国人の方へ向けた仕事やアルバイトを企業が投稿しそれをみた方が連絡して仕事に就けることをかなえるために作ったアプリケーションです。

