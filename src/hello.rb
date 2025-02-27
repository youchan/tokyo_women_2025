require_relative 'parser'
require 'js'

puts "##########3"

markdown = File.read('slide.md')
parser = new Gibier2::Parser.new
pages = parser.parse(markdown)

page = JS.global[:document].getElementsByClassName('page')[0]
page[:innerHTML] = pages[0].to_html
