require 'rdf/ntriples'

# Model of pages from owl.
# @author M. Navrotskiy m.navrotskiy@gmail.com
class Page
  def self.all
    graph = RDF::Graph.load("#{Rails.root}/db/main.owl")
    my_ont = RDF::Vocabulary.new('http://www.semanticweb.org/mikhail/ontologies/2015/8/semantic-cms-ifmo#')
    query = RDF::Query.new(page: {RDF.type => my_ont.Page, my_ont.html => :html})
    result = query.execute(graph)
    pages = []
    result.each do |solution|
      page = OpenStruct.new(
        name: "#{solution[:page].to_s.gsub(/^.*\#/, '')}",
        path: '/???/?=?',
        short_content: solution[:html].value.gsub(/(.{10}).+/, '\1...'),
        uri: solution[:page],
        id: 0
      )
      pages << page
    end
    pages
  end
end
