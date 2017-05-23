CREATE TABLE virksomhed
(
cvrnr int,
livsforloeb_startdato date,
livsforloeb_ophoersdato date,
ajourfoeringsdato date,
reklamebeskyttelse boolean,
navn_tekst character varying,
primaeraddresse_id uuid,
primaeraddresse_coord point,
virksomhedsform_kode int,
hovedbranche_kode int,
bibranche1_kode int,
bibranche2_kode int,
bibranche3_kode int,
telefonnummer_kontaktoplysning char 12,
telefax_kontaktoplysning char 12,
email_kontaktoplysning char 250,
kreditoplysninger_tekst char 150,
produktionsenheder char varying,
deltagere char varying
)
WITH (
  OIDS=FALSE
);

CREATE TABLE virksomhed_adress_lookup
(
cvrnr int,
adresse_id uuid
)
WITH (
  OIDS=FALSE
);


CREATE TABLE virsomhed_penhed
(
cvrnr int,
pnr int
)
WITH (
  OIDS=FALSE
);


CREATE TABLE virsomhed_deltager
(
cvrnr int,
deltagerid int
)
WITH (
  OIDS=FALSE
);


CREATE TABLE produktionsenhed
(
pnr int,
livsforloeb_startdato date,
livsforloeb_ophoersdato date,
ajourfoeringsdato date,
virksomhed_cvrnr int,
reklamebeskyttelse boolean,
navn_tekst character varying,
primaeraddresse_id uuid,
primaeraddresse_coord point,
hovedbranche_kode int, 
bibranche1_kode int, 
bibranche2_kode int, 
bibranche3_kode int, 
telefonnummer_kontaktoplysning char 12,
telefax_kontaktoplysning char 12,
email_kontaktoplysning char 150,
hovedafdeling boolean,
deltagere char varying
)
WITH (
  OIDS=FALSE
);


CREATE TABLE deltager
(
deltagernummer int,
ajourfoeringsdato date,
deltagelseGyldigFra date,
cvrnr int,
pnr int,
oplysninger_deltagertype char 25,
oplysninger_id int,
oplysninger_navn char 300,
primaeraddresse_id uuid,
primaeraddresse_coord point,
oplysninger_personstatus	char 145,
rolle char 30
)
WITH (
  OIDS=FALSE
);
