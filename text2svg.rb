require "cairo"
require "pango"

TEXT = "The grass is greener where we're going."

Cairo::SVGSurface.new("t.svg",1080,720) do |surface|
  cr = Cairo::Context.new(surface)
  cr.select_font_face("Brandon Grotesque",
                              Cairo::FONT_SLANT_NORMAL,
                              Cairo::FONT_WEIGHT_NORMAL)
   cr.set_font_size(24)
   cr.move_to(200,200)
   cr.show_text(TEXT)
   #surface.save()
end
