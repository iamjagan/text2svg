=begin
  cairo.rb - Ruby/Pango with cairo sample script.
  Copyright (c) 2005 Ruby-GNOME2 Project
  This program is licenced under the same licence as Ruby-GNOME2.
  $Id: pango_cairo.rb,v 1.1 2005/10/15 07:57:52 mutoh Exp $
=end

require 'pango'

unless Pango.cairo_available?
  STDERR.puts "This sample requires Pango 1.0.0 or later and cairo support"
  exit 1
end

filename = ARGV.shift
filename ||= "svg/text.svg"


FONT = "Brandon Grotesque Bold 36"
FONT1 = "Brandon Grotesque Light 144"
FONT_TBI = "FF Scala 48"
FONT_TBI_Bold = "FF Scala Bold 48"
FONT_Australis = "Australis Pro Swash Bold Italic 48"
FONT_1=FONT_Australis
def draw_text(cr)
  tbi_1_1="Meet Arif"
  # Center coordinates on the middle of the region we are drawing

  # Create a PangoLayout, set the font and text
  layout = cr.create_pango_layout
  
  desc = Pango::FontDescription.new(FONT_1)
  layout.set_font_description(desc)
  layout.set_text(tbi_1_1);
  ink,logical=layout.get_line(0).extents    
  pix_ink,pix_logical=layout.get_line(0).pixel_extents    
  puts "ink.ascent=",ink.ascent
  puts "logical.ascent=",logical.ascent
  puts "pink.ascent=",pix_ink.ascent
  puts "plogical.ascent=",pix_logical.ascent
  #cr.move_to(ink.lbearing/Pango::SCALE*-1,ink.ascent/Pango::SCALE*-1);
  cr.move_to(pix_ink.lbearing*-1,pix_ink.ascent)
  cr.update_pango_layout(layout)
  cr.show_pango_layout(layout)
end

surface = Cairo::SVGSurface.new(filename,10800, 7200) 
cr = Cairo::Context.new(surface);
draw_text(cr)


