# 🔧 Car Mechanic Shop — Database Schema

Relational database designed for managing a car mechanic shop, including customers, vehicles, service orders, employees, parts, and suppliers.

---

## 📌 Overview

This project defines a normalized database schema for a workshop management system. It supports the full lifecycle of a service order — from vehicle check-in to service execution and final billing.

---

## 🛠️ Tech Stack

* **Database:** SQL (PostgreSQL-style syntax)
* **Language:** SQL (DDL)
* **Modeling:** Relational

---

## 🧱 Database Structure

### Core Entities

* **Customer** → Stores client information
* **Vehicle** → Vehicles owned by customers
* **Supplier** → Parts providers
* **Part** → Inventory of spare parts
* **Service** → Catalog of workshop services
* **Employee** → Staff members
* **Service Order** → Central entity for workshop operations

---

## 🔗 Relationships

* A **customer** can own multiple vehicles

* A **vehicle** belongs to one customer

* A **service order** is linked to:

  * one vehicle
  * one responsible employee

* Many-to-many relationships:

  * Service Order ↔ Services → `order_service`
  * Service Order ↔ Parts → `order_part`

---

## ⚙️ Key Features

* ✔️ Fully normalized schema
* ✔️ Referential integrity using `FOREIGN KEY`
* ✔️ Data validation with `CHECK` constraints
* ✔️ Automatic timestamps using `NOW()`
* ✔️ Default values for key fields
* ✔️ Composite primary keys in junction tables
* ✔️ Indexes for query performance optimization

---

## 🧾 Service Order Lifecycle

The `service_order.status` field controls workflow:

* `OPEN` → Order created
* `IN_PROGRESS` → Work started
* `WAITING` → Waiting for parts/approval
* `DONE` → Work completed
* `CLOSED` → Delivered and paid
* `CANCELLED` → Order canceled

---

## 📦 Inventory Logic

* `stock_qty` increases when new parts arrive
* `stock_qty` decreases when parts are used
* `unit_cost` preserves historical pricing

---

## 🧪 Constraints & Data Integrity

* Unique constraints:

  * Vehicle plate
  * VIN
  * Part code

* Validation rules:

  * Prices and quantities must be ≥ 0
  * Status must match predefined values

---

## ⚡ Indexes

Indexes are used to improve performance on common queries:

* `vehicle(customer_id)`
* `service_order(vehicle_id)`
* `service_order(employee_id)`
* `service_order(status)`
* `part(supplier_id)`

---

## 🚀 How to Run

```sql
CREATE DATABASE car_mechanic_shop;
USE car_mechanic_shop;

-- Execute the full script to create all tables and indexes
```

---

## 📌 Technical Notes

* Uses `SERIAL` for auto-increment (PostgreSQL-style)
* Uses `NOW()` and `CURRENT_DATE` for automatic timestamps
* Designed for scalability and real-world workshop scenarios
* `total` in service_order is denormalized for performance

---

# 🇧🇷 Versão em Português

## 📌 Visão Geral

Banco de dados relacional para gerenciamento de oficina mecânica, cobrindo clientes, veículos, ordens de serviço, funcionários, peças e fornecedores.

---

## 🧱 Estrutura

### Entidades Principais

* **Cliente**
* **Veículo**
* **Fornecedor**
* **Peças**
* **Serviços**
* **Funcionários**
* **Ordem de Serviço**

---

## 🔗 Relacionamentos

* Cliente → vários veículos

* Veículo → pertence a um cliente

* Ordem de serviço → vinculada a:

  * veículo
  * funcionário

* Relações muitos-para-muitos:

  * Ordem ↔ Serviços
  * Ordem ↔ Peças

---

## ⚙️ Funcionalidades

* ✔️ Banco normalizado
* ✔️ Integridade referencial
* ✔️ Regras com `CHECK`
* ✔️ Valores padrão automáticos
* ✔️ Índices para performance

---

## 🔄 Ciclo da Ordem de Serviço

* `OPEN` → Aberta
* `IN_PROGRESS` → Em andamento
* `WAITING` → Aguardando
* `DONE` → Finalizada
* `CLOSED` → Encerrada
* `CANCELLED` → Cancelada

---

## 📦 Controle de Estoque

* Entrada → aumenta estoque
* Saída → reduz estoque
* Custos históricos preservados

---

## 🚀 Execução

```sql
CREATE DATABASE car_mechanic_shop;
USE car_mechanic_shop;
```

---

## 📌 Observações

* Uso de `SERIAL` para IDs automáticos
* Uso de `NOW()` para datas
* Estrutura escalável e próxima de cenários reais
* Campo `total` otimizado para performance

---

## 👨‍💻 Author

Database design project focused on real-world workshop operations.
