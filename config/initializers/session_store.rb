# Cookieの有効期限を設定
Rails.application.config.session_store :cookie_store, key: '_app_session', expire_after: 1.month
