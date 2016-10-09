## サービス名
ChatSpace

### markup
- デザイン追加
- `Message`モデル、`messages`テーブル追加
- `/messages`にアクセス

## messages
- createアクションでメッセージ投稿
- `Message`モデルにバリデーション設定
- Rspecインストール
  - `bundle exec rails g rspec:install`
  - `bundle exec rspec`
- locale設定によるエラーメッセージの日本語化

## 実装のフロー
1. チャット画面のコーディング
2. チャットを送信できるようにする（Railsだけ）
3. ログイン機能
4. チャットグループ作成
6. チャットグループ作成時にメンバー検索
7. チャットグループ作成時にメンバー追加
8. チャット投稿の非同期化
9. 画像の送信機能
10. チャットへの招待機能実装
11. 自動更新機能の実装

## サービスの機能
- 新規登録機能（ログアウトは割愛）
- 1対1のチャット機能
- 複数人によるグループチャット機能
- チャット相手の検索機能
- グループへの招待機能
- チャットの履歴表示機能
- 画像送信機能
- チャットの自動更新（10秒に一回更新）

## 画面構成
1. TOPページ兼ログイン
2. ユーザー登録
2. グループチャット一覧・チャット履歴
3. グループチャット開始・メンバー追加

## チャット画面の仕様
サイドバー：グループチャット一覧、新規チャットボタン(※1)
ヘッダー：グループ名が表示、招待ボタン(※2)
メイン画面：チャット画面

※1 新規チャットボタンを押すと4の画面に移動して新しくチャットを始めるユーザーを選べる。
※2 招待ボタンを押すと4の画面に移動してグループに追加したいユーザーを選べる。

## テーブル設計

### Users

- index
  - `email`
- 関連
  - `has_many :chat_group_users`
  - `has_many :chat_groups, through: :chat_group_users`
  - `has_many :messages`

### Messages

| column | 説明 | type | default | null | 備考 |
|---|---|---|---|---|---|
| `body` | メッセージ本文 | text | '' | | |
| `chat_group_id` | 紐づくChatGroupのid | integer |  | false |  |
| `user_id` |  作成者Userのid | integer | | false | |
| `image` | 画像の識別子 | string |  | false | Carrierwaveに利用 |

- index
  - `chat_group_id`
  - `user_id`
- 関連
  - `belongs_to :chat_group`
  - `belongs_to :user`

### ChatGroups

| column | 説明 | type | default | null | 備考 |
|---|---|---|---|---|---|
| `name` | チャットグループ名 | string | | false | |

- 関連
  - `has_many :chat_group_users`
  - `has_many :users, through: :chat_group_users`
  - `has_many :messages`


### ChatGroupsUsers

| column | 説明 | type | default | null | 備考 |
|---|---|---|---|---|---|
| `chat_group_id` | 紐づくChatGroupのid | integer | | false | |
| `user_id` | 紐づくUserのid | integer | | false | |

- index
  - `chat_group_id`
  - `user_id`
- 関連
  - `belongs_to :chat_group`
  - `belongs_to :user`

