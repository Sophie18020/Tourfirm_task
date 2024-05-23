CREATE TABLE IF NOT EXISTS tourist(
tourist_id SERIAL PRIMARY KEY,
lastname VARCHAR(20) NOT NULL,
name VARCHAR(20) NOT NULL,
surname VARCHAR(20) NOT NULL
);

CREATE TABLE IF NOT EXISTS tourist_info (
t_id INT PRIMARY KEY NOT NULL UNIQUE REFERENCES tourist (tourist_id),
pass_info VARCHAR(10) NOT NULL,
city VARCHAR(20) NOT NULL,
country VARCHAR(20) NOT NULL,
phone_num VARCHAR(20) NOT NULL,
index INT NOT NULL
);

CREATE TABLE IF NOT EXISTS tour(
tour_id SERIAL PRIMARY KEY,
tour_name VARCHAR(40),
price MONEY,
info text
);

CREATE TABLE IF NOT EXISTS season(
season_id serial primary key,
tour_id INT,
FOREIGN KEY(tour_id)
REFERENCES tour(tour_id),
start_date date,
end_date date,
season_is_closed boolean,
number_of_places INT
);

CREATE TABLE IF NOT EXISTS voucher(
voucher_id SERIAL PRIMARY KEY,
tourist_id INT,
FOREIGN KEY(tourist_id)
REFERENCES tourist(tourist_id),
s_id INT,
FOREIGN KEY(s_id)
REFERENCES season(season_id)
);

create table if not exists payment(
payment_id serial primary key,
voucher_id int,
FOREIGN KEY(voucher_id)
REFERENCES voucher(voucher_id),
pay_date date,
deposit money
);

INSERT INTO tourist (lastname, name, surname) VALUES ("Пацева", "Софья", "Валерьевна");

INSERT INTO tourist_info (t_id, pass_info, city, country, phone_num, index) VALUES (5,"0000000000","Краснодар","Россия","89000000000", 350062);

INSERT INTO tour(tour_name, price, info) VALUES ("Приключение", 50000, "Тур");

INSERT INTO season (tour_id, start_date, end_date, season_is_closed, number_of_places) VALUES (3, '2024-05-23', '2024-05-30', false, 20);

INSERT INTO voucher (tourist_id, s_id) VALUES(2, 1);

INSERT INTO payment (voucher_id, pay_date, deposit) VALUES (2, '2024-05-20', 20000);