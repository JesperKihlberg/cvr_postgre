COPY virksomheder
FROM '/home/jesperkihlberg/VIRKSOMHEDER.csv'
WITH DELIMITER ','
CSV HEADER;
