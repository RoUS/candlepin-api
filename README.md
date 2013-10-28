# CandlepinAPI

The *candlepin-api* gem provides two things:

1. Ruby bindings for the multiple versions of the REST API of the
{https://fedorahosted.org/candlepin/ Candlepin} project, and
1. A utility application to access the API from the command-line or shell scripts.

## Installation

Add this line to your application's Gemfile:

    gem('candlepin-api')

And then execute:

    % bundle

Or install it yourself as:

    % gem install candlepin-api

## Usage

### Command-line Application

The application is named `candlepin-api`, and it is largely
self-documenting.  `candlepin-api help` or `candlepin-api --help` will
start you off by listing global options and all of the entrypoints
known for the API version selected.

By default `candlepin-api` will use the most recent (highest-numbered)
version of the API it knows about.  To select a particular version
instead, define the `CANDLEPIN_API_VERSION` environment variable
before invoking it:

    $ CANDLEPIN_API_VERSION=0.8.15-1 candlepin-api versions
    Application version:  0.1.0
    Selected API version: 0.8.15-1

`candlepin-api` will try to pick the API definition that most closely
matches the version you specify.  If you specify `0.8` then
`candlepin-api` will selected the latest version it knows about
matching `0.8.*`.  If it cannot find a supported version that safely
matches your selection it will raise an exception.

#### Exit Status

* `0` Success
* `1` The HTTP status code of the response was not listed in the API
* `2` Client and server API versions were not the same
* `7` The response (if any) from the server did not appear to be from Candlepin
* `8` There was a problem with the entrypoint arguments

### Ruby bindings

TBS.

## To-Do list

1. Enhance processing of `CANDLEPIN_API_VERSION` environment variable
to permit "ask the server what version it's using, and use our best match."

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
