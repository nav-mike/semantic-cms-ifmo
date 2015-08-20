# Public pages controller class
# @author M. Navrotskiy m.navrotskiy@gmail.com
class PagesController < ApplicationController
  layout 'public', only: %i(index abit student graduate history staff contacts)

  def index
  end

  def abit
  end

  def student
  end

  def graduate
  end

  def history
  end

  def staff
  end

  def contacts
  end
end
