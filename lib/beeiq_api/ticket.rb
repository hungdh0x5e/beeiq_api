module BeeiqAPI
  class Ticket
    attr_accessor :contact_type
    attr_accessor :title
    attr_accessor :body
    attr_accessor :email
    attr_accessor :phone
    attr_accessor :name
    attr_accessor :passport
    attr_accessor :contact_id
    attr_accessor :group_name
    attr_accessor :sla_name
    attr_accessor :channel
    attr_accessor :tag

    def initialize(options = {})
      @contact_type = options[:contact_type] || Config::ContactType::CUSTOMER
      @title = options[:title]
      @body = options[:body]
      @email = options[:email]
      @phone = options[:phone]
      @name = options[:name]
      @passport = options[:passport]
      @contact_id = options[:contact_id]
      @group_name = options[:group_name]
      @sla_name = options[:sla_name]
      @channel = options[:channel]
      @tag = options[:tag]

      raise ArgumentError, 'body is required' if @body.to_s.empty?
    end

    def payload
      data = {
        contactType: @contact_type,
        title: @title,
        body: @body.to_s.gsub("\n", '<br>'),
        email: @email,
        phone: @phone,
        name: @name,
        passport: @passport,
        contactId: @contact_id,
        groupName: @group_name,
        slaName: @sla_name,
        channel: @channel,
        tag: @tag
      }
      data.delete_if { |k, v| v.nil? || v.empty? }
    end
  end
end
