# 📦 Proyecto Facturas (Monorepo con Submódulos)

Este repositorio actúa como contenedor de los subproyectos **backend** y **frontend**, organizados como submódulos de Git. Está diseñado para centralizar el desarrollo, despliegue y mantenimiento del sistema completo de facturación.

---

## 📁 Estructura del Proyecto

```
Proyecto-Facturas/
├── backend/               # Submódulo: lógica de negocio, base de datos, API
├── frontend/              # Submódulo: interfaz Angular para usuarios
├── .gitmodules            # Configuración de los submódulos
├── .gitignore             # Ignora node_modules, .env, logs, etc.
└── docker-compose.yml     # (Opcional) Configuración de servicios para desarrollo local
```

---

## 🔗 Repositorios de los submódulos

- 🔧 **Backend** → [back-billing](https://github.com/JsEndiFray/back-billing)
- 💻 **Frontend** → [front-billing](https://github.com/JsEndiFray/front-billing)

---

## 🚀 Cómo clonar este repositorio con submódulos

Clona el proyecto y sus submódulos en un solo paso:

```bash
git clone --recurse-submodules https://github.com/JsEndiFray/Proyecto-Facturas.git
```

> Si ya lo clonaste sin `--recurse-submodules`, puedes inicializar los submódulos después con:

```bash
git submodule update --init --recursive
```

---

## 🛠️ Requisitos generales

- Node.js (recomendado: 18 o superior)
- Angular CLI (para frontend)
- Docker & Docker Compose (opcional, para entorno unificado)
- Git

---

## ⚙️ Trabajar con los submódulos

### Backend

```bash
cd backend
# Trabaja normalmente como en cualquier repo Node.js
git pull
git add .
git commit -m "Cambios en backend"
git push
```

### Frontend

```bash
cd frontend
# Igual que cualquier proyecto Angular
git pull
git add .
git commit -m "Cambios en frontend"
git push
```

Después, vuelve al repositorio global y actualiza la referencia:

```bash
cd ..
git add backend frontend
git commit -m "Actualización de submódulos"
git push
```

---

## 📦 Despliegue local (opcional con Docker)

> Solo si tienes configurado `docker-compose.yml` y tus subproyectos soportan containers:

```bash
docker-compose up --build
```

---

## 🧠 Notas adicionales

- El archivo `docker-compose.yml` está ignorado en Git.
- Puedes personalizar el archivo `.gitignore` para adaptar a tu flujo de trabajo.

---

## 👤 Autor

Desarrollado por **Endi Fray**  
🔗 [https://github.com/JsEndiFray](https://github.com/JsEndiFray)

---