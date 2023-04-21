create table patient (
    id int,
    nom varchar2(100),
    prenom varchar2(100),
    primary key (id)
);

create table caracteristique (
    id int,
    idPatient int NOT NULL,
    description varchar2(100),
    primary key (id),
    foreign key (idPatient) references patient(id)
);

create table medecin (
    id int,
    nom varchar2(100),
    prenom varchar2(100),
    primary key (id)
);

create table laboratoire (
    id int,
    nom varchar2(100),
    primary key (id)
);

create table travail (
    idMedecin int,
    idLaboratoire int,
    foreign key (idLaboratoire) references laboratoire(id),
    foreign key (idMedecin) references medecin(id),
    primary key (idMedecin, idLaboratoire)
);

create table consultation(
    id int,
    idPatient int NOT NULL,
    idMedecin int NOT NULL,
    foreign key (idMedecin) references medecin(id),
    foreign key (idPatient) references patient(id),
    primary key (id)
);

create table observation(
    id int,
    idConsultation int NOT NULL,
    observation varchar2(500),
    primary key (id),
    foreign key (idConsultation) references consultation(id)
);

create table maladies(
    id varchar2(150),
    nom varchar2(200),
    primary key (id)
);

create table deduit(
    idObservation int,
    idMaladies varchar2(150),
    primary key (idObservation, idMaladies),
    foreign key (idObservation) references observation(id),
    foreign key (idMaladies) references maladies(id)
);

create table traitement(
    id int,
    duree int,
    primary key (id)
);

create table prescript(
    idTraitement int,
    idObservation int,
    primary key (idTraitement, idObservation),
    foreign key (idTraitement) references traitement(id),
    foreign key (idObservation) references observation(id)
);

create table medicament(
    id int,
    nom varchar2(200),
    url varchar2(3000),
    primary key (id)
);

create table indication(
    idMedicament int,
    idMaladies varchar2(150),
    primary key (idMedicament, idMaladies),
    foreign key (idMaladies) references maladies(id),
    foreign key (idMedicament) references medicament(id)
);

create table constitue(
    idMedicament int,
    idTraitement int,
    primary key (idMedicament, idTraitement),
    foreign key (idMedicament) references medicament(id),
    foreign key (idTraitement) references traitement(id)
);

create table developpe(
    idMedecin int,
    idMedicament int,
    primary key (idMedecin, idMedicament),
    foreign key (idMedicament) references medicament(id),
    foreign key (idMedecin) references medecin(id)
);

create table recommendation(
    id int,
    description varchar2(200),
    primary key (id)
);

create table contient(
    idRecommendation int,
    idTraitement int,
    primary key (idRecommendation, idTraitement),
    foreign key (idRecommendation) references recommendation(id),
    foreign key (idTraitement) references traitement(id)
);

create table contreIndication(
    id int,
    description varchar2(200),
    primary key (id)
);

create table possedeC(
    idContreIndication int,
    idMedicament int,
    primary key (idContreIndication, idMedicament),
    foreign key (idContreIndication) references contreIndication(id),
    foreign key (idMedicament) references medicament(id)
);

create table substanceActive(
    id int,
    nom varchar2(200),
    primary key (id)
);

create table possedeSA(
    idSubstanceActive int,
    idMedicament int,
    primary key (idSubstanceActive, idMedicament),
    foreign key (idSubstanceActive) references substanceActive(id),
    foreign key (idMedicament) references medicament(id)
);

create table effetIndesirable(
    id int,
    description varchar2(200),
    frequence varchar2(200),
    primary key (id)
);

create table genereM(
    idMedicament int,
    idEffet int,
    primary key (idMedicament, idEffet),
    foreign key (idMedicament) references medicament(id),
    foreign key (idEffet) references effetIndesirable(id)
);

create table genereSA(
    idSubstanceActive int,
    idEffet int,
    primary key (idSubstanceActive, idEffet),
    foreign key (idSubstanceActive) references substanceActive(id),
    foreign key (idEffet) references effetIndesirable(id)
);

create table classeChimique(
    id int,
    nom varchar2(200),
    idparent int,
    primary key (id),
    foreign key (idparent) references classeChimique(id)
);

create table appartientCC(
    idClasseChimique int,
    idSubstanceActive int,
    primary key (idClasseChimique, idSubstanceActive),
    foreign key (idSubstanceActive) references substanceActive(id),
    foreign key (idClasseChimique) references classeChimique(id)
);

create table classePharmacologique(
    id int,
    nom varchar2(200),
    idparent int,
    primary key (id),
    foreign key (idparent) references classePharmacologique(id)
);

create table appartientCP(
    idClassePharmacologique int,
    idSubstanceActive int,
    primary key (idClassePharmacologique, idSubstanceActive),
    foreign key (idSubstanceActive) references substanceActive(id),
    foreign key (idClassePharmacologique) references classePharmacologique(id)
);

create table genereCP(
    idClassePharmacologique int,
    idEffet int,
    primary key (idClassePharmacologique, idEffet),
    foreign key (idEffet) references effetIndesirable(id),
    foreign key (idClassePharmacologique) references classePharmacologique(id)
);

create table genereCC(
    idClasseChimique int,
    idEffet int,
    primary key (idClasseChimique, idEffet),
    foreign key (idEffet) references effetIndesirable(id),
    foreign key (idClasseChimique) references classeChimique(id)
);
