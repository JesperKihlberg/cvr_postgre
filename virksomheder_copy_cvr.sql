COPY virksomheder_raw
FROM '/home/jesperkihlberg/VIRKSOMHEDER.csv'
WITH DELIMITER ','
CSV HEADER;
