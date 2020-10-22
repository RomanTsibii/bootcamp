class DepartmentController < ApplicationController
  def index
    @department = Department.all
  end
end
