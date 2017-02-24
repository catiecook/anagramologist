require 'json'

class PagesController < ApplicationController

  # define the index page
  def index
    @greeting = "Whats The Word?"
  end

  # search page
  def search
    puts "in search route"
    get_word
    # renders word's anagrams to json on /search
    render json: @anagrams
    if @anagrams
      get '/:word'
  end

  def word
    #render the anagrams - duplicate of index but with search word
  end

  # def search:word
  #   @greeting = "Anagram Finder"
  #   @found = "Anagrams go here"
  # end

  def get_word
    # get word from form
    base_word = params['base_word']
    arrange_word(base_word) #function that sorts word to find anagram
  end

  def arrange_word(base_word)
    # remove white spage
    base_word = base_word.strip
    # sort letters alphebetically
    sorted_base_word = base_word.downcase.split('').sort.join
    # call anagram function
    new_anagram(base_word, sorted_base_word) #find anagram
  end

  def new_anagram(base_word, sorted_base_word)

    hash = Hash.new
    anagrams = Array.new

    File.open("app/assets/files/dictionary.txt", 'r') do |file|
      file.readlines.each_with_index do |line, index|
        original = line.strip
        if original.length == base_word.length

          sorted = original.downcase.split('').sort.join

          if sorted_base_word == sorted
            anagrams.push(original)
          end
        end
        hash[base_word] = anagrams
        @anagrams = hash[base_word]

      end
    end
  end

  def show_anagrams
    @greeting = "Anagram Finder"
    @found = "Anagrams go here"
  end
end
