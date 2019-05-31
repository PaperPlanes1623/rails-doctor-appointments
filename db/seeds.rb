10.times do
  doctor = Doctor.create(
    name: Faker::Name.name
  )
end