-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.1-beta
-- PostgreSQL version: 10.0
-- Project Site: pgmodeler.com.br
-- Model Author: ---


-- Database creation must be done outside an multicommand file.
-- These commands were put in this file only for convenience.
-- -- object: avenger | type: DATABASE --
-- -- DROP DATABASE IF EXISTS avenger;
-- CREATE DATABASE avenger
-- 	OWNER = postgres
-- ;
-- -- ddl-end --
-- 

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- object: public.candidate | type: TABLE --
-- DROP TABLE IF EXISTS public.candidate CASCADE;
CREATE TABLE public.candidate(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	first_name varchar(65) NOT NULL,
	middle_initial varchar(4),
	last_name varchar(65) NOT NULL,
	email varchar(120) NOT NULL,
    created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated timestamp,
	CONSTRAINT "PK_CANDIDATE_ID" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.candidate OWNER TO postgres;
-- ddl-end --

-- object: "IDX_CANDIDATE_ID" | type: INDEX --
-- DROP INDEX IF EXISTS public."IDX_CANDIDATE_ID" CASCADE;
CREATE UNIQUE INDEX  CONCURRENTLY "IDX_CANDIDATE_ID" ON public.candidate
	USING btree
	(
	  id
	);
-- ddl-end --

INSERT INTO public.candidate (
    first_name,
    middle_initial,
    last_name,
    email
)
VALUES
(
    'John',
    'S',
    'Doe',
    'john.doe@candidate.com'
),
(
    'Jane',
    'K',
    'smith',
    'jane.smith@candidate.com'
);
-- object: public."position" | type: TABLE --
-- DROP TABLE IF EXISTS public."position" CASCADE;
CREATE TABLE public."position"(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	title varchar(25) NOT NULL,
	description text NOT NULL,
    created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated timestamp,
	CONSTRAINT "PK_POSITION_ID" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public."position" OWNER TO postgres;
-- ddl-end --

-- object: "IDX_POSITION_ID" | type: INDEX --
-- DROP INDEX IF EXISTS public."IDX_POSITION_ID" CASCADE;
CREATE UNIQUE INDEX  CONCURRENTLY "IDX_POSITION_ID" ON public."position"
	USING btree
	(
	  id
	);
-- ddl-end --

-- object: public.interview | type: TABLE --
-- DROP TABLE IF EXISTS public.interview CASCADE;
CREATE TABLE public.interview(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	candidate_id uuid NOT NULL,
	position_id uuid NOT NULL,
    created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated timestamp,
	CONSTRAINT "PK_INTERVIEW_ID" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.interview OWNER TO postgres;
-- ddl-end --

-- object: public.question | type: TABLE --
-- DROP TABLE IF EXISTS public.question CASCADE;
CREATE TABLE public.question(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	text text NOT NULL,
    created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated timestamp,
	CONSTRAINT "PK_QUESTION_ID" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.question OWNER TO postgres;
-- ddl-end --

-- object: public.postgres | type: TABLE --
-- DROP TABLE IF EXISTS public.postgres CASCADE;
CREATE TABLE public.postgres(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	interview_id uuid NOT NULL,
	question_id uuid NOT NULL,
	response text,
	confirmed_response text,
	status varchar(25),
    created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated timestamp,
	CONSTRAINT "PK_ANSWER_ID" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.postgres OWNER TO postgres;
-- ddl-end --

-- object: "IDX_ANSWER_ID" | type: INDEX --
-- DROP INDEX IF EXISTS public."IDX_ANSWER_ID" CASCADE;
CREATE UNIQUE INDEX  CONCURRENTLY "IDX_ANSWER_ID" ON public.postgres
	USING btree
	(
	  id
	);
-- ddl-end --

-- object: "IDX_QUESTION_ID" | type: INDEX --
-- DROP INDEX IF EXISTS public."IDX_QUESTION_ID" CASCADE;
CREATE UNIQUE INDEX  CONCURRENTLY "IDX_QUESTION_ID" ON public.question
	USING btree
	(
	  id
	);
-- ddl-end --

-- object: public.pos_quest | type: TABLE --
-- DROP TABLE IF EXISTS public.pos_quest CASCADE;
CREATE TABLE public.pos_quest(
	id uuid NOT NULL DEFAULT uuid_generate_v4(),
	position_id uuid NOT NULL,
	question_id uuid NOT NULL,
    created timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated timestamp,
	CONSTRAINT "PK_POS_QUEST_ID" PRIMARY KEY (id)

);
-- ddl-end --
ALTER TABLE public.pos_quest OWNER TO postgres;
-- ddl-end --

-- object: "FK_CANDIDATE_ID" | type: CONSTRAINT --
-- ALTER TABLE public.interview DROP CONSTRAINT IF EXISTS "FK_CANDIDATE_ID" CASCADE;
ALTER TABLE public.interview ADD CONSTRAINT "FK_CANDIDATE_ID" FOREIGN KEY (candidate_id)
REFERENCES public.candidate (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "FK_POSITION_ID" | type: CONSTRAINT --
-- ALTER TABLE public.interview DROP CONSTRAINT IF EXISTS "FK_POSITION_ID" CASCADE;
ALTER TABLE public.interview ADD CONSTRAINT "FK_POSITION_ID" FOREIGN KEY (position_id)
REFERENCES public."position" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "FK_INTERVIEW_ID" | type: CONSTRAINT --
-- ALTER TABLE public.postgres DROP CONSTRAINT IF EXISTS "FK_INTERVIEW_ID" CASCADE;
ALTER TABLE public.postgres ADD CONSTRAINT "FK_INTERVIEW_ID" FOREIGN KEY (interview_id)
REFERENCES public.interview (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "FK_QUESTION_ID" | type: CONSTRAINT --
-- ALTER TABLE public.postgres DROP CONSTRAINT IF EXISTS "FK_QUESTION_ID" CASCADE;
ALTER TABLE public.postgres ADD CONSTRAINT "FK_QUESTION_ID" FOREIGN KEY (question_id)
REFERENCES public.question (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "FK_POS_ID" | type: CONSTRAINT --
-- ALTER TABLE public.pos_quest DROP CONSTRAINT IF EXISTS "FK_POS_ID" CASCADE;
ALTER TABLE public.pos_quest ADD CONSTRAINT "FK_POS_ID" FOREIGN KEY (position_id)
REFERENCES public."position" (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: "FK_QUEST_ID" | type: CONSTRAINT --
-- ALTER TABLE public.pos_quest DROP CONSTRAINT IF EXISTS "FK_QUEST_ID" CASCADE;
ALTER TABLE public.pos_quest ADD CONSTRAINT "FK_QUEST_ID" FOREIGN KEY (question_id)
REFERENCES public.question (id) MATCH FULL
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --
