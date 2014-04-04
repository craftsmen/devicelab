require 'sinatra'
require 'sinatra/i18n'

class App < Sinatra::Base
  register Sinatra::I18n

  configure do
    I18n.default_locale = :fr
  end

  def set_locale
    browser_locale = 'fr'
    if request.env['HTTP_ACCEPT_LANGUAGE']
      browser_locale = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
    end

    I18n.load_path += Dir[File.join(File.dirname(__FILE__), 'config', 'locales', '*.yml').to_s]
    locale = params[:locale] if params[:locale]
    I18n.locale = locale || browser_locale
  end

  get '/?:locale?' do
    set_locale

    erb :home
  end
end
