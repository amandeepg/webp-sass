#  Copyright 2012 Amandeep Grewal
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

require 'sass'

module Sass::Script::Functions
  def webp(string, cmd_line_options)
    assert_type string, :String
    assert_type cmd_line_options, :String

    #Strip out the 'url' part if it was given in that format
    string = if string.value =~ /^url\(/
               string.value[4..-2]
             else
               string.value
             end

    #Get locations of all files
    orig_file = File.expand_path(File.join(File.dirname(options[:css_filename]), string))
    image_dir = File.dirname(orig_file)
    file_ext = File.extname(orig_file)[1..-1]
    webp_file = File.join(image_dir, File.basename(string, file_ext) + "webp")

    full_cmd_line_options = cmd_line_options.value + ' -quiet ' + orig_file + ' -o ' + webp_file

    #Generate .webp images
    if file_ext == 'png'
      system('cwebp -lossless ' + full_cmd_line_options)
    elsif ['jpg', 'jpeg'].include? file_ext
      system('cwebp ' + full_cmd_line_options)
    end

    #Write out url for the .webp image
    Sass::Script::String.new('url(' + File.join(File.dirname(string), File.basename(string, file_ext) + "webp" + ')'))
  end

  declare :webp, :args => [:string, :cmd_line_options]
end
