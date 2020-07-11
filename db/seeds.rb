# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "starting to seed"



Chantier.destroy_all
Client.destroy_all
User.destroy_all
puts "creating users"


user = User.new(email:"laura1@gmail.com", password:"123456", nom:"France", prenom:"Laura", nom_societe:"Bouygues", numero_siret: 1234567890, numero_tva: 1234567890, adresse: "18 avenue du petit bosquet 13012 Marseille", jours_travail: ["lundi", "mardi"], heure_debut_travail: "8h", heure_fin_travail: "18h" )
user.save


client1 = Client.new(nom: "ALLON", prenom: "Levy", telephone_1: "0612345678", telephone_2: "+33767450160", email: "pierredupond@gmail.com", adresse: "12 Rue Paradis, 13006 Marseille", categorie: "Entreprise", information: "joignable entre 9h et 18h", fidelite: "VIP", entreprise:"Maison France Confort")
client1.user = user
client1.save


client2 = Client.new(nom: "BACARD", prenom: "Hugo", telephone_1: "0617283948", telephone_2: "+33767450160", email: "hugobacard@gmail.com", adresse: "36 Rue Sainte, 13006 Marseille", categorie: "Entreprise", information: "joignable sur son portable", fidelite: "VIP", entreprise: "Bouygues")
client2.user = user
client2.save


client3 = Client.new(nom: "ANE", prenom: "Jean-Marc", telephone_1: "0617283948", telephone_2: "+33767450160", email: "jeanmarcane@gmail.com", adresse: "38 avenue jean jugan, 13004 Marseille", categorie: "Entreprise", information: "Accés entrée principale", fidelite: "VIP", entreprise: "Mediane")
client3.user = user
client3.save



chantier1 = Chantier.new(reference: "", nom:"Installation des cables électrique", description: "Installation des cables électriques dans une maison individuelle", statut:"en cours", priorite: 1 , date_debut: "01/07/2020", date_fin_estimee: "04/07/2020", date_fin: "04/07/2020", adresse: "5 rue de marseille 13100 Aix-en-Provence", montant_versement: 2000 )
chantier1.user = user
chantier1.client = client1
chantier1.save

chantier2 = Chantier.new(reference: "", nom:"Remplacement du tableau électrique", description: "Remplacement du tableau electriques dans la piece 2 ", statut:"en cours", priorite: 1 , date_debut: "21/07/2020", date_fin_estimee: "31/07/2020", date_fin: "31/07/2020", adresse: "8 avenue jean moulinn 13127 Vitrolles", montant_versement: 1000)
chantier2.user = user
chantier2.client = client2
chantier2.save

chantier3 = Chantier.new(reference: "", nom:"Raccordement electrique balneo", description: "Raccordement électrique de la balneo vers le tableau électrique", statut:"en cours", priorite: 2, date_debut: "10/07/2020", date_fin_estimee: "11/07/2020", date_fin: "11/07/2020", adresse: "183 avenue des chartreux 13004 marseille", montant_versement: 1500)
chantier3.user = user
chantier3.client = client3
chantier3.save



tache1 = Tache.new(objet: "Achat marchandise", description: "Achat cable 36mm 2 bobines de 20 métres, Achat gaine rouge électrique 50mm, 15 prises Legrand", note:"", categorie:"", priorite: 1, environnement: "interieur", date_debut:"01/07/2020", date_fin:"01/07/2020",jalon_anomalie:"", dependance:"", equipement:"", equipement_description:"", realisation:"")
tache1.chantier = chantier1
tache1.save

tache2 = Tache.new(objet: "Tirer les cables", description: "Tirer les cables dans les gaines ", note:"preparer les attentes",categorie:"", priorite: 1, environnement: "interieur", date_debut:"01/07/2020", date_fin:"03/07/2020", jalon_anomalie:"", dependance:"Achat marchandise", equipement: true, equipement_description:"Chalimeau, boule chauffante, guide", realisation:"")
tache2.chantier = chantier1
tache2.save

tache3 = Tache.new(objet: "Installation des prises électrique", description: "Pose des prises électrique ", note:"pose de prise",categorie:"", priorite: 1, environnement: "interieur", date_debut:"04/07/2020", date_fin:"04/07/2020", jalon_anomalie:"", dependance:"installation des cables", equipement: true, equipement_description:"Chalimeau, boule chauffante, guide", realisation:"")
tache3.chantier = chantier1
tache3.save




puts "finish seed"
