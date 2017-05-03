require "set"

class WordChainer
  attr_accessor :dict, :start, :target

  def initialize(filename)
    @dict = Set.new(File.readlines(filename).map{|word| word.chomp})

  end

  def one_step(str1, str2)
    diff = 0
    str1.chars.each_with_index do |el, idx|
      diff += 1 if el != str2[idx]
    end
    diff == 1
  end
# Set filter method for adjacent words
  def adjacent_words_(word)
    @dict.select {|el| el.length == word.length && one_step(el, word)}
  end
# Set lookup method for adjacent words
  def adjacent_words(word)
    res = []
    letters = ("a".."z").to_a
    word = word.chars
    word.each_with_index do |char, idx|
      sword = word.dup
      (letters - [char]).each do |subschar|
        sword[idx] = subschar
        res << sword.join("") if @dict.include?(sword.join(""))
      end
    end
    res
  end

  def explore_current_words
    @current_words.each do |word|
      adjacent_words(word).each do |adjword|
        unless @all_seen.include?(adjword)
          @new_current_words << adjword
          @all_seen[adjword] = word
          build_path if word == @target
        end
      end
    end
  end

  def run(src, target)
    @src = src
    @target = target
    return p "Already here" if @scr == @target
    @current_words = [src]
    @all_seen = {src => nil}
    until @current_words.empty?
      @new_current_words = []
      explore_current_words
    #  @new_current_words.each {|word| p "#{word} came from #{@all_seen[word]}"}
    #  p "-----new step --------"
      @current_words = @new_current_words
    end
    build_path
  end

  def build_path
    path = [@target]
    until path.last == @src
      path << @all_seen[path.last]
    end
    path.each{|word| p word }
  end
end
