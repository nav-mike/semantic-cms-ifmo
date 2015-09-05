class AddDefaultSettings < ActiveRecord::Migration
  def change
    %w(sparql_endpoint department_title university_title domain).each do |item|
      Setting.create! key: item, value: '-'
    end
  end
end
