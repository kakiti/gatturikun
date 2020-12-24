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