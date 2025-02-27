require 'markly'

class Gibier2::Page
  attr_accessor :title

  def to_html
    "<h1>#{title}</h1>"
  end
end

class Gibier2::Parser
  def text_content(node)
    text = ''
    node.walk do |n|
      case n.type
      when :text
        text << n.string_content
      end
    end

    text
  end

  def parse(content)
    pages = []
    doc = Markly.parse(content)
    doc.walk do |node|
      case node.type
      when :header
        page = Page.new
        page.title = text_content(node.extract_children)
        pages << page
      else
      end
    end
    pages
  end
end
