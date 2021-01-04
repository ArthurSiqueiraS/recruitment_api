class JobsController < QualificationsController
  def index
    jobs = query(Job, params).page(params[:page]).per(6)
    total_pages = jobs.total_pages

    jobs = jobs.map { |job| job_data(job) }

    render json: { jobs: jobs, pages: total_pages }, status: :ok
  end

  private

  def job_data(job)
    job.as_json.merge({
      location: job.location,
      technologies: job.technologies
    })
  end
end
