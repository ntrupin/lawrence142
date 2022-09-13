class IssuesController < ApplicationController
  before_action :authenticate_admin!, :except => [:index, :show]

  def index
    @issue = Issue.all
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def new
    @issue = Issue.new
  end

  def create
    @issue = Issue.new(issue_params)
    if @issue.save
        redirect_to @issue
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])

    if @issue.update(issue_params)
      redirect_to @issue
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def issue_params
      params.require(:issue).permit(:name, :date, :pdf)
    end
end
