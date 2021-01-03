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

# 制作背景
  前職では、営業に使うツールは全て別々のアプリを使用していました。別々のアプリを使用しているため、顧客情報などがをまとめ切れず、共有もしにくい状況ではありました。今回制作したアプリは、そんな前職に使っていたツールを１つにまとめられるようなアプリを目指しました。

# DEMO

## 新規顧客登録機能
 [![Image from Gyazo](https://i.gyazo.com/cdfdbd493f7d23403a51d17ccf7370bc.gif)](https://gyazo.com/cdfdbd493f7d23403a51d17ccf7370bc)

 ・顧客一覧ページの新規登録ボタンから、新規登録ページに遷移し、苗字、名前、苗字(カナ)、名前(カナ)、電話番号、見込み、最終対応日を入力することで、顧客情報を新規登録することができます。(メモは任意)
 ・登録した後は、顧客一覧ページに遷移します。
## 顧客管理機能(トップページ→顧客一覧→顧客詳細)
 [![Image from Gyazo](https://i.gyazo.com/1bdea97fce118bc2a30cdde37e74c6ae.gif)](https://gyazo.com/1bdea97fce118bc2a30cdde37e74c6ae)

 ・トップページから、顧客管理機能を選択し、一覧表示されている顧客をクリックすることで、クリックした顧客の詳細ページに遷移します。
 ・詳細ページにおいて、メモが何も入力されていない場合、「*まだメモがありません」が代わりに表示されます
 ・詳細ページにおいて、担当者がログインしている本人の場合、顧客の編集、削除ボタンが表示され、顧客情報の編集、削除を行うことができます



 ## メンバー一覧表示機能
 [![Image from Gyazo](https://i.gyazo.com/9b755a2aaa0cb060e8204b641b10c7a2.gif)](https://gyazo.com/9b755a2aaa0cb060e8204b641b10c7a2)



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