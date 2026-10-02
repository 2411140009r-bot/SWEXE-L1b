cat << 'EOF' > bin/render-build.sh
#!/usr/bin/env bash
# エラーが発生した時点で処理を中断する設定
set -o errexit

# 必要なライブラリ（Gem）のインストール
bundle install

# アセット（CSSやJavaScript）のビルドと不要ファイルの削除
bundle exec rake assets:precompile
bundle exec rake assets:clean

# データベース（PostgreSQLなど）の自動マイグレーションを行う場合は以下の行のコメントアウト（#）を外してください
# bundle exec rake db:migrate
EOF