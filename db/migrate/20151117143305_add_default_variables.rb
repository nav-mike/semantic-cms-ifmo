class AddDefaultVariables < ActiveRecord::Migration
  def change
    %w(projects staff publications).each do |v|
      Variable.create! name: v, sparql: '-', can_removed: false
    end
  end
end
