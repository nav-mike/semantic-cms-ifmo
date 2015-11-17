# Variables controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class VariablesController < AuthenticateController
    before_action :set_variable, only: %i(show exec update destroy)

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

  def show
  end

  def exec
    graph = RDF::Repository.load("#{Rails.root}/db/main.owl")
    sse = SPARQL.parse(@variable.sparql)
    result = graph.query(sse).to_a.map { |e| e.to_hash }
    render json: result, status: :ok
  rescue => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
    render json: e.message, status: :ok
  end

  def update
    if @variable.update(variable_params)
      render json: true, status: :ok
    else
      logger.error @variable.errors.messages.to_s
      render json: {message: @variable.errors.messages}, status: :internal_server_error
    end
  end

  def destroy
    if @variable.destroy
      render json: true, status: :ok
    else
      logger.error @user.errors.messages.to_s
      render json: {message: @user.errors.messages.to_s}, status: :internal_server_error
    end
  rescue => e
    logger.error e.message
    logger.error e.backtrace.join("\n")
    render json: {message: e.message}, status: :internal_server_error
  end

  private

  def set_variable
    @variable = Variable.find params[:id]
  end

  def variable_params
    params.require(:variable).permit(%i(name sparql))
  end
end
