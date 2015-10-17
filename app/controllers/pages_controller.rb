require 'rdf/ntriples'

# Public pages controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class PagesController < ApplicationController
  # layout 'public', only: %i(index abit student graduate history staff contacts)
  layout 'admin', only: :index

  def index
    # @pages_grid = initialize_grid(Page)
    graph = RDF::Graph.load("#{Rails.root}/db/main.owl")
    my_ont = RDF::Vocabulary.new('http://www.semanticweb.org/mikhail/ontologies/2015/8/semantic-cms-ifmo#')
    query = RDF::Query.new(page: {RDF.type => my_ont.Page, my_ont.html => :html})
    result = query.execute(graph)
    @solution = result.first
  end
end
