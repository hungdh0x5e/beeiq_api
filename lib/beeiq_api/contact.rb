module BeeiqAPI
  class Contact
    attr_accessor :contact_type
    attr_accessor :name
    attr_accessor :lastname
    attr_accessor :title
    attr_accessor :passport
    attr_accessor :gender
    attr_accessor :date_of_birth
    attr_accessor :emails
    attr_accessor :phones
    attr_accessor :addresses
    attr_accessor :im
    attr_accessor :tag
    attr_accessor :cus_fields
    attr_accessor :company_contact

    def initialize(options = {})
      @contact_type = options[:contact_type] || Config::ContactType::CUSTOMER
      @name = options[:name]
      @lastname = options[:lastname]
      @title = options[:title]
      @passport = options[:passport]
      @gender = options[:gender]
      @date_of_birth = options[:date_of_birth]
      @emails = options[:emails]
      @phones = options[:phones]
      @addresses = options[:addresses]
      @im = options[:im]
      @tag = options[:tag]
      @cus_fields = options[:cus_fields]
      @company_contact = options[:company_contact]

      raise ArgumentError, 'name is required' if @name.to_s.empty?
    end

    def payload_raw
      {
        contactType: @contact_type,
        name: @name,
        lastname: @lastname,
        title: @title,
        passport: @passport,
        gender: @gender,
        dateOfBirth: @date_of_birth,
        emails: @emails,
        phones: @phones,
        addresses: @addresses,
        im: @im,
        tag: @tag,
        cusFields: @cus_fields,
        companyContact: @company_contact
      }
    end

    def payload
      payload_raw.delete_if { |k, v| v.nil? || (!v.kind_of?(Integer) && v.empty?)  }
    end
  end
end
