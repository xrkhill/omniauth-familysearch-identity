# Omniauth FamilySearchIdentity

OmniAuth strategy for FamilySearch Identity v2 API (OAuth 1.0a)

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-familysearch-identity'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-familysearch-identity

## Usage

    use OmniAuth::Builder do
      provider :familysearch_identity, ENV['FAMILYSEARCH_DEVELOPER_KEY'], ''
    end

## Auth Hash

Here's an example Auth Hash available in `request.env['omniauth.auth']`:
```ruby
{
  "provider" => "familysearch_identity",
  "uid" => "jdoe",
  "info" => {
    "name" => "John Doe",
    "email" => "jdoe@example.com",
    "nickname" => "jdoe",
    "first_name" => "John",
    "last_name" => "Doe"
  },
  "credentials" => {
    "token" => "56421fc9ac",
    "secret" => "6f532ad1bb"
  },
  "extra" => {
    "access_token" => "56421fc9ac",
    "raw_info" => {
      "users" => [
	"id" => "MMMM-QY4Y",
	"username" => "jdoe",
	"emails" => [
	  {
	    "type" => "Primary",
	    "value" => "noreply@ldschurch.org"
	  },
	  {
	    "type" => "Alternate",
	    "value" => nil
	  }
	],
	"names" => [
	  {
	    "type" => "Display",
	    "value" => "John Doe"
	  },
	  {
	    "type" => "Family",
	    "value" => "Doe"
	  },
	  {
	    "type" => "Given",
	    "value" => "John"
	  }
	],
	"preferences" => [
	  {
	    "name" => "language",
	    "value" => "en"
	  }
	]
      ]
    }
  }
}
```

## FamilySearch Identity v2 Docs

https://familysearch.org/developers/docs/identity-v2

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
