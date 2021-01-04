FactoryBot.define do
  factory :location do
    city { 'São Paulo' }
    state { 'SP' }
  end

  factory :technology do
    sequence(:name) { |n| "Ruby#{n}" }
  end

  factory :candidate do
    base_id { 1 }
    exp_min { 0 }
    exp_max { 1 }
    association :location

    factory :candidate_with_technologies do
      after(:create) do |candidate|
        create_list(:technology, 2, candidates: [candidate])
      end
    end
  end

  factory :job do
    base_id { 1 }
    exp_min { 0 }
    exp_max { 2 }
    association :location

    factory :job_with_technologies do
      after(:create) do |job|
        create_list(:technology, 2, jobs: [job])
      end
    end
  end
end