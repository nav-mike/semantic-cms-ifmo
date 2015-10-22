require 'rdf/ntriples'

# Public pages controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class PagesController < ApplicationController
  layout 'admin', only: %i(index new edit)

  before_action :set_page, only: %i(edit update destroy)

  def index
    sleep 10.seconds
    @pages = Page.all
  end

  def show
    if params[:id].blank? && params[:page].present?
      @page = Page.by_path params[:page]
    elsif params[:id].present?
      @page = Page.find params[:id]
    else
      fail '404'
    end
    render 'show', layout: 'public'
  rescue
    render file: "#{Rails.root}/public/404", layout: false, status: :not_found
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def destroy
    @page.delete_full
    redirect_to pages_url, notice: 'Page was successfully destroyed.'
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end
end
