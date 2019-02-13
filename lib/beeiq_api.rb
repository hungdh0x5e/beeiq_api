require "beeiq_api/version"
require "beeiq_api/config"
require "beeiq_api/response"
require "beeiq_api/ticket"
require "beeiq_api/contact"
require 'configuration'
require 'rest-client'
require 'json'

module BeeiqAPI
  class Error < StandardError; end

  class Client
    attr_reader :webhook_url
    attr_reader :sender_email

    def initialize(webhook_url = nil, sender_email = nil)
      webhook_url ||= BeeiqAPI.configuration.webhook_url
      sender_email ||= BeeiqAPI.configuration.sender_email

      raise ArgumentError, 'Missing webhook url' if webhook_url.to_s.empty?
      raise ArgumentError, 'Missing sender_email' if sender_email.to_s.empty?

      @webhook_url = webhook_url
      @sender_email = sender_email
    end

    def create_ticket(data = {})
      create_many_ticket([data])
    end

    def create_many_ticket(data = [])
      payload = build_payload(Config::ActionType::ADD_TICKET, data)
      process(:post, payload)
    end

    def create_contact(data = {})
      create_many_contact([data])
    end

    def create_many_contact(data = [])
      payload = build_payload(Config::ActionType::ADD_CONTACT, data)
      process(:post, payload)
    end

    def build_payload(action, data)
      payload =
        case action
        when Config::ActionType::ADD_TICKET
          build_ticket_payload(data)
        when Config::ActionType::ADD_CONTACT
          build_contact_payload(data)
        end

      {
        senderUser: @sender_email,
        data: payload
      }
    end

    def build_ticket_payload(data)
      data.map do |item|
        ticket = BeeiqAPI::Ticket.new item
        {
          actionType: Config::ActionType::ADD_TICKET,
          data: ticket.payload
        }
      end
    end

    def build_contact_payload(data)
      data.map do |item|
        contact = BeeiqAPI::Contact.new item
        {
          actionType: Config::ActionType::ADD_CONTACT,
          data: contact.payload
        }
      end
    end

    private

    def process(verb, data=nil)
      begin
        BeeiqAPI::Response.new ::RestClient::Request.execute(method: verb,
                                  url: @webhook_url,
                                  headers: { 'Content-Type': 'application/json' },
                                  payload: data.to_json,
                                  timeout: 10)
      rescue ::RestClient::ExceptionWithResponse => e
        BeeiqAPI::Response.new e.response
      end
    end
  end
end
