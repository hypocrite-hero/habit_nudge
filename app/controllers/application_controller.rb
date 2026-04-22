class ApplicationController < ActionController::Base
  # 認証を全環境で実行する
  before_action :basic_auth

  private

  def basic_auth
    # ログ出力（RenderのLogsで確認してください）
    Rails.logger.info '--- Basic Auth Check Start ---'
    Rails.logger.info "ENV USER: #{ENV['BASIC_AUTH_USER'].inspect}"
    Rails.logger.info "ENV PASS: #{ENV['BASIC_AUTH_PASSWORD'].inspect}"

    authenticate_or_request_with_http_basic do |username, password|
      # 比較処理
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
