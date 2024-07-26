use hotel_eden;

--  Get the name of al the customers who have booked the rooms
select c.name from customers  c join bookings  b
on c.customer_id = b.customer_id;


--  Get the name of al the customers who have booked the queen type rooms
select c.name from customers as c join bookings as b
on c.customer_id = b.customer_id
join rooms as r
on r.room_id = b.room_id
where room_type = 'queen';


-- Get the name and salary of al the housekeepers who are on booking duty (whose ids are present in the bookings table).
select name , salary from employees as e 
join bookings as b 
on e.emp_id = b.housekeeper;


-- Get the names of al senior managers
select e.name from employees as e join managers as m 
on e.emp_id = m.emp_id
where position = 'senior';


-- Get the count of states from where the customers who have booked the rooms are coming from.
select count(s.state_id),state from bookings as b join customers as c
on b.customer_id = c.customer_id
join states as s
on c.state_id = s.state_id
group by state;

-- Get the email of al housekeeping staff on duty whose salary is above 15000 
select email from employees as e 
join bookings as  b
 on e.emp_id = b.housekeeper
 where salary >15000;
 

-- Get the emp_id,email and phone number of al the housekeeping staff who are assigned the floors 5 and 4
select e.emp_id,email,phone from employees as e
join housekeeping as h 
on e.emp_id = h.emp_id
where designated_floor = 5 and 4;


-- Get the name of al employees and if the employee is on duty, get their phone number
select name, phone from employees as e 
left join housekeeping as h
on e.emp_id = h.emp_id;

-- Get the name of al employees and if the employee is a manager, get their position.
select name,position from employees as e 
left join managers as m 
on e.emp_id = m.emp_id;

-- Get the name of al customers and if the customer has made a booking, get the booking id
select name,booking_id  from customers as c
 LEFT join bookings as b
on c.customer_id = b.customer_id;
USE HOTEL_EDEN;


-- Find the names of managers along with their position and state name.
select name,position,state from managers as m
join employees as e
on m.emp_id = e.emp_id
join states as s
on m.state_id = s.state_id;


-- List all bookings with the customer's name, room type, and the housekeeper's name.
select booking_id,c.name as customer_name,room_type,e.name as housekeeper_name from bookings as b
left join customers as c
on b.customer_id = c.customer_id
join rooms as r
on b.room_id = r.room_id
join employees as e
on b.housekeeper = e.emp_id;


--  Find all rooms that have been booked along with the customer's name and booking dates.
select r.room_id ,c.name,booking_date from rooms as r
left join bookings as b
on r.room_id= b.room_id
join customers as c
on c.customer_id = b.customer_id;

--  List all rooms along with their housekeeper's name
select r.room_id,e.name from rooms as r
left join bookings as b
on r.room_id = b.room_id
left join housekeeping as h
on b.housekeeper = h.emp_id
left join employees as e
on e.emp_id = h.emp_id
order by room_id asc;


-- List all managers along with their designated position and state.
select e.name,position,state from employees as e
join managers as m
on e.emp_id = m.emp_id
join states as s
on m.state_id = s.state_id;

-- Is there any housekeeper who has been assigned to more than 1 room?
select count(housekeeper),e.name from employees as e
join bookings as b
on e.emp_id = b.housekeeper
group by e.name ;

-- What is the average salary of al the managers
select avg(salary) from employees as e
join managers as m
on e.emp_id = m.emp_id;





