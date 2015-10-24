require 'rdf/ntriples'

# Public pages controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class PagesController < ApplicationController
  layout 'admin', only: %i(index new edit)

  before_action :set_page, only: %i(edit update destroy)

  def index
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

  def create
    @page = Page.new()
    @page.create_rdf pages_params
    render json: true, status: :ok
  rescue => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
    render json: {message: e.message}, status: :interval_server_error
  end

  def destroy
    @page.delete_full
    render json: {message: 'Page was successfully destroyed.'}, status: :ok
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def pages_params
    params.permit(:name, :path, :title, :html)
  end
end
