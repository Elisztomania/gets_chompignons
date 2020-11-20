# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

puts 'Cleaning database...'
Mushroom.destroy_all
User.destroy_all
Review.destroy_all

puts 'Creating user...'

user = User.create(username:"Mère Nature", email:"elisztomania@gmail.com", password:"totooo")

puts 'Creating mushrooms...'
amanite = { name: "Amanite Tue-Mouches", content: "L’Amanite tue-mouche provoque de violents troubles digestifs et nerveux, qui se manifestent par un état d’ivresse suivi d’un profond sommeil.", location: "Bois de feuillus", eatable: false, cap: "Convexe" }
chanterelle = { name: "Chanterelle Jaune", content: "Trop bon champignons à cuisiner", location: "Bois de conifères", eatable: true, cap: "Entonnoir"  }
coprin = { name: "Coprin Chevelu", content: "Le coprin chevelu est un très bon comestible cru ou cuit, mais à consommer jeune, avant qu’il noircisse.", location: "Lisières", eatable: true, cap: "Cylindrique"  }
xylaire = { name: "Xylaire Polymorphe", content: "La surface paraît couverte de minuscules verrues et les formes sont parfois irrégulières.", location: "Bois pourrissant", eatable: false, cap: "Verruqueuse"  }
hebelome = { name: "Hébélome Échaudé", content: "La consommation du hebélome échaudé provoque de sérieuses gastro-entérites. Il pousse sur un sol calcaire, souvent sous noisetiers.", location: "Sol calcaire", eatable: false, cap: "Convexe"  }
russule = { name: "Russule Jolie", content: "La chair, blanche et ferme, a une saveur mentholée puissante mais dégage une amertume plus ou moins prononcée.", location: "Bois de feuillus et conifères", eatable: false, cap: "Convexe"  }

[amanite, chanterelle, coprin, xylaire, hebelome, russule].each do |attributes|
  image = attributes[:name].split(" ")[0].parameterize
  source = File.open("app/assets/images/#{image}.jpg")
  mushroom = Mushroom.new(attributes)
  mushroom.photo.attach(io: source, filename: "#{image}.jpg", content_type: 'image/jpg')
  mushroom.user = user
  mushroom.save!
  puts "Created #{mushroom.name}"
end

reviews_manuelles = ["Très joli, beaucoup de délicatesse dans ce champignon, bravo Mère Nature !", "Un peu déçu de la forme du chapeau.....", "Un nom comme ça, ça donne super envie !", "Moi qui pensait qu'on en trouvait que sur des sols calcaire!! Merci des infos ;)", "J'adore 🥰"]

10.times do
  review = Review.new(rating: rand(1..5), content: reviews_manuelles.sample)
  review.mushroom = Mushroom.all.sample
  review.user = user
  review.save!
  puts "Created reviews"
end

puts 'Finished!'








