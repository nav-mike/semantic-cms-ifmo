# Test class of data cube!
# Class of Project
# @author M. Navrotskiy m.navrotskiy@gmail.com
class Project
  attr_accessor :link, :peoples, :github_link, :twitter, :leader, :partners, :keywords
  attr_accessor :is_active, :title, :name, :logo, :start_date, :end_date, :departments
  attr_accessor :publications, :description

  def initialize(options)
    init_peoples options

    init_project_info options

    init_social options
    @publications = options[:publications] || []
  end

  private

  def init_peoples(options)
    @leader = options[:leader] || nil
    @departments = options[:departments] || []
    @partners = options[:partners] || []
    @peoples = options[:peoples] || []
  end

  def init_social(options)
    @link = options[:link] || 'http://aksw.org/Projects/OntoWiki.html'
    @github_link = options[:github_link] || 'https://github.com/AKSW/OntoWiki'
    @twitter = options[:twitter] || 'https://twitter.com/akswgroup'
    @keywords = options[:keywords] || %w(ai metadata socialsoftware database framework owl ontology php semantic_web dynamic_content rdf web wiki)
  end

  def init_project_info(options)
    @is_active = options[:is_active] || true
    @title = options[:title] || 'a tool providing support for agile, distributed knowledge engineering scenarios'
    @name = options[:name] || 'OntoWiki'
    @logo = options[:logo] || 'http://s3.amazonaws.com/cloud.ohloh.net/attachments/11400/ow-logo_med.png'
    @start_date = options[:start_date] || 4.years.ago
    @end_date = options[:end_date] || 2.years.from_now
    @description = options[:description] || 'OntoWiki facilitates the visual presentation of a knowledge base as an
                                             information map, with different views on instance data. It enables intuitive
                                             authoring of semantic content, with an inline editing mode for editing RDF content,
                                             similar to WYSIWIG for text documents.'
  end
end
