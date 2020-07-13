puts "starting to seed"

Chantier.destroy_all
Client.destroy_all
User.destroy_all

puts "Creating a user"

user = User.new(email:"alex@elec.com", password:"123456", nom:"France", prenom:"Alex", nom_societe:"SarlElec", numero_siret: 123456789, numero_tva: 123456789, adresse: "18 avenue du petit bosquet 13012 Marseille", jours_travail: ["lundi", "mardi", "mercredi", "jeudi", "vendredi"], heure_debut_travail: "8h00", heure_fin_travail: "18h00" )
user.save

puts "Creating clients"

client1 = Client.new(nom: "ALLON", prenom: "Levy", telephone_1: "0612345678", telephone_2: "+33767450160", email: "pierredupond@gmail.com", adresse: "110 Rue Paradis, 13008 Marseille", categorie: "Entreprise", information: "joignable entre 9h et 18h", fidelite: "VIP", entreprise:"France Confort")
client1.user = user
client1.save

client2 = Client.new(nom: "BACARD", prenom: "Hugo", telephone_1: "0617283948", telephone_2: "+33767450160", email: "hugobacard@gmail.com", adresse: "36 Rue Sainte, 13006 Marseille", categorie: "Entreprise", information: "joignable sur son portable", fidelite: "VIP", entreprise: "Bouygues")
client2.user = user
client2.save

client3 = Client.new(nom: "ANE", prenom: "Jean-Marc", telephone_1: "0653284048", telephone_2: "+33767450160", email: "jeanmarcane@gmail.com", adresse: "38 avenue jean jugan, 13004 Marseille", categorie: "Entreprise", information: "Accés entrée principale", fidelite: "VIP", entreprise: "Mediane")
client3.user = user
client3.save

puts "Creating chantiers"

chantier1 = Chantier.new(reference: "", nom:"Câbles électriques", description: "Installation des cables électriques dans une maison individuelle", statut:"en cours", priorite: 1 , date_debut: "12/07/2020", date_fin_estimee: "25/07/2020", date_fin: "30/07/2020", adresse: "5 rue de marseille 13100 Aix-en-Provence", montant_versement: 2000 )
chantier1.user = user
chantier1.client = client1
chantier1.save

chantier2 = Chantier.new(reference: "", nom:"Tableau Electrique", description: "Remplacement du tableau electriques dans la piece 2 ", statut:"en cours", priorite: 1 , date_debut: "12/07/2020", date_fin_estimee: "22/07/2020", date_fin: "30/07/2020", adresse: "8 avenue jean moulin 13127 Vitrolles", montant_versement: 1000)
chantier2.user = user
chantier2.client = client2
chantier2.save

chantier3 = Chantier.new(reference: "", nom:"Raccordement balneo", description: "Raccordement électrique de la balneo vers le tableau électrique", statut:"En attente", priorite: 2, date_debut: "12/07/2020", date_fin_estimee: "19/07/2020", date_fin: "30/07/2020", adresse: "183 avenue des chartreux 13004 marseille", montant_versement: 1500)
chantier3.user = user
chantier3.client = client3
chantier3.save

puts "Creating taches"

tache1 = Tache.new(objet: "Achat marchandise", description: "Achat cable 36mm 2 bobines de 20 métres, Achat gaine rouge électrique 50mm, 15 prises Legrand", note:"", categorie:"", priorite: 1, environnement: "interieur", date_debut:"12/07/2020", date_fin:"12/07/2020",jalon_anomalie:"", dependance:"", equipement:"", equipement_description:"", realisation:"")
tache1.chantier = chantier1
tache1.save

tache2 = Tache.new(objet: "Tirer les cables", description: "Tirer les cables dans les gaines ", note:"préparer les attentes",categorie:"", priorite: 1, environnement: "interieur", date_debut:"12/07/2020", date_fin:"12/07/2020", jalon_anomalie:"", dependance:"Achat marchandise", equipement: true, equipement_description:"Chalimeau, boule chauffante, guide", realisation:"")
tache2.chantier = chantier1
tache2.save

tache3 = Tache.new(objet: "Installation prises électrique", description: "Pose des prises électriques ", note:"modele celian",categorie:"", priorite: 1, environnement: "interieur", date_debut:"12/07/2020", date_fin:"12/07/2020", jalon_anomalie:"", dependance:"installation des cables", equipement: true, equipement_description:"Chalimeau, boule chauffante, guide", realisation:"")
tache3.chantier = chantier1
tache3.save

puts "Finished seed"
