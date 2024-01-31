module MailerDefaultUrlOptions
  def default_url_options
    {
      host: host,
      port: port
    }
  end

  private

  def host
    @host ||= ENV.fetch("RAILS_APP_HOST", "localhost")
  end

  def port
    @port ||= ENV.fetch("RAILS_APP_PORT", 3000)
  end
end
