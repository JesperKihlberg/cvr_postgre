COPY deltagere_raw
FROM '/home/jesperkihlberg/DELTAGERE.csv'
WITH DELIMITER ','
CSV HEADER;
