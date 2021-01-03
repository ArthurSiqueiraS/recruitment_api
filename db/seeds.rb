
# location = Location.create(city: 'Remote')
# experience_range = ExperienceRange.create(min_years: 0, max_years: 1)
# technology = Technology.create(name: 'AWS')
# candidate = Candidate.create(location: location, experience_range: experience_range)
# job = Job.create(location: location, experience_range: experience_range)

Array(0..11).each do |n|
  ExperienceRange.create(min_years: n, max_years: n + 1)
end

ExperienceRange.create(min_years: 12)