--Patient
--(id, nom, prenom)
insert into patient values(1,'Baptiste' , 'Jean', caracteristiques_type(
    caracteristique_type('Yeux Bleu'),
    caracteristique_type('Cheveux Noirs'),
    caracteristique_type('Bras Droit Manquant')
));

insert into patient values(2,'Marc'     , 'Jean', caracteristiques_type(
    caracteristique_type('Yeux Vert'),
    caracteristique_type('Cheveux Marrons')
));

insert into patient values(3,'Dana'     , 'Maxime', caracteristiques_type(
    caracteristique_type('Yeux Noirs'),
    caracteristique_type('Cheveux Bruns')
));


--Medecin
--(id, nom, prenom)
insert into medecin values(1,'Usclat'   , 'Magalie');
insert into medecin values(2,'Filleux'  , 'Jean');
insert into medecin values(3,'Dana'     , 'Yohann');


--Laboratoire
--(id, nom)
insert into laboratoire values(1, 'Sanofi');
insert into laboratoire values(2, 'Magalie');

--Travail
--(idMedecin, idLaboratoire)
insert into travail values(1, 1);
insert into travail values(1, 2);
insert into travail values(2, 1);

--Consultation
--(id, idpatient, idmedecin)
insert into consultation values(1, 1, 1);
insert into consultation values(2, 2, 1);
insert into consultation values(3, 1, 1);
insert into consultation values(4, 2, 2);
insert into consultation values(5, 2, 2);

--Observation
--(id, idConsultation, observation)
insert into observation values(1, 1, 'grosseur au niveau du crane');
insert into observation values(2, 1, 'rougeur au niveau du crane');
insert into observation values(3, 2, 'temperature eleve');
insert into observation values(4, 3, 'temperature trop basse');
insert into observation values(5, 4, 'difficulté respiratoire');

--maladies
--(id, nom)
INSERT INTO maladies VALUES ('C','maladies','');
INSERT INTO maladies VALUES ('C01','infections bactériennes et mycoses','');
INSERT INTO maladies VALUES ('C01.252','infections bactériennes','');
INSERT INTO maladies VALUES ('C01.252.100','bactériémie','');
INSERT INTO maladies VALUES ('C01.252.100.375','septicémie hémorragique','');
INSERT INTO maladies VALUES ('C01.252.200','infections bactériennes du système nerveux central','');
INSERT INTO maladies VALUES ('C01.252.200.100','abcès cérébral','');
INSERT INTO maladies VALUES ('C01.252.200.200','empyème subdural','');
INSERT INTO maladies VALUES ('C01.252.200.250','abcès épidural','');
INSERT INTO maladies VALUES ('C01.252.200.450','neuroborréliose de lyme','');
INSERT INTO maladies VALUES ('C01.252.200.500','méningite bactérienne','');
INSERT INTO maladies VALUES ('C01.252.200.500.400','méningite à escherichia coli','');
INSERT INTO maladies VALUES ('C01.252.200.500.450','méningite à hémophilus','');
INSERT INTO maladies VALUES ('C01.252.200.500.500','méningite à listeria','');
INSERT INTO maladies VALUES ('C01.252.200.500.550','méningite à méningocoques','');
INSERT INTO maladies VALUES ('C01.252.200.500.550.800','syndrome de Waterhouse-Friderichsen','');
INSERT INTO maladies VALUES ('C01.252.200.500.600','méningite à pneumocoques','');
INSERT INTO maladies VALUES ('C01.252.200.500.800','méningite tuberculeuse','');
INSERT INTO maladies VALUES ('C01.252.200.750','neurosyphilis','');
INSERT INTO maladies VALUES ('C01.252.300','endocardite bactérienne','');
INSERT INTO maladies VALUES ('C01.252.300.407','endocardite bactérienne subaigüe','');
INSERT INTO maladies VALUES ('C01.252.354','infections bactériennes de l oeil','');
INSERT INTO maladies VALUES ('C01.252.354.225','conjonctivite bactérienne','');
INSERT INTO maladies VALUES ('C01.252.354.225.250','conjonctivite à inclusions','');
INSERT INTO maladies VALUES ('C01.252.354.225.625','conjonctivite du nouveau-né','');
INSERT INTO maladies VALUES ('C01.252.354.225.800','trachome','');
INSERT INTO maladies VALUES ('C01.252.354.400','orgelet','');
INSERT INTO maladies VALUES ('C01.252.354.450','kératoconjonctivite infectieuse','');
INSERT INTO maladies VALUES ('C01.252.354.800','tuberculose oculaire','');
INSERT INTO maladies VALUES ('C01.252.354.900','uvéite purulente','');
INSERT INTO maladies VALUES ('C01.252.354.900.675','panophtalmie','');
INSERT INTO maladies VALUES ('C02','maladies virales','');
INSERT INTO maladies VALUES ('C02.081','infections à arbovirus','');
INSERT INTO maladies VALUES ('C02.081.030','peste équine','');
INSERT INTO maladies VALUES ('C02.081.125','fièvre catarrhale du mouton','');
INSERT INTO maladies VALUES ('C02.081.270','dengue','');
INSERT INTO maladies VALUES ('C02.081.270.200','dengue hémorragique','');
INSERT INTO maladies VALUES ('C02.081.343','encéphalite à arbovirus','');
INSERT INTO maladies VALUES ('C02.081.343.340','encéphalite de californie','');
INSERT INTO maladies VALUES ('C02.081.343.345','encéphalite japonaise','');
INSERT INTO maladies VALUES ('C02.081.343.350','encéphalite de Saint-Louis','');
INSERT INTO maladies VALUES ('C02.081.343.360','encéphalites à tiques','');
INSERT INTO maladies VALUES ('C02.081.343.950','fièvre à virus west nile','');
INSERT INTO maladies VALUES ('C02.081.355','encéphalomyélite équine','');
INSERT INTO maladies VALUES ('C02.081.355.177','encéphalomyélite équine de l Est','');
INSERT INTO maladies VALUES ('C02.081.355.355','encéphalomyélite équine du vénézuéla','');
INSERT INTO maladies VALUES ('C02.081.355.677','encéphalomyélite équine de l Ouest','');
INSERT INTO maladies VALUES ('C02.081.700','fièvre à phlébotomes','');
INSERT INTO maladies VALUES ('C02.081.810','fièvre de la vallée du rift','');
INSERT INTO maladies VALUES ('C02.081.885','maladies transmises par les tiques','');
INSERT INTO maladies VALUES ('C02.081.885.125','peste porcine africaine','');
INSERT INTO maladies VALUES ('C02.081.885.200','fièvre à tiques du colorado','');
INSERT INTO maladies VALUES ('C02.081.885.400','encéphalites à tiques','');
INSERT INTO maladies VALUES ('C02.081.885.430','fièvre hémorragique de Crimée-Congo','');
INSERT INTO maladies VALUES ('C02.081.885.440','fièvre hémorragique d Omsk','');
INSERT INTO maladies VALUES ('C02.081.885.475','maladies de la forêt kyasanur','');
INSERT INTO maladies VALUES ('C02.081.885.550','maladies de nairobi','');
INSERT INTO maladies VALUES ('C02.081.980','fièvre jaune','');
INSERT INTO maladies VALUES ('C02.109','bronchiolite virale','');
INSERT INTO maladies VALUES ('C02.182','maladies virales du système nerveux central','');
INSERT INTO maladies VALUES ('C02.182.500','encéphalite','');
INSERT INTO maladies VALUES ('C02.182.500.300','encéphalite virale','');
INSERT INTO maladies VALUES ('C02.182.500.300.300','encéphalite à arbovirus','');
INSERT INTO maladies VALUES ('C02.182.500.300.300.200','encéphalite de californie','');
INSERT INTO maladies VALUES ('C02.182.500.300.300.250','encéphalite japonaise','');
INSERT INTO maladies VALUES ('C02.182.500.300.300.300','encéphalite de Saint-Louis','');
INSERT INTO maladies VALUES ('C02.182.500.300.300.350','encéphalites à tiques','');
INSERT INTO maladies VALUES ('C02.182.500.300.300.850','fièvre à virus west nile','');
INSERT INTO maladies VALUES ('C02.182.500.300.350','encéphalite à herpès simplex','');


--insert de deduit
--(idObserv, idmaladie)
insert into deduit values(1, 'C01.252.200.100');
insert into deduit values(2, 'C01.252.200.100');
insert into deduit values(3, 'C02.081');
insert into deduit values(4, 'C02.081.885.430');
insert into deduit values(5, 'C02.081.885');

--insert de traitement
--(id durée)
insert into traitement values(1,2);
insert into traitement values(2,2);
insert into traitement values(3,100);
insert into traitement values(4,3);

--insertion de prescript
--(idtraitement idobservation)
insert into prescript values(1,2);
insert into prescript values(2,1);
insert into prescript values(3,2);
insert into prescript values(3,3);
insert into prescript values(3,4);
insert into prescript values(4,5);

--insert de medicament
--(id, nom)
insert into medicament values(1, 'calment');
insert into medicament values(2, 'soin');
insert into medicament values(3, 'antibiotique');
insert into medicament values(4, 'ventoline');

--insert contitue
--(idMedicament idTraitement)
insert into constitue values(1,2);
insert into constitue values(2,2);
insert into constitue values(2,1);
insert into constitue values(3,3);
insert into constitue values(1,3);
insert into constitue values(4,4);

--insert indication
--(idMedicament, idMaladies)
insert into indication values(1,'C01.252.200.100');
insert into indication values(2,'C01.252.200.100');
insert into indication values(1,'C01.252.200');
insert into indication values(2,'C01.252');
insert into indication values(3,'C01');
insert into indication values(1,'C02.081');
insert into indication values(3,'C02.081');
insert into indication values(1,'C02.081.885.430');
insert into indication values(3,'C02.081.885.430');
insert into indication values(1,'C02.081.885');
insert into indication values(4,'C02.081.885');

--insert developpe
--(idMedecin, idMedicament)
insert into developpe values(1, 1);
insert into developpe values(1, 2);
insert into developpe values(1, 3);
insert into developpe values(1, 4);
insert into developpe values(2, 3);
insert into developpe values(2, 4);
insert into developpe values(3, 2);
insert into developpe values(3, 3);

--insert recommendation
--(id, description)
insert into recommendation values(1,'arreter de fumer');
insert into recommendation values(2,'se reposer');
insert into recommendation values(3,'prendre ses gelules a la bonne heure');
insert into recommendation values(4,'prendre en manger les gelules');

--insert contient
--(idRecommendation, idTraitement)
insert into contient values(1,4);
insert into contient values(1,2);
insert into contient values(1,1);
insert into contient values(2,2);
insert into contient values(3,3);
insert into contient values(3,4);
insert into contient values(4,1);
insert into contient values(4,2);

--insert contreIndication
--(id, description(200))
insert into contreIndication values(1,'ne
pas utiliser chez la femme enceinte');
insert into contreIndication values(2,'Ne pas boire d alcool');
insert into contreIndication values(3,'ne pas conduire');
insert into contreIndication values(4,'Ne pas faire de sport');
insert into contreIndication values(5,'Ne pas manger 30 avant et apres');

--insert possedeC
--(idContreIndication, idMedicament)
insert into possedeC values(1,1);
insert into possedeC values(2,1);
insert into possedeC values(3,1);
insert into possedeC values(1,2);
insert into possedeC values(4,4);
insert into possedeC values(5,3);
insert into possedeC values(2,3);
insert into possedeC values(2,2);

--insert substanceActive
--(id, nom)
insert into substanceActive values(1,'paracetamol');
insert into substanceActive values(2,'ibuprofene');
insert into substanceActive values(3,'armoxiciline');
insert into substanceActive values(4,'salbutamol');

--insert possedeSA
--(idSubstanceActive, idMedicament)
insert into possedeSA values(1,1);
insert into possedeSA values(2,1);
insert into possedeSA values(2,2);
insert into possedeSA values(3,3);
insert into possedeSA values(4,4);

--insert effetIndesirable
--(id, description(200), frequence(200))
insert into effetIndesirable values(1,'eryhtheme','rare');
insert into effetIndesirable values(2,'urticaire','rare');
insert into effetIndesirable values(3,'maux de tete','rare');
insert into effetIndesirable values(4,'perturbation flore intestinal','modéré');
insert into effetIndesirable values(5,'crampe musculaire','fréquent');
insert into effetIndesirable values(6,'accélération du coeur','moderer');

--insert genereM
--(idMedicament, idEffet)
insert into genereM values(1,1);
insert into genereM values(3,3);
insert into genereM values(4,3);

--insert genereSA
--(idSubstanceActive, idEffet)
insert into genereSA values(1,2);
insert into genereSA values(2,3);
insert into genereSA values(3,3);
insert into genereSA values(3,4);
insert into genereSA values(4,3);
insert into genereSA values(4,6);

--insert classeChimique
--(id, nom(200), idparent)
insert into classeChimique values(1, 'analgésiques', null);
insert into classeChimique values(2, 'antalgique', 1);
insert into classeChimique values(3, 'acide arylcarboxylique', null);
insert into classeChimique values(4, 'propionique', 3);
insert into classeChimique values(5, 'aminopenicillines', null);
insert into classeChimique values(6, 'beta-lactamines', 5);

--insert appartientCC
--(idClasseChimique, idSubstanceActive)
insert into appartientCC values(1,1);
insert into appartientCC values(2,1);
insert into appartientCC values(3,2);
insert into appartientCC values(4,2);
insert into appartientCC values(5,3);
insert into appartientCC values(6,3);

--insert classePharmacologique
--(id, nom(200), idparent)
insert into classePharmacologique values(1,'antipyretique', null);
insert into classePharmacologique values(2,'analgesique', 1);
insert into classePharmacologique values(3,'pénicillines', null);
insert into classePharmacologique values(4,'antibiotique', 3);
insert into classePharmacologique values(5,'bronchodilatateur', null);

--insert appartientCP
--(idClassePharmacologique, idSubstanceActive)
insert into appartientCP values(1,1);
insert into appartientCP values(2,1);
insert into appartientCP values(1,2);
insert into appartientCP values(2,2);
insert into appartientCP values(3,3);
insert into appartientCP values(4,3);
insert into appartientCP values(5,4);

--insert genereCP
--(idClassePharmacologique, idEffet)
insert into genereCP values(1,2);
insert into genereCP values(4,6);

--insert genereCC
--(idClasseChimique, idEffet)
insert into genereCC values(3,5);
insert into genereCC values(6,2);


