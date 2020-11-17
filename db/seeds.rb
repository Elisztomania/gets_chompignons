# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Mushroom.destroy_all
User.destroy_all

puts 'Creating user...'

user = User.create(username:"Elisztomania", email:"alisztomania@gmai.com", password:"totooo")

puts 'Creating mushrooms...'
amanite = { name: "Amanite Tue-Mouches", content: "L’Amanite tue-mouche provoque de violents troubles digestifs et nerveux, qui se manifestent par un état d’ivresse suivi d’un profond sommeil.", location: "Sous bois feuillus", eatable: false, cap: "Convexe"  }
chanterelle = { name: "Chanterelle Jaune", content: "Trop bon champignons à cuisiner", location: "Bois de conifères", eatable: true, cap: "Entonnoir"  }

[amanite, chanterelle].each do |attributes|
  mushroom = Mushroom.new(attributes)
  mushroom.user = user
  mushroom.save!
  puts "Created #{mushroom.name}"
end

puts 'Finished!'
