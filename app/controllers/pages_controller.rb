require 'rdf/ntriples'

# Public pages controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class PagesController < ApplicationController
  # layout 'public', only: %i(index abit student graduate history staff contacts)
  layout 'admin', only: :index

  def index
    @pages = Page.all
  end
end
