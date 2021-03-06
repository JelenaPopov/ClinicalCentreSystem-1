# Clinical Centre System

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/cfb4694540c44d7ea3c31f766a545d61)](https://www.codacy.com/manual/Tim16/ClinicalCentreSystem?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=NikolaBrodic/ClinicalCentreSystem&amp;utm_campaign=Badge_Grade)

This web application allows a clinical centre to organize work of its clinics. The main purpose of this application is keeping records of the employees, registered clinics, examination and operation rooms of a clinic, patients and their medical records, as well as scheduling appointments. Users of the system are patients, doctors, nurses, clinic administrators and clinical centre administrators. 

## Screenshots

![Page example](https://raw.githubusercontent.com/NikolaBrodic/ClinicalCentreSystem/readme/for_readme.png)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

To get started, clone the project to your local directory:
```
$ git clone https://github.com/NikolaBrodic/ClinicalCentreSystem.git
```

### Prerequisites

You need to install following software to be able to run the application:
* Java SDK v1.8 [*(download link)*](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
* Apache Maven v3.6.3 [*(download link)*](https://maven.apache.org/download.cgi) (or use IDE of your choice, such as IntelliJ Idea, Eclipse etc.)
* NodeJS v12.13.0 [*(download link)*](https://nodejs.org/en/blog/release/v12.13.0/)
* PostgreSQL v12.0 [*(download link)*](https://www.postgresql.org/download/)

### Installing and Configuring

1. Start *pgAdmin* and create a database with name `ClinicalCentreDatabase`

2. Go to the Frontend directory inside the application's root directory, open a console and type:
```
npm install
```
to install all dependencies.

### Using

#### Starting Backend

If you are using *Apache Maven* to run the backend, go to the Backend directory inside the application's root directory, open a console and type:
```
mvn spring-boot:run
```
This command will start the backend.

If you are using some *IDE*, just open/import the Backend directory in it and run the project.

#### Starting Frontend

Go to the Frontend directory inside the application's root directory, open a console and type:
```
ng serve
```
or alternatively
```
npm start
```
to start the frontend.

## Deployment

Application is deployed on Heroku from another repository, which contains combined backed and frontend. Angular frontend was build using the command `ng build --prod` and placed in resoures/static package on the backend.

[Deployment repository](https://github.com/NikolaBrodic/ClinicalCentreSystem-DeploymentRepo)

[Heroku live demo](https://clinical-centre-system.herokuapp.com)

## Built With

* [Angular 8](https://angular.io) - Frontend framework
* [Spring Boot](https://spring.io/) - Backend framework
* [Maven](https://maven.apache.org/) - Dependency management

## Authors

* [Nikola Brodić](https://github.com/NikolaBrodic)
* [Jelena Popov](https://github.com/JelenaPopov)


