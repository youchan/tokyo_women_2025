#require 'bundler/setup'
require 'redcarpet'
require 'js'

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
html = markdown.render("This is *bongos*, indeed.")

page = JS.global[:document].getElementsByClassName('page')[0]
page[:innerHTML] = html
