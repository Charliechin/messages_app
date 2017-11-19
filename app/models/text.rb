require 'dictionary'

class Text < ApplicationRecord

  after_save :write_to_json

  def write_to_json
    binding.pry
    Rails.root.join('lib','messages.txt')
  end
end
