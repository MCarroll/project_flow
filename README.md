# README

## Install
This base install is based on the setup described at:
[https://www.bootrails.com/blog/vitejs-rails-a-wonderful-combination/]

### Setup Base Rails
```ruby
mkdir projectflow railsvite && cd projectflow
echo "source 'https://rubygems.org'" > Gemfile
echo "gem 'rails', '7.0.1'" >> Gemfile
bundle install
bundle exec rails new . --force --css=bootstrap --minimal
bin/rails db:create
bin/rails db:migrate
```

### Install gems
```ruby
gem 'vite_rails'
gem 'Plex'
```
`Bundle Install`

## Directory Structure
```bash
app
|--views
  |--home
     |--header.rb
     |--footer.rb
     |--index.html.erb
```

## Hot Module Reload
```ruby
import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import FullReload from 'vite-plugin-full-reload'

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload(['config/routes.rb', 'app/views/**/*'], { delay: 200 })
  ],
})
```

```ruby
# app/views/home/header.html.erb
module Views
  class Heading < Phlex::Component
    def template
      h1 "My Phex Header"
      p "Render ruby generated view components"
    end
  end
end
```

```ruby
Module Views
  class Footer < Phlex::Component
    def template
      h3 "Fun 2x Times"
    end
  end
end
```

```html
<div class="container">
  <%= render Views::Home::Heading.new %>
  <div>Standard html</div>
  <h1>Project Flow Demo</h1>
  <p>To test out Phlex Components</p>
  <%= render Views::Home::Footer.new %>
</div>
```

