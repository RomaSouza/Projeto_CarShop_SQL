-- =============================================================
--  CAR MECHANIC SHOP — SAMPLE DATA & TEST QUERIES
--  Script 02: INSERT statements + SELECT queries
-- =============================================================


-- =============================================================
--  SECTION A — SAMPLE DATA INSERTION
-- =============================================================

-- -------------------------------------------------------------
--  Suppliers
-- -------------------------------------------------------------
INSERT INTO supplier (name, contact, phone, email, address) VALUES
  ('AutoParts Brasil',    'Ricardo Nunes',  '(71) 3200-1000', 'vendas@autopartsbr.com',   'Av. Industrial, 500 – Salvador, BA'),
  ('MegaStock Peças',     'Fernanda Lima',  '(71) 3100-5500', 'contato@megastock.com.br', 'Rua das Peças, 88 – Camaçari, BA'),
  ('ImportTech Supply',   'Carlos Souza',   '(11) 4002-9999', 'carlos@importtech.com.br', 'Rod. Anhanguera, 1200 – SP');


-- -------------------------------------------------------------
--  Parts catalogue
-- -------------------------------------------------------------
INSERT INTO part (supplier_id, name, code, description, unit_cost, stock_qty) VALUES
  (1, 'Óleo Motor 5W30 (1L)',          'OLM-5W30-1L',  'Óleo sintético para motores a gasolina e flex', 38.00,  50),
  (1, 'Filtro de Óleo',                'FLT-OLEO-001',  'Filtro compatível com maioria dos motores 1.0-2.0', 22.00,  80),
  (2, 'Filtro de Ar',                  'FLT-AR-002',    'Filtro de ar esportivo lavável',                29.50,  40),
  (2, 'Pastilha de Freio Dianteira',   'PFR-DIANT-04',  'Par de pastilhas para eixo dianteiro',         85.00,  30),
  (2, 'Pastilha de Freio Traseira',    'PFR-TRAS-04',   'Par de pastilhas para eixo traseiro',          72.00,  25),
  (3, 'Correia Dentada Kit',           'COR-DENT-KIT',  'Kit correia + tensionador + rolamento',        220.00, 15),
  (3, 'Vela de Ignição NGK (unid.)',   'VEL-NGK-BKR6E', 'Vela de ignição para motores 1.0 a 2.0',       18.00, 100),
  (1, 'Fluido de Freio DOT 4 (500ml)', 'FLD-DOT4-500',  'Fluido de freio sintético DOT 4',              25.00,  60),
  (2, 'Amortecedor Dianteiro Esq.',    'AMO-DIANT-ESQ', 'Amortecedor a gás eixo dianteiro esquerdo',   310.00,  10),
  (3, 'Sensor de Oxigênio (Sonda)',    'SEN-O2-UNIV',   'Sonda lambda universal banda larga',          195.00,  12);


-- -------------------------------------------------------------
--  Labour services catalogue
-- -------------------------------------------------------------
INSERT INTO service (name, description, price, duration_min) VALUES
  ('Troca de Óleo e Filtro',      'Substituição do óleo do motor e filtro de óleo',               80.00,  30),
  ('Revisão de Freios',           'Inspeção + substituição de pastilhas e sangria do fluido',     150.00,  90),
  ('Alinhamento e Balanceamento', 'Alinhamento das rodas e balanceamento dos quatro pneus',        90.00,  60),
  ('Troca de Correia Dentada',    'Substituição do kit correia dentada + tensionador',            250.00, 180),
  ('Diagnóstico Eletrônico',      'Leitura e interpretação de falhas via scanner OBD2',            70.00,  45),
  ('Troca de Velas de Ignição',   'Substituição das quatro velas de ignição',                      60.00,  40),
  ('Substituição de Amortecedor', 'Troca do amortecedor de um eixo (preço por lado)',             120.00,  90),
  ('Higienização do Ar-Cond.',    'Limpeza + antifungos no sistema de ar condicionado',           100.00,  60);


-- -------------------------------------------------------------
--  Employees
-- -------------------------------------------------------------
INSERT INTO employee (name, role, phone, email, hire_date) VALUES
  ('João Ferreira',  'Mecânico Sênior', '(71) 99100-1111', 'joao@oficina.com',    '2018-03-15'),
  ('Ana Paula Silva','Assessora de Serviço','(71) 99200-2222','ana@oficina.com',   '2020-07-01'),
  ('Marcos Oliveira','Mecânico Júnior', '(71) 99300-3333', 'marcos@oficina.com',  '2022-01-10'),
  ('Lívia Santos',   'Gerente',         '(71) 99400-4444', 'livia@oficina.com',   '2016-05-20');


-- -------------------------------------------------------------
--  Customers
-- -------------------------------------------------------------
INSERT INTO customer (name, phone, email, address) VALUES
  ('Rafael Andrade',   '(71) 98001-0001', 'rafael@email.com',   'Rua das Flores, 12 – Camaçari, BA'),
  ('Beatriz Costa',    '(71) 98002-0002', 'beatriz@email.com',  'Av. Atlântica, 300 – Salvador, BA'),
  ('Transportes Silva LTDA','(71) 3300-9900','fiscal@tsilva.com','Rod. BA-093, Km 5 – Dias D''Ávila, BA'),
  ('Gustavo Mendes',   '(71) 98004-0004', 'gustavo@email.com',  'Rua 15 de Novembro, 7 – Lauro de Freitas, BA'),
  ('Camila Rocha',     '(71) 98005-0005', 'camila@email.com',   'Condomínio Sol Nascente, Casa 8 – Camaçari, BA');


-- -------------------------------------------------------------
--  Vehicles
-- -------------------------------------------------------------
INSERT INTO vehicle (customer_id, plate, brand, model, year, color, vin, mileage_in) VALUES
  (1, 'BCA-1234', 'Volkswagen', 'Gol',         2019, 'Prata',   'VWBCA12345678901', 45200),
  (2, 'BEF-5678', 'Chevrolet',  'Onix',        2021, 'Branco',  'CHEVBEF5678901234', 22100),
  (3, 'BCG-9012', 'Ford',       'Ranger',      2020, 'Preto',   'FORDBCG9012345678', 98000),
  (3, 'BDH-3456', 'Ford',       'Transit',     2018, 'Branco',  'FORDBDH3456789012', 135000),
  (4, 'BFJ-7890', 'Fiat',       'Cronos',      2022, 'Vermelho','FIATBFJ7890123456', 18300),
  (5, 'BGK-2345', 'Toyota',     'Corolla',     2020, 'Grafite', 'TOYBGK2345678901', 55700);


-- -------------------------------------------------------------
--  Service orders
-- -------------------------------------------------------------
INSERT INTO service_order (vehicle_id, employee_id, open_date, close_date, status, notes, total) VALUES
  -- Order 1: Gol, oil change done
  (1, 1, '2025-11-10 08:30', '2025-11-10 10:00', 'CLOSED',
   'Cliente relatou barulho no motor. Troca de óleo realizada sem anomalias.', 0),

  -- Order 2: Onix, brakes + alignment, closed
  (2, 1, '2025-11-15 09:00', '2025-11-15 13:30', 'CLOSED',
   'Revisão completa de freios e alinhamento. Pastilhas traseiras substituídas.', 0),

  -- Order 3: Ranger, timing belt, done waiting collection
  (3, 3, '2025-12-01 07:45', NULL, 'DONE',
   'Kit correia dentada substituído. Diagnóstico eletrônico sem falhas ativas.', 0),

  -- Order 4: Transit, multiple services, in progress
  (4, 1, '2026-01-08 08:00', NULL, 'IN_PROGRESS',
   'Veículo de frota. Revisão programada de 30.000 km.', 0),

  -- Order 5: Cronos, spark plugs
  (5, 3, '2026-02-20 10:15', '2026-02-20 11:30', 'CLOSED',
   'Troca das quatro velas. Motor trabalhando bem.', 0),

  -- Order 6: Corolla, shock absorber + electronic diagnosis, open
  (6, 2, '2026-04-10 09:00', NULL, 'OPEN',
   'Cliente relata batidas na suspensão dianteira esquerda. Aguardando avaliação.', 0);


-- -------------------------------------------------------------
--  Labour lines (order_service)
-- -------------------------------------------------------------
INSERT INTO order_service (order_id, service_id, quantity, unit_price) VALUES
  -- Order 1: oil change
  (1, 1, 1, 80.00),

  -- Order 2: brakes + alignment
  (2, 2, 1, 150.00),
  (2, 3, 1,  90.00),

  -- Order 3: timing belt + electronic diagnosis
  (3, 4, 1, 250.00),
  (3, 5, 1,  70.00),

  -- Order 4: oil change + brakes + alignment + air-con cleaning
  (4, 1, 1,  80.00),
  (4, 2, 1, 150.00),
  (4, 3, 1,  90.00),
  (4, 8, 1, 100.00),

  -- Order 5: spark plug replacement
  (5, 6, 1, 60.00),

  -- Order 6: shock absorber + electronic diagnosis
  (6, 7, 1, 120.00),
  (6, 5, 1,  70.00);


-- -------------------------------------------------------------
--  Parts lines (order_part)
-- -------------------------------------------------------------
INSERT INTO order_part (order_id, part_id, quantity, unit_cost) VALUES
  -- Order 1: 4 L oil + 1 filter
  (1, 1, 4, 38.00),
  (1, 2, 1, 22.00),

  -- Order 2: front brake pads + rear brake pads + brake fluid
  (2, 4, 1, 85.00),
  (2, 5, 1, 72.00),
  (2, 8, 1, 25.00),

  -- Order 3: timing belt kit
  (3, 6, 1, 220.00),

  -- Order 4: oil + filter + air filter + brake fluid
  (4, 1, 5, 38.00),
  (4, 2, 1, 22.00),
  (4, 3, 1, 29.50),
  (4, 8, 1, 25.00),

  -- Order 5: 4 spark plugs
  (5, 7, 4, 18.00),

  -- Order 6: left front shock absorber + O2 sensor
  (6, 9, 1, 310.00),
  (6, 10,1, 195.00);


-- -------------------------------------------------------------
--  Update order totals (labour + parts)
-- -------------------------------------------------------------
SET SQL_SAFE_UPDATES = 0;
UPDATE service_order so
SET total = (
    SELECT COALESCE(SUM(os.quantity * os.unit_price), 0)
    FROM   order_service os
    WHERE  os.order_id = so.order_id
) + (
    SELECT COALESCE(SUM(op.quantity * op.unit_cost), 0)
    FROM   order_part op
    WHERE  op.order_id = so.order_id
);
SET SQL_SAFE_UPDATES = 1;

-- =============================================================
--  SECTION B — TEST QUERIES
-- =============================================================

-- -------------------------------------------------------------
--  Q1: Full customer + vehicle directory
--      Shows every vehicle with its owner's contact info.
-- -------------------------------------------------------------
SELECT
    c.name          AS customer,
    c.phone,
    v.brand,
    v.model,
    v.year,
    v.plate,
    v.mileage_in    AS km_in
FROM customer c
JOIN vehicle  v ON v.customer_id = c.customer_id
ORDER BY c.name, v.plate;


-- -------------------------------------------------------------
--  Q2: All open / in-progress orders with responsible employee
--      Useful for the workshop dashboard.
-- -------------------------------------------------------------
SELECT
    so.order_id,
    so.open_date,
    so.status,
    c.name          AS customer,
    CONCAT(v.brand, ' ', v.model, ' (', v.plate, ')' ) AS vehicle,
    e.name          AS mechanic,
    so.total        AS estimated_total
FROM service_order so
JOIN vehicle  v ON v.vehicle_id  = so.vehicle_id
JOIN customer c ON c.customer_id = v.customer_id
JOIN employee e ON e.employee_id = so.employee_id
WHERE so.status NOT IN ('CLOSED', 'CANCELLED')
ORDER BY so.open_date;


-- -------------------------------------------------------------
--  Q3: Complete detail of one specific order (order_id = 4)
--      Labour lines + parts lines in a single result set.
-- -------------------------------------------------------------
-- Labour
SELECT
    'Labour'        AS line_type,
    s.name          AS description,
    os.quantity,
    os.unit_price   AS unit_value,
    os.quantity * os.unit_price AS subtotal
FROM order_service os
JOIN service s ON s.service_id = os.service_id
WHERE os.order_id = 4

UNION ALL

-- Parts
SELECT
    'Part'          AS line_type,
    p.name          AS description,
    op.quantity,
    op.unit_cost    AS unit_value,
    op.quantity * op.unit_cost AS subtotal
FROM order_part op
JOIN part p ON p.part_id = op.part_id
WHERE op.order_id = 4

ORDER BY line_type, description;


-- -------------------------------------------------------------
--  Q4: Revenue by employee — closed orders only
-- -------------------------------------------------------------
SELECT
    e.name               AS employee,
    e.role,
    COUNT(so.order_id)   AS closed_orders,
    SUM(so.total)        AS total_revenue
FROM employee      e
JOIN service_order so ON so.employee_id = e.employee_id
WHERE so.status = 'CLOSED'
GROUP BY e.employee_id, e.name, e.role
ORDER BY total_revenue DESC;


-- -------------------------------------------------------------
--  Q5: Most used parts across all orders
-- -------------------------------------------------------------
SELECT
    p.code,
    p.name              AS part,
    SUM(op.quantity)    AS total_used,
    SUM(op.quantity * op.unit_cost) AS total_cost
FROM order_part op
JOIN part p ON p.part_id = op.part_id
GROUP BY p.part_id, p.code, p.name
ORDER BY total_used DESC;


-- -------------------------------------------------------------
--  Q6: Parts with low stock (less than 15 units)
-- -------------------------------------------------------------
SELECT
    p.code,
    p.name,
    p.stock_qty,
    s.name AS supplier,
    s.phone
FROM part     p
JOIN supplier s ON s.supplier_id = p.supplier_id
WHERE p.stock_qty < 15
ORDER BY p.stock_qty;


-- -------------------------------------------------------------
--  Q7: Service history for a specific vehicle (plate BCA-1234)
-- -------------------------------------------------------------
SELECT
    so.order_id,
    so.open_date,
    so.close_date,
    so.status,
    e.name      AS mechanic,
    so.notes,
    so.total
FROM service_order so
JOIN vehicle  v ON v.vehicle_id  = so.vehicle_id
JOIN employee e ON e.employee_id = so.employee_id
WHERE v.plate = 'BCA-1234'
ORDER BY so.open_date;


-- -------------------------------------------------------------
--  Q8: Monthly revenue — closed orders grouped by month
-- -------------------------------------------------------------
SELECT
    DATE_FORMAT(close_date, '%Y-%m') AS month,
    COUNT(*) AS orders_closed,
    SUM(total) AS revenue
FROM service_order
WHERE status = 'CLOSED'
  AND close_date IS NOT NULL
GROUP BY DATE_FORMAT(close_date, '%Y-%m')
ORDER BY DATE_FORMAT(close_date, '%Y-%m');


-- -------------------------------------------------------------
--  Q9: Customers with more than one vehicle registered
-- -------------------------------------------------------------
SELECT
    c.name          AS customer,
    c.phone,
    COUNT(v.vehicle_id) AS vehicle_count,
    GROUP_CONCAT(CONCAT(v.brand, ' ', v.model, ' (', v.plate, ')') SEPARATOR ', ') as vehicles
FROM customer c
JOIN vehicle  v ON v.customer_id = c.customer_id
GROUP BY c.customer_id, c.name, c.phone
HAVING COUNT(v.vehicle_id) > 1
ORDER BY vehicle_count DESC;


-- -------------------------------------------------------------
--  Q10: Average order value and total revenue overall
-- -------------------------------------------------------------
SELECT
    COUNT(*) AS total_orders,
    SUM(CASE WHEN status = 'CLOSED' THEN 1 ELSE 0 END) AS closed_orders,
    ROUND(AVG(total), 2) AS avg_order_value,
    SUM(total) AS gross_revenue,
    SUM(CASE WHEN status = 'CLOSED' THEN total ELSE 0 END) AS settled_revenue
FROM service_order;
