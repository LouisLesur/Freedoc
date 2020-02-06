# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Doctor.delete_all
Patient.delete_all
Appointment.delete_all
City.delete_all
InterSpec.delete_all
Specialty.delete_all

4.times do |index|
  City.create(name: Faker::Address.city)
end

100.times do |index|
  Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city_id: City.find(rand(City.first.id..City.last.id)).id
  )
end

20.times do |index|
  Doctor.create(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    zip_code: Faker::Address.zip,
    city_id: City.find(rand(City.first.id..City.last.id)).id
  )
end

10.times do |index|
  Specialty.create(
    specialty: ['dentist','general','surgeon','ophthalmologist','dermatologist','pediatrician'].sample
  )
end

50.times do |index|
  Appointment.create(
    date: Faker::Date.in_date_period,
    patient_id: Patient.find(rand(Patient.first.id..Patient.last.id)).id,
    doctor_id: Doctor.find(rand(Doctor.first.id..Doctor.last.id)).id,
    city_id: City.find(rand(City.first.id..City.last.id)).id
  )
end

20.times do |index|
  InterSpec.create(
    doctor_id:  Doctor.find(rand(Doctor.first.id..Doctor.last.id)).id,
    specialty_id: Specialty.find(rand(Specialty.first.id..Specialty.last.id)).id
    )
end
