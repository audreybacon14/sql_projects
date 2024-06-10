CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email_address VARCHAR(255) NULL,
    phone_number INTEGER NOT NULL,
    number_of_complaints INTEGER NULL
) ;

INSERT INTO customers (first_name, last_name, email_address, phone_number, number_of_complaints)VALUES ('John', 'Doe', 'jdoe@mail.com', '5254525', 2) ;

INSERT INTO customers (
    first_name,
    last_name,
    email_address,
    phone_number) VALUES (
    'Bob',
    'Davids',
    'bdavids@mail.com',
    '5251795'
) ;

INSERT INTO customers (
    first_name,
    last_name,
    phone_number) VALUES (
    'Rachel',
    'Rayan',
    '5250217'
    ) ;
INSERT INTO customers (
    first_name,
    last_name,
    email_address,
    phone_number,
    number_of_complaints
) VALUES (
    'Sarah',
    'King',
    'sking_mail.com',
    '5250002',
    5
) ;
INSERT INTO customers (
    first_name,
    last_name,
    email_address,
    phone_number
) VALUES (
    'George',
    'Samuel',
    'gsamuel@mail.com',
    '5251700'
) ;
INSERT INTO customers (
    first_name,
    last_name,
    email_address,
    phone_number,
    number_of_complaints
) VALUES (
    'Anna',
    'Parkinson',
    'aparkinson@mail.com',
    '5251057',
    3
) ;

SELECT *  FROM customers ;
