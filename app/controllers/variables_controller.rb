# Variables controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class VariablesController < AuthenticateController
  layout 'admin'

  before_action :set_variable, only: %i(show update destroy)

  def index
    @variables = Variable.all
  end

  def create
    @variable = Variable.new(variable_params)
    @variable.save!
    render json: true, status: :ok
  rescue => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
    render json: {message: e.message}, status: :internal_server_error
  end

  private

  def variable_params
    params.require(:variable).permit(%i(name sparql))
  end
end
