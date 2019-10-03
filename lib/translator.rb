# require modules here
require "yaml"

def load_library(filepath)
  emojilib = YAML.load_file(filepath)
  emojilib.reduce({}) do |memo, (meaning, emojis)|
    if !memo[:get_meaning] && !memo[:get_emoticon]
      memo[:get_meaning] = {}
      memo[:get_emoticon] = {}
    end 
    memo[:get_meaning][emojis.last] = meaning
    memo[:get_emoticon][emojis.first] = emojis.last
    memo
  end 
end

def get_japanese_emoticon(filepath, emoticon)
  load_library(filepath)[:get_emoticon][emoticon] ||= "Sorry, that emoticon was not found"
end

<<<<<<< HEAD
def get_english_meaning(filepath, emoticon)
  load_library(filepath)[:get_meaning][emoticon] ||= "Sorry, that emoticon was not found"
=======
def get_english_meaning(filepath, meaning)
  load_library(filepath)[:get_meaining][meaning] ||= "Sorry, that emoticon was not found"
>>>>>>> ce56cead2ce0db974967b8baa02839030a54ba41
end