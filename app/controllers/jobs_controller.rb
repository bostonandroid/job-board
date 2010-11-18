class JobsController < ApplicationController
  respond_to :html, :atom, :only => :index

  def index
    @jobs = Job.index
  end

  def new
    @job = Job.new
    @job.expires_on = 2.weeks.from_now
  end

  def create
    @job = Job.new(params[:job])
    if @job.save
      flash[:notice] = 'Your job ad has been posted.'
      redirect_to jobs_path
    else
      render :new
    end
  end

  def show
    @job = Job.find(params[:id])
    # TODO: QR code
  end
end
