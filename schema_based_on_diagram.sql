CREATE TABLE IF NOT EXISTS invoices
(
    id integer GENERATED ALWAYS AS IDENTITY,
    total_amount integer,
    generated_at timestamp with time zone,
    payed_at timestamp with time zone,
    medical_history_id integer
)

CREATE TABLE IF NOT EXISTS invoice_items
(
    id integer GENERATED ALWAYS AS IDENTITY,
    unit_price decimal,
    quantity integer,
    total_price decimal,
    invoice_id integer,
    treatment_id integer
)

CREATE TABLE IF NOT EXISTS medical_histories
(
    id integer GENERATED ALWAYS AS IDENTITY,
    admitted_at timestamp with time zone,
    patient_id integer,
    status varchar(100)
)

CREATE TABLE IF NOT EXISTS patients
(
    id integer GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date
)

CREATE TABLE IF NOT EXISTS treatments
(
    id integer GENERATED ALWAYS AS IDENTITY,
    type varchar(100),
    name varchar(100)
)
