#1.
#Give the organiser's name of the concert in the Assembly Rooms after the first of Feb, 1997.
SELECT m_name
FROM musician m
JOIN concert c
ON m.m_no = c.concert_orgniser
WHERE concert_venue = 'Assembly Rooms'
AND con_date > '1997-02-01'

#2.
#Find all the performers who played guitar or violin and were born in England.
SELECT m_name, instrument
FROM performer p
JOIN musician m
ON p.perf_is = m.m_no
JOIN place pl
ON m.born_in = pl.place_no
WHERE place_country = 'England'
AND instrument IN ('guitar', 'violin')

#3.
#List the names of musicians who have conducted concerts in USA together with the towns and dates of these concerts.

