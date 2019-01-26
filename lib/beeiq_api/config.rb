module BeeiqAPI
  module Config
    module ActionType
      ADD_CONTACT = 'add-contact'.freeze
      UPDATE_CONTACT = 'update-contact'.freeze
      ADD_NOTE = 'add-note'.freeze
      ADD_DEAL = 'add-deal'.freeze
      ADD_TICKET = 'add-ticket'.freeze
    end

    module ContactType
      LEAD = 'lead'.freeze
      CUSTOMER = 'customer'.freeze
    end

    module Gender
      MALE = 0
      FEMALE = 1
      OTHER = 2
    end

    module EmailType
      WORK = 'Work'.freeze
      HOME = 'Home'.freeze
      MOBILE = 'Mobile'.freeze
      OTHER = 'Other'.freeze
    end

    module PhoneType
      WORK = 'Work'.freeze
      HOME = 'Home'.freeze
      MOBILE = 'Mobile'.freeze
      OTHER = 'Other'.freeze
    end

    module AddressType
      WORK = 'Work'.freeze
      HOME = 'Home'.freeze
      OTHER = 'Other'.freeze
    end

    module ImType
      SKYPE = 'Skype'.freeze
      FACEBOOK = 'Facebook'.freeze
      YAHOO = 'Yahoo'.freeze
      VIBER = 'Viber'.freeze
      HANGOUTS = 'Hangouts'.freeze
      OTHER = 'Other'.freeze
    end
  end
end
