# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Project.create!(name: 'Ironhack' , description: 'Ironhack is a.....')
Project.create!(name: 'Time Tracking App')
Project.create!(name: 'Recipes' , description: 'Track my favorites recipes')
i=0
while i < 10
  project= Project.create!(name: "Food #{i}", description: "My favorite meal #{i}")
  project.time_entries.create(hours: 0, minutes: 35)
  i+=1
end
