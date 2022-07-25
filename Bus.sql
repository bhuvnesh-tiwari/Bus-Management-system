--DROP TABLE RESERVATION;
CREATE TABLE reservation(
  reservation_id INT PRIMARY KEY,
  reservation_data DATE,
  depart_time TIME,
  destination VARCHAR(40),
  passenger_id VARCHAR(20),
  bus_id INT 
);
CREATE TABLE passenger(
 passenger_id VARCHAR(20) PRIMARY KEY,
 first_name VARCHAR(20),
 last_name VARCHAR(20),
 gender VARCHAR(1),
 age INT,
 contact_address VARCHAR(30),
 bus_id INT 
);
--DROP TABLE passenger;
ALTER TABLE reservation
ADD FOREIGN KEY(bus_id)
REFERENCES bus(bus_id)
ON DELETE SET NULL;
ALTER TABLE reservation
ADD FOREIGN KEY(passenger_id)
REFERENCES passenger(passenger_id)
ON DELETE SET NULL;

CREATE TABLE bus(
    bus_id INT PRIMARY KEY,
    bus_no INT,
    bus_status VARCHAR(20),
    bus_seats INT,
    driver_id INT
);
--DROP TABLE bus;
ALTER TABLE reservation
ADD FOREIGN KEY(bus_id)
REFERENCES bus(bus_id)
ON DELETE SET NULL;
CREATE TABLE driver(
    driver_id INT PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    phone_no INT,
    bus_id INT,
     FOREIGN KEY(bus_id) REFERENCES bus(bus_id) ON DELETE SET NULL
);
--DROP TABLE driver;
CREATE TABLE payment(
    payment_id VARCHAR(20) PRIMARY KEY UNIQUE,
    payment_date DATE,
    amount INT,
    passenger_id VARCHAR(20),
    FOREIGN KEY(passenger_id) REFERENCES passenger(passenger_id) ON DELETE SET NULL
);
--DROP TABLE payment;

CREATE TABLE transaction_report(
report_id VARCHAR(20) PRIMARY KEY,
passenger_id VARCHAR(20),
reservation_id INT,
payment_id VARCHAR(20) UNIQUE,
transaction_type VARCHAR(20),
report_date DATE,
FOREIGN KEY( passenger_id)REFERENCES passenger(passenger_id)ON DELETE CASCADE,
FOREIGN KEY(reservation_id)REFERENCES reservation(reservation_id)ON DELETE CASCADE,
FOREIGN KEY(payment_id)REFERENCES payment(payment_id)ON DELETE CASCADE
);
--DROP TABLE transaction_report;

insert  into `reservation`(`reservation_id`,`reservation_data`,`depart_time`,`destination`,`passenger_id`,`bus_id`) values 
(1,'2021-11-14' , '10:00:00' ,'jaipur' ,'1xba234' ,101 ),
(2, '2021-11-15', '14:00:00', 'jalandhar','1xba235' ,103 ),
(3,'2021-11-16' , '08:00:00', 'delhi','1xba236' ,102 ),
(4,'2021-11-14' , '10:00:00', 'jaipur','1xba237' ,101 ),
(5,'2021-11-18' , '15:00:00' , 'ajmer','1xba238' ,104 ),
(6, '2021-11-17', '08:00:00' , 'chandigarh','1xba239',105 ),
(7, '2021-11-19', '11:00:00' , 'bangalore','1xba240' ,106 ),
(8, '2021-11-19', '13:00:00' , 'hyderabad','1xba241' ,107 ),
(9, '2021-11-11', '14:00:00' , 'mysore','1xba242' ,108 ),
(10,'2021-11-16' , '08:00:00' ,'delhi' ,'1xba243' ,102 ),
(11,'2021-11-14' , '10:00:00', 'jaipur','1xba244' ,101),
(12,'2021-11-21' , '06:00:00', 'srinagar','1xba245' ,109 ),
(13, '2021-11-22', '15:00:00', 'lucknow','1xba246' ,110 ),
(14, '2021-11-15', '14:00:00', 'jalandhar','1xba247' ,103 ),
(15, '2021-11-19', '11:00:00', 'bhopal','1xba248' ,111 ),
(16, '2021-11-09', '08:00:00', 'chandigarh','1xba249' ,105 ),
(17, '2021-11-11', '11:00:00', 'bangalore','1xba250' ,106 ),
(18, '2021-11-13', '10:00:00', 'chennai','1xba251' ,112),
(19, '2021-11-14', '11:00:00', 'patna','1xba252' ,113 ),
(20, '2021-11-18', '15:00:00', 'ajmer','1xba253' , 104),
(21, '2021-11-16', '08:00:00', 'delhi','1xba254' , 102),
(22, '2021-11-14', '10:00:00', 'jaipur' ,'1xba255' ,101 ),
(23, '2021-11-23', '08:00:00', 'lucknow','1xba256' ,110 ),
(24, '2021-11-22', '12:00:00', 'alwar','1xba257' ,114 ),
(25, '2021-11-14', '10:00:00', 'jaipur','1xba258' , 101),
(26, '2021-11-16', '08:00:00', 'delhi','1xba259' ,102 ),
(27, '2021-11-23', '11:00:00', 'srinagar','1xba260' ,109 ),
(28, '2021-11-15', '14:00:00', 'jalandhar','1xba261' ,103 ),
(29, '2021-11-14', '10:00:00', 'jaipur','1xba262' , 101),
(30, '2021-11-23', '11:00:00', 'patna','1xba263' ,113),
(31, '2021-11-23', '11:00:00', 'patna','1xba264' ,113 ),
(32, '2021-11-25', '14:00:00', 'bangalore','1xba265' , 106),
(33, '2021-11-13', '15:00:00', 'hyderabad','1xba266' ,107 ),
(34, '2021-11-11', '16:00:00', 'bhopal','1xba267' , 111),
(35, '2021-11-14', '14:00:00', 'ranchi','1xba268' ,115 ),
(36, '2021-11-14', '10:00:00', 'jaipur','1xba269' , 101),
(37, '2021-11-16', '08:00:00', 'delhi','1xba270' , 102),
(38, '2021-11-18', '11:00:00', 'lucknow','1xba271' ,110 ),
(39, '2021-11-17', '09:00:00', 'chandigarh','1xba272' ,105 ),
(40, '2021-11-17', '09:00:00', 'chandigarh','1xba273' ,105);

--DELETE  FROM reservation;
SELECT * FROM reservation;
INSERT INTO bus(bus_id,bus_no,bus_status,bus_seats,driver_id)VALUES
(101 , 1,'available' ,10 ,201),
( 102,2 , 'notavailable', 11,202),
(103 , 3, 'available',10 ,203),
(104 , 4,'available' , 20,204),
( 105,5 ,'unavailable' , 11,205),
(106 , 6,'unavailable' , 12,206),
( 107, 7,'available' , 10,207),
(108 ,8 ,'unavailable' , 10,208),
( 109,9 ,'unavailable' , 10,209),
( 110,10 ,'unavailable' , 15,210),
( 111, 11,'available' ,10 ,211),
( 112,12 , 'available', 10,212),
( 113,13 ,'available' , 10,213),
( 114, 14,'available' , 11,214),
( 115,15 , 'available', 12,215);
--DELETE FROM bus;
SELECT * FROM bus;
INSERT INTO bus VALUES
( 116,16 ,NULL ,10 ,NULL),
( 117,17 ,NULL ,10 ,NULL),
( 118,18 ,NULL ,10 ,NULL),
( 119,19 ,NULL ,10 ,NULL),
( 120,20 ,NULL ,10 ,NULL);

INSERT INTO driver VALUES
(201 ,'alter' ,'catie' ,100100101 ,101 ),
( 202,'joe' , 'ketlie',100100102 , 102),
(203 ,'robbert' , 'alie',100100103 , 103),
( 204,'mathew' ,'simph' ,100100104 ,104 ),
( 205, 'drive', 'sand',100100105 ,105 ),
( 206,'nick' , 'sand',100100106 ,106 ),
( 207,'jack' ,'dan' ,100100107 ,107 ),
( 208, 'crack','sini' ,100100108 ,108 ),
( 209, 'albert', 'kit',100100109 , 109),
( 210,'robbert' ,'catie' ,100100110  ,110),
( 211, 'simon','home' ,100100111 , 111),
( 212, 'gatty','lewis' ,100100112 ,112 ),
(213 , 'denis','lorentz' ,100100113 , 113),
( 214, 'gabris','kevin' ,100100114 , 114),
( 215, 'kevin','momentz' ,100100115 , 115);
--DELETE FROM driver;
SELECT * FROM driver;
insert into driver VALUES
( 216 ,'chirp'    ,'kelvin' ,NULL  ,NULL  ),
( 217 ,'dash'    ,'board' ,NULL  ,NULL  ),
( 218 , 'black'   ,'belt',NULL   ,NULL  ),
( 219 ,  'dark'  , 'belt',NULL  ,NULL  ),
( 220 ,  'even'  ,'eager',NULL   ,NULL  );
INSERT INTO passenger VALUES
('1xba234' , 'nike','comts' ,'M' ,51 ,'Cecilia Chapman' , 101 ),
('1xba235' , 'prompt','luis' , 'M',31 ,'P.O.  283 8562 Fusce Rd.' ,103 ),
( '1xba236' , 'french','dutch' , 'M',55, '52,606-3727Street' ,102 ),
( '1xba237' , 'alien','kartz' ,'F' ,54 ,'Ap #867-859 Sit Rd.Azusa'  ,101 ),
( '1xba238' , 'daren','wolf' ,'M' , 55 ,'7292 Dictum Av.' ,104 ),
( '1xba239' , 'ment','war' , 'M',25  ,'Kyla Olsen' , 105),
( '1xba240' , 'branch','school' ,'F',35 ,'36 ,Forrest Ray' ,106 ),
( '1xba241' , 'cal','part' , 'M',31 ,'P.O.887 2508 Dolor. Av.' ,107 ),
( '1xba242' , 'william','sand' ,'M' ,45 ,'Nyssa Vazquez' ,108 ),
( '1xba243' , 'louis','frand' ,'M' ,57 ,'Lawrence Moreno' , 102 ),
( '1xba244' ,'bengal' ,'rai' , 'F',56 ,'P.O. 929 4189 Nunc Road' ,101 ),
( '1xba245' , 'canon','ball' ,'F' ,56 ,'Aaron Hawkin' , 109 ),
( '1xba246' , 'mon','rar' , 'M', 66,'Ap #696-3279 Viverra. Avenue' , 110 ),
( '1xba247' ,'sant' ,'zeta' , 'F',37 ,'Bandera South Dakota 45149' , 103 ),
( '1xba248' , 'red','wolf' , 'M',38 ,'Woodruff SC 49854' ,111 ),
( '1xba249' ,'charlie' ,'red' ,'F' ,39 ,'Idaho Falls Ohio 19253' , 105 ),
( '1xba250' ,'chapter' ,'two' ,'M' ,40 ,'Leilani Boyer' , 106 ),
( '1xba251', 'wind','mill' ,'M' ,15 ,'Colby Bernard' ,112 ),
( '1xba252' ,'davin' ,'acre' ,'F' ,10 ,'Bryar Pitts' ,113 ),
( '1xba253' ,'dust' ,'bin' ,'M' ,10 ,'Ap #285-7193 Avenue' , 104 ),
(  '1xba254', 'ackno','ment' ,'F' ,61 ,'Fort Dodge GA 20783' , 102),
( '1xba255' ,'den' ,'mark' , 'M',60 ,'Daly City Ohio 90255' , 101 ),
( '1xba256' ,'pen' ,'drive' ,'M' ,11 ,'Gardena Colorado 37547' , 110 ),
(  '1xba257','card' ,'reader' ,'F' ,9 ,'Centel Delaware 48432' , 114 ),
(  '1xba258', 'shakes','peare' ,'F' ,58 ,'North Dakota 58563' , 101),
( '1xba259' ,'santa' ,'criz' ,'M' ,57 ,'778-9383 Suspendisse Av.' , 102 ),
( '1xba260' , 'cringe','life' , 'M',49 ,'Santa Monica FL 30309' ,109  ),
( '1xba261' ,'moment' ,'reader' ,'F' ,29 ,'Liberal Vermont 51324' , 103 ),
( '1xba262' ,'dark' ,'reader' ,'M' ,56 ,'P.O.886 4118 Arcu St.' , 101 ),
( '1xba263' ,'canom' ,'mentos' ,'M' ,28 ,'Green Bay Indiana 19759' ,113 ),
( '1xba264' ,'chimpu' ,'karl' ,'F' ,26 ,'P.O.508 3919 Grava St.' , 113 ),
( '1xba265' ,'devis' ,'lartz' ,'M' ,27 ,'928-3313 Vel Av.' , 106 ),
( '1xba266' , 'tom','santa' , 'M',23 ,'P.O.Box262 4978 Sit St.' , 107 ),
( '1xba267' ,'harry' ,'potter' ,'F' ,27 ,'Easthampton TN 31626' , 111 ),
( '1xba268' ,'william' ,'kevinson' ,'M' ,29 ,'3476 Aliquet. Ave' , 115 ),
( '1xba269' ,'hatred' ,'sick' ,'F' ,59 ,'Lynchburg DC 29738' ,  101),
(  '1xba270','tube' ,'well' ,'M' ,63 ,'Visalia VA 54886' , 102 ),--d37
( '1xba271' ,'solar' ,'light' ,'M' ,61 ,'San Fernando ID 77373' , 110 ),
( '1xba272' ,'kevin' ,'peterson' , 'F',21 ,'9291 Proin Road' , 105),
( '1xba273' ,'mask' ,'men' ,'F' ,18 ,'Ap #643-7006 Risus St.' , 105 );

SELECT * FROM passenger;

INSERT INTO payment VALUES

( '2bzxa2401','2021-11-05' ,1000 ,'1xba234'),
( '2bzxa2402','2021-11-06',2000 ,'1xba235'),
( '2bzxa2403','2021-11-03' ,1500 ,'1xba236'),
( '2bzxa2404','2021-11-04' ,1000 ,'1xba237'),
('2bzxa2405' , '2021-11-07',500 ,'1xba238'),
('2bzxa2406' , '2021-11-08',2500 ,'1xba239'),
('2bzxa2407' ,'2021-11-09' ,3000 ,'1xba240'),
('2bzxa2408' ,'2021-11-01' ,2800 ,'1xba241'),
( '2bzxa2409','2021-11-02' ,2500 ,'1xba242'),
('2bzxa2410' ,'2021-11-02' ,1500 ,'1xba243'),
('2bzxa2411' ,'2021-11-02' ,1000 ,'1xba244'),
('2bzxa2412' ,'2021-11-05' ,5000 ,'1xba245'),
('2bzxa2413' , '2021-11-08',1800 ,'1xba246'),
('2bzxa2414' ,'2021-11-10' ,2000 ,'1xba247'),
('2bzxa2415' ,'2021-11-10' ,1500 ,'1xba248'),
('2bzxa2416' ,'2021-11-07' ,2500 ,'1xba249'),
('2bzxa2417' ,'2021-11-10' ,3000 ,'1xba250'),
('2bzxa2418' ,'2021-11-09' ,6000 ,'1xba251'),
('2bzxa2419' ,'2021-11-04' ,4000 ,'1xba252'),
('2bzxa2420' ,'2021-11-03' ,500 ,'1xba253'),
('2bzxa2421' , '2021-11-02',1500 ,'1xba254'),
('2bzxa2422' ,'2021-11-05' ,1000 ,'1xba255'),
('2bzxa2423' ,'2021-11-07' ,1800 ,'1xba256'),
('2bzxa2424' ,'2021-11-09' ,1300 ,'1xba257'),
('2bzxa2425' ,'2021-11-10' ,1000 ,'1xba258'),
( '2bzxa2426','2021-11-01' ,1500 ,'1xba259'),
('2bzxa2427' ,'2021-11-01' ,5000 ,'1xba260'),
('2bzxa2428' ,'2021-11-02' ,2000 ,'1xba261'),
('2bzxa2429' ,'2021-11-09' , 1000,'1xba262'),
('2bzxa2430' ,'2021-11-10' ,4000 ,'1xba263'),
( '2bzxa2431','2021-11-09' ,4000 ,'1xba264'),
('2bzxa2432' ,'2021-11-07' ,3000 ,'1xba265'),
('2bzxa2433' ,'2021-11-06' ,2800 ,'1xba266'),
('2bzxa2434' ,'2021-11-06' ,1500 ,'1xba267'),
('2bzxa2435' ,'2021-11-06' ,6000 ,'1xba268'),
('2bzxa2436' ,'2021-11-06' ,1000 ,'1xba269'),
('2bzxa2437' ,'2021-11-06' ,1500 ,'1xba270'),
('2bzxa2438' ,'2021-11-03' ,1800 ,'1xba271'),
( '2bzxa2439','2021-11-04' ,2500 ,'1xba272'),
('2bzxa2440' ,'2021-11-08' , 2500,'1xba273');

SELECT * FROM payment;



INSERT INTO transaction_report VALUES
('zx123a#aq1' ,'1xba234' ,1 ,'2bzxa2401' ,'UPI' ,'2021-11-30' ),
('zx123a#aq2' ,'1xba235' ,2 ,'2bzxa2402' ,'DEBIT-CARD' ,'2021-11-30' ),
('zx123a#aq3' ,'1xba236' ,3 ,'2bzxa2403' ,'DEBIT-CARD' ,'2021-11-30' ),
('zx123a#aq4' ,'1xba237' ,4 ,'2bzxa2404' ,'UPI' ,'2021-11-30' ),
('zx123a#aq5' ,'1xba238' ,5 ,'2bzxa2405' ,'INTERNETBANKING' ,'2021-11-30' ),
('zx123a#aq6' ,'1xba239' ,6 ,'2bzxa2406' ,'INTERNETBANKING' ,'2021-11-30' ),
('zx123a#aq7' ,'1xba240' ,7 ,'2bzxa2407' ,'MOBILEWALLET' ,'2021-11-30' ),
('zx123a#aq8' ,'1xba241' ,8 ,'2bzxa2408' ,'MOBILEWALLET' ,'2021-11-30' ),
('zx123a#aq9' ,'1xba242' ,9 ,'2bzxa2409' ,'MOBILEWALLET' ,'2021-11-30' ),
('zx123a#aq10' ,'1xba243' ,10 ,'2bzxa2410' ,'UPI' ,'2021-11-30' ),
('zx123a#aq11' ,'1xba244' ,11 ,'2bzxa2411' ,'DEBIT-CARD' ,'2021-11-30' ),
('zx123a#aq12' ,'1xba245' ,12 ,'2bzxa2412' ,'INTERNETBANKING' ,'2021-11-30' ),
('zx123a#aq13' ,'1xba246' ,13 ,'2bzxa2413' ,'UPI' ,'2021-11-30' ),
('zx123a#aq14' ,'1xba247' ,14 ,'2bzxa2414' ,'DEBIT-CARD' ,'2021-11-30' ),
('zx123a#aq15' ,'1xba248' ,15 ,'2bzxa2415' ,'UPI' ,'2021-11-30' ),
('zx123a#aq16' ,'1xba249' ,16 ,'2bzxa2416' ,'INTERNETBANKING' ,'2021-11-30' ),
('zx123a#aq17' ,'1xba250' ,17 ,'2bzxa2417' ,'MOBILEWALLET' ,'2021-11-30' ),
('zx123a#aq18' ,'1xba251' ,18 ,'2bzxa2418' ,'INTERNETBANKING' ,'2021-11-30' ),
('zx123a#aq19' ,'1xba252' ,19 ,'2bzxa2419' ,'DEBIT-CARD' ,'2021-11-30' ),
('zx123a#aq20' ,'1xba253' ,20 ,'2bzxa2420' ,'DEBIT-CARD' ,'2021-11-30' ),
('zx123a#aq21' ,'1xba254' ,21 ,'2bzxa2421' ,'DEBIT-CARD' ,'2021-11-30' ),
('zx123a#aq22' ,'1xba255' ,22 ,'2bzxa2422' ,'UPI' ,'2021-11-30' ),
('zx123a#aq23' ,'1xba256' ,23 ,'2bzxa2423' ,'INTERNETBANKING' ,'2021-11-30' ),
('zx123a#aq24' ,'1xba257' ,24 ,'2bzxa2424' ,'UPI' ,'2021-11-30' ),
('zx123a#aq25' ,'1xba258' ,25 ,'2bzxa2425' ,'UPI' ,'2021-11-30' ),
('zx123a#aq26' ,'1xba259' ,26 ,'2bzxa2426' ,'MOBILEWALLET' ,'2021-11-30' ),
('zx123a#aq27' ,'1xba260' ,27 ,'2bzxa2427' ,'DEBIT-CARD' ,'2021-11-30' ),
('zx123a#aq28' ,'1xba261' ,28 ,'2bzxa2428' ,'DEBIT-CARD' ,'2021-11-30' ),
('zx123a#aq29' ,'1xba262' ,29 ,'2bzxa2429' ,'INTERNETBANKING' ,'2021-11-30' ),
('zx123a#aq30' ,'1xba263' ,30 ,'2bzxa2430' ,'DEBIT-CARD' ,'2021-11-30' ),
('zx123a#aq31' ,'1xba264' ,31 ,'2bzxa2431' ,'UPI' ,'2021-11-30' ),
('zx123a#aq32' ,'1xba265' ,32 ,'2bzxa2432' ,'UPI' ,'2021-11-30' ),
('zx123a#aq33' ,'1xba266' ,33 ,'2bzxa2433' ,'MOBILEWALLET' ,'2021-11-30' ),
('zx123a#aq34' ,'1xba267' ,34 ,'2bzxa2434' ,'UPI' ,'2021-11-30' ),
('zx123a#aq35' ,'1xba268' ,35 ,'2bzxa2435' ,'INTERNETBANKING' ,'2021-11-30' ),
('zx123a#aq36' ,'1xba269' ,36 ,'2bzxa2436' ,'DEBIT-CARD' ,'2021-11-30' ),
('zx123a#aq37' ,'1xba270' ,37 ,'2bzxa2437' ,'INTERNETBANKING' ,'2021-11-30' ),
('zx123a#aq38' ,'1xba271' ,38 ,'2bzxa2438' ,'DEBIT-CARD' ,'2021-11-30' ),
('zx123a#aq39' ,'1xba272' ,39 ,'2bzxa2439' ,'UPI' ,'2021-11-30' ),
('zx123a#aq40' ,'1xba273' ,40 ,'2bzxa2440' ,'UPI' ,'2021-11-30' );

select * from transaction_report;
--delete from transaction_report;






--find all passengers  above age 50 going to jaipur
SELECT reservation.passenger_id,reservation.destination,passenger.first_name,passenger.age
FROM reservation 
JOIN passenger 
where reservation.passenger_id=passenger.passenger_id AND age>50 AND reservation.destination='jaipur';




--find the revenue generated per day 
SELECT sum(amount),payment_date
from payment
group by payment_date
order by payment_date;






--creating view o passenger having id,name,reservation date

CREATE VIEW  passengerdetails AS
SELECT passenger.passenger_id, passenger.first_name,reservation.reservation_data
FROM passenger, reservation
WHERE passenger.passenger_id = reservation.passenger_id AND passenger.gender='F';

SELECT * FROM passengerdetails;




--find all the male passenger going to jaipur on '2021-11-14'
select passenger.passenger_id,passenger.first_name,passenger.gender
from passenger 
where passenger.gender='M'AND passenger.passenger_id IN (select reservation.passenger_id 
from reservation
where reservation.destination='jaipur'AND reservation.reservation_data='2021-11-14'
);



--calculate the number of transactions through each mode
select count(transaction_type),transaction_type
from transaction_report
group by transaction_type;  


