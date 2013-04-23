OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '164653890343682', '6740a4ebb061a6ea74f1980b85b3272a'
  provider :vkontakte, '3241996', 'KezvND1LRdweKSdKcVQr', :scope => 'notify'
  provider :google_oauth2, '228357313672.apps.googleusercontent.com', 'ZFO2i7SEPW6CY0EN4lE8D0P-', {access_type: 'online', approval_prompt: ''}
end