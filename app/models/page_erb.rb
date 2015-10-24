require 'erb'
require 'ostruct'

class PageErb < OpenStruct
  def render(template)
    ERB.new(template).result(binding)
  end
end
