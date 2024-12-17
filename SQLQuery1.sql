-- Creación de la base de datos
CREATE DATABASE ConstructoraUH;
GO

USE ConstructoraUH;
GO

-- Tabla para empleados
CREATE TABLE Empleados (
    Carnet INT PRIMARY KEY,
    NombreCompleto NVARCHAR(100) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Direccion NVARCHAR(200) DEFAULT 'San José',
    Telefono NVARCHAR(20) NOT NULL,
    CorreoElectronico NVARCHAR(100) NOT NULL UNIQUE,
    Salario DECIMAL(10, 2) CHECK (Salario >= 250000 AND Salario <= 500000) DEFAULT 250000,
    CategoriaLaboral NVARCHAR(50) CHECK (CategoriaLaboral IN ('Administrador', 'Operario', 'Peón')) NOT NULL
);

-- Tabla para proyectos
CREATE TABLE Proyectos (
    CodigoProyecto INT  PRIMARY KEY,
    NombreProyecto NVARCHAR(200) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NULL
);

-- Tabla para asignación de empleados a proyectos
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
(1, 'Juan Pérez González', '1985-03-12', 'Avenida 1, San José', '555-1234', 'juan.perez@email.com', 300000, 'Administrador'),
(2, 'María López Fernández', '1990-07-25', 'Calle 2, Alajuela', '555-5678', 'maria.lopez@email.com', 260000, 'Operario'),
(3, 'Carlos Rodríguez Gómez', '1988-11-14', 'Calle 3, Heredia', '555-9876', 'carlos.rodriguez@email.com', 275000, 'Peón');


-- Insertar datos en la tabla de Asignaciones
INSERT INTO Asignaciones (IdAsignacion, Carnet, CodigoProyecto, FechaAsignacion)
VALUES 
(1, 1, 101, '2024-01-05'),
(2, 2, 102, '2024-03-20'),
(3, 3, 103, '2024-05-15');


-- Insertar nuevas obras de construcción
INSERT INTO Proyectos (CodigoProyecto, NombreProyecto, FechaInicio, FechaFin)
VALUES 
(201, 'Construcción de Edificio A', '2024-01-01', '2024-06-30'),
(202, 'Construcción de Puente B', '2024-03-15', '2024-11-30'),
(203, 'Ampliación de Carretera C', '2024-05-01', '2024-12-31'),
(204, 'Construcción de Hospital D', '2024-02-01', '2024-09-30'),
(205, 'Planta de Tratamiento de Agua E', '2024-06-01', '2024-12-31');


