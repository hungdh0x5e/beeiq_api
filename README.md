## Beeiq

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'beeiq_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install beeiq_api

## Usage

#### Configuration

**Ruby**
```ruby
client = BeeiqAPI::Client.new(webhook_url, sender_email)
```

**Rails**
```ruby
# in file: config/initialize/beeiq.rb
BeeiqAPI.configure do |config|
  config.webhook_url = 'https://github.com'
  config.sender_email = 'huyhung1994@gmail.com'
end

client = BeeiqAPI::Client.new
```

#### **Create ticket**
Create ticket and create contact/lead
```ruby
data = {
  # ticket info
  title: 'title of ticket',
  body: 'body of ticket', # required
  tag: 'webhook',

  # for create contact/lead
  contact_type: 'customer', # [lead, customer] default is customer
  name: 'name of contact',
  email: 'email@github.com',
  phone: '01234567890'
}

client.create_ticket(data)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hungdh0x5e/beeiq. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Beeiq project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hungdh0x5e/beeiq/blob/master/CODE_OF_CONDUCT.md).

## TODO:

- [x] add-ticket: thêm Ticket
- [ ] add-contact: tạo Contact
- [ ] update-contact: cập nhật Contact
- [ ] add-note: thêm Ghi chú
