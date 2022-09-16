class IssuesController < ApplicationController
  before_action :authenticate_admin!, :except => [:index, :show, :latest]

  def index
    @issue = Issue.all
    .order(date: :desc)
  end

  def show
    @issue = Issue.find(params[:id])
  end

  def new
    @issue = Issue.new
  end

  def create
    issue_params[:id] = Issue.count + 1
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

  def latest
    @issue = Issue.where('date <= ?', DateTime.now)
      .order(date: :desc)
      .first
    redirect_to @issue
  end

  private
    def issue_params
      params.require(:issue).permit(:name, :date, :pdf)
    end
end
