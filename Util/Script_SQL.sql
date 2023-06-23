CREATE DATABASE educacional;
USE educacional;

CREATE TABLE Persona (PK_Persona INT AUTO_INCREMENT, Rut VARCHAR (20) UNIQUE, 
Nombre VARCHAR (30), Apellido_1 VARCHAR (30), 
Apellido_2 VARCHAR (30), Fecha_nacimiento DATE, Estado INT, PRIMARY KEY (PK_Persona));

CREATE TABLE Capitulo (PK_Capitulo INT AUTO_INCREMENT, Nombre VARCHAR(30),
Descripcion VARCHAR (200), Imagen_1 VARCHAR (200), Imagen_2 VARCHAR (200), 
Imagen_3 VARCHAR (200), Duracion INT, Dificultad INT, Estado INT, PRIMARY KEY (PK_Capitulo));

CREATE TABLE Habilidad_trabajada (PK_Habilidad_trabajada INT AUTO_INCREMENT, 
Nombre VARCHAR (30), Icono VARCHAR (200), Estado INT, PRIMARY KEY (PK_Habilidad_trabajada));

CREATE TABLE Capitulo_Habilidad (PK_Capitulo_Habilidad INT AUTO_INCREMENT, FK_Capitulo INT, FK_Habilidad INT, Estado INT,
PRIMARY KEY (PK_Capitulo_Habilidad),FOREIGN KEY (FK_Capitulo) REFERENCES Capitulo(PK_Capitulo), FOREIGN KEY (FK_Habilidad) REFERENCES Habilidad_trabajada(PK_Habilidad_trabajada));

CREATE TABLE Clase (PK_Clase INT AUTO_INCREMENT, 
Nombre VARCHAR (40), Tipo INT, Estado INT, PRIMARY KEY (PK_Clase));

CREATE TABLE Curso (PK_Cursos INT AUTO_INCREMENT, Nombre VARCHAR (30),
Letra CHAR, Estado INT, PRIMARY KEY (PK_Cursos));

CREATE TABLE Asignatura (PK_Asignatura INT AUTO_INCREMENT, Nombre VARCHAR (40), Estado INT,
PRIMARY KEY (PK_Asignatura));

CREATE TABLE Clase_Capitulo (PK_Clase_Capitulo INT AUTO_INCREMENT, FK_Capitulo INT, FK_Clase INT, Estado INT,
PRIMARY KEY (PK_Clase_Capitulo),  FOREIGN KEY (FK_Capitulo) REFERENCES Capitulo(PK_Capitulo),
FOREIGN KEY (FK_Clase) REFERENCES Clase(PK_Clase));

CREATE TABLE Persona_Clase (PK_Persona_Clase INT AUTO_INCREMENT, FK_Persona INT, FK_Clase INT, Estado INT,
PRIMARY KEY (PK_Persona_Clase), FOREIGN KEY (FK_Persona) REFERENCES Persona(PK_Persona), FOREIGN KEY (FK_Clase) REFERENCES Clase(PK_Clase));

CREATE TABLE Alumno (PK_Alumno INT AUTO_INCREMENT, Nombre VARCHAR (30), Apellido_1 VARCHAR (30), Apellido_2 VARCHAR (30), Rut VARCHAR (13) UNIQUE, Estado INT, FK_Curso INT,
PRIMARY KEY (PK_Alumno), FOREIGN KEY (FK_Curso) REFERENCES Curso(PK_Cursos));

CREATE TABLE Profesor (PK_Profesor INT AUTO_INCREMENT, Nombre VARCHAR (30), Apellido_1 VARCHAR (30), Apellido_2 VARCHAR(30), Rut VARCHAR (13) UNIQUE, Estado INT,
PRIMARY KEY (PK_Profesor));

CREATE TABLE Asignatura_Profesor (PK_Asignatura_Profesor INT AUTO_INCREMENT, FK_Profesor INT, FK_Asignatura INT, Año DATE, Semestre INT, Estado INT,
PRIMARY KEY (PK_Asignatura_Profesor), FOREIGN KEY (FK_Profesor) REFERENCES Profesor(PK_Profesor), FOREIGN KEY (FK_Asignatura) REFERENCES Asignatura(PK_Asignatura));

CREATE TABLE Clase_Alumnos_Profesores (PK_Clase_Alumnos_Profesores INT AUTO_INCREMENT, FK_Profesor INT, FK_Clase INT, FK_Alumno INT, Fecha DATE, Asistencia BOOL, Estado INT,
PRIMARY KEY (PK_Clase_Alumnos_Profesores),FOREIGN KEY (FK_Profesor) REFERENCES Profesor(PK_Profesor),FOREIGN KEY (FK_Clase) REFERENCES Clase(PK_Clase),FOREIGN KEY (FK_Alumno) REFERENCES Alumno(PK_Alumno));



