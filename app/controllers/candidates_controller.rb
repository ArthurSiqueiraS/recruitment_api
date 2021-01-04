class CandidatesController < QualificationsController
  def index
    candidates = query(Candidate, params).limit(5)

    candidates = candidates.map { |candidate| candidate_data(candidate) }

    render json: candidates, status: :ok
  end

  private

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
