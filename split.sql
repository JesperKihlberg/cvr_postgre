truncate table virksomhed;
truncate table produktionsenhed;
truncate table deltager;
truncate table virsomhed_penhed;
truncate table virsomhed_deltager;
truncate table penhed_deltager;

insert into virksomhed
(
    primaeraddresse_id,
    primaeraddresse_coord,
    cvrnr ,
    livsforloeb_startdato,
    livsforloeb_ophoersdato,
    ajourfoeringsdato,
    reklamebeskyttelse,
    navn_tekst,
    virksomhedsform_kode,
    hovedbranche_kode,
    bibranche1_kode,
    bibranche2_kode,
    bibranche3_kode,
    telefonnummer_kontaktoplysning,
    telefax_kontaktoplysning,
    email_kontaktoplysning,
    kreditoplysninger_tekst,
    produktionsenheder,
    deltagere
)
select
    null,
    null,
    cast(cvrnr as integer) as cvrnr,
    to_date(livsforloeb_startdato, 'DD-MM-YYYY') as livsforloeb_startdato,
    to_date(livsforloeb_ophoersdato, 'DD-MM-YYYY') as livsforloeb_ophoersdato,
    to_date(ajourfoeringsdato, 'DD-MM-YYYY') as ajourfoeringsdato,
    cast(reklamebeskyttelse as boolean) as reklamebeskyttelse,
    navn_tekst,
    cast(virksomhedsform_kode as integer) virksomhedsform_kode,
    cast(hovedbranche_kode as integer) hovedbranche_kode ,
    cast(bibranche1_kode as integer) bibranche1_kode ,
    cast(bibranche2_kode as integer) bibranche2_kode ,
    cast(bibranche3_kode as integer) bibranche3_kode ,
    telefonnummer_kontaktoplysning,
    telefax_kontaktoplysning,
    email_kontaktoplysning,
    kreditoplysninger_tekst,
    produktionsenheder,
    deltagere
from virksomheder_raw;

insert into produktionsenhed
(
    primaeraddresse_id,
    primaeraddresse_coord,
    pnr,
    livsforloeb_startdato,
    livsforloeb_ophoersdato,
    ajourfoeringsdato,
    virksomhed_cvrnr,
    reklamebeskyttelse,
    navn_tekst,
    hovedbranche_kode, 
    bibranche1_kode, 
    bibranche2_kode, 
    bibranche3_kode, 
    telefonnummer_kontaktoplysning,
    telefax_kontaktoplysning,
    email_kontaktoplysning,
    hovedafdeling,
    deltagere
)
select
    null,
    null,
    cast(pnr as int) as pnr,
    to_date(livsforloeb_startdato, 'DD-MM-YYYY') as livsforloeb_startdato,
    to_date(livsforloeb_ophoersdato, 'DD-MM-YYYY') as livsforloeb_ophoersdato,
    to_date(ajourfoeringsdato, 'DD-MM-YYYY') as ajourfoeringsdato,
    cast(virksomhed_cvrnr as int) as virksomhed_cvrnr,
    cast(reklamebeskyttelse as boolean) as reklamebeskyttelse,
    navn_tekst,
    cast(hovedbranche_kode as int) as hovedbranche_kode, 
    cast(bibranche1_kode as int) as bibranche1_kode, 
    cast(bibranche2_kode as int) as bibranche2_kode, 
    cast(bibranche3_kode as int) as bibranche3_kode, 
    telefonnummer_kontaktoplysning,
    telefax_kontaktoplysning,
    email_kontaktoplysning,
    cast(hovedafdeling as boolean) as hovedafdeling,
    deltagere
from produktionsenheder_raw;

insert into deltager
(
    primaeraddresse_id,
    primaeraddresse_coord,
    deltagernummer,
    ajourfoeringsdato,
    deltagelseGyldigFra,
    cvrnr,
    pnr,
    oplysninger_deltagertype,
    oplysninger_id,
    oplysninger_navn,
    oplysninger_personstatus,
    rolle
)
select
    null,
    null,
    cast(deltagernummer as int) as deltagernummer,
    to_date(ajourfoeringsdato, 'DD-MM-YYYY') as ajourfoeringsdato,
    to_date(deltagelseGyldigFra, 'DD-MM-YYYY') as deltagelseGyldigFra,
    cast(cvrnr as int) as cvrnr,
    cast(pnr as int) as pnr,
    oplysninger_deltagertype,
    cast(oplysninger_id as int) as oplysninger_id,
    oplysninger_navn,
    oplysninger_personstatus,
    rolle
from deltagere_raw;

insert into virsomhed_penhed
select cvrnr, regexp_split_to_table(produktionsenheder, ',') as pnr from virksomhed;
insert into virsomhed_deltager
select cvrnr, regexp_split_to_table(deltagere, ',') as deltagerid from virksomhed;
insert into penhed_deltager
select pnr, regexp_split_to_table(deltagere, ',') as deltagerid from produktionsenhed;