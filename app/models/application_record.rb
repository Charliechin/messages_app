class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  after_save :write_to_json



  def write_to_json
    #get the file from lib folder
    file = Rails.root.join('lib','messages.txt')
    #Include the root. IE If we are writing a Text, it will begin with {text: {...}}
    ActiveRecord::Base.include_root_in_json = false
    ActiveSupport.escape_html_entities_in_json = false
    open(file,'w') do |f|
      f.puts [Email.all,Tweet.all,Text.all].to_json(:except => [:created_at, :updated_at])
    end
  end

end
