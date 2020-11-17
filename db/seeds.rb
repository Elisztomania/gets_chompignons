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

user = User.create(username:"Elisztomania", email:"elisztomania@gmail.com", password:"totooo")

puts 'Creating mushrooms...'
amanite = { name: "Amanite Tue-Mouches", content: "L’Amanite tue-mouche provoque de violents troubles digestifs et nerveux, qui se manifestent par un état d’ivresse suivi d’un profond sommeil.", location: "Bois de feuillus", eatable: false, cap: "Convexe"  }
amanite.photo.attach(io: File.open('../app/assets/images/amanite.jpg'), filename: 'amanite.jpg', content_type: 'image/jpg')
chanterelle = { name: "Chanterelle Jaune", content: "Trop bon champignons à cuisiner", location: "Bois de conifères", eatable: true, cap: "Entonnoir"  }
coprin = { name: "Coprin Chevelu", content: "Le coprin chevelu est un très bon comestible cru ou cuit, mais à consommer jeune, avant qu’il noircisse.", location: "Lisières", eatable: true, cap: "Cylindrique"  }
xylaire = { name: "Xylaire Polymorphe", content: "La surface paraît couverte de minuscules verrues et les formes sont parfois irrégulières.", location: "Bois pourrissant", eatable: false, cap: "Verruqueuse"  }
hebelome = { name: "Hébélome Échaudé", content: "La consommation du hebélome échaudé provoque de sérieuses gastro-entérites. Il pousse sur un sol calcaire, souvent sous noisetiers.", location: "Sol calcaire", eatable: false, cap: "Convexe"  }
russule = { name: "Russule Jolie", content: "La chair, blanche et ferme, a une saveur mentholée puissante mais dégage une amertume plus ou moins prononcée.", location: "Bois de feuillus et conifères", eatable: false, cap: "Convexe"  }

[amanite, chanterelle, coprin, xylaire, hebelome, russule].each do |attributes|
  mushroom = Mushroom.new(attributes)
  mushroom.user = user
  mushroom.save!
  puts "Created #{mushroom.name}"
end

puts 'Finished!'
