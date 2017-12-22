require 'net/http'
require 'json'

def translate(source_lang: "auto", target_lang:, text:) # Returns translated text as string
  JSON.parse(Net::HTTP.get(URI("https://translate.googleapis.com/translate_a/single?client=gtx&sl=#{source_lang}&tl=#{target_lang}&dt=t&q=#{text}")))[0][0][0]
end
