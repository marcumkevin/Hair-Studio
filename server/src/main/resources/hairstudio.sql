DROP TABLE IF EXISTS APPOINTMENT;
DROP TABLE IF EXISTS SERVICE;
DROP TABLE IF EXISTS CLIENT;

CREATE TABLE client (
	client_id serial,
	first_name varchar(50) NOT NULL,
	last_name varchar(50) NOT NULL,
	email varchar(50) UNIQUE,
	phone_number varchar(12) NOT NULL,
	address varchar(150),
	address2 varchar(150),
	city varchar(50),
	state_abbreviation varchar(2),
	postal_code varchar(50),
	reminder_emails boolean NOT NULL,
	client_notes varchar(1000),
	CONSTRAINT PK_client_client_id PRIMARY KEY (client_id)
);

CREATE TABLE service (
	service_id serial,
	service_name varchar(150) NOT NULL,
	duration_minutes int NOT NULL,
	price money NOT NULL,
	description varchar(1000),
	CONSTRAINT PK_service_service_id PRIMARY KEY (service_id)
);

CREATE TABLE appointment (
	appointment_id serial,
	client_id int,
	service_id int,
	start_date_time timestamp NOT NULL,
	end_date_time timestamp,
	appointment_notes varchar(1000),
	CONSTRAINT PK_appointment_appointment_id PRIMARY KEY (appointment_id),
	CONSTRAINT FK_appointment_client_id FOREIGN KEY (client_id) REFERENCES client(client_id),
	CONSTRAINT FK_appointment_service_id FOREIGN KEY (service_id) REFERENCES service(service_id)
);

INSERT INTO client (first_name, last_name, email, phone_number, address, address2, city, state_abbreviation, postal_code, reminder_emails)
VALUES ('Kevin', 'Marcum', 'marcum.k@gmail.com', '555-555-5555', '500 Main St.', 'Apt. 101', 'Asheville', 'NC', '28806', true);

INSERT INTO service (service_name, duration_minutes, price, description)
VALUES ('1 Hour Cut', 60, '55.00', '60 min customized haircut (* if you got more than 4 months between haircuts or your hair is above average thickness and/or length, please see 1.5 hours.');

INSERT INTO appointment (client_id, service_id, start_date_time)
VALUES ((SELECT client_id FROM client WHERE last_name = 'Marcum'), (SELECT service_id FROM service WHERE service_name = '1 Hour Cut'), '07/02/2022 10:00 AM');

