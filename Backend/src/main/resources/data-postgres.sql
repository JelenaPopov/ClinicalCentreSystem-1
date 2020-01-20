INSERT INTO AUTHORITY (name) VALUES ('ROLE_CLINICAL_CENTRE_ADMIN');
INSERT INTO AUTHORITY (name) VALUES ('ROLE_CLINIC_ADMIN');
INSERT INTO AUTHORITY (name) VALUES ('ROLE_PATIENT');
INSERT INTO AUTHORITY (name) VALUES ('ROLE_DOCTOR');
INSERT INTO AUTHORITY (name) VALUES ('ROLE_NURSE');

insert into clinic (address, description, name,clinic_rating,version) values ('Novi sad Grbavica', 'Savremena klinika u Novom Sadu', 'Klinika mira',2.5,0);
insert into clinic (address, description, name,clinic_rating,version) values ('Novi sad Tolstojeva', 'VMA', 'Klinika',3.7,0);

insert into clinic_administrator (email, password, first_name, last_name, phone_number, status,clinic_id,last_password_reset_date) values
 ('ClinicAdmin1@maildrop.cc', '$2a$10$O2sRY6wvf0lpUu/mF5RN2u9dSW3AAzEplF4g9RpzwDOfSCFRhad6C', 'Marko', 'Marković', '064153456', 'ACTIVE',1,'2020-01-05 16:33:14');
insert into clinic_admin_authority(user_id, authority_id) values (1,2);

insert into room (label, kind,status,clinic_id,version) values ('Room 1', 'EXAMINATION','EXISTING' ,1,0);
insert into room (label, kind,status,clinic_id,version) values ('Room 2', 'EXAMINATION','EXISTING' ,1,0);

insert into examination_type (label, price,status,clinic_id,version) values ('Opsta praksa', '1000','EXISTING' ,1,0);
insert into examination_type (label, price,status,clinic_id,version) values ('Dermatolog', '2000','EXISTING',1,0);
insert into examination_type (label, price,status,clinic_id,version) values ('Oftamolog', '1800','DELETED',1,0);
insert into examination_type (label, price,status,clinic_id,version) values ('Zubar', '1500','EXISTING',2,0);

 insert into doctor (email, password, first_name, last_name, phone_number,work_hours_from,work_hours_to,clinic_id,status,specialized_id, doctor_rating)
 values ('ClinicDoctor1@maildrop.cc', '$2a$10$E1K7MZ9u5TkTZtESLfc8lOulf9/aPXKXhsFxtZQYMAeRnk9ezZ42q', 'Miodrag', 'Simic', '065256856','07:30','20:00',1,'ACTIVE',1,4);
insert into doctor_authority(user_id, authority_id) values (1,4);

 insert into doctor (email, password, first_name, last_name, phone_number,work_hours_from,work_hours_to,clinic_id,status,specialized_id,doctor_rating)
 values ('ClinicDoctor2@maildrop.cc', '$2a$10$0X7DgfIVxh1.MJoKeIp6juCEkrfYplqYrnUI7oB/LyElZ7dSZ2Z1a', 'Miodrag', 'Lazarevic', '065257165','06:01','23:30',1,'ACTIVE',2,2.5);
insert into doctor_authority(user_id, authority_id) values (2,4);

 insert into doctor (email, password, first_name, last_name, phone_number,work_hours_from,work_hours_to,clinic_id,status,specialized_id, doctor_rating)
 values ('ClinicDoctor3@maildrop.cc', '$2a$10$E1K7MZ9u5TkTZtESLfc8lOulf9/aPXKXhsFxtZQYMAeRnk9ezZ42q', 'Misa', 'Popovic', '065356856','07:30','20:00',1,'ACTIVE',2,4);
insert into doctor_authority(user_id, authority_id) values (3,4);

insert into nurse (email, password, first_name, last_name, phone_number,work_hours_from,work_hours_to,clinic_id,status)
values ('Nurse.01@maildrop.cc', '$2a$10$dT.7xoRoI338DdVr0E19EOj4/xrYSFyRLF6CAWphlBEONNnX22WfK', 'Milica', 'Milić', '065432432','07:30','20:00',1,'ACTIVE');
insert into nurse_authority(user_id, authority_id) values (1,5);

insert into nurse (email, password, first_name, last_name, phone_number,work_hours_from,work_hours_to,clinic_id,status)
values ('Nurse.02@maildrop.cc', '$2a$10$dT.7xoRoI338DdVr0E19EOj4/xrYSFyRLF6CAWphlBEONNnX22WfK', 'Tamara', 'Simic', '065432433','02:01','23:30',1,'ACTIVE');
insert into nurse_authority(user_id, authority_id) values (2,5);

insert into nurse (email, password, first_name, last_name, phone_number,work_hours_from,work_hours_to,clinic_id,status)
values ('Nurse.03@maildrop.cc', '$2a$10$dT.7xoRoI338DdVr0E19EOj4/xrYSFyRLF6CAWphlBEONNnX22WfK', 'Jelena', 'Simic', '075432433','07:01','23:30',1,'ACTIVE');
insert into nurse_authority(user_id, authority_id) values (3,5);

insert into date_time_interval (start_date_time, end_date_time) values ( '07.05.2020 08:00','15.05.2020 10:00:00');
insert into time_off_doctor (status, type, doctor_id, interval_id,version)
 values ('APPROVED', 'HOLIDAY', 1, 1,0);

  insert into time_off_doctor (status, type, doctor_id, interval_id,version)
 values ('AWAITING', 'HOLIDAY', 2, 1,0);

   insert into time_off_doctor (status, type, doctor_id, interval_id,version)
 values ('AWAITING', 'TIME_OFF', 3, 1,0);

insert into time_off_nurse (status, type, nurse_id, interval_id,version)
 values ('APPROVED', 'HOLIDAY', 1, 1,0);

 insert into time_off_nurse (status, type, nurse_id, interval_id,version)
 values ('AWAITING', 'HOLIDAY', 2, 1,0);

  insert into time_off_nurse (status, type, nurse_id, interval_id,version)
 values ('AWAITING', 'HOLIDAY', 3, 1,0);

insert into patient (email, password, first_name, last_name, phone_number,address,city,country,health_insurance_id,status,version)
 values ('Patient1@maildrop.cc', '$2a$10$ItcRjGVnH26jIqw7GRXOBeM5Wu3sGxkSdvSgTRWSjEpPno4J9T4kS', 'Milovan', 'Milic', '065258255','Marsala tita 13','Novi Sad',
 'Srbija','0625351236915','AWAITING_APPROVAL',0);
insert into patient_authority(user_id, authority_id) values (1,1);

insert into patient (email, password, first_name, last_name, phone_number,address,city,country,health_insurance_id,status,version)
 values ('Patient2@maildrop.cc', '$2a$10$ItcRjGVnH26jIqw7GRXOBeM5Wu3sGxkSdvSgTRWSjEpPno4J9T4kS', 'Adam', 'Bah', '065298255','Marsala tita 14','Beograd',
 'Srbija','0625351286915','AWAITING_APPROVAL',0);
insert into patient_authority(user_id, authority_id) values (1,2);

insert into patient (email, password, first_name, last_name, phone_number,address,city,country,health_insurance_id,status,version)
 values ('Patient3@maildrop.cc', '$2a$10$ItcRjGVnH26jIqw7GRXOBeM5Wu3sGxkSdvSgTRWSjEpPno4J9T4kS', 'Srdjan', 'Stanojevic', '065898255','Marsala tita 17','Kikinda',
 'Srbija','0625351286815','ACTIVATED',0);
insert into patient_authority(user_id, authority_id) values (1,3);

insert into date_time_interval (start_date_time, end_date_time) values ('20.06.2021 09:30:00', '20.06.2021 10:30:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id,patient_id,room_id,nurse_id,version)
 values ('EXAMINATION',2,'APPROVED',1,1,1,3,1,1,0);
insert into examining (examination_id,doctor_id) values (1,1);

insert into date_time_interval (start_date_time, end_date_time) values ('20.06.2021 09:45:00','20.02.2021 10:45:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id,version)
 values ('EXAMINATION',3,'AWAITING',2,1,1,0);
insert into examining (examination_id,doctor_id) values (2,2);

 insert into date_time_interval (start_date_time, end_date_time) values ('20.06.2021 10:35:00', '20.06.2021 11:45:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id,patient_id,room_id,nurse_id,version)
 values ('EXAMINATION',4,'APPROVED',2,1,1,3,2,2,0);
insert into examining (examination_id,doctor_id) values (3,2);


insert into date_time_interval (start_date_time, end_date_time) values ('21.07.2021 10:30:00', '21.07.2021 12:30:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id,patient_id,room_id,nurse_id,version)
 values ('EXAMINATION',5,'APPROVED',1,1,1,3,1,1,0);
insert into examining (examination_id,doctor_id) values (4,1);

insert into date_time_interval (start_date_time, end_date_time) values ('21.07.2021 11:00:00', '21.07.2021 13:30:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id,version)
 values ('EXAMINATION',6,'AWAITING',2,1,1,0);
insert into examining (examination_id,doctor_id) values (5,2);

 insert into date_time_interval (start_date_time, end_date_time) values ('21.07.2021 12:45:00', '21.07.2021 13:45:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id,patient_id,room_id,nurse_id,version)
 values ('EXAMINATION',7,'APPROVED',1,1,1,3,2,2,0);
insert into examining (examination_id,doctor_id) values (6,1);


insert into date_time_interval (start_date_time, end_date_time) values ('21.08.2021 12:45:00', '21.08.2021 13:45:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id,version)
 values ('EXAMINATION',8,'AWAITING',1,1,1,0);
insert into examining (examination_id,doctor_id) values (7,1);
