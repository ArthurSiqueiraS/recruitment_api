require 'net/http'

class BaseApiController < ApplicationController
  def update
    uri = URI.parse('https://geekhunter-recruiting.s3.amazonaws.com/code_challenge.json')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.get(uri.request_uri)

    data = JSON.parse(response.body)

    inserted_data = {
      candidates: insert_candidates(data['candidates']),
      jobs: insert_jobs(data['jobs'])
    }

    render json: inserted_data, status: :created
  end

  private

  def insert_candidates(candidates)
    new_candidates = []

    candidates.each do |c|
      candidate = Candidate.find_by(base_id: c['id'])
      if candidate.nil?
        new_candidates.push(create_candidate(c))
      end
    end

    new_candidates
  end

  def insert_jobs(jobs)
    new_jobs = []

    jobs.each do |c|
      job = Job.find_by(base_id: c['id'])
      if job.nil?
        new_jobs.push(create_job(c))
      end
    end

    new_jobs
  end

  def create_candidate(candidate)
    location = find_or_create_location(candidate['city'])
    exp_min, exp_max = candidate['experience'].scan(/\d+/)

    new_candidate = Candidate.create({
      base_id: candidate['id'],
      location: location,
      exp_min: exp_min,
      exp_max: exp_max
    })

    find_or_create_candidate_technologies(new_candidate, candidate['technologies'])

    new_candidate
  end

  def create_job(job)
    location = find_or_create_location(job['city'])
    exp_min, exp_max = job['experience'].scan(/\d+/)

    new_job = Job.create({
      base_id: job['id'],
      location: location,
      exp_min: exp_min,
      exp_max: exp_max
    })

    find_or_create_job_technologies(new_job, job['technologies'])

    new_job
  end

  def find_or_create_location(location_string)
    city, state = location_string.split(' - ')
    Location.find_or_create_by(city: city, state: state)
  end

  def find_or_create_candidate_technologies(candidate, technologies)
    technologies.each do |t|
      technology = Technology.find_or_create_by(name: t['name'].strip)

      CandidatesTechnologies.create({
        technology: technology,
        candidate: candidate,
        main: t['is_main_tech']
      })
    end
  end

  def find_or_create_job_technologies(job, technologies)
    technologies.each do |t|
      technology = t ? Technology.find_or_create_by(name: t['name']) : Technology.limit(1).order("RANDOM()").first

      JobsTechnologies.create({
        technology: technology,
        job: job
      })
    end
  end
end
