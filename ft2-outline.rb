require "cairo"
require "pango"
require "ft2"
google_font_path = "/usr/local/share/fonts/google-fonts/"
TEXT = "Nothing"
face = FT2::Face.new google_font_path+"Lato-Regular.ttf"
if (face.flags & (FT2::Face::SCALABLE) != 0)
    puts 'face is scalable'
end

