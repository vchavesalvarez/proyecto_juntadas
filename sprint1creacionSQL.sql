-- ========================================
-- CREACIÓN DE LA BASE DE DATOS
-- ========================================
CREATE DATABASE IF NOT EXISTS organizador_grupos;
USE organizador_grupos;

-- ========================================
-- TABLA USUARIOS
-- ========================================
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL, -- Guarda el hash encriptado (bcrypt / hashlib)
    foto_perfil VARCHAR(255) NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ========================================
-- TABLA GRUPOS
-- ========================================
CREATE TABLE grupos (
    id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_grupo VARCHAR(100) NOT NULL,
    descripcion TEXT NULL,
    id_creador INT NOT NULL,
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_grupo_creador -- Asigna un nombre único e identificable 
        FOREIGN KEY (id_creador) -- Declara que columna de la tabla actual actua como clave foránea, relacionandose con otras tablas
        REFERENCES usuarios(id_usuario) -- Destino del vinculo. El campo id_usuario de esta tabla apunta y pertenece a la columna id_usuario de la tabla padre (usuarios).
        ON DELETE CASCADE -- Borra la cascada ante una eliminacion. Si se ejecuta un delete sobre un usuario de la tabla, busca todos los registros con el mismo id y los eliminara automaticamente
);


-- ========================================
-- TABLA MIEMBROS_GRUPO
-- ========================================
CREATE TABLE miembros_grupo (
    id_miembro INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_grupo INT NOT NULL,
    rol VARCHAR(50) DEFAULT 'miembro',
    fecha_union DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uq_usuario_grupo
        UNIQUE (id_usuario, id_grupo),
    CONSTRAINT fk_miembro_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE,
    CONSTRAINT fk_miembro_grupo
        FOREIGN KEY (id_grupo)
        REFERENCES grupos(id_grupo)
        ON DELETE CASCADE
);

-- ========================================
-- TABLA EVENTOS_CALENDARIO
-- ========================================
CREATE TABLE eventos_calendario (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_grupo INT NULL,                            -- NULL permite eventos personales del usuario
    titulo VARCHAR(150) NOT NULL,
    descripcion TEXT NULL,
    es_recurrente BOOLEAN NOT NULL DEFAULT FALSE, -- TRUE: Semanal (rutina), FALSE: Única vez
    dia_semana TINYINT NULL,                      -- 1 (Lunes) a 7 (Domingo) si es recurrente
    fecha_especifica DATE NULL,                  -- YYYY-MM-DD si es evento único
    hora_inicio TIME NOT NULL,                   -- HH:MM:SS
    hora_fin TIME NOT NULL,                      -- HH:MM:SS
    tipo VARCHAR(50) NULL,                        -- Ocio, Estudio, Deporte, Cursada, etc.
    fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_evento_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE,
    CONSTRAINT fk_evento_grupo
        FOREIGN KEY (id_grupo)
        REFERENCES grupos(id_grupo)
        ON DELETE CASCADE
);