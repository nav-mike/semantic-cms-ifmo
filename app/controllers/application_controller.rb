# Base controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Mongo logger
  # mongodb://<dbuser>:<dbpassword>@ds055832.mongolab.com:55832/logger - EXPERIMENTAL
  include MongodbLogger::Base
end
