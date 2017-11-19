require 'csv'
require 'colorize'

class Dictionary
  attr_accessor :file
  #default path Rails.root.join('lib','textwords.csv')
  def initialize(csv_file = Rails.root.join('lib','textwords.csv'))
    begin
      @file = CSV.read(csv_file)
    rescue
      puts "Oops something went wrong reading the file."
    end
  end

  def expand_text(text_to_expand)
    #expand abbreviations of a given text
    #returns a string

    text_to_expand = text_to_expand.split(" ")
    text_to_expand.each_with_index do |word_to_check, i|
      expanded_text = self.expand_word(word_to_check)
      if expanded_text != nil
        text_to_expand[i] +=" <#{expanded_text}>"
      end
      # scan(/[A-Z]{2,7}/) finds and store capital words from 2-7 characters in an array
    end
    return text_to_expand.join(" ")
  end

  def expand_word(word_to_expand)
    #returns the expanded version of the abbr. version given
    #else nil
    expanded_word = self.file.select{|x,y| x== word_to_expand}.map{|x,y|y}[0]
    expanded_word ? expanded_word : nil
  end
end

