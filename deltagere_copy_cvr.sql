COPY deltagere_raw
FROM '/home/jesperkihlberg/DELTAGERE.csv'
WITH DELIMITER ','
CSV HEADER;
