class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  after_save :write_to_json



  def write_to_json
    file = Rails.root.join('lib','messages.txt')
    ActiveRecord::Base.include_root_in_json = true
    ActiveSupport.escape_html_entities_in_json = false
    open(file,'a+') do |f|
      f.puts self.to_json(:except => [:created_at, :updated_at])
    end
  end

end
