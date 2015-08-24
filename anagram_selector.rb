# Given a dictionary with 1,000 words (the words are in alphabetical order given it's a dictionary),
# write a program that prints all anagrams found. For example, using the following dictionary as
# input: [ "ACT", "ANTS", "ART", "BAT", "BAR", "CAT", "DOOR", "RAT", "TAB", "TAR" ] should print
# ACT: CAT, ART: RAT, TAR, BAT: TAB.

# ASSUME: input will be a valid array

class AnagramSelector

  def initialize(input_array)
    @input_array = input_array
  end

  def print_anagrams
    puts format_anagram_strings.to_s
  end

  private

  def match_anagrams
    @input_array.group_by { |element| element.upcase.chars.sort }.values
  end

  def limit_matches_to_anagrams
    match_anagrams.select {|x| x.length>1}
  end

  def format_anagrams
    anagram_array = []
    limit_matches_to_anagrams.each do |x|
      anagram_array << "#{x.first}: #{x[1..-1]}"
    end
    anagram_array
  end

  def format_anagram_strings
    format_anagrams.join(" ").gsub("[","").gsub("]","").gsub('"',"")
  end

end

a = AnagramSelector.new([ "ACT", "ANTS", "ART", "BAT", "BAR", "CAT", "DOOR", "RAT", "TAB", "TAR" ])
a.print_anagrams