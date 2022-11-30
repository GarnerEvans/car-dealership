create table salesperson (		
	staff_id SERIAL primary key,
	sales_first_name VARCHAR(100),
	sales_last_name VARCHAR(100)
);

create table sold_cars(
	sold_car_id SERIAL primary key,
	car_make VARCHAR(100),
	car_model VARCHAR(100),
	car_year NUmeric(4, 0),
	car_color VARCHAR(100),
	staff_id INTEGER,
	foreign key(staff_id) references salesperson(staff_id)
);

create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

create table invoice(
	invoice_id serial primary key,
	sold_car_id INTEGER,
	staff_id INTEGER,
	customer_id INTEGER,
	payment_amount NUMERIC(7,2),
	foreign key(sold_car_id) references sold_cars(sold_car_id),
	foreign key(staff_id) references salesperson(staff_id),
	foreign key(customer_id) references customer(customer_id)
);

create table service_ticket(
	service_ticket_id SERIAL primary key,
	service_date date default current_date,
	service_cost numeric(6,2),
	customer_id INTEGER,
	foreign key(customer_id) references customer(customer_id)
);

create table service_log (
	service_id SERIAL primary key,
	service_car_make VARCHAR(100),
	service_car_model VARCHAR(100),
	service_ticket_id INTEGER,
	foreign key(service_ticket_id) references service_ticket(service_ticket_id)
);

create table mechanic(
	mechanic_id serial primary key,
	mech_first_name VARCHAR(100),
	mech_last_name VARCHAR(100),
	service_id INTEGER,
	foreign key(service_id) references service_log(service_id)
);

insert into salesperson(
	staff_id, sales_first_name, sales_last_name
)values(
	1, 'Garner', 'Evans' 
)

insert into salesperson(
	staff_id, sales_first_name, sales_last_name
)values(
	2, 'Katie', 'Lemons' 
)

insert into sold_cars(
	sold_car_id, car_make, car_model, car_year, car_color
)values(
	14, 'Kia', 'sorento', '2012', 'grey'
)

insert into sold_cars(
	sold_car_id, car_make, car_model, car_year, car_color
)values(
	7, 'Toyota', 'Avalon', '2003', 'white'
)

create or replace function add_customer(customer_id INTEGER, first_name VARCHAR, last_name VARCHAR)
returns void
as $MAIN$
begin 
	insert into customer(customer_id, first_name, last_name)
	values(customer_id, first_name, last_name);
end;
$MAIN$
language plpgsql;

select add_customer(1, 'Beck', 'Tankersley');

insert into customer(
	customer_id, first_name, last_name
) values(4, 'Craig', 'Anderson')

insert into invoice(
	invoice_id,
	sold_car_id,
	staff_id,
	customer_id,
	payment_amount
) values(
	1, '14', '1', '1', '43000.00'
)

insert into invoice(
	invoice_id,
	sold_car_id,
	staff_id,
	customer_id,
	payment_amount
) values(
	2, '7', '2', '4', '56000.00'
)

insert into service_ticket(
	service_ticket_id,
	service_cost,
	customer_id
) values(
	1, 143.00, 1
)

insert into service_ticket(
	service_ticket_id,
	service_cost,
	customer_id
) values(
	2, 117.00, 4
)

insert into service_log(
	service_id,
	service_car_make,
	service_car_model,
	service_ticket_id
) values(
	1, 'Kia', 'Sorento', '2'
)

insert into service_log(
	service_id,
	service_car_make,
	service_car_model,
	service_ticket_id
) values(
	4, 'Toyota', 'Avalon', '1'
)

create or replace function add_mechanic(mechanic_id INTEGER, mech_first_name VARCHAR, mech_last_name VARCHAR, service_id INTEGER)
returns void
as $MECH$
begin 
	insert into mechanic(mechanic_id, mech_first_name, mech_last_name, service_id)
	values(mechanic_id, mech_first_name, mech_last_name, service_id);
end;
$MECH$
language plpgsql;

select add_mechanic(1, 'Zane', 'Molinar', 1);

select add_mechanic(2, 'Jeff', 'Evans', 2);

select * from service_log




