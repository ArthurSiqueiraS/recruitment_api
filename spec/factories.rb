FactoryBot.define do
  factory :location do
    city { 'São Paulo' }
    state { 'SP' }
  end

  factory :experience_range do
    min_years { 0 }
    max_years { 1 }
  end

  factory :technology do
    sequence(:name) { |n| "Ruby#{n}" }
  end

  factory :candidate do
    base_id { 1 }
    association :location
    association :experience_range

    factory :candidate_with_technologies do
      after(:create) do |candidate|
        create_list(:technology, 2, candidates: [candidate])
      end
    end
  end

  factory :job do
    base_id { 1 }
    association :location
    association :experience_range

    factory :job_with_technologies do
      after(:create) do |job|
        create_list(:technology, 2, jobs: [job])
      end
    end
  end
end