CREATE TABLE virksomhed
(
cvrnr int,
livsforloeb_startdato date,
livsforloeb_ophoersdato date,
ajourfoeringsdato date,
reklamebeskyttelse bool,
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
cvrnr
adresse_id
)
WITH (
  OIDS=FALSE
);


CREATE TABLE virsomhed_penhed
(
cvrnr
pnr
)
WITH (
  OIDS=FALSE
);


CREATE TABLE virsomhed_deltager
(
cvrnr
deltagerid
)
WITH (
  OIDS=FALSE
);


CREATE TABLE produktionsenhed
(
pnr
livsforloeb_startdato
livsforloeb_ophoersdato
ajourfoeringsdato
virksomhed_cvrnr
reklamebeskyttelse
navn_tekst
primaeraddresse_id
primaeraddresse_xcoord
primaeradresse_ycoord
hovedbranche_kode
bibranche1_kode
bibranche2_kode
bibranche3_kode
telefonnummer_kontaktoplysning
telefax_kontaktoplysning
email_kontaktoplysning
hovedafdeling
deltagere
)
WITH (
  OIDS=FALSE
);


CREATE TABLE deltager
(
deltagernummer
ajourfoeringsdato
deltagelseGyldigFra
cvrnr
pnr
oplysninger_deltagertype
oplysninger_id
oplysninger_navn
primaeraddresse_id
primaeraddresse_xcoord
primaeradresse_ycoord
oplysninger_personstatus	
rolle
)
WITH (
  OIDS=FALSE
);
