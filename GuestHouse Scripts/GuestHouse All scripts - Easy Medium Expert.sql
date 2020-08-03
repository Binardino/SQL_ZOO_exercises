#1# Guest 1183. Give the booking_date and the number of nights for guest 1183

SELECT booking_date, nights
FROM booking
WHERE guest_id = 1183

#2# When do they get here? List the arrival time and the first and last names for all guests due to arrive on 2016-11-05, order the output by time of arrival.

SELECT arrival_time, first_name, last_name
FROM booking
JOIN guest
ON booking.guest_id = guest.id
WHERE (YEAR(booking_date) = 2016
AND MONTH(booking_date) = 11
AND DAY(booking_date) = 5)
ORDER BY arrival_time ASC


#3# Look up daily rates. Give the daily rate that should be paid for bookings with ids 5152, 5165, 5154 and 5295. Include booking id, room type, number of occupants and the amount.

SELECT booking_id, room_type_requested, occupants, amount
FROM booking
JOIN rate
ON booking.room_type_requested = rate.room_type
WHERE booking.booking_id IN (5152, 5154, 5295)


#4# Who’s in 101? Find who is staying in room 101 on 2016-12-03, include first name, last name and address.

SELECT first_name, last_name, address
FROM booking
JOIN guest
ON booking.guest_id = guest.id
WHERE room_no = 101
AND (YEAR(booking_date) = 2016
AND MONTH(booking_date) = 12
AND DAY(booking_date) = 03)

#5# How many bookings, how many nights? 
#For guests 1185 and 1270 show the number of bookings made and the total number of nights. Your output should include the guest id and the total number of bookings and the total number of nights.

SELECT guest_id, COUNT(booking_id), SUM(nights)
FROM booking
JOIN guest
ON booking.guest_id = guest.id
WHERE guest_id IN (1185, 1270)
GROUP BY guest_id


##6 #Ruth Cadbury. 
#Show the total amount payable by guest Ruth Cadbury for her room bookings. You should JOIN to the rate table using room_type_requested and occupants.

SELECT SUM(nights*amount)
FROM booking
JOIN guest
ON booking.guest_id = guest.id
JOIN rate
ON (booking.room_type_requested = rate.room_type
AND booking.occupants = rate.occupancy)
WHERE guest.last_name = 'Cadbury'

##7 #Including Extras. 
#Calculate the total bill for booking 5346 including extras.
SELECT SUM(booking.nights * rate.amount) + SUM(e.e_amount)
FROM booking
JOIN rate
ON (booking.occupants = rate.occupancy
AND booking.room_type_requested = rate.room_type)
JOIN
(SELECT booking_id, SUM(extra.amount) AS e_amount
FROM extra
GROUP BY booking_id
)
AS e
ON booking.booking_id = e.booking_id
WHERE booking.booking_id = 5346

##8 #Edinburgh Residents. 
#For every guest who has the word “Edinburgh” in their address show the total number of nights booked. Be sure to include 0 for those guests who have never had a booking. Show last name, first name, address and number of nights. Order by last name then first name.

SELECT last_name, first_name, address, 
CASE WHEN 
SUM(booking.nights) IS NULL THEN 0 
ELSE SUM(booking.nights) END AS nights_e
FROM booking
RIGHT JOIN guest
ON booking.guest_id = guest.id
WHERE address LIKE '%Edinburgh%'
GROUP BY last_name, first_name, address
ORDER BY last_name, first_name

#9 How busy are we? 
#For each day of the week beginning 2016-11-25 show the number of bookings starting that day. Be sure to show all the days of the week in the correct order.


SELECT booking_date, COUNT(nights)
FROM booking
WHERE booking_date BETWEEN '2016-11-25' AND '2016-12-02'
GROUP BY booking_date
ORDER BY booking_date