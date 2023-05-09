DROP DATABASE IF EXISTS clinic;
CREATE DATABASE clinic;
\c clinic

CREATE TABLE patients
(
    id integer GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    date_of_birth date,
    PRIMARY KEY(id)
);

CREATE TABLE medical_histories
(
    id integer GENERATED ALWAYS AS IDENTITY,
    admitted_at timestamp with time zone,
    patient_id integer,
    status varchar(100),
    PRIMARY KEY(id),
    CONSTRAINT patient_constraint
        FOREIGN KEY (patient_id)
        REFERENCES patients (id)
);

CREATE TABLE invoices
(
    id integer GENERATED ALWAYS AS IDENTITY,
    total_amount integer,
    generated_at timestamp with time zone,
    payed_at timestamp with time zone,
    medical_history_id integer,
    PRIMARY KEY(id),
    CONSTRAINT medical_history_constraint
        FOREIGN KEY (medical_history_id)
        REFERENCES medical_histories (id)
);

CREATE TABLE IF NOT EXISTS treatments
(
    id integer GENERATED ALWAYS AS IDENTITY,
    type varchar(100),
    name varchar(100),
    PRIMARY KEY(id)
);

CREATE TABLE invoice_items
(
    id integer GENERATED ALWAYS AS IDENTITY,
    unit_price decimal,
    quantity integer,
    total_price decimal,
    invoice_id integer,
    treatment_id integer,
    PRIMARY KEY(id),
    CONSTRAINT invoice_constraint
        FOREIGN KEY (invoice_id)
        REFERENCES invoices (id),
    CONSTRAINT treatment_constraint
        FOREIGN KEY (treatment_id)
        REFERENCES treatments (id)
);

-- Join table for medical hostories and treatments
-- many-to-many relationship
CREATE TABLE medical_histories_and_treatments
(
    medical_history_id integer,
    treatment_id integer,
    PRIMARY KEY(medical_history_id, treatment_id)
);

CREATE INDEX patient_id_asc ON medical_histories(patient_id ASC);
CREATE INDEX medical_history_id_asc ON invoices(medical_history_id ASC);
CREATE INDEX invoice_id_asc ON invoice_items(invoice_id ASC);
CREATE INDEX treatment_id_asc ON invoice_items(treatment_id ASC);
