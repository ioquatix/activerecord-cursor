# ActiveRecord::Rack

Provides efficient enumeration of large result sets.

[![Build Status](https://secure.travis-ci.org/ioquatix/activerecord-cursor.svg)](http://travis-ci.org/ioquatix/activerecord-cursor)
[![Code Climate](https://codeclimate.com/github/ioquatix/activerecord-cursor.svg)](https://codeclimate.com/github/ioquatix/activerecord-cursor)
[![Coverage Status](https://coveralls.io/repos/ioquatix/activerecord-cursor/badge.svg)](https://coveralls.io/r/ioquatix/activerecord-cursor)

## Motivation

ActiveRecord `find_each` is inefficiently implemented for complex queries. It orders by `id` and for large result sets this is O(N^2) or worse.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-cursor'
```

## Usage

In your `config.ru`, before any middleware that would use the database, insert:

```ruby
# Middleware below this point may require database access:
use ActiveRecord::Rack::ConnectionManagement
```

It only works for servers which support cursors, which at this time includes Postgres.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## See Also

- [ActiveRecord::Migrations](https://github.com/ioquatix/activerecord-migrations)
- [ActiveRecord::Rack](https://github.com/ioquatix/activerecord-rack)

## License

Released under the MIT license.

Copyright, 2017, by [Samuel G. D. Williams](http://www.codeotaku.com/samuel-williams).

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
