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

# アプリ名
 gatturikun(がっつりくん)

# 概要
 営業現場において、管理したい情報をまとめるためのアプリ
 機能は現在３つあり、顧客管理機能、メンバー一覧表示機能、タスク管理機能です。

# 本番環境
 https://gatturikun.herokuapp.com/

 Basic認証
 ・ユーザー ：admin
 ・パスワード ：2222

 ログイン情報
 ・Eメール :test@aaa.aaa
 ・パスワード :kkk111


# 制作背景
  前職では、営業に使うツールは全て別々のアプリを使用していました。別々のアプリを使用しているため、顧客情報などがをまとめ切れず、共有もしにくい状況ではありました。今回制作したアプリは、そんな前職に使っていたツールを１つにまとめられるようなアプリを目指しました。

# DEMO

## 新規顧客登録機能
  [![Image from Gyazo](https://i.gyazo.com/cdfdbd493f7d23403a51d17ccf7370bc.gif)](https://gyazo.com/cdfdbd493f7d23403a51d17ccf7370bc)

  ・顧客一覧ページの新規登録ボタンから、新規登録ページに遷移し、苗字、名前、苗字(カナ)、名前(カナ)、電話番号、見込み、最終対応日を入力することで、顧客情報を新規登録することができます。(メモは任意)
  ・登録した後は、顧客一覧ページに遷移します。

## 顧客管理機能
  [![Image from Gyazo](https://i.gyazo.com/1bdea97fce118bc2a30cdde37e74c6ae.gif)](https://gyazo.com/1bdea97fce118bc2a30cdde37e74c6ae)

  ・トップページから、顧客管理機能を選択し、一覧表示されている顧客をクリックすることで、クリックした顧客の詳細ページに遷移します。
  ・詳細ページにおいて、メモが何も入力されていない場合、「*まだメモがありません」が代わりに表示されます
  ・詳細ページにおいて、担当者がログインしている本人の場合、顧客の編集、削除ボタンが表示され、顧客情報の編集、削除を行うことができます

 ## メンバー一覧表示機能
  [![Image from Gyazo](https://i.gyazo.com/9b755a2aaa0cb060e8204b641b10c7a2.gif)](https://gyazo.com/9b755a2aaa0cb060e8204b641b10c7a2)

  ・トップページから、メンバー一覧を選択し、一覧表示されているメンバーをクリックすることで、クリックしたメンバーの詳細ページに遷移します。
  ・詳細ページを開いたメンバーが、ログインしているユーザー自身の場合、編集ボタンが表示され、編集を行うことができます。

## メンバー情報編集機能
  [![Image from Gyazo](https://i.gyazo.com/8b13c9c7e0f13dcb8a633c4760408452.gif)](https://gyazo.com/8b13c9c7e0f13dcb8a633c4760408452)

  ・メンバー詳細ページから編集をすることができます。なお、ログインしているユーザーが、自身の詳細ページ開いた時のみ、編集ボタンが表示されます。
  ・編集時は、現在のパスワードも入力する必要があります。

## タスク管理機能
  [![Image from Gyazo](https://i.gyazo.com/a905e632206754566ac6c99d6fd244ce.gif)](https://gyazo.com/a905e632206754566ac6c99d6fd244ce)

  ・タスクを非同期通信で追加、削除、チェックをつけることができます
  ・一度チェックをつけたものは、チェックがついた状態で保存されます
  ・使用例として、１日にやるべきタスクを追加し、終わったら、チェックをつけ、タスクが完全に解決したら削除するようなことを想定しています。

# 工夫したポイント

  ・テーブル要素の一行全体をクリックすることで、詳細ページに以降できるようにする点です。テーブル要素は今回初めて学び、調べて実装した内容だったので苦労しました。JavaScriptと組み合わせて実装しました。
  ・タスク管理機能の追加、削除、チェックの非同期通信の実装です。特に非同期通信の削除、チェックは今回初めて実装した点であり、自分で仮定を立てながら、試行錯誤を繰り返しながら実装しました。

# 使用技術(開発環境)

## バックエンド

Ruby, Ruby on Rails

## フロントエンド

JavaScript,Ajax

## データベース

MySQL,SequelPro

## インフラ

Heroku

##  ソース管理

GitHub,GitHubDesktop

## エディタ

VSCode

# 課題や今後実装したい機能

・ユーザー同士でのチャット機能
・任意のページにのみJavaScriptを適用させる
・ユーザー情報を編集する際に、毎回パスワードを求められるので、もっと簡単に編集できるようにしたい
・テストコードの記述

# テーブル設計

## users テーブル

| Column       | Type    | Options                   |
| ------------ | ------- | ------------------------- |
| email        | string  | null: false, unique: true |
| password     | string  | null: false               |
| name         | string  | null: false               |
| phone_number | string  | null: false               |
| position_id  | integer | null: false               |

### Association

- has_many :clients
- has_many :tasks

## clients テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| tel_number      | string     | null: false                    |
| prospect_id     | integer    | null: false                    |
| date            | date       | null: false                    |
| memo            | text       |                                |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## tasks テーブル

| Column  | Type       | Options                        |
| --------| ---------- | ------------------------------ |
| check   | boolean    |                                |
| content | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user