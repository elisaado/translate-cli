require 'net/http'
require 'json'

def blank?(object)
  return object.to_s.strip.size <= 0 # can something be smaller than 0? Dunno.
end

def translate(source_lang="auto", target_lang, text) # Returns translated text as string
  translation = JSON.parse(Net::HTTP.get(URI("https://translate.googleapis.com/translate_a/single?client=gtx&sl=#{source_lang}&tl=#{target_lang}&dt=t&q=#{text}")))[0]
end

def show_usage()
  puts 'Usage: translate [source language (use auto for auto)] [target language] [text]'
  puts
  puts 'Example:'
  puts '  translate auto en kaas #=> "cheese"'
  puts
  puts 'By Eli Saado and contributors'
  puts 'Translation engine provided by Google'
end

if !blank?(ARGV[0]) && !blank?(ARGV[1]) && !blank?(ARGV[2])
  translation = translate(ARGV[0], ARGV[1], ARGV[2])
  if blank?(translation)
    puts "Unkown language(s)"
  else
    puts "Translation: #{translation[0][0]}"
    puts 'By Eli Saado and contributors'
    puts 'Translation engine provided by Google'
  end
else
  show_usage()
end
