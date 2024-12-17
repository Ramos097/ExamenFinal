-- Creaci�n de la base de datos
CREATE DATABASE ConstructoraUH;
GO

USE ConstructoraUH;
GO

-- Tabla para empleados
CREATE TABLE Empleados (
    Carnet INT PRIMARY KEY,
    NombreCompleto NVARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Direccion NVARCHAR(200) DEFAULT 'San Jos�',
    Telefono NVARCHAR(20) NOT NULL,
    CorreoElectronico NVARCHAR(100) NOT NULL UNIQUE,
    Salario DECIMAL(10, 2) CHECK (Salario >= 250000 AND Salario <= 500000) DEFAULT 250000,
    CategoriaLaboral NVARCHAR(50) CHECK (CategoriaLaboral IN ('Administrador', 'Operario', 'Pe�n')) NOT NULL
);

-- Tabla para proyectos
CREATE TABLE Proyectos (
    CodigoProyecto INT  PRIMARY KEY,
    NombreProyecto NVARCHAR(200) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NULL
);

-- Tabla para asignaci�n de empleados a proyectos
CREATE TABLE Asignaciones (
    IdAsignacion INT PRIMARY KEY,
    Carnet INT NOT NULL,
    CodigoProyecto INT NOT NULL,
    FechaAsignacion DATE DEFAULT GETDATE(),
    FOREIGN KEY (Carnet) REFERENCES Empleados(Carnet),
    FOREIGN KEY (CodigoProyecto) REFERENCES Proyectos(CodigoProyecto)
);
-- Insertar datos en la tabla de Empleados
INSERT INTO Empleados (Carnet, NombreCompleto, FechaNacimiento, Direccion, Telefono, CorreoElectronico, Salario, CategoriaLaboral)
VALUES 
(1, 'Juan P�rez Gonz�lez', '1985-03-12', 'Avenida 1, San Jos�', '555-1234', 'juan.perez@email.com', 300000, 'Administrador'),
(2, 'Mar�a L�pez Fern�ndez', '1990-07-25', 'Calle 2, Alajuela', '555-5678', 'maria.lopez@email.com', 260000, 'Operario'),
(3, 'Carlos Rodr�guez G�mez', '1988-11-14', 'Calle 3, Heredia', '555-9876', 'carlos.rodriguez@email.com', 275000, 'Pe�n');


-- Insertar datos en la tabla de Asignaciones
INSERT INTO Asignaciones (IdAsignacion, Carnet, CodigoProyecto, FechaAsignacion)
VALUES 
(1, 1, 101, '2024-01-05'),
(2, 2, 102, '2024-03-20'),
(3, 3, 103, '2024-05-15');


-- Insertar nuevas obras de construcci�n
INSERT INTO Proyectos (CodigoProyecto, NombreProyecto, FechaInicio, FechaFin)
VALUES 
(201, 'Construcci�n de Edificio A', '2024-01-01', '2024-06-30'),
(202, 'Construcci�n de Puente B', '2024-03-15', '2024-11-30'),
(203, 'Ampliaci�n de Carretera C', '2024-05-01', '2024-12-31'),
(204, 'Construcci�n de Hospital D', '2024-02-01', '2024-09-30'),
(205, 'Planta de Tratamiento de Agua E', '2024-06-01', '2024-12-31');


