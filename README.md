# Proyecto Juntadas - Organizador de Horarios Grupales

Aplicación web desarrollada en **Python (Django)** y **MySQL** para la materia **Estructura de Datos y Programación (71.59)** - ITBA. Permite a los usuarios gestionar su calendario personal (compromisos fijos semanales y eventos puntuales), administrar grupos de amigos y encontrar franjas horarias libres en común entre todos los integrantes.

---

## Estructura del Proyecto

* `config/`: Configuración general del proyecto Django (`settings.py`, `urls.py`).
* `app_calendario/`: Aplicación principal organizada de forma modular (`views/`, `models/`, `templates/`).
* `sprint1creacionSQL.sql`: Script DDL para crear la base de datos `organizador_grupos` y sus tablas (`usuarios`, `grupos`, `miembros_grupo`, `eventos_calendario`).
* `requirements.txt`: Listado de librerías y dependencias del proyecto.
* `manage.py`: Script de administración de Django.

---

## Requisitos Previos

* **Python** 3.10 o superior
* **MySQL Server** (MySQL Workbench, XAMPP o servicio local activo)

---

## Instrucciones de Instalación y Ejecución

### 1. Clonar el repositorio

```bash
git clone [https://github.com/vchavesalvarez/proyecto_juntadas.git](https://github.com/vchavesalvarez/proyecto_juntadas.git)
cd proyecto_juntadas



### 2. Instalar las dependencias

```bash
pip install -r requirements.txt

### 3. Crear la base de datos en MySQL

Abrí tu gestor de base de datos (MySQL Workbench o phpMyAdmin).

Ejecutá el archivo script_base_datos.sql incluido en este repositorio para generar la base organizador_grupos con sus respectivas claves primarias, foráneas y restricciones.

### 4. Configurar las credenciales locales
Por seguridad, las credenciales reales no se incluyen en el repositorio. Antes de levantar el servidor, configurá tu usuario y contraseña local de MySQL en config/settings.py (o mediante variables de entorno):

Python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'organizador_grupos',
        'USER': 'tu_usuario_mysql',
        'PASSWORD': 'tu_password_mysql',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
### 5. Iniciar el servidor de desarrollo

```bash
python manage.py runserver
Luego, ingresá desde tu navegador a http://127.0.0.1:8000/.

Integrantes - Grupo 11 (Comisión A)
Sofia Salomon (68096)
Melanie Michelle Hoffmann (68029)
Victoria Mia Chaves Alvarez (67626)
Ema Allona (67985)
Santiago Ranftl (68031)
Antonela Petrucci ()
Facundo Serra (62102)