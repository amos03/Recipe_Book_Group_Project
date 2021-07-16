gem 'activerecord', '=4.2.10'
gem 'sqlite3', '=1.3.13'

require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'recipebook.sqlite3')

class Recipebook < ActiveRecord::Base
    
    field :name, as: :string
    field :prep_time, as: :integer
    field :ingredients, as: :text
    field :meat, as: :boolean
    field :dairy, as: :boolean
    field :parve, as: :boolean
    field :instructions, as: :text

end

Recipebook.auto_upgrade!

at_exit do
  ActiveRecord::Base.connection.close
end