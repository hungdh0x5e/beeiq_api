module BeeiqAPI
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    # The API key for your project.
    attr_accessor :webhook_url
    # The email sender in BeeIQ platform
    attr_accessor :sender_email

    def initialize
      @webhook_url= nil
      @sender_email = nil
    end
  end
end
