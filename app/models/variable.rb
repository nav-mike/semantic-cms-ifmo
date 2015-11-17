class Variable < ActiveRecord::Base
  def destroy
    return unless can_removed
    delete
  end
end
