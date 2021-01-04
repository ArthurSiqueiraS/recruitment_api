class CandidatesController < QualificationsController
  def index
    candidates = query(Candidate, params)

    candidates = candidates.map { |candidate| candidate_data(candidate) }

    render json: candidates, status: :ok
  end

  def show
    begin
      candidate = Candidate.find(params[:id])
      render json: candidate, status: :ok
    rescue ActiveRecord::RecordNotFound
      render status: :not_found
    end
  end

  def candidate_data(candidate)
    candidate_technologies = CandidatesTechnologies.where(candidate: candidate).order(main: :desc)
    technologies = candidate_technologies.map do |a|
      {
        id: a.technology.id,
        name: a.technology.name,
        main: a.main
      }
    end

    candidate.as_json.merge({
      location: candidate.location,
      technologies: technologies
    })
  end
end
