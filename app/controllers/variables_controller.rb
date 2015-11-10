# Variables controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class VariablesController < AuthenticateController
  layout 'admin'

  before_action :set_variable, only: %i(show update destroy)

  def index
    @variables = Variable.all
  end
end
