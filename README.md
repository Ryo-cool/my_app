# Grensta
自分のお気に入りの自然の写真（風景や道端に咲いている花など）をシェアするアプリです。
旅行で撮った風景や、綺麗な花を見つけた時など気軽にシェアできます。
自然の写真を見ると、ストレスレベルが減少したり、生産性が上がる効果が実証されています。
仕事の休憩中や集中したい作業の前後などに気軽に自然が味わえるアプリです。
## 機能一覧
ユーザー登録・編集・ログイン機能（gem: Devise）
投稿機能 （画像のアップロードにgem:CarrierWaveを使用）
投稿一覧・投稿詳細表示機能
投稿編集機能
ページネーション機能（gem: Kaminari）
いいね機能（Ajax / 非同期処理）
コメント機能
<!-- CircleCI/CD 自動ビルド・自動テスト・自動デプロイ -->
モデルに対するバリデーション(文字数・メールアドレス・パスワードなど)
## 使用技術
* フロント
    haml
    SCSS
    jQuery
* バックエンド
    Ruby 2.5.8
    Ruby on Rails 5.2.4.3
* DB
    MySQL 5.7
* インフラ・開発環境等
    AWS(ACM,EC2/ALB,ECR/ECS,VPC,S3)
    Docker/docker-compose
* その他
  Capistrano
  Rubocop
  RSpec
## ER図
https://gyazo.com/51bff51e06c3bc53a250fcfd53885de0