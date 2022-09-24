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
app
|--components #Phlex Components
  |--header.rb
  |--footer.rb
|--views
  |--home
      |--index.html.erb

## For Hot Module Reload
```ruby
import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import FullReload from 'vite-plugin-full-reload'

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload(['config/routes.rb', 'app/views/**/*', 'app/components/**/*'], { delay: 200 })
  ],
})
```

## Phlex Components
```ruby
class Heading < Phlex::Component
  def template
    h2 "Fun Times"
  end
end
```

## app/views/home/index.html.erb
```html
# Call the Phlex heading component
<%= render Heading.new %>
# Standard html
<h1>Project Flow Demo</h1>
# Call the Plex footer component
<%= render Footer.new %>
```






Plhex Version:
phlex (0.2.2)

