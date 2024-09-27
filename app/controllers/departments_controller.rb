class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show]

  def index
    @departments = Department.all
    render json: @departments
  end

  def show
    render json: @department
  end

  private

  def set_department
    @department = Department.find(params[:id])
  end
end
