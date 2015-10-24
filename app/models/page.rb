require 'rdf/ntriples'
require 'sparql'

# Model of pages from owl.
# @author M. Navrotskiy m.navrotskiy@gmail.com
class Page < ActiveRecord::Base
  def delete_full
    drop_rdf
    destroy
  end

  def self.by_path(path)
    query = path
    graph = RDF::Repository.load("#{Rails.root}/db/main.owl")
    sse = SPARQL.parse("PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
                        PREFIX owl: <http://www.w3.org/2002/07/owl#>
                        PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
                        PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
                        PREFIX my_ont: <http://www.semanticweb.org/mikhail/ontologies/2015/8/semantic-cms-ifmo#>
                        SELECT distinct * WHERE {
                          ?page rdf:type my_ont:Page.
                          ?page my_ont:html ?html.
                          ?page my_ont:page_title ?title.
                          ?page my_ont:page_path ?path
                          FILTER (str(?path) = \"#{query}\")
                        }")
    result = graph.query(sse).first
    Page.find_by uri: result[:page].to_s
  end

  def name
    return '' if id.blank?
    load_instance if @name.blank?
    @name = "#{@result[:page].to_s.gsub(/^.*\#/, '')}"
    @name
  end

  def path
    return '' if id.blank?
    load_instance if @path.blank?
    @path = @result[:path].value
    @path
  end

  def short_content
    return '' if id.blank?
    load_instance if @short_content.blank?
    @short_content = @result[:html].value.gsub(/(.{10}).+/, '\1...')
    @short_content
  end

  def html
    projects = Project.all
    return '' if id.blank?
    load_instance if @html.blank?
    @html = @result[:html].value
    @html
  end

  def title
    return '' if id.blank?
    load_instance if @title.blank?
    @title = @result[:title].value
    @title
  end

  def create_rdf(options)
    insert_rdf(options)

    Page.create! uri: "http://www.semanticweb.org/mikhail/ontologies/2015/8/semantic-cms-ifmo##{options[:name]}"
  end

  def update_rdf(options)
    drop_rdf
    insert_rdf options
    self.uri = "http://www.semanticweb.org/mikhail/ontologies/2015/8/semantic-cms-ifmo##{options[:name]}"
    save
  end

  private

  def drop_rdf
    @graph ||= RDF::Repository.load("#{Rails.root}/db/main.owl")
    page = RDF::URI.new uri
    @graph.delete [page, nil, nil]
    File.open("#{Rails.root}/db/main.owl", 'w') { |f| f << @graph.dump(:turtle) }
  end

  def insert_rdf(options)
    @graph ||= RDF::Repository.load("#{Rails.root}/db/main.owl")
    page = RDF::URI.new "http://www.semanticweb.org/mikhail/ontologies/2015/8/semantic-cms-ifmo##{options[:name]}"
    base = RDF::URI.new 'http://www.semanticweb.org/mikhail/ontologies/2015/8/semantic-cms-ifmo#Page'
    owl = RDF::URI.new 'http://www.w3.org/2002/07/owl#NamedIndividual'
    html = RDF::URI.new 'http://www.semanticweb.org/mikhail/ontologies/2015/8/semantic-cms-ifmo#html'
    path = RDF::URI.new 'http://www.semanticweb.org/mikhail/ontologies/2015/8/semantic-cms-ifmo#page_path'
    title = RDF::URI.new 'http://www.semanticweb.org/mikhail/ontologies/2015/8/semantic-cms-ifmo#page_title'
    @graph << [page, RDF.type, base]
    @graph << [page, RDF.type, owl]
    @graph << [page, html, options[:html]]
    @graph << [page, path, options[:path]]
    @graph << [page, title, options[:title]]
    File.open("#{Rails.root}/db/main.owl", 'w') { |f| f << @graph.dump(:turtle) }
  end

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
                          ?page my_ont:page_title ?title.
                          ?page my_ont:page_path ?path
                          FILTER (?page = <#{uri}>)
                        }")
    @result ||= @graph.query(sse).first
  end
end
