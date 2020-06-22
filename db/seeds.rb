# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "open-uri"


Client.destroy_all
User.destroy_all

user = User.create(email: "laura1@gmail.com", password: "123456")

client1 = Client.new(nom: "Dupond", prenom: "Pierre", telephone_1: "0612345678", telephone_2: "0712345678", email: "pierredupond@gmail.com", adresse: "12 Rue Paradis, 13006 Marseille", categorie: "Particulier", information: "joignable entre 9h et 18h", fidelite: "VIP")
client1.user = user
client1.save

client2 = Client.new(nom: "France", prenom: "Claire", telephone_1: "0617283948", telephone_2: "0138495839", email: "clairefrance@gmail.com", adresse: "36 Rue Sainte, 13006 Marseille", categorie: "Entreprise", information: "joignable sur son portable", fidelite: "première collaboration", entreprise: "Bouygues")
client2.user = user
client2.save


tache1 = Tache.new(object: "Remplacement_chaudière", description: "Il faudrait reparer la chaudière elle à un problème d'écrous", priorite: 1, environnement: "dehors")
 tache1.user = user
 tache1.save
