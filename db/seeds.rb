puts "starting to seed"

Chantier.destroy_all
Client.destroy_all
User.destroy_all

puts "Creating a user"

user = User.new(email:"alex@elec.com", password:"123456", nom:"Dubois", prenom:"Alex", nom_societe:"Sarl Elec", numero_siret: 123456789, numero_tva: 123456789, adresse: "110 rue paradis 13006 Marseille", jours_travail: ["lundi", "mardi", "mercredi", "jeudi", "vendredi"], heure_debut_travail: "8h00", heure_fin_travail: "18h00" )
user.save

puts "Creating clients"

client1 = Client.new(nom: "Durand", prenom: "Francis", telephone_1: "+33612345678", telephone_2: "+33767450160", email: "f.durand@gmail.com", adresse: "110 boulevard Baille, 13005 Marseille", categorie: "Entreprise", information: "joignable entre 9h et 18h", fidelite: "VIP", entreprise:"France Confort")
client1.user = user
client1.save

client2 = Client.new(nom: "Bacard", prenom: "Hugo", telephone_1: "+33617283948", telephone_2: "+33767450160", email: "h.bacard@gmail.com", adresse: "36 Rue Sainte, 13006 Marseille", categorie: "Entreprise", information: "joignable sur son portable", fidelite: "VIP", entreprise: "Bouygues")
client2.user = user
client2.save

client3 = Client.new(nom: "Petit", prenom: "Jean-Marc", telephone_1: "+33653284048", telephone_2: "+33767450160", email: "jm.petit@gmail.com", adresse: "38 avenue du prado, 13006 Marseille", categorie: "Entreprise", information: "Accés entrée principale", fidelite: "VIP", entreprise: "Alliance")
client3.user = user
client3.save

puts "Creating chantiers"

chantier1 = Chantier.new(reference: "ref:FD001", nom:"Réno élec", description: "Changement tableau électrique", statut:"En cours", priorite: 1 , date_debut: "12/07/2020", date_fin_estimee: "25/07/2020", date_fin:"", adresse: "110 boulevard Baille, 13005 Marseille", montant_versement: 2000 )
chantier1.user = user
chantier1.client = client1
chantier1.save

chantier2 = Chantier.new(reference: "ref:BH001", nom:"Rplct chauffage", description: "Mise en place radiateur à inertie douce", statut:"En cours", priorite: 1 , date_debut: "11/07/2020", date_fin_estimee: "22/07/2020", date_fin:"", adresse: "36 Rue Sainte, 13006 Marseille", montant_versement: 1000)
chantier2.user = user
chantier2.client = client2
chantier2.save

chantier3 = Chantier.new(reference: "ref:JP001", nom:"Raccordement spa", description: "Raccordement électrique tableau vers spa", statut:"En attente", priorite: 2, date_debut: "14/07/2020", date_fin_estimee: "19/07/2020", date_fin:"", adresse: "38 avenue du prado, 13006 Marseille", montant_versement: 1500)
chantier3.user = user
chantier3.client = client3
chantier3.save

puts "Creating taches"

tache1 = Tache.new(objet: "Preparation", description: "Montage tableau Legrand", note:"prévoir un 4 rangée", categorie:"", priorite: 1, environnement: "", date_debut:"Fri, 17 Jul 2020 07:22:00 UTC +00:00", date_fin:"Fri, 17 Jul 2020 22:22:00 UTC +00:00",jalon_anomalie:"", dependance:"", equipement:"", equipement_description:"", realisation:true)
tache1.chantier = chantier1
tache1.save

tache2 = Tache.new(objet: "Tirer les cables", description: "Prévoir câbles 3G5 ", note:"préparer les attentes",categorie:"", priorite: 1, environnement: "", date_debut:"Fri, 17 Jul 2020 08:22:00 UTC +00:00", date_fin:"Fri, 17 Jul 2020 23:50:00 UTC +00:00", jalon_anomalie:"", dependance:"Achat marchandise", equipement: true, equipement_description:"Chalimeau, boule chauffante, guide", realisation:"")
tache2.chantier = chantier1
tache2.save

tache2 = Tache.new(objet: "Raccorder radiateur", description: "Fil pilote à raccoder : gestion heures creuses", note:"vérifier les attentes",categorie:"", priorite: 1, environnement: "", date_debut:"17/07/2020", date_fin:"Fri, 17 Jul 2020 23:22:00 UTC +00:00", jalon_anomalie:"", dependance:"Achat marchandise", equipement: true, equipement_description:"Penser à l'avertiseur + guide", realisation:"")
tache2.chantier = chantier2
tache2.save

tache4 = Tache.new(objet: "Installation prises électriques", description: "Pose des prises électriques ", note:"modele celian",categorie:"", priorite: 1, environnement: "", date_debut:"14/07/2020", date_fin:"12/07/2020", jalon_anomalie:"", dependance:"installation des cables", equipement: true, equipement_description:"Chalimeau, boule chauffante, guide", realisation:"")
tache4.chantier = chantier3
tache4.save

puts "Finished seed"
