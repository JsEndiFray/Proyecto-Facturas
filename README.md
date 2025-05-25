# 🚀 Proyecto Facturas - Fullstack con Docker

Sistema completo de facturación desarrollado con **Node.js + Express** (backend) y **Angular 19** (frontend), completamente dockerizado para desarrollo profesional.

## ✨ Características

- 🐳 **Docker Compose** - Un comando para iniciar todo
- 🔥 **Hot Reload** - Cambios automáticos en desarrollo
- 🗄️ **MySQL 8.0** - Base de datos con persistencia
- 🛠️ **phpMyAdmin** - Gestión visual de base de datos
- 🔒 **JWT Authentication** - Sistema de autenticación seguro
- 📚 **Swagger** - Documentación automática de API
- ⚡ **Workflow profesional** - Listo para producción

---

## 🏗️ Arquitectura del Sistema

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │    Backend      │    │     MySQL       │
│   Angular 19    │◄──►│  Node.js +      │◄──►│   Database      │
│   Port: 4200    │    │  Express 5.1    │    │   Port: 3306    │
└─────────────────┘    │   Port: 3600    │    └─────────────────┘
                       └─────────────────┘
                               │
                       ┌─────────────────┐
                       │   phpMyAdmin    │
                       │   Port: 8080    │
                       └─────────────────┘
```

---

## 📁 Estructura del Proyecto

```
Proyecto-Facturas/
├── 🐳 docker-compose.yml     # Orquestación de servicios
├── 📄 .env                   # Variables de entorno (no en Git)
├── 📄 .env.example           # Plantilla de variables
├── 📄 .gitignore             # Archivos ignorados
├── 📄 README.md              # Este archivo
├── 📁 backend/               # API Node.js + Express
│   ├── 🐳 Dockerfile         # Configuración contenedor backend
│   ├── 📄 .env               # Variables específicas backend
│   ├── 📁 src/               # Código fuente
│   ├── 📁 routes/            # Rutas de API
│   ├── 📁 config/            # Configuraciones
│   └── 📄 package.json       # Dependencias Node.js
└── 📁 frontend/              # Aplicación Angular
    ├── 🐳 Dockerfile         # Configuración contenedor frontend
    ├── 📁 src/               # Código fuente Angular
    ├── 📄 angular.json       # Configuración Angular
    └── 📄 package.json       # Dependencias Angular
```

---

## 🚀 Inicio Rápido

### Prerrequisitos
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) instalado
- Git

### 1. Clonar el repositorio
```bash
git clone https://github.com/JsEndiFray/Proyecto-Facturas.git
cd Proyecto-Facturas
```

### 2. Configurar variables de entorno
```bash
# Crear archivo de variables desde plantilla
cp .env.example .env

# Editar con tus credenciales (opcional para desarrollo)
nano .env
```

### 3. ¡Iniciar todo con un comando!
```bash
# Inicia backend + frontend + MySQL + phpMyAdmin
docker-compose up -d
```

### 4. Acceder a la aplicación
- 🅰️ **Frontend (Angular):** http://localhost:4200
- 🔧 **Backend (API):** http://localhost:3600
- 📚 **Swagger (Documentación):** http://localhost:3600/api-docs
- 🗄️ **phpMyAdmin:** http://localhost:8080

---

## 🛠️ Desarrollo

### Comandos principales
```bash
# Iniciar todos los servicios
docker-compose up -d

# Ver logs en tiempo real
docker-compose logs -f

# Ver logs específicos
docker-compose logs -f backend
docker-compose logs -f frontend

# Ver estado de contenedores
docker-compose ps

# Parar todos los servicios
docker-compose down
```

### Hot Reload automático ✨
- **Backend:** Edita archivos en `backend/src/` → cambios inmediatos
- **Frontend:** Edita archivos en `frontend/src/` → recarga automática

### Solución de problemas
```bash
# Si algo no funciona, reiniciar servicios
docker-compose restart

# Rebuild completo (si cambias dependencias)
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

---

## 🏗️ Stack Tecnológico

### Backend
- **Runtime:** Node.js 22
- **Framework:** Express 5.1.0
- **Base de datos:** MySQL 8.0 con mysql2
- **Autenticación:** JWT (jsonwebtoken)
- **Documentación:** Swagger (swagger-ui-express)
- **Seguridad:** Helmet, CORS, bcrypt
- **Validación:** express-validator
- **Rate Limiting:** express-rate-limit

### Frontend
- **Framework:** Angular 19.2.0
- **CLI:** Angular CLI 19.2.10
- **Alertas:** SweetAlert2
- **HTTP:** Angular HttpClient
- **Routing:** Angular Router

### DevOps
- **Contenedores:** Docker + Docker Compose
- **Base de datos:** MySQL 8.0
- **Admin BD:** phpMyAdmin
- **Hot Reload:** Volúmenes Docker + Watchers

---

## 🌐 API Endpoints

### Autenticación
- `POST /api/auth/login` - Iniciar sesión
- `POST /api/auth/register` - Registrar usuario
- `POST /api/auth/refresh` - Renovar token

### Recursos principales
- `GET|POST /api/clients` - Gestión de clientes
- `GET|POST /api/estates` - Gestión de propiedades
- `GET|POST /api/bills` - Gestión de facturas
- `GET|POST /api/owners` - Gestión de propietarios
- `GET|POST /api/users` - Gestión de usuarios

> 📚 **Documentación completa:** http://localhost:3600/api-docs

---

## 🗄️ Base de Datos

### Conexión
- **Host:** localhost
- **Puerto:** 3306
- **Base de datos:** db_jose
- **Usuario:** admin
- **Gestión visual:** http://localhost:8080

### Backup y restauración
```bash
# Crear backup
docker-compose exec mysql mysqldump -u admin -p db_jose > backup.sql

# Restaurar backup
docker-compose exec mysql mysql -u admin -p db_jose < backup.sql
```

---

## 📦 Despliegue

### Desarrollo
```bash
# Ya configurado con docker-compose.yml
docker-compose up -d
```

### Producción
1. Configurar variables de entorno de producción
2. Usar `docker-compose.prod.yml` (si existe)
3. Configurar reverse proxy (nginx)
4. Certificados SSL
5. Monitoreo y logs

---

## 🤝 Contribución

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -m 'feat: añadir nueva funcionalidad'`)
4. Push a la rama (`git push origin feature/nueva-funcionalidad`)
5. Abre un Pull Request

### Estándares de código
- **Commits:** Conventional Commits (feat, fix, docs, etc.)
- **Backend:** ESLint + Prettier
- **Frontend:** Angular Style Guide
- **Testing:** Jest (backend) + Jasmine/Karma (frontend)

---

## 🐛 Troubleshooting

### Problemas comunes

**❌ Error: "Port already in use"**
```bash
# Ver qué usa el puerto
lsof -i :3600  # o :4200, :3306
# Parar Docker y reiniciar
docker-compose down && docker-compose up -d
```

**❌ "Cannot connect to MySQL"**
```bash
# Ver logs de MySQL
docker-compose logs mysql
# Esperar a que termine de inicializar (puede tardar 1-2 min)
```

**❌ "Changes not reflecting"**
```bash
# Verificar volúmenes
docker-compose ps
# Rebuild si es necesario
docker-compose build --no-cache
```

---

## 📚 Recursos Adicionales

- [Docker Documentation](https://docs.docker.com/)
- [Node.js Best Practices](https://github.com/goldbergyoni/nodebestpractices)
- [Angular Style Guide](https://angular.io/guide/styleguide)
- [MySQL 8.0 Reference](https://dev.mysql.com/doc/refman/8.0/en/)

---

## 👤 Autor

**Endi Fray**
- GitHub: [@JsEndiFray](https://github.com/JsEndiFray)
- LinkedIn: [Endi Fray](https://linkedin.com/in/endifray)

---

## ⭐ Acknowledgments

- Gracias a la comunidad de Docker por las mejores prácticas
- Angular Team por el excelente framework
- Node.js community por el ecosistema robusto

---

**¡Si este proyecto te ayuda, dale una ⭐ en GitHub!**