# Omniauth FamilySearchIdentity

OmniAuth strategy for FamilySearch Identity v2 API (OAuth 1.0a).

There is also a [companion strategy](https://github.com/xrkhill/omniauth-familysearch) for the OAuth 2 API.

Note: FamilySearch [requires](https://familysearch.org/developers/docs/guides/authentication) web apps to use the OAuth 2 API.

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-familysearch-identity'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-familysearch-identity

## Usage

```ruby
use OmniAuth::Builder do
  provider :familysearch_identity, ENV['FAMILYSEARCH_DEVELOPER_KEY'], ''
end

# To use the sandbox API
use Omniauth::Builder do
  provider :familysearch_identity, ENV['FAMILYSEARCH_DEVELOPER_KEY'], '',
    :client_options => { :site => 'https://sandbox.familysearch.org' }
end
```

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

https://familysearch.org/developers/docs/guides/identity-v2

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
