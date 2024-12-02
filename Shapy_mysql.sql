-- Crear la base de datos
CREATE DATABASE Shapy;
USE Shapy;

CREATE TABLE Usuarios (
    Id_Usuarios INT PRIMARY KEY AUTO_INCREMENT,
    Nombres_Apellidos VARCHAR(130),
    Edad INT,
    Email VARCHAR(200) UNIQUE,
    Contraseña VARCHAR(100),
    Peso_actual_kg DECIMAL(5,2),
    Altura_cm INT,
    Objetivo_peso_kg DECIMAL(5,2),
    Genero ENUM('Masculino', 'Femenino', 'Otro'),
    Nivel_actividad ENUM('Ninguna', 'Ligera', 'Moderada', 'Alta'),
    Meta_salud ENUM('Perder peso', 'Ganar músculo', 'Mejorar resistencia', 'Mantener peso'),
    Preferencia_dieta ENUM('Sin preferencia', 'Equilibrada', 'Baja en carbohidratos', 'Alta en proteínas', 'Vegetariana', 'Vegana'),
    Tiempo_ejercicio ENUM('0-2 horas', '2-4 horas', '4-6 horas', 'Más de 6 horas'),
    Preferencia_ejercicio ENUM('Entrenamiento de fuerza', 'Cardio', 'Flexibilidad', 'Mezcla de varios')
);


-- Tabla Soporte
CREATE TABLE Soporte (
    Id_Soporte INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255),
    Email VARCHAR(255),
    Mensaje TEXT,
    Fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- Tabla Plan_Comida
CREATE TABLE Plan_Comida (
    Id_Comida INT PRIMARY KEY AUTO_INCREMENT,
    Id_Usuario INT,
    FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuarios)
);
CREATE TABLE Catalogo_Comidas (
    Id_Comida INT PRIMARY KEY AUTO_INCREMENT,
    Detalles_Comida VARCHAR(800),
    Tipo_Dieta ENUM('Alta en proteínas', 'Baja en carbohidratos', 'Vegetariana', 'Vegana', 'Equilibrada')
);

-- Tabla Deporte
CREATE TABLE Deporte (
    Id_Deporte INT PRIMARY KEY AUTO_INCREMENT,
    Detalles_Deporte VARCHAR(800)
);

-- Tabla Rutinas
CREATE TABLE Rutinas (
    Id_Rutinas INT PRIMARY KEY AUTO_INCREMENT,
    Id_Deporte INT,
    Detalles VARCHAR(800),
    Nombre_Rutina VARCHAR(100),
    FOREIGN KEY (Id_Deporte) REFERENCES Deporte(Id_Deporte)
);

-- Tabla Plan_Ejercicio
CREATE TABLE Plan_Ejercicio (
    Id_Ejercicio INT PRIMARY KEY AUTO_INCREMENT,
    Id_Usuario INT,
    Id_Rutinas INT,
    FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuarios),
    FOREIGN KEY (Id_Rutinas) REFERENCES Rutinas(Id_Rutinas)
);

-- Tabla Recordatorios
CREATE TABLE Recordatorios (
    Id_Recordatorio INT PRIMARY KEY AUTO_INCREMENT,
    Id_Usuario INT,
    Fecha_Mensaje DATE,
    Detalles VARCHAR(800),
    FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuarios)
);

-- Tabla Progreso
CREATE TABLE Progreso (
    Id_Progreso INT PRIMARY KEY AUTO_INCREMENT,
    Id_Usuario INT,
    Peso_Actual FLOAT,
    FOREIGN KEY (Id_Usuario) REFERENCES Usuarios(Id_Usuarios)
);



-- Insertar deportes (si aún no existen)
INSERT INTO Deporte (Detalles_Deporte) VALUES ('Cardio');
INSERT INTO Deporte (Detalles_Deporte) VALUES ('Entrenamiento de fuerza');
INSERT INTO Deporte (Detalles_Deporte) VALUES ('Flexibilidad');
INSERT INTO Deporte (Detalles_Deporte) VALUES ('Mezcla de varios');

INSERT INTO Rutinas (Id_Deporte, Detalles, Nombre_Rutina) VALUES
(1, 'Correr 20 minutos a ritmo moderado, Saltar la cuerda: 3x1 minuto, Estiramientos dinámicos', 'Cardio Básico - Día 1'),
(1, 'HIIT: Sprints de 30 segundos (10 series), Descanso 1 minuto, Plancha dinámica: 3x30 segundos', 'HIIT Cardio - Día 2'),
(1, 'Ciclismo: 30 minutos a ritmo constante, Jumping Jacks: 3x50 repeticiones, Estiramientos activos', 'Ciclismo Ligero - Día 3'),
(1, 'Saltar la cuerda: 5 minutos, Burpees: 3x12, Correr 15 minutos en pendiente', 'Cardio Intenso - Día 4'),
(1, 'Remo en máquina: 20 minutos, Mountain Climbers: 3x40 segundos, Estiramientos estáticos', 'Remo y Fuerza - Día 5'),
(1, 'Correr 25 minutos alternando ritmos, Zancadas dinámicas: 3x15 por pierna, Saltos al cajón: 3x10', 'Cardio Intervalos - Día 6'),
(1, 'Natación: 25 minutos estilo libre, Skipping: 3x30 segundos, Planchas laterales: 3x15 segundos por lado', 'Cardio en Agua - Día 7'),
(1, 'HIIT: Sprints 10x20 segundos, Descanso 40 segundos entre series, Flexiones con salto: 3x12', 'HIIT de Intensidad - Día 8'),
(1, 'Bicicleta estática: 30 minutos, Saltos laterales: 3x15 por lado, Plancha frontal: 3x1 minuto', 'Cardio en Casa - Día 9'),
(1, 'Correr 15 minutos, Flexiones dinámicas: 3x15, Zancadas con salto: 3x10 por pierna', 'Cardio Rápido - Día 10'),
(1, 'Saltar la cuerda 10 minutos, Sentadillas con salto: 3x15, Burpees: 3x12', 'Cardio Explosivo - Día 11'),
(1, 'Elíptica: 30 minutos, Plancha con elevación de piernas: 3x20 segundos, Skipping: 3x30 segundos', 'Cardio en Máquina - Día 12'),
(1, 'Ciclismo al aire libre: 40 minutos, Elevación de rodillas: 3x40 repeticiones, Jumping Jacks: 3x100', 'Cardio de Resistencia - Día 13'),
(1, 'Natación: 30 minutos estilo libre, Mountain climbers: 3x45 segundos, Plancha estática: 3x1 minuto', 'Cardio Acuático - Día 14'),
(1, 'Remo en máquina: 15 minutos, Saltos al cajón: 3x15, Estiramientos activos', 'Remo y Cardio - Día 15'),
(1, 'Correr 40 minutos a ritmo constante, Mountain climbers: 4x30 segundos, Estiramiento de cadera', 'Cardio Resistencia - Día 16'),
(1, 'Saltar la cuerda: 15 minutos, Burpees con salto: 4x10, Plancha frontal: 4x40 segundos', 'Cardio Dinámico - Día 17'),
(1, 'Ciclismo: 50 minutos en terreno mixto, Sentadilla con salto: 4x12, Flexiones: 4x15', 'Cardio en Exterior - Día 18'),
(1, 'Elíptica: 30 minutos, Planchas laterales: 4x20 segundos por lado, Jumping Jacks: 4x50 repeticiones', 'Cardio y Core - Día 19'),
(1, 'Natación: 35 minutos, Saltos al cajón: 4x12, Mountain climbers: 4x40 segundos', 'Natación Cardio - Día 20'),
(1, 'Correr intervalos: 1 minuto rápido, 2 minutos lento x10, Flexiones explosivas: 3x10, Estiramientos activos', 'Cardio Intervalos - Día 21'),
(1, 'Saltar la cuerda 10 minutos, Flexiones con salto: 4x12, Estocadas dinámicas: 4x10 por pierna', 'Cardio Completo - Día 22'),
(1, 'Ciclismo 60 minutos en terreno montañoso, Planchas dinámicas: 4x30 segundos, Burpees: 3x10', 'Ciclismo Resistencia - Día 23'),
(1, 'Correr 30 minutos a ritmo variable, Flexiones cerradas: 4x12, Sentadillas aéreas: 4x15', 'Cardio Mixto - Día 24'),
(1, 'Remo en máquina: 25 minutos, Jumping lunges: 4x10 por pierna, Plancha con elevación: 3x20 segundos', 'Remo y Saltos - Día 25'),
(1, 'Natación estilo libre: 40 minutos, Saltos laterales: 4x20 por lado, Planchas laterales: 4x15 segundos por lado', 'Cardio en Agua - Día 26'),
(1, 'Correr 45 minutos en cinta, Burpees con salto: 4x12, Flexiones dinámicas: 4x15', 'Cardio Intenso - Día 27'),
(1, 'Ciclismo 30 minutos a velocidad constante, Zancadas con salto: 4x10, Estiramientos de glúteos', 'Ciclismo y Fuerza - Día 28'),
(1, 'Saltar la cuerda: 20 minutos, Plancha con rotación: 3x30 segundos, Estiramientos de cuerpo completo', 'Cardio Final - Día 29'),
(1, 'Correr 30 minutos, Jumping Jacks: 4x100 repeticiones, Estiramiento completo', 'Cardio Básico - Día 30');



INSERT INTO Rutinas (Id_Deporte, Detalles, Nombre_Rutina) VALUES
(2, 'Press banca: 4x10, Sentadillas profundas: 4x10, Peso muerto: 4x8', 'Fuerza Total - Día 1'),
(2, 'Dominadas: 3x8, Remo con mancuernas: 3x10, Curl de bíceps: 3x12', 'Fuerza Tren Superior - Día 2'),
(2, 'Sentadilla frontal: 4x8, Zancadas: 3x12 por pierna, Elevación de talones: 3x20', 'Fuerza Tren Inferior - Día 3'),
(2, 'Peso muerto convencional: 4x10, Extensión lumbar: 3x15, Plancha frontal: 3x1 minuto', 'Fuerza y Núcleo - Día 4'),
(2, 'Press inclinado con mancuernas: 3x12, Aperturas con mancuernas: 3x15, Flexiones cerradas: 3x15', 'Fuerza de Pecho - Día 5'),
(2, 'Dominadas: 4x6, Remo con barra: 4x8, Curl martillo: 3x12', 'Fuerza de Espalda - Día 6'),
(2, 'Sentadilla sumo: 3x12, Peso muerto rumano: 3x10, Elevaciones de gemelos: 4x15', 'Piernas y Glúteos - Día 7'),
(2, 'Press militar con barra: 3x10, Remo al mentón: 3x12, Elevación lateral: 3x15', 'Hombros - Día 8'),
(2, 'Flexiones: 4x15, Sentadillas: 4x12, Zancadas con salto: 3x10 por pierna', 'Entrenamiento en Casa - Día 9'),
(2, 'Peso muerto: 5x5, Hip thrust: 3x10, Sentadilla búlgara: 3x8 por pierna', 'Glúteos Intensivo - Día 10'),
(2, 'Press con barra: 4x10, Aperturas en banco inclinado: 3x12, Fondos: 3x15', 'Fuerza Mixta - Día 11'),
(2, 'Dominadas asistidas: 3x8, Remo bajo en máquina: 3x12, Pull-over: 3x10', 'Espalda y Bíceps - Día 12'),
(2, 'Elevación de talones: 4x20, Press de pierna: 3x12, Zancadas laterales: 3x12 por pierna', 'Piernas y Glúteos - Día 13'),
(2, 'Flexiones con pies elevados: 3x15, Pull-ups: 3x6, Elevaciones de piernas en barra: 3x15', 'Upper Body - Día 14'),
(2, 'Press militar: 3x10, Elevación lateral con mancuernas: 3x12, Elevación frontal con barra: 3x10', 'Hombros Completo - Día 15'),
(2, 'Remo con barra: 4x8, Peso muerto rumano: 4x8, Plancha lateral: 3x30 segundos por lado', 'Espalda y Core - Día 16'),
(2, 'Sentadilla profunda: 5x5, Zancadas caminando: 3x12 por pierna, Extensión de rodilla: 3x15', 'Fuerza de Pierna - Día 17'),
(2, 'Fondos entre bancos: 4x12, Flexiones de triceps: 3x15, Pullover con mancuerna: 3x12', 'Tríceps y Pecho - Día 18'),
(2, 'Dominadas con agarre amplio: 3x6, Remo inclinado: 3x10, Elevación lateral con mancuernas: 3x12', 'Espalda y Hombros - Día 19'),
(2, 'Press inclinado con barra: 3x10, Fondos con peso: 3x8, Flexiones de rodillas: 3x12', 'Fuerza Pecho y Tríceps - Día 20'),
(2, 'Peso muerto: 4x8, Prensa de pierna: 3x12, Elevaciones de talones: 4x20', 'Fuerza Tren Inferior - Día 21'),
(2, 'Pull-ups: 3x8, Curl con barra: 3x12, Plancha: 3x1 minuto', 'Fuerza y Core - Día 22'),
(2, 'Press militar con barra: 4x8, Press inclinado: 3x12, Elevaciones de hombros: 3x15', 'Hombros y Pecho - Día 23'),
(2, 'Curl en banco inclinado: 3x12, Flexiones cerradas: 4x10, Zancadas con salto: 3x10', 'Fuerza de Brazos - Día 24'),
(2, 'Peso muerto: 3x8, Zancadas caminando: 3x12, Flexiones de hombro: 3x15', 'Fuerza Glúteos y Piernas - Día 25'),
(2, 'Sentadillas con barra: 4x10, Elevaciones de talones: 3x20, Zancadas con peso: 3x12 por pierna', 'Fuerza Inferior - Día 26'),
(2, 'Prensa de pierna: 3x12, Extensiones de cadera: 3x12, Peso muerto sumo: 3x8', 'Fuerza Glúteos - Día 27'),
(2, 'Curl con mancuernas: 4x12, Flexiones: 3x15, Sentadilla con salto: 3x10', 'Fuerza Básica - Día 28'),
(2, 'Peso muerto sumo: 4x10, Pull-ups asistidas: 3x8, Press militar: 3x12', 'Fuerza para Espalda y Piernas - Día 29'),
(2, 'Press de banca: 4x12, Elevación lateral con mancuernas: 4x12, Zancadas con barra: 3x12', 'Fuerza Completa - Día 30');



INSERT INTO Rutinas (Id_Deporte, Detalles, Nombre_Rutina) VALUES
(3, 'Estiramientos de cuello, hombros y brazos: 3x15 segundos cada uno, Flexión hacia adelante: 3x20 segundos', 'Flexibilidad General - Día 1'),
(3, 'Estiramientos de isquiotibiales: 3x30 segundos, Estiramientos de caderas: 3x30 segundos, Flexiones laterales: 3x20 segundos', 'Flexibilidad Caderas y Piernas - Día 2'),
(3, 'Estiramientos de espalda baja: 3x30 segundos, Postura del gato/vaca: 3x15 repeticiones, Estiramientos de tobillos: 3x20 segundos', 'Flexibilidad Espalda - Día 3'),
(3, 'Estiramientos de cuádriceps: 3x30 segundos, Flexión de rodillas profunda: 3x20 segundos, Estiramientos de tríceps: 3x20 segundos', 'Flexibilidad Muscular - Día 4'),
(3, 'Estiramientos de muñecas y hombros: 3x15 segundos, Estiramientos de isquiotibiales en pie: 3x30 segundos, Flexión de cadera: 3x20 segundos', 'Flexibilidad Superior - Día 5'),
(3, 'Postura del guerrero: 3x30 segundos por lado, Estiramientos de espalda alta: 3x30 segundos, Estiramientos de pantorrillas: 3x20 segundos', 'Flexibilidad Estática - Día 6'),
(3, 'Estiramientos dinámicos de piernas: 3x20 repeticiones, Estiramientos de hombros con bandas: 3x15 segundos, Sentadilla profunda: 3x15 segundos', 'Flexibilidad Dinámica - Día 7'),
(3, 'Estiramiento de glúteos en suelo: 3x30 segundos, Estiramientos de cadera: 3x30 segundos, Rotaciones de espalda baja: 3x15 repeticiones', 'Flexibilidad Core - Día 8'),
(3, 'Torsiones de columna: 3x15 repeticiones por lado, Estiramientos de muñecas y antebrazos: 3x20 segundos, Flexión lateral de torso: 3x15 segundos', 'Flexibilidad Movilidad - Día 9'),
(3, 'Postura del niño: 3x30 segundos, Estiramientos de muslos: 3x30 segundos, Estiramientos de caderas y glúteos: 3x30 segundos', 'Flexibilidad para Relax - Día 10'),
(3, 'Estiramientos de espalda media: 3x30 segundos, Flexión lateral de piernas: 3x15 segundos, Estiramiento de tobillos: 3x20 segundos', 'Flexibilidad Relajante - Día 11'),
(3, 'Estiramientos de hombros con bandas: 3x15 segundos, Estiramiento de caderas: 3x30 segundos, Flexión hacia adelante de pie: 3x20 segundos', 'Flexibilidad Profunda - Día 12'),
(3, 'Rotaciones de cadera: 3x15 por lado, Estiramientos de piernas con banda: 3x30 segundos, Estiramientos de glúteos: 3x30 segundos', 'Flexibilidad de Cadera - Día 13'),
(3, 'Postura del perro hacia abajo: 3x30 segundos, Estiramiento de piernas cruzadas: 3x30 segundos, Flexión hacia adelante de rodillas: 3x30 segundos', 'Flexibilidad Yoga - Día 14'),
(3, 'Estiramiento de columna vertebral: 3x30 segundos, Flexión lateral en pie: 3x15 segundos, Estiramientos de pantorrillas: 3x20 segundos', 'Flexibilidad de Columna - Día 15'),
(3, 'Estiramientos de cuello y hombros: 3x20 segundos por lado, Postura del ángulo: 3x30 segundos, Flexión de rodillas profunda: 3x20 segundos', 'Flexibilidad en Pie - Día 16'),
(3, 'Estiramiento de espalda baja y glúteos: 3x30 segundos, Rotaciones de cuello: 3x10 por lado, Estiramientos de cadera: 3x30 segundos', 'Flexibilidad Total - Día 17'),
(3, 'Estiramiento de tobillos y piernas: 3x20 segundos, Flexión lateral de torso: 3x20 segundos, Estiramiento de tríceps: 3x20 segundos', 'Flexibilidad y Relajación - Día 18'),
(3, 'Estiramientos de cuello: 3x30 segundos, Estiramientos de piernas en suelo: 3x30 segundos, Postura del guerrero: 3x30 segundos', 'Flexibilidad General - Día 19'),
(3, 'Estiramientos dinámicos de espalda: 3x20 repeticiones, Flexión lateral con brazos extendidos: 3x20 segundos, Estiramiento de glúteos en suelo: 3x30 segundos', 'Flexibilidad Activa - Día 20'),
(3, 'Estiramiento de cuádriceps en pie: 3x30 segundos, Estiramientos de caderas: 3x20 segundos, Estiramiento de espalda alta: 3x20 segundos', 'Flexibilidad de Cuádriceps - Día 21'),
(3, 'Estiramiento de caderas y glúteos: 3x30 segundos, Rotación de hombros: 3x20 segundos, Flexión lateral de piernas: 3x15 segundos', 'Flexibilidad Funcional - Día 22'),
(3, 'Postura del gato/vaca: 3x15 repeticiones, Estiramientos de glúteos: 3x30 segundos, Flexión de torso hacia adelante: 3x20 segundos', 'Flexibilidad Yoga - Día 23'),
(3, 'Estiramiento de columna vertebral: 3x30 segundos, Flexión lateral de torso: 3x20 segundos, Estiramiento de caderas: 3x30 segundos', 'Flexibilidad Yoga Completa - Día 24'),
(3, 'Estiramientos de muñecas: 3x20 segundos, Estiramientos de espalda baja: 3x30 segundos, Postura del ángulo: 3x30 segundos', 'Flexibilidad Completa - Día 25'),
(3, 'Estiramientos de caderas y piernas: 3x30 segundos, Estiramiento de pantorrillas: 3x20 segundos, Estiramiento de hombros con banda: 3x15 segundos', 'Flexibilidad para Ejercicios - Día 26'),
(3, 'Estiramientos de caderas: 3x30 segundos, Flexión lateral con brazos extendidos: 3x20 segundos, Estiramientos de tobillos: 3x20 segundos', 'Flexibilidad para Corredores - Día 27'),
(3, 'Estiramientos de espalda: 3x30 segundos, Flexión de piernas en pie: 3x30 segundos, Postura del niño: 3x30 segundos', 'Flexibilidad para Yoga - Día 28'),
(3, 'Estiramientos de pantorrillas: 3x30 segundos, Flexión lateral de piernas: 3x20 segundos, Estiramientos de cuello: 3x30 segundos', 'Flexibilidad Avanzada - Día 29'),
(3, 'Estiramientos de glúteos: 3x30 segundos, Flexión hacia adelante: 3x30 segundos, Estiramientos de cadera: 3x30 segundos', 'Flexibilidad Final - Día 30');


INSERT INTO Rutinas (Id_Deporte, Detalles, Nombre_Rutina) VALUES
(4, 'Cardio: Correr 20 minutos, Fuerza: Sentadillas 4x12, Flexibilidad: Estiramientos de piernas 3x30 segundos', 'Mezcla Total - Día 1'),
(4, 'Cardio: HIIT 20 minutos, Fuerza: Flexiones 3x15, Flexibilidad: Estiramientos de caderas 3x30 segundos', 'Mezcla Intensiva - Día 2'),
(4, 'Cardio: Saltar la cuerda 15 minutos, Fuerza: Peso muerto 4x10, Flexibilidad: Estiramientos de espalda baja 3x30 segundos', 'Mezcla Cardio-Fuerza - Día 3'),
(4, 'Cardio: Remo 20 minutos, Fuerza: Sentadillas 4x12, Flexibilidad: Estiramientos dinámicos 3x20 repeticiones', 'Mezcla Resistencia - Día 4'),
(4, 'Cardio: Ciclismo 30 minutos, Fuerza: Curl de bíceps 3x12, Flexibilidad: Estiramientos de tobillos 3x20 segundos', 'Mezcla Ciclismo - Día 5'),
(4, 'Cardio: HIIT 20 minutos, Fuerza: Prensa de pierna 4x10, Flexibilidad: Flexión de rodillas profunda 3x20 segundos', 'Mezcla HIIT - Día 6'),
(4, 'Cardio: Correr 25 minutos, Fuerza: Flexiones 3x12, Flexibilidad: Estiramientos de cuello 3x20 segundos', 'Mezcla de Resistencia - Día 7'),
(4, 'Cardio: Natación 30 minutos, Fuerza: Sentadillas 4x15, Flexibilidad: Estiramientos de glúteos 3x30 segundos', 'Mezcla de Agua - Día 8'),
(4, 'Cardio: HIIT 15 minutos, Fuerza: Curl de bíceps 4x12, Flexibilidad: Estiramientos de caderas 3x30 segundos', 'Mezcla Cardio-Fuerza-Estiramiento - Día 9'),
(4, 'Cardio: Correr 20 minutos, Fuerza: Peso muerto 4x12, Flexibilidad: Estiramientos de pantorrillas 3x20 segundos', 'Mezcla Total de Cardio - Día 10'),
(4, 'Cardio: Remo 25 minutos, Fuerza: Flexiones 3x20, Flexibilidad: Estiramientos de hombros 3x20 segundos', 'Mezcla de Fuerza y Resistencia - Día 11'),
(4, 'Cardio: Saltar la cuerda 20 minutos, Fuerza: Prensa de pierna 4x12, Flexibilidad: Estiramientos de espalda baja 3x30 segundos', 'Mezcla de Agilidad - Día 12'),
(4, 'Cardio: HIIT 25 minutos, Fuerza: Sentadillas 4x15, Flexibilidad: Estiramientos de muñecas 3x20 segundos', 'Mezcla HIIT y Fuerza - Día 13'),
(4, 'Cardio: Natación 30 minutos, Fuerza: Curl de bíceps 3x15, Flexibilidad: Estiramientos de caderas 3x30 segundos', 'Mezcla Aqua-Cardio - Día 14'),
(4, 'Cardio: Remo 20 minutos, Fuerza: Flexiones 3x15, Flexibilidad: Estiramientos de glúteos 3x30 segundos', 'Mezcla Resistencia y Fuerza - Día 15'),
(4, 'Cardio: Correr 30 minutos, Fuerza: Peso muerto 4x15, Flexibilidad: Estiramientos de tobillos 3x30 segundos', 'Mezcla Correr y Fuerza - Día 16'),
(4, 'Cardio: Ciclismo 30 minutos, Fuerza: Sentadillas 4x12, Flexibilidad: Estiramientos de espalda baja 3x20 segundos', 'Mezcla Ciclismo-Fuerza - Día 17'),
(4, 'Cardio: HIIT 20 minutos, Fuerza: Prensa de pierna 4x10, Flexibilidad: Flexión de rodillas profunda 3x20 segundos', 'Mezcla HIIT Fuerza Estiramiento - Día 18'),
(4, 'Cardio: Remo 20 minutos, Fuerza: Flexiones 3x12, Flexibilidad: Estiramientos dinámicos 3x30 segundos', 'Mezcla Cardio-Fuerza-Estiramiento - Día 19'),
(4, 'Cardio: Correr 20 minutos, Fuerza: Sentadillas 4x12, Flexibilidad: Estiramientos de piernas 3x30 segundos', 'Mezcla Básica - Día 20'),
(4, 'Cardio: HIIT 15 minutos, Fuerza: Sentadillas 4x12, Flexibilidad: Estiramientos de espalda baja 3x30 segundos', 'Mezcla HIIT Básica - Día 21'),
(4, 'Cardio: Correr 25 minutos, Fuerza: Peso muerto 4x10, Flexibilidad: Estiramientos de cuello 3x20 segundos', 'Mezcla Correr y Fuerza - Día 22'),
(4, 'Cardio: Remo 30 minutos, Fuerza: Flexiones 3x12, Flexibilidad: Estiramientos de glúteos 3x20 segundos', 'Mezcla Fuerza y Cardio - Día 23'),
(4, 'Cardio: Natación 30 minutos, Fuerza: Prensa de pierna 4x12, Flexibilidad: Estiramientos de tobillos 3x30 segundos', 'Mezcla Acuática - Día 24'),
(4, 'Cardio: Saltar la cuerda 15 minutos, Fuerza: Flexiones 3x15, Flexibilidad: Estiramientos dinámicos 3x30 segundos', 'Mezcla Cuerda y Fuerza - Día 25'),
(4, 'Cardio: HIIT 20 minutos, Fuerza: Curl de bíceps 4x12, Flexibilidad: Estiramientos de muñecas 3x30 segundos', 'Mezcla HIIT Fuerza Estiramiento - Día 26'),
(4, 'Cardio: Ciclismo 40 minutos, Fuerza: Sentadillas 3x15, Flexibilidad: Estiramientos de glúteos 3x30 segundos', 'Mezcla Ciclismo y Fuerza - Día 27'),
(4, 'Cardio: HIIT 15 minutos, Fuerza: Peso muerto 4x12, Flexibilidad: Estiramientos de caderas 3x30 segundos', 'Mezcla HIIT y Fuerza - Día 28'),
(4, 'Cardio: Remo 25 minutos, Fuerza: Flexiones 4x12, Flexibilidad: Estiramientos de piernas 3x30 segundos', 'Mezcla Resistencia - Día 29'),
(4, 'Cardio: Correr 20 minutos, Fuerza: Curl de bíceps 4x12, Flexibilidad: Estiramientos de espalda baja 3x30 segundos', 'Mezcla Cardio-Brazos - Día 30');





INSERT INTO Catalogo_Comidas (Detalles_Comida, Tipo_Dieta) VALUES
-- Equilibrada
('Pechuga de pollo con puré de camote y espárragos', 'Equilibrada'),
('Tacos de pescado con guacamole y ensalada mixta', 'Equilibrada'),
('Filete de res con ensalada de rúcula y tomate', 'Equilibrada'),
('Arroz frito integral con vegetales y huevo', 'Equilibrada'),
('Wrap de pollo y espinacas con hummus', 'Equilibrada'),
('Salmón al horno con arroz salvaje y brócoli', 'Equilibrada'),
('Lasaña de vegetales con queso cottage', 'Equilibrada'),
('Quinoa con pollo, almendras y arándanos', 'Equilibrada'),

-- Baja en carbohidratos
('Ensalada de salmón con aguacate y espinacas', 'Baja en carbohidratos'),
('Pollo al limón con col rizada salteada', 'Baja en carbohidratos'),
('Chuleta de cerdo con ensalada de col morada', 'Baja en carbohidratos'),
('Berenjenas rellenas de carne y queso', 'Baja en carbohidratos'),
('Pavo a la plancha con espárragos y almendras', 'Baja en carbohidratos'),
('Ceviche de pescado con pepino y jícama', 'Baja en carbohidratos'),
('Omelette de champiñones y queso', 'Baja en carbohidratos'),
('Sopa de pollo con calabacitas y cilantro', 'Baja en carbohidratos'),

-- Alta en proteínas
('Tazón de quinoa con atún, huevo duro y espinacas', 'Alta en proteínas'),
('Pechuga de pavo al horno con brócoli y zanahorias', 'Alta en proteínas'),
('Batido de proteínas con avena y plátano', 'Alta en proteínas'),
('Hamburguesa de pollo sin pan con ensalada griega', 'Alta en proteínas'),
('Arroz con frijoles y pechuga de pollo', 'Alta en proteínas'),
('Tofu a la parrilla con guarnición de espinacas', 'Alta en proteínas'),
('Pollo al curry con lentejas', 'Alta en proteínas'),
('Pescado a la parrilla con quinoa y kale', 'Alta en proteínas'),

-- Vegetariana
('Pizza vegetariana con queso, champiñones y espinacas', 'Vegetariana'),
('Guiso de garbanzos con espinacas', 'Vegetariana'),
('Tortilla española de patata con ensalada de rúcula', 'Vegetariana'),
('Pan pita integral con hummus y vegetales', 'Vegetariana'),
('Risotto de champiñones y espárragos', 'Vegetariana'),
('Chiles rellenos de queso panela y elote', 'Vegetariana'),
('Croquetas de zanahoria con ensalada de lentejas', 'Vegetariana'),
('Curry de vegetales con arroz basmati', 'Vegetariana'),

-- Vegana
('Bowl de arroz integral con frijoles negros y aguacate', 'Vegana'),
('Sopa de miso con tofu y algas', 'Vegana'),
('Espagueti de calabacita con pesto de albahaca', 'Vegana'),
('Hamburguesa de lentejas con pan integral', 'Vegana'),
('Ensalada de couscous con garbanzos y menta', 'Vegana'),
('Wrap de hummus con pimientos y pepino', 'Vegana'),
('Vegetales asados con quinua y tahini', 'Vegana'),
('Chili vegano de frijoles con tomate y aguacate', 'Vegana'),
('Tacos de setas con guacamole y salsa verde', 'Vegana'),
('Smoothie de plátano, espinacas y leche de almendra', 'Vegana');


INSERT INTO Catalogo_Comidas (Detalles_Comida, Tipo_Dieta) VALUES
-- Equilibrada
('Ensalada de pasta integral con pollo y aderezo de yogur', 'Equilibrada'),
('Pollo a la parrilla con puré de calabaza y espinacas salteadas', 'Equilibrada'),
('Tilapia al vapor con arroz integral y zanahorias glaseadas', 'Equilibrada'),
('Tazón de arroz, frijoles, aguacate y pico de gallo', 'Equilibrada'),
('Pechuga de pavo con puré de papas y brócoli al vapor', 'Equilibrada'),
('Sándwich integral con pavo, queso y vegetales frescos', 'Equilibrada'),
('Wrap de salmón ahumado con crema de aguacate y rúcula', 'Equilibrada'),
('Quinoa con espárragos, calabacitas y pollo', 'Equilibrada'),

-- Baja en carbohidratos
('Albóndigas de res con salsa de tomate y ensalada verde', 'Baja en carbohidratos'),
('Pimientos rellenos de carne molida y champiñones', 'Baja en carbohidratos'),
('Pollo a la parmesana con brócoli al vapor', 'Baja en carbohidratos'),
('Calabacines rellenos de queso ricotta y espinacas', 'Baja en carbohidratos'),
('Rollitos de lechuga con pollo y aderezo de maní', 'Baja en carbohidratos'),
('Hamburguesa sin pan con queso y ensalada de col', 'Baja en carbohidratos'),
('Chuletas de cerdo con puré de coliflor', 'Baja en carbohidratos'),
('Cazuela de pollo con crema de espinacas', 'Baja en carbohidratos'),

-- Alta en proteínas
('Pavo salteado con arroz basmati y espárragos', 'Alta en proteínas'),
('Salmón ahumado con guacamole y ensalada verde', 'Alta en proteínas'),
('Brochetas de pollo con vegetales al horno', 'Alta en proteínas'),
('Tofu salteado con salsa teriyaki y quinoa', 'Alta en proteínas'),
('Filete de pescado con lentejas y espinacas', 'Alta en proteínas'),
('Tazón de huevo revuelto con jamón de pavo y champiñones', 'Alta en proteínas'),
('Bistec a la parrilla con batata asada y brócoli', 'Alta en proteínas'),
('Lomo de cerdo al horno con ensalada de espárragos y almendras', 'Alta en proteínas'),

-- Vegetariana
('Canelones de espinacas y ricotta', 'Vegetariana'),
('Guiso de garbanzos con papa y zanahoria', 'Vegetariana'),
('Ensalada caprese con tomate, mozzarella y albahaca', 'Vegetariana'),
('Chiles poblanos rellenos de quinoa y queso', 'Vegetariana'),
('Pasta integral con pesto de espinacas y nueces', 'Vegetariana'),
('Tacos de hongos portobello con cebolla caramelizada', 'Vegetariana'),
('Pizza de coliflor con queso y verduras', 'Vegetariana'),
('Bowl de arroz integral, edamame y aguacate', 'Vegetariana'),

-- Vegana
('Arroz frito con tofu y vegetales', 'Vegana'),
('Tacos de coliflor al pastor con salsa de aguacate', 'Vegana'),
('Hamburguesa de frijoles negros con pan integral', 'Vegana'),
('Sopa de lentejas con zanahorias y cilantro', 'Vegana'),
('Ensalada de kale con semillas de girasol y aderezo de limón', 'Vegana'),
('Wrap de vegetales asados con hummus', 'Vegana'),
('Curry de coco con batata, espinacas y garbanzos', 'Vegana'),
('Quinoa con champiñones y espárragos salteados', 'Vegana'),
('Batido de avena, cacao y plátano con leche de almendra', 'Vegana'),
('Panqueques de avena con jarabe de arce y frutas frescas', 'Vegana');


INSERT INTO Catalogo_Comidas (Detalles_Comida, Tipo_Dieta) VALUES
-- Equilibrada
('Ensalada de pasta integral con pollo y aderezo de yogur', 'Equilibrada'),
('Pollo a la parrilla con puré de calabaza y espinacas salteadas', 'Equilibrada'),
('Tilapia al vapor con arroz integral y zanahorias glaseadas', 'Equilibrada'),
('Tazón de arroz, frijoles, aguacate y pico de gallo', 'Equilibrada'),
('Pechuga de pavo con puré de papas y brócoli al vapor', 'Equilibrada'),
('Sándwich integral con pavo, queso y vegetales frescos', 'Equilibrada'),
('Wrap de salmón ahumado con crema de aguacate y rúcula', 'Equilibrada'),
('Quinoa con espárragos, calabacitas y pollo', 'Equilibrada'),
('Pollo al horno con papas asadas y ensalada de rúcula', 'Equilibrada'),
('Lomo de cerdo con arroz integral y ensalada de tomate', 'Equilibrada'),
('Sopa minestrone con pan integral', 'Equilibrada'),
('Tacos de pescado con ensalada de repollo y salsa de yogur', 'Equilibrada'),
('Pasta integral con salsa de tomate y albóndigas de pollo', 'Equilibrada'),
('Pizza de vegetales asados con mozzarella', 'Equilibrada'),
('Ensalada de atún con papa y huevo cocido', 'Equilibrada'),

-- Baja en carbohidratos
('Albóndigas de res con salsa de tomate y ensalada verde', 'Baja en carbohidratos'),
('Pimientos rellenos de carne molida y champiñones', 'Baja en carbohidratos'),
('Pollo a la parmesana con brócoli al vapor', 'Baja en carbohidratos'),
('Calabacines rellenos de queso ricotta y espinacas', 'Baja en carbohidratos'),
('Rollitos de lechuga con pollo y aderezo de maní', 'Baja en carbohidratos'),
('Hamburguesa sin pan con queso y ensalada de col', 'Baja en carbohidratos'),
('Chuletas de cerdo con puré de coliflor', 'Baja en carbohidratos'),
('Cazuela de pollo con crema de espinacas', 'Baja en carbohidratos'),
('Ensalada césar con pechuga de pollo y aderezo bajo en grasa', 'Baja en carbohidratos'),
('Salmón al horno con espinacas y almendras tostadas', 'Baja en carbohidratos'),
('Fajitas de pollo servidas en hojas de lechuga', 'Baja en carbohidratos'),
('Sopa de pollo con espárragos y champiñones', 'Baja en carbohidratos'),
('Rollitos de pavo rellenos de espinacas y queso bajo en grasa', 'Baja en carbohidratos'),
('Ensalada de camarones con aguacate y limón', 'Baja en carbohidratos'),
('Pizza de base de coliflor con queso y vegetales', 'Baja en carbohidratos'),

-- Alta en proteínas
('Pavo salteado con arroz basmati y espárragos', 'Alta en proteínas'),
('Salmón ahumado con guacamole y ensalada verde', 'Alta en proteínas'),
('Brochetas de pollo con vegetales al horno', 'Alta en proteínas'),
('Tofu salteado con salsa teriyaki y quinoa', 'Alta en proteínas'),
('Filete de pescado con lentejas y espinacas', 'Alta en proteínas'),
('Tazón de huevo revuelto con jamón de pavo y champiñones', 'Alta en proteínas'),
('Bistec a la parrilla con batata asada y brócoli', 'Alta en proteínas'),
('Lomo de cerdo al horno con ensalada de espárragos y almendras', 'Alta en proteínas'),
('Pechuga de pollo rellena de espinacas y queso cottage', 'Alta en proteínas'),
('Atún a la plancha con puré de batata y ensalada', 'Alta en proteínas'),
('Huevos al horno con espárragos y queso feta', 'Alta en proteínas'),
('Carne de res al grill con ensalada de aguacate y tomate', 'Alta en proteínas'),
('Ensalada de lentejas con zanahoria, apio y perejil', 'Alta en proteínas'),
('Guiso de pollo con vegetales y garbanzos', 'Alta en proteínas'),
('Sopa de huevo con espinaca y champiñones', 'Alta en proteínas'),

-- Vegetariana
('Canelones de espinacas y ricotta', 'Vegetariana'),
('Guiso de garbanzos con papa y zanahoria', 'Vegetariana'),
('Ensalada caprese con tomate, mozzarella y albahaca', 'Vegetariana'),
('Chiles poblanos rellenos de quinoa y queso', 'Vegetariana'),
('Pasta integral con pesto de espinacas y nueces', 'Vegetariana'),
('Tacos de hongos portobello con cebolla caramelizada', 'Vegetariana'),
('Pizza de coliflor con queso y verduras', 'Vegetariana'),
('Bowl de arroz integral, edamame y aguacate', 'Vegetariana'),
('Tortilla de espinacas con queso y tomate', 'Vegetariana'),
('Risotto de hongos con parmesano', 'Vegetariana'),
('Sopa de calabaza con nuez moscada', 'Vegetariana'),
('Pizza de vegetales con base integral', 'Vegetariana'),
('Hamburguesa de garbanzos con ensalada fresca', 'Vegetariana'),
('Croquetas de papa con espinaca y queso', 'Vegetariana'),
('Berenjenas gratinadas con queso y tomate', 'Vegetariana'),

-- Vegana
('Arroz frito con tofu y vegetales', 'Vegana'),
('Tacos de coliflor al pastor con salsa de aguacate', 'Vegana'),
('Hamburguesa de frijoles negros con pan integral', 'Vegana'),
('Sopa de lentejas con zanahorias y cilantro', 'Vegana'),
('Ensalada de kale con semillas de girasol y aderezo de limón', 'Vegana'),
('Wrap de vegetales asados con hummus', 'Vegana'),
('Curry de coco con batata, espinacas y garbanzos', 'Vegana'),
('Quinoa con champiñones y espárragos salteados', 'Vegana'),
('Batido de avena, cacao y plátano con leche de almendra', 'Vegana'),
('Panqueques de avena con jarabe de arce y frutas frescas', 'Vegana'),
('Ensalada de quinoa con garbanzos, pepino y limón', 'Vegana'),
('Curry de vegetales con leche de coco y arroz basmati', 'Vegana'),
('Estofado de lentejas con espinacas', 'Vegana'),
('Bowl de tofu con brócoli y sésamo', 'Vegana'),
('Pasta de calabacín con pesto vegano', 'Vegana');


INSERT INTO Catalogo_Comidas (Detalles_Comida, Tipo_Dieta) VALUES
-- Equilibrada
('Merluza al horno con arroz integral y ensalada de espinacas', 'Equilibrada'),
('Omelette de claras con champiñones y tostada integral', 'Equilibrada'),

-- Baja en carbohidratos
('Salmón al vapor con ensalada de pepino y aguacate', 'Baja en carbohidratos'),
('Muslos de pollo al horno con coliflor asada', 'Baja en carbohidratos'),

-- Alta en proteínas
('Brochetas de camarones con vegetales al grill', 'Alta en proteínas'),
('Huevos pochados con espinacas y puré de camote', 'Alta en proteínas'),

-- Vegetariana
('Curry de garbanzos con arroz basmati', 'Vegetariana'),
('Tarta de espinacas y queso feta', 'Vegetariana'),

-- Vegana
('Ensalada de espinacas con quinoa, almendras y vinagreta de naranja', 'Vegana'),
('Guiso de lentejas con batata y tomate', 'Vegana');
