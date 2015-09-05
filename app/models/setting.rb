# Setting of cms
# @author M. Navrotskiy m.navrotskiy@gmail.com
class Setting < ActiveRecord::Base
  def destroy
    return unless can_removed
    delete
  end

  def self.department_title
    result = find_by(key: 'department_title').value
    return 'Semantic CMS' if result.blank? || result == '-'
    result
  end

  def self.university_title
    result = find_by(key: 'university_title').value
    return 'Semantic CMS' if result.blank? || result == '-'
    result
  end
end
