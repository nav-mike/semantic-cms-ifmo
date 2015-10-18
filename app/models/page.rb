require 'rdf/ntriples'
require 'sparql'

# Model of pages from owl.
# @author M. Navrotskiy m.navrotskiy@gmail.com
class Page < ActiveRecord::Base
  def name
    load_instance if @name.blank?
    @name = "#{@result[:page].to_s.gsub(/^.*\#/, '')}"
    @name
  end

  def path
    load_instance if @path.blank?
    @path = @result[:path].value
    @path
  end

  def short_content
    load_instance if @short_content.blank?
    @short_content = @result[:html].value.gsub(/(.{10}).+/, '\1...')
    @short_content
  end

  def html
    load_instance if @html.blank?
    @html = @result[:html].value
    @html
  end

  private

  def load_instance
    @graph ||= RDF::Repository.load("#{Rails.root}/db/main.owl")
    sse = SPARQL.parse("PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                        PREFIX owl: <http://www.w3.org/2002/07/owl#>
                        PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                        PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                        PREFIX my_ont: <http://www.semanticweb.org/mikhail/ontologies/2015/8/semantic-cms-ifmo#>
                        SELECT distinct * WHERE {
                          ?page rdf:type my_ont:Page.
                          ?page my_ont:html ?html.
                          ?page my_ont:page_path ?path
                          FILTER (?page = <#{uri}>)
                        }")
    @result ||= @graph.query(sse).first
  end
end
