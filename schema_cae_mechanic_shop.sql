-- =============================================================
--  CAR MECHANIC SHOP — DATABASE SCHEMA
--  Script 01: Table definitions (DDL)
-- =============================================================
create database car_mechanic_shop;
use car_mechanic_shop;
-- -------------------------------------------------------------
-- TABLE: customer
-- Stores every person or company that brings a vehicle in for
-- service.  A customer can own one or more vehicles and will
-- appear on every service order linked to those vehicles.
-- -------------------------------------------------------------
CREATE TABLE customer (
    customer_id   SERIAL        PRIMARY KEY,
    name          VARCHAR(120)  NOT NULL,
    phone         VARCHAR(20),
    email         VARCHAR(120),
    address       TEXT,
    created_at    TIMESTAMP     NOT NULL DEFAULT NOW()
);


-- -------------------------------------------------------------
-- TABLE: vehicle
-- Represents a specific car (or truck, motorcycle, etc.) owned
-- by a customer.  The VIN is unique across the entire fleet so
-- the same physical vehicle cannot be registered twice.  Every
-- service order is raised against a vehicle, not directly
-- against a customer.
-- -------------------------------------------------------------
CREATE TABLE vehicle (
    vehicle_id    SERIAL       PRIMARY KEY,
    customer_id   INT          NOT NULL REFERENCES customer(customer_id),
    plate         VARCHAR(20)  NOT NULL UNIQUE,
    brand         VARCHAR(60)  NOT NULL,
    model         VARCHAR(60)  NOT NULL,
    year          SMALLINT     NOT NULL,
    color         VARCHAR(30),
    vin           VARCHAR(17)  UNIQUE,         -- ISO 3779 chassis number
    mileage_in    INT,                          -- km/miles at drop-off
    created_at    TIMESTAMP    NOT NULL DEFAULT NOW()
);


-- -------------------------------------------------------------
-- TABLE: supplier
-- Companies or individuals that supply spare parts to the shop.
-- Each part in the catalogue references exactly one supplier.
-- -------------------------------------------------------------
CREATE TABLE supplier (
    supplier_id   SERIAL        PRIMARY KEY,
    name          VARCHAR(120)  NOT NULL,
    contact       VARCHAR(120),
    phone         VARCHAR(20),
    email         VARCHAR(120),
    address       TEXT
);


-- -------------------------------------------------------------
-- TABLE: part
-- The shop's parts catalogue.  Each row represents one SKU
-- (stock-keeping unit).  stock_qty is decremented when a part
-- is consumed by a service order and incremented when new stock
-- arrives.  unit_cost is the shop's purchase cost; the selling
-- price may include a markup applied at order time.
-- -------------------------------------------------------------
CREATE TABLE part (
    part_id       SERIAL        PRIMARY KEY,
    supplier_id   INT           REFERENCES supplier(supplier_id),
    name          VARCHAR(120)  NOT NULL,
    code          VARCHAR(60)   UNIQUE,         -- manufacturer / internal code
    description   TEXT,
    unit_cost     NUMERIC(10,2) NOT NULL CHECK (unit_cost >= 0),
    stock_qty     INT           NOT NULL DEFAULT 0 CHECK (stock_qty >= 0)
);


-- -------------------------------------------------------------
-- TABLE: service
-- The catalogue of labour services the shop offers (oil change,
-- tyre rotation, brake pad replacement, etc.).  The price field
-- holds the default list price; mechanics can override it per
-- order when required.
-- -------------------------------------------------------------
CREATE TABLE service (
    service_id    SERIAL        PRIMARY KEY,
    name          VARCHAR(120)  NOT NULL,
    description   TEXT,
    price         NUMERIC(10,2) NOT NULL CHECK (price >= 0),
    duration_min  INT                            -- estimated minutes
);


-- -------------------------------------------------------------
-- TABLE: employee
-- Workshop staff — mechanics, service advisors, managers.  The
-- role column is free text (e.g. 'Mechanic', 'Advisor',
-- 'Manager') so new roles can be added without schema changes.
-- Each service order is assigned to one responsible employee.
-- -------------------------------------------------------------
CREATE TABLE employee (
    employee_id   SERIAL       PRIMARY KEY,
    name          VARCHAR(120) NOT NULL,
    role          VARCHAR(60)  NOT NULL,
    phone         VARCHAR(20),
    email         VARCHAR(120),
    hire_date     DATE         NOT NULL DEFAULT (current_date),
    active        BOOLEAN      NOT NULL DEFAULT TRUE
);


-- -------------------------------------------------------------
-- TABLE: service_order
-- The central document of the system.  One order is opened per
-- visit; it groups all labour and parts consumed during that
-- visit.  Status lifecycle:
--   'OPEN'       → vehicle received, work not started
--   'IN_PROGRESS'→ workshop is working on it
--   'WAITING'    → waiting for a part or customer approval
--   'DONE'       → work complete, awaiting collection
--   'CLOSED'     → vehicle collected and invoice settled
--   'CANCELLED'  → order voided before work began
-- The total column is a denormalised sum updated by the
-- application (or a trigger) after each line-item change.
-- -------------------------------------------------------------
CREATE TABLE service_order (
    order_id      SERIAL        PRIMARY KEY,
    vehicle_id    INT           NOT NULL REFERENCES vehicle(vehicle_id),
    employee_id   INT           NOT NULL REFERENCES employee(employee_id),
    open_date     TIMESTAMP     NOT NULL DEFAULT NOW(),
    close_date    TIMESTAMP,
    status        VARCHAR(20)   NOT NULL DEFAULT 'OPEN'
                  CHECK (status IN ('OPEN','IN_PROGRESS','WAITING','DONE','CLOSED','CANCELLED')),
    notes         TEXT,
    total         NUMERIC(10,2) NOT NULL DEFAULT 0 CHECK (total >= 0)
);


-- -------------------------------------------------------------
-- TABLE: order_service  (junction: service_order ↔ service)
-- Each row records one line of labour work inside a service
-- order.  unit_price captures the price agreed at the moment
-- the service was added (which may differ from the catalogue
-- default, e.g. promotional pricing or negotiated discount).
-- Composite PK prevents the same service from being added twice
-- to the same order; use quantity instead.
-- -------------------------------------------------------------
CREATE TABLE order_service (
    order_id      INT           NOT NULL REFERENCES service_order(order_id),
    service_id    INT           NOT NULL REFERENCES service(service_id),
    quantity      INT           NOT NULL DEFAULT 1 CHECK (quantity > 0),
    unit_price    NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0),
    PRIMARY KEY (order_id, service_id)
);


-- -------------------------------------------------------------
-- TABLE: order_part  (junction: service_order ↔ part)
-- Each row records one type of spare part used in a service
-- order.  unit_cost captures the purchase cost at the time of
-- consumption so historical order totals remain accurate even
-- if supplier prices change later.
-- -------------------------------------------------------------
CREATE TABLE order_part (
    order_id      INT           NOT NULL REFERENCES service_order(order_id),
    part_id       INT           NOT NULL REFERENCES part(part_id),
    quantity      INT           NOT NULL DEFAULT 1 CHECK (quantity > 0),
    unit_cost     NUMERIC(10,2) NOT NULL CHECK (unit_cost >= 0),
    PRIMARY KEY (order_id, part_id)
);


-- =============================================================
--  INDEXES  — improve lookup performance on common queries
-- =============================================================
CREATE INDEX idx_vehicle_customer    ON vehicle(customer_id);
CREATE INDEX idx_order_vehicle       ON service_order(vehicle_id);
CREATE INDEX idx_order_employee      ON service_order(employee_id);
CREATE INDEX idx_order_status        ON service_order(status);
CREATE INDEX idx_part_supplier       ON part(supplier_id);
