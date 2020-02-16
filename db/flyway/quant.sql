-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1-beta
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.com.br
-- Model Author: ---


CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: quant | type: DATABASE --
-- -- DROP DATABASE IF EXISTS quant;
-- CREATE DATABASE quant
-- 	ENCODING = 'UTF8'
-- 	LC_COLLATE = 'en_US.UTF-8'
-- 	LC_CTYPE = 'en_US.UTF-8'
-- 	TABLESPACE = pg_default
-- 	OWNER = postgres
-- ;
-- -- ddl-end --
-- 

-- object: public.instrument | type: TABLE --
DROP TABLE IF EXISTS public.instrument CASCADE;
CREATE TABLE public.instrument(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	symbol varchar(20),
	cusip varchar(70) NOT NULL,
	description text,
	exchange varchar(21) NOT NULL,
	type varchar(21),
	CONSTRAINT "PK_INSTRUMENT_ID" PRIMARY KEY (id),
	CONSTRAINT "UK_CUSIP" UNIQUE (cusip)
);

-- object: public.quote | type: TABLE --
DROP TABLE IF EXISTS public.quote CASCADE;
CREATE TABLE public.quote(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	instrument_id uuid NOT NULL,
	"bidPrice" numeric DEFAULT 0,
	"bidSize" integer DEFAULT 0,
	"bidId" varchar(3),
	"askPrice" numeric DEFAULT 0,
	"askSize" integer DEFAULT 0,
	"askId" varchar(3),
	"lastPrice" numeric DEFAULT 0,
	"lastSize" integer DEFAULT 0,
	"lastId" varchar(3),
	"totalVolume" integer DEFAULT 0,
	"quoteTime" timestamp,
	CONSTRAINT "PK_QUOTE_ID" PRIMARY KEY (id),
    CONSTRAINT "FK_INSTRUMENT_ID" FOREIGN KEY (instrument_id) REFERENCES public.instrument (id) MATCH FULL ON DELETE NO ACTION ON UPDATE NO ACTION
);

INSERT INTO public.instrument ( symbol, cusip, description, exchange, type ) VALUES
( 'TEST', 'test_cusip', 'test_description', 'test_exchange', 'test_asset_type'  );
-- ddl-end --
