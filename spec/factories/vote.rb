FactoryBot.define do
  factory :vote do
    chamber_id { 1223 }
    bill_id { 342_343 }
    member_id { 2_343_243 }
    position { 234 }
  end
end
