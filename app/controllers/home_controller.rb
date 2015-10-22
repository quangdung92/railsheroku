# This Class is Home Controller
# @author Kudo Syuji
# @version 1.0
class HomeController < ApplicationController

  # index action
  def index

    @kinds = Kind.create_select_options

    @num = ActionItem.get_count_of_action_items(current_user.id)

  end

  def flatten_keys(hash, prefix="")
    keys = []
    hash.keys.each do |key|
      if hash[key].is_a? Hash
        current_prefix = prefix + "#{key}."
        keys << flatten_keys(hash[key], current_prefix)
      else
        keys << "#{prefix}#{key}"
      end
    end
    prefix == "" ? keys.flatten : keys
  end


  # function test locale files
  def testlocale
    check_path = 'config/locales/'
    locale_list = %w(vi en ja)

    @missing_files = []
    @missing_keys = []
    # begin checking if all the necessary locale files exist
    folders = Dir.glob("#{check_path}**/*/").push(check_path)
    for folder in folders do
      key_list = []
      for locale in locale_list do
        file = "#{folder}#{locale}.yml"
        if File.exist?(file)
          thing = YAML.load_file(file)
          key_list.push(flatten_keys(thing[locale]))
        else
          @missing_files.push(file)
        end
      end
      key_list.each_with_index do |key1,k1|
        for key2 in key_list do
          missing = key2 - key1
          if missing.any?
            missing.each { |key| @missing_keys.push("Missing #{key} in #{folder}#{locale_list[k1]}.yml")  }
          end

        end
      end
    end

  end
end
