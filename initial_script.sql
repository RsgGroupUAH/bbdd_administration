drop table if EXISTS user_role cascade;
drop table if EXISTS usuario cascade;
drop table if EXISTS navbar cascade;
drop table if EXISTS role_navbar cascade;
drop table if EXISTS articles;
drop table if EXISTS notifications;
drop table if EXISTS user_notifications;



CREATE SEQUENCE IF NOT EXISTS public.user_role_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.user_role_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.user_role
(
    id integer NOT NULL DEFAULT nextval('user_role_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    name text NOT NULL,
	CONSTRAINT user_role_pkey PRIMARY KEY (id),
	CONSTRAINT unique_user_role_uuid UNIQUE (uuid),
	CONSTRAINT unique_user_role_name UNIQUE (name)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.user_role     OWNER to postgres;

ALTER SEQUENCE IF EXISTS user_role_id_seq OWNED BY user_role.id;


CREATE INDEX IF NOT EXISTS user_role_idx_uuid
    ON public.user_role USING btree
    (uuid)
    TABLESPACE pg_default;


-- --------------------------------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.usuario_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.usuario_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.usuario
(
    id integer NOT NULL DEFAULT nextval('usuario_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    fullName text NOT NULL,
    phone text,
    email text NOT NULL,
    password text NOT NULL,
    sessionToken text,
    sessionDate text,
    id_role int NOT NULL,
	CONSTRAINT usuario_pkey PRIMARY KEY (id),
	CONSTRAINT unique_usuario_uuid UNIQUE (uuid),
	CONSTRAINT unique_usuario_email UNIQUE (email),
    CONSTRAINT usuario_id_role_fkey FOREIGN KEY (id_role)
        REFERENCES public.user_role (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.usuario     OWNER to postgres;

ALTER SEQUENCE IF EXISTS usuario_id_seq OWNED BY usuario.id;


CREATE INDEX IF NOT EXISTS usuario_idx_uuid
    ON public.usuario USING btree
    (uuid)
    TABLESPACE pg_default;


-- ----------------------------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.navbar_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.navbar_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.navbar
(
    id integer NOT NULL DEFAULT nextval('navbar_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    code text NOT NULL,
    title text NOT NULL,
	CONSTRAINT navbar_pkey PRIMARY KEY (id),
	CONSTRAINT unique_navbar_uuid UNIQUE (uuid),
	CONSTRAINT unique_navbar_code UNIQUE (code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.navbar     OWNER to postgres;

ALTER SEQUENCE IF EXISTS navbar_id_seq OWNED BY navbar.id;


CREATE INDEX IF NOT EXISTS navbar_idx_uuid
    ON public.navbar USING btree
    (uuid)
    TABLESPACE pg_default;


-- ---------------------------------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.role_navbar_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.role_navbar_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.role_navbar
(
    id integer NOT NULL DEFAULT nextval('role_navbar_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    id_navbar int NOT NULL,
    id_role int NOT NULL,
	CONSTRAINT role_navbar_pkey PRIMARY KEY (id),
	CONSTRAINT unique_role_navbar_uuid UNIQUE (uuid),
    CONSTRAINT role_navbar_id_role_fkey FOREIGN KEY (id_role)
        REFERENCES public.user_role (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT navbar_role_id_navbar_fkey FOREIGN KEY (id_navbar)
        REFERENCES public.navbar (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.role_navbar     OWNER to postgres;

ALTER SEQUENCE IF EXISTS role_navbar_id_seq OWNED BY role_navbar.id;


CREATE INDEX IF NOT EXISTS role_navbar_idx_uuid
    ON public.role_navbar USING btree
    (uuid)
    TABLESPACE pg_default;


-- ---------------------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.articles_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.articles_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.articles
(
    id integer NOT NULL DEFAULT nextval('articles_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    title text NOT NULL,
    doi text,
    authors text NOT NULL,
    url_github text,
    type text NOT NULL,
    cites integer,
    journal text,
    publishYear text NOT NULL,
	CONSTRAINT articles_pkey PRIMARY KEY (id),
	CONSTRAINT unique_articles_uuid UNIQUE (uuid),
	CONSTRAINT unique_articles_title UNIQUE (title)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.articles     OWNER to postgres;

ALTER SEQUENCE IF EXISTS articles_id_seq OWNED BY articles.id;


CREATE INDEX IF NOT EXISTS articles_idx_uuid
    ON public.articles USING btree
    (uuid)
    TABLESPACE pg_default;


-- --------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.notifications_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.notifications_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.notifications
(
    id integer NOT NULL DEFAULT nextval('notifications_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    priority text NOT NULL,
    title text NOT NULL,
    message text NOT NULL,
	CONSTRAINT notifications_pkey PRIMARY KEY (id),
	CONSTRAINT unique_notifications_uuid UNIQUE (uuid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.notifications     OWNER to postgres;

ALTER SEQUENCE IF EXISTS notifications_id_seq OWNED BY notifications.id;


CREATE INDEX IF NOT EXISTS notifications_idx_uuid
    ON public.notifications USING btree
    (uuid)
    TABLESPACE pg_default;


-- ------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.user_notifications_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.user_notifications_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.user_notifications
(
    id integer NOT NULL DEFAULT nextval('user_notifications_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    id_notification int NOT NULL,
    id_user int NOT NULL,
	CONSTRAINT user_notifications_pkey PRIMARY KEY (id),
	CONSTRAINT unique_user_notifications_uuid UNIQUE (uuid),
    CONSTRAINT user_notifications_id_user_fkey FOREIGN KEY (id_user)
        REFERENCES public.usuario (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT user_notifications_id_notification_fkey FOREIGN KEY (id_notification)
        REFERENCES public.notifications (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.user_notifications     OWNER to postgres;

ALTER SEQUENCE IF EXISTS user_notifications_id_seq OWNED BY user_notifications.id;


CREATE INDEX IF NOT EXISTS user_notifications_idx_uuid
    ON public.user_notifications USING btree
    (uuid)
    TABLESPACE pg_default;