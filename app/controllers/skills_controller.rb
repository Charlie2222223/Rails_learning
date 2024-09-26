class SkillsController < ApplicationController
  before_action :set_skill, only: [:show]

  def index
    @skills = Skill.all
    render json: @skills
  end

  def show
    render json: @skill
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end
end
