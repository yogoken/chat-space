User.delete_all
User.create(id: 1, name: '山田太郎', email: 'taro@example.com', password: 'testtest', password_confirmation: 'testtest')
User.create(id: 2, name: '鈴木次郎', email: 'jiro@example.com', password: 'testtest', password_confirmation: 'testtest')
User.create(id: 3, name: '田中花子', email: 'hanako@example.com', password: 'testtest', password_confirmation: 'testtest')
User.create(id: 4, name: '加藤三郎', email: 'saburo@example.com', password: 'testtest', password_confirmation: 'testtest')
User.create(id: 5, name: '山口智史', email: 'satoshi@example.com', password: 'testtest', password_confirmation: 'testtest')
User.create(id: 6, name: '山中健三', email: 'kenzo@example.com', password: 'testtest', password_confirmation: 'testtest')

Message.delete_all
Message.create(id: 1, user_id: 1, body: 'Hello World!')
Message.create(id: 2, user_id: 2, body: '返信テスト')
Message.create(id: 3, user_id: 3, body: '3人目')
Message.create(id: 4, user_id: 1, body: 'もう一度テスト')
