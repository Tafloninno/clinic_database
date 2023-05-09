CREATE TABLE IF NOT EXISTS public.invoices
(
    id integer NOT NULL,
    total_amount numeric,
    generated_at timestamp with time zone,
    payed_at time with time zone,
    medical_history_id integer NOT NULL,
    CONSTRAINT invoices_pkey PRIMARY KEY (id, medical_history_id)
)
CREATE TABLE IF NOT EXISTS public.invoice_items
(
    id integer NOT NULL,
    unit_price numeric,
    quantity integer,
    total_price numeric,
    invoice_id integer,
    treatment_id integer,
    CONSTRAINT invoice_items_pkey PRIMARY KEY (id)
)
CREATE TABLE IF NOT EXISTS public.medical_histories
(
    id integer NOT NULL,
    admitted_at timestamp with time zone,
    patient_id integer,
    status character varying COLLATE pg_catalog."default",
    CONSTRAINT medical_histories_pkey PRIMARY KEY (id)
)
CREATE TABLE IF NOT EXISTS public.patients
(
    id integer NOT NULL,
    name character varying COLLATE pg_catalog."default",
    date_of_birth date,
    CONSTRAINT patients_pkey PRIMARY KEY (id)
)
CREATE TABLE IF NOT EXISTS public.treatments
(
    id integer NOT NULL,
    type character varying COLLATE pg_catalog."default",
    name character varying COLLATE pg_catalog."default",
    CONSTRAINT treatments_pkey PRIMARY KEY (id)
)