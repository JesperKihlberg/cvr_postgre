COPY produktionsenheder_raw
FROM '/home/jesperkihlberg/PRODUKTIONSENHEDER.csv'
WITH DELIMITER ','
CSV HEADER;
