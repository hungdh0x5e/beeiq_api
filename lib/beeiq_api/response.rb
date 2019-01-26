module BeeiqAPI
  class Response
    attr_accessor :response

    def initialize(response)
      @response = response
    end

    def body
      if success?
        { success: true }
      else
        format_hash(JSON.parse(response.body, :quirks_mode => true))
      end
    end

    def raw_body
      response.body
    end

    def success?
      [200, 204].include? response.code
    end

    def code
      response.code
    end

    def headers
      response.headers
    end

    private

    def format_hash(h)
      if h.kind_of? Hash
        Hash[
          h.map do |k, v|
            [k.respond_to?(:to_sym) ? k.to_sym : k, format_hash(v)]
          end
        ]
      else
        h
      end
    end
  end
end
