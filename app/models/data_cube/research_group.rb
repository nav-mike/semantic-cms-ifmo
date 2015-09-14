require 'faker'

# Test class of data cube!
# Class of Research Group
# @author M. Navrotskiy m.navrotskiy@gmail.com
class ResearchGroup
  attr_accessor :projects, :publications, :name, :tags, :about, :people, :research_themes

  def initialize(options = {})
    @projects = options[:projects] || []
    @publications = options[:publications] || []
    @name = options[:name] || Faker::Lorem.word.humanize
    @tags = options[:tags] || Faker::Lorem.words(5)
    @about = options[:about] || Faker::Lorem.paragraph
    @people = options[:people] || []
    @research_themes = options[:research_themes] || Faker::Lorem.words(10)
  end
end
