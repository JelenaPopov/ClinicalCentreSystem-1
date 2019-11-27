INSERT INTO AUTHORITY (name) VALUES ('ROLE_CLINICAL_CENTRE_ADMIN');
INSERT INTO AUTHORITY (name) VALUES ('ROLE_CLINIC_ADMIN');
INSERT INTO AUTHORITY (name) VALUES ('ROLE_PATIENT');
INSERT INTO AUTHORITY (name) VALUES ('ROLE_DOCTOR');
INSERT INTO AUTHORITY (name) VALUES ('ROLE_NURSE');

/* password: 1st.Admin */
insert into clinical_centre_administrator (email, password, first_name, last_name, phone_number, status) values
('1st.admin@maildrop.cc', '$2a$10$0fX3yNqeWX3O/f0HtZRtVOA/6SA1Jq2vqARolGgJjRu47FX4AE/Y.', 'Marko', 'Marković', '064123456', 'ACTIVE');
insert into clinical_centre_admin_authority (user_id, authority_id) values (1,1);

/*CLINIC*/
insert into clinic (address, description, name) values ('3.Oktobar 73', 'Savremena klinika u Beogradu', 'VMA');
insert into clinic (address, description, name) values ('Marsala Tita 9c', 'Savremena klinika u Novom Sadu', 'Klinika mira');

/*CLINIC ADMIN*/
/* Password: Admin.01 */
insert into clinic_administrator (email, password, first_name, last_name, phone_number, status,clinic_id) values
 ('example@maildrop.cc', '$2a$10$2FpM8YtFb.xVHejeWG8AsufRlbO9lL.YjI3OFsgq5dBHOXcgBkXSO', 'Marko', 'Marković', '064123456', 'ACTIVE',1);
insert into clinic_admin_authority(user_id, authority_id) values (1,2);
/* Password: Admin.02 */
insert into clinic_administrator (email, password, first_name, last_name, phone_number, status,clinic_id) values
 ('example2@maildrop.cc', '$2a$10$tSSrg2pGJrulxcsYIPfQkusLZfwDKslf76oP8at5BQPbaAQl4Ixpq', 'Mario', 'Simic', '0652561980', 'ACTIVE',1);
insert into clinic_admin_authority(user_id, authority_id) values (2,2);
/* Password: Admin.03 */
insert into clinic_administrator (email, password, first_name, last_name, phone_number, status,clinic_id) values
('example3@maildrop.cc', '$2a$10$hFfDWwXv6Ad6CS/eHyhVuefHgWGdYiJpTmfelv7JKhohKBuayn15K', 'Petar', 'Peric', '064123276', 'ACTIVE',1);
insert into clinic_admin_authority(user_id, authority_id) values (3,2);
/* Password: Admin.04 */
insert into clinic_administrator (email, password, first_name, last_name, phone_number, status,clinic_id) values
 ('example4@maildrop.cc', '$2a$10$/.0cmhd2AYDGBQHGJn2RPel.sOUmjTe1f7DCUyGwW31NBh0bollBS', 'Aleksa', 'Aleksic', '0652539280', 'ACTIVE',2);
insert into clinic_admin_authority(user_id, authority_id) values (4,2);

/*EXAMINATION TYPE*/
insert into examination_type (label, price,status,clinic_id) values ('Ginekolog', '5000','EXISTING' ,1);
insert into examination_type (label, price,status,clinic_id) values ('Zubar', '2000','EXISTING',1);

/*ROOM*/
/*insert into room (label, kind,status,clinic_id) values ('Room 1', 'OPERATION','EXISTING' ,1);
insert into room (label, kind,status,clinic_id) values ('Room 2', 'EXAMINATION','EXISTING' ,1);
insert into room (label, kind,status,clinic_id) values ('Room 3', 'OPERATION','DELETED' ,1);
insert into room (label, kind,status,clinic_id) values ('Room 4', 'OPERATION','EXISTING' ,1);
insert into room (label, kind,status,clinic_id) values ('Room 5', 'OPERATION','EXISTING' ,1);
insert into room (label, kind,status,clinic_id) values ('Room 6', 'OPERATION','EXISTING' ,1);
insert into room (label, kind,status,clinic_id) values ('Room 7', 'OPERATION','EXISTING' ,1);
insert into room (label, kind,status,clinic_id) values ('Room 8', 'OPERATION','DELETED' ,1);
insert into room (label, kind,status,clinic_id) values ('Room 9', 'OPERATION','EXISTING' ,1);
insert into room (label, kind,status,clinic_id) values ('Room 10', 'OPERATION','EXISTING' ,1);*/

/*NURSE*/
 insert into nurse (email, password, first_name, last_name, phone_number,work_hours_from,work_hours_to,clinic_id,status)
 values ('popov5@gmail.com', '$2a$10$Hef/d2ZrMjGXUFE60xUVU.u0up/nV2cIJMg9GDevEgnv5cCcJpTpW', 'Sima', 'Docic', '065256155','06:00','19:00',1,'ACTIVE');
insert into nurse_authority(user_id, authority_id) values (1,5);

/*DOCTOR*/
 insert into doctor (email, password, first_name, last_name, phone_number,work_hours_from,work_hours_to,clinic_id,status,specialized_id)
 values ('doca2@gmail.com', '$2a$10$Hef/d2ZrMjGXUFE60xUVU.u0up/nV2cIJMg9GDevEgnv5cCcJpTpW', 'Doca', 'Docic', '065256856','06:00','19:00',1,'ACTIVE',1);
insert into doctor_authority(user_id, authority_id) values (1,4);

 insert into doctor (email, password, first_name, last_name, phone_number,work_hours_from,work_hours_to,clinic_id,status,specialized_id)
 values ('doca3@gmail.com', '$2a$10$Hef/d2ZrMjGXUFE60xUVU.u0up/nV2cIJMg9GDevEgnv5cCcJpTpW', 'Doca', 'Docic', '065257165','08:00','20:00',1,'ACTIVE',2);
insert into doctor_authority(user_id, authority_id) values (2,4);

insert into room (label, kind,clinic_id,status) values ('Operacijska soba1', 'OPERATION',1,'EXISTING');
insert into date_time_interval (start_date_time, end_date_time) values ('19.11.2019 09:00','19.11.2019 10:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id )
 values ('EXAMINATION',1,'AWAITING',1,1,1);


insert into room (label, kind,clinic_id,status) values ('Operacijska soba2', 'OPERATION',1,'EXISTING');
insert into date_time_interval (start_date_time, end_date_time) values ('19.11.2019 09:00','19.11.2019 10:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id )
 values ('EXAMINATION',2,'AWAITING',1,1,1);

insert into date_time_interval (start_date_time, end_date_time) values ('19.11.2019 10:00','19.11.2019 11:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id )
 values ('EXAMINATION',3,'AWAITING',1,1,1);


insert into room (label, kind,clinic_id,status) values ('Operacijska soba 3 ', 'OPERATION',1,'EXISTING');
insert into date_time_interval (start_date_time, end_date_time) values ('19.11.2019 09:00','19.11.2019 10:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id )
values ('EXAMINATION',4,'AWAITING',2,1,1);

insert into date_time_interval (start_date_time, end_date_time) values ('19.11.2019 10:00','19.11.2019 11:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id )
values ('EXAMINATION',5,'AWAITING',1,1,1);
insert into date_time_interval (start_date_time, end_date_time) values ('19.11.2019 08:00','19.11.2019 09:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id )
values ('EXAMINATION',6,'AWAITING',2,1,2);

insert into date_time_interval (start_date_time, end_date_time) values ('25.11.2019 10:00','25.11.2019 11:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id )
values ('EXAMINATION',7,'AWAITING',1,1,1);

insert into date_time_interval (start_date_time, end_date_time) values ('25.11.2019 12:00','25.11.2019 15:00');
insert into examination (kind,interval_id,status,examination_type_id,clinic_id,clinic_administrator_id )
values ('EXAMINATION',8,'AWAITING',2,1,1);

