class SkillsController < ApplicationController
  def index
    @skills = Skillr.all
  end

  def show
    @skill = Skill.find(params[:id])
  end
end
