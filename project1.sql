create database project1;
use project1;
create table cardholder_details(
cardholder_id int primary key,
name varchar(45),
account_no int not null,
age int,
mobile_no varchar(50),
region varchar(45),
email_id varchar(70)
);
select * from cardholder_details;  

create table creditcard_details(
card_no varchar(50) primary key,
cardholder_id int,
constraint fk_creditcard_details foreign key (cardholder_id) references cardholder_details (cardholder_id) on delete set null,
card_type varchar(45),
cvv_no int not null,
exp_date varchar(36)
);
select * from creditcard_details;

create table merchant_category(
merchant_category_code int primary key,
merchant_description varchar(500));
select * from merchant_category;

create table merchant_details(
merchant_id varchar(60) primary key,
merchant_name varchar (550),
merchant_category_code int,
constraint fk_merchant_details foreign key (merchant_category_code) references merchant_category (merchant_category_code) on delete set null);
select * from merchant_details;

create table transaction_details(
transaction_id varchar(70) primary key,
card_no varchar(50),
constraint fk_cardno foreign key (card_no) references creditcard_details (card_no) on delete set null,
cardholder_id int,
constraint fk_cardholder_id foreign key (cardholder_id) references cardholder_details (cardholder_id) on delete set null,
transaction_date datetime,
amount int,
merchant_id varchar(60),
constraint fk_merchant_id foreign key (merchant_id) references merchant_details (merchant_id) on delete set null,
merchant_name varchar (550),
merchant_category_code int
);
select * from transaction_details;

insert into cardholder_details(cardholder_id,name , account_no,age,mobile_no, region,email_id) 
values (1, "robert johnson", 8010, 45, '8129702282', "chennai" ,"robert johnson@gmail.com"),
(2, "shane shaffer", 8020, 52, '9977159128', "trichy", "shane shaffer@gmail.com"),
(3, "elizabeth sawyer",	8030, 46, '9686647772', "salem" , "elizabeth sawyer@gmail.com"),
(4, "danielle green", 8040, 35, '9407053619', "madurai", "danielle green@gmail.com"),
(5, "sara cooper", "8050", 56, '9820550824', "chennai" ,"sara cooper@gmail.com"),
(6,"beth hernandez", 8060,55, '9864074986', "chennai" ,"beth hernandez@gmail.com"),
(7, "saen taylor", 8070, 54, '7044787057', "vilupuram", "saen taylor@gmail.com"),
(8, "michael floyd", 8080, 39,'8123099980', "madurai", "michael floyd@gmail.com"),
(9, "laurie gibbs",	8090, 44, '9049520662', "kovai", "laurie gibbs@gmail.com"),
(10, "matthew gutierrez", 9010, 57, '9848565253', "erode", "matthew gutierrez@gmail.com"),
(11, "brandon pineda", 9020, 60, '9910683842', "madurai", "brandon pineda@gmail.com"),
(12, "megan price", 9030, 63, '8699212202', "madurai", "megan price@gmail.com"),
(13, "john martin", 9040,64, '9768685759', "salem" , "john martin@gmail.com"),
(14, "gary jacobs", 9050, 62, '9848822313', "trichy", "gary jacobs@gmail.com"),
(15, "kyle tucker", 9060, 56, '8861525952', "trichy", "kyle tucker@gmail.com"),
(16, "crystal clark", "9070", 45, '9899943333', "chennai" , "crystal clark@gmail.com"),
(17, "michael carroll", 9080,62, '9971433228', "salem" , "michael carroll@gmail.com"),
(18, "malik carlson", 9090, 58, '9428544097', "madurai", "malik carlson@gmail.com"),
(19, "peter mckay", 6010, 54, '8861525952', "madurai",  "peter mckay@gmail.com"),
(20, "kevin spencer", 6020, 56, '9870778276', "salem" , "kevin spencer@gmail.com"),
(21, "dana washington", 6030, 32, '9176433377', "kovai", "dana washington@gmail.com"),
(22, "austin johnson", 6040, 52, '9642654945', "erode", "austin johnson@gmail.com"),
(23, "mark lewins", 6050, 55, '9190252545', "salem" , "mark lewins@gmail.com"),
(24, "stephanie dalton", 6060, 45, '9080884221', "chennai" , "stephanie dalton@gmail.com"),
(25, "nancy contreras",	6070,37, '9040422252', "madurai", "nancy contreras@gmail.com");

insert into creditcard_details(card_no, cardholder_id, card_type, cvv_no, exp_date)
values ('424243435454',2, "visa", '123', '2021-03'),
('366621319876',2, "rupay",'567', '2022-01'),
('567865543123',12, "visa", '908', '2023-04'),
('098765431234',8, "visa", '876', '2023-11'),
('567854321290', 23,"mastercard", '145', '2024-12'),
('456723459876',11, "visa", '589', '2022-15'),
('678923450001',1, "visa", '907', '2023-11'),
('980076554323',22, "rupay", '109', '2024-14'),
('987654321010',5, "rupay",'101', '2024-05'),
('988888888888',2, "visa",'102', '2023-10'),
('914326678989',5, "visa", '234', '2022-09'),
('901234567889',9, "rupay", '889', '2021-09'),
('908765432121',11, "rupay", '121', '2021-08'),
('976543210900',5, "visa", '900', '2023-01'),
('976542345699',22, "visa", '700', '2024-09'),
('990011223344',12, "mastercard", '100', '2024-10'),
('989898989898',11, "mastercard", '898', '2023-07'),
('9445566778899',4, "visa", '111', '2025-05'),
('9556677889900',17, "visa", '222', '2025-03'),
('911122244446',24, "visa",'333', '2024-07'),
('900098889777',4, "mastercard", '444', '2023-08'),
('111122223333',24, "rupay", '555', '2023-02'),
('222288889999',18, "visa", '565', '2023-05'),
('555566660000',18, "rupay", '323', '2024-06'),
('123456780987',25, "rupay", '199', '2023-09');

insert into merchant_category (merchant_category_code, merchant_description)
values ('6540', "POI Funding Transactions (Excluding MoneySend)"),
('5399', "Miscellaneous General Merchandise"),
('5699', "Miscellaneous Apparel and Accessory Stores"),
('5411', "Grocery Stores and Supermarkets"),
('5977', "Cosmetic Stores"),
('5812', "Eating Places and Restaurants"),
('7832', "Motion Picture Theater"),
('5944', "Jewelry, Watch, Clock, and Silverware Stores"),
('5462', "Bakeries"),
('5921', "Package Stores--Beer, Wine, and Liquor"),
('4722', "Travel Agencies"),
('5122', "Drugs, Drug Proprietary's, and Druggists' Sundries"),
('5571', "Motorcycle Dealers"),
('8249', "Trade and Vocational Schools"),
('4511', "Airlines and Air Carriers"),
('3020', "Air India"),
('8299', "Schools and Educational Services - Not Elsewhere Classified"),
('5969' ,"Direct Marketing/Direct Marketers--Not Elsewhere Classified"),
('6300', "Insurance Sales and Underwriting"),
('7273', "Dating Services");


insert into merchant_details(merchant_id, merchant_name, merchant_category_code)
values ('98sr65345', "amazon", '6540'),
('12a34y78', "flipkart", '5399'),
('rw2345b6789',	"myntra", '5699'),
('345rt67890', "dmart", '5411'),
('mki45678901',	"health and glow", '5977'),
('mb56789k012', "swiggy", '5812'),
('vh567890865',	"pvr cinemas", '7832'),
('zs8902rr128',	"zaitoon restaurants", '5812'),
('qw134532', "grt jewellers", '5944'),
('ty234oo987', "a2b", '5462'),
('123gbn7896', "A1 brewary", '5921'),
('tgb8902345', "make my trip", '4722'),
('4328trdcvb', "apollo parmacy", '5122'),
('yg5678dfv', "suzuki", '5571'),
('cvb34567m', "gt holidays", '4722'),
('6tfgi098765',	"indian school of business", '8249'),
('bn8907612', "indigo",	'4511'),
('tit6789096t',	"titan", '5944'),
('pi567123ma', "starbucks", '5812'),
('aa34567oo', "airindia", '3020'),
('ty0982345m', "SRM INSTITUTION", '8299'),
('987fgggh65', "lenovo", '5969'),
('987rtg43231',	"india first life insurance", '6300'),
('6789yh245p', "bharat matrimony", '7273'),
('89076bnrt', "policy bazar", '6300');

insert into transaction_details (transaction_id, card_no, cardholder_id, transaction_date, amount, merchant_id, merchant_name, merchant_category_code)
values('889900', '424243435454', 2, '2025-03-21', '100000',	'98sr65345', "amazon", '6450'),
('112200', '990011223344', 12, '2025-03-22', '45000',	'12a34y78',	"flipkart", '5399'),
('223300', '098765431234', 8, '2025-03-23', '32000',	'rw2345b6789', "myntra", '5699'),
('334400', '987654321010', 5, '2025-03-24', '21000', '345rt67890', "dmart", '5411'),
('445500', '990011223344', 12, '2025-03-25',	'30000', 'mki45678901',	"health and  glow",	'5977'),
('667700', '366621319876', 2,'2025-03-26', '44000',	'mb56789k012', "swiggy", '5812'),
('778800', '456723459876', 11, '2025-03-27', '35000',	'vh567890865', "pvr cinemas", '7832'),
('889000', '456723459876', 11,	'2025-03-28', '10000',	'zs8902rr128',	"zaitoon restaurants", '5812'),
('998811', '9556677889900',	17,	'2025-03-29','32000', 'qw134532', "grt jewellers", '5944'),
('887711', '9556677889900', 17,  '2025-03-30', '23000', '6tfgi098765', "indian school of business", '8249'),
('776611', '222288889999', 18, '2025-03-31',	'15000', 'bn8907612', "indigo",	'4511'),
('667711', '424243435454', 2, '2025-04-01', '10000', 'tit6789096t',	"titan", '5944'),
('665511', '9445566778899', 4, '2025-04-02', '75000', 'pi567123ma', "starbucks", '5812'),
('554411', '567854321290', 23, '2025-04-03', '83000', 'tgb8902345',	"make my trip",	'4722'),
('443311', '980076554323', 22, '2025-04-04', '64000', '4328trdcvb',	"apollo parmacy", '5122'),
('332211', '222288889999', 18, '2025-04-05', '56000', 'yg5678dfv', "suzuki", '5571'),
('221111', '9556677889900', 17,	'2025-04-06', '24000', 'cvb34567m',	"gt holidays", '4722'),
('123456', '123456780987', 25,	'2025-04-07', '97000',	'aa34567oo', "airindia", '3020'),
('234567', '567854321290', 23,	'2025-04-08', '24500', 'ty0982345m', "SRM INSTITUTION",  '8299'),
('345678', '567854321290', 23,	'2025-04-09', '12000', '987fgggh65', "lenovo", '5969'),
('456789', '567865543123', 12,	'2025-04-10', '15000', '987rtg43231',	"india first life insurance", '6300'),
('567890', '567854321290', 23,	'2025-04-11', '35000', '6789yh245p', 'bharat matrimony', '7273'),
('678901', '111122223333', 24, '2025-04-12', '27000', '89076bnrt', "policy bazar",	'6300'),
('789012', '123456780987', 25,	'2025-04-13', '28000', 'kpq5677853', "med plus", '5122'),
('890123', '989898989898', 11, '2025-04-14', '12000', 'nyu45678', "shaddi.com",	'7273'),
('901234', '901234567889', 9, '2025-04-15',	'32000', 'qw134532', "grt jewellers", '5944'),
('111222', '9556677889900', 17, '2025-04-16', '72000', '987rtg43231',	"india first life insurance", '6300'),
('222333', '567854321290', 23, '2025-04-17', '60000', '6789yh245p',	"bharat matrimony",	'7273'),
('333444', '908765432121', 11, '2025-04-18', '65000', '89076bnrt',  "policy bazar", '6300'),
('444555', '567854321290', 23, '2025-04-19', '91000', 'kpq5677853',	"med plus", '5122'),
('555666', '111122223333', 24, '2025-04-20', '42000', '98sr65345', "amazon",	'6450'),
('666777', '123456780987', 25, '2025-04-21', '16000', 'pi567123ma', "starbucks", '5812'),
('777888', '976543210900', 5,  '2025-04-22', '24500', 'tgb8902345', "make my trip",	'4722'),
('888999', '908765432121', 11, '2025-04-23', '75200', '4328trdcvb',	"apollo parmacy", '5122'),
('999000', '678923450001', 1,	'2025-04-24', '56240', 'yg5678dfv',	"suzuki", '5571');
set foreign_key_checks=0;
set foreign_key_checks=1;


-----stored procedure------
---top 10 largst transaction details
delimiter //
create procedure largest_amount ()
begin
select * from transaction_details
order by amount desc
limit 10;
end //
delimiter ;
call latgest_amount();

----add new card holders---
delimiter //
create procedure add_cardholder(cardhol_id int, cardhol_name varchar(45), acc_no int, carhol_age int, mob_no varchar(45), carhol_region varchar(45), carhol_email varchar(70))
begin
insert into cardholder_details (cardholder_id, name,account_no ,age , mobile_no, region,email_id)
values (cardhol_id,cardhol_name, acc_no ,  carhol_age, mob_no,  carhol_region ,  carhol_email);
select * from cardholder_details;
end //
delimiter ;
call add_cardholder(27, "john clinton", '1234509876', 45, '9876543210', 'trichy', 'johncilnton@gmail.com');

--- expird card details---
delimiter // 
create procedure getexpiredcard()
begin
select * from creditcard_details
where exp_date < curdate() - interval '1' year;
end //
delimiter ;
call getexpiredcard();

---- most amount spend category----
delimiter //
create procedure mostamount_spend()
select m. merchant_id, m. merchant_category_code, m.merchant_name, sum (amount)as total_spent
from transaction_details
join merchant_details.m on t. merchant_category_code = m. merchant_category_code
group by m. merchant_id, m. merchant_category_code, m.merchant_name
order by total_spent desc
limit 2;
end //
delimiter ;
call mostamount_spend();

--- region wise transaction---
delimiter //
create procedure region_wise_transaction(in carhol_region varchar(45))
begin
select c. region from cardholder_details as c
join transaction_details as t on c. cardholder_id = t. cardholder_id
where region = carhol_region
group by c.region;
end //
delimiter ;
call region_wise_transaction(25);

--- 
delimiter //
create procedure spendbyamazon()
begin
select sum(amount) as totalamount
from transaction_details
where merchant_name  = 'amazon';
end // 
delimiter ;
call spendbyamazon();













