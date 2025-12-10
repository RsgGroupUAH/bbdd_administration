drop table if EXISTS user_role cascade;
drop table if EXISTS usuario cascade;
drop table if EXISTS navbar cascade;
drop table if EXISTS role_navbar cascade;
drop table if EXISTS articles;
drop table if EXISTS journals;
drop table if EXISTS projects;
drop table if EXISTS tasks;
drop table if EXISTS tasks_user;
drop table if EXISTS user_notifications;
drop table if EXISTS notifications;
drop table if EXISTS status_actions;
drop table if EXISTS works;
drop table if EXISTS computers;
drop table if EXISTS softwares;
drop table if EXISTS signal_devices;
drop table if EXISTS material_devices;



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
    imagePath text NOT NULL DEFAULT 'NO-USER.png',
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


CREATE SEQUENCE IF NOT EXISTS public.journals_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.journals_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.journals
(
    id integer NOT NULL DEFAULT nextval('journals_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    name text NOT NULL,
    quartil text NOT NULL,
	CONSTRAINT journals_pkey PRIMARY KEY (id),
	CONSTRAINT unique_journals_uuid UNIQUE (uuid),
	CONSTRAINT unique_journals_title UNIQUE (name)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.journals     OWNER to postgres;

ALTER SEQUENCE IF EXISTS journals_id_seq OWNED BY journals.id;


CREATE INDEX IF NOT EXISTS journals_idx_uuid
    ON public.journals USING btree
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
    publishYear text NOT NULL,
    id_journal int,
	CONSTRAINT articles_pkey PRIMARY KEY (id),
	CONSTRAINT unique_articles_uuid UNIQUE (uuid),
	CONSTRAINT unique_articles_title UNIQUE (title),
    CONSTRAINT articles_id_journal_fkey FOREIGN KEY (id_journal)
        REFERENCES public.journals (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
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


-- ------------------------------------------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.status_actions_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.status_actions_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.status_actions
(
    id integer NOT NULL DEFAULT nextval('status_actions_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    status text NOT NULL,
    uuid_action text NOT NULL,
    uuid_user text NOT NULL,
    table_action text NOT NULL,
	CONSTRAINT status_actions_pkey PRIMARY KEY (id),
	CONSTRAINT unique_status_actions_uuid UNIQUE (uuid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.status_actions     OWNER to postgres;

ALTER SEQUENCE IF EXISTS status_actions_id_seq OWNED BY status_actions.id;


CREATE INDEX IF NOT EXISTS status_actions_idx_uuid
    ON public.status_actions USING btree
    (uuid)
    TABLESPACE pg_default;


-- -------------------------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.projects_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.projects_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.projects
(
    id integer NOT NULL DEFAULT nextval('projects_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    title text NOT NULL,
    ref text NOT NULL,
    authors text NOT NULL,
    finance text NOT NULL,
    type text NOT NULL,
    startDate text NOT NULL,
    endDate text NOT NULL,
	CONSTRAINT projects_pkey PRIMARY KEY (id),
	CONSTRAINT unique_projects_uuid UNIQUE (uuid),
	CONSTRAINT unique_projects_title UNIQUE (title)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.projects     OWNER to postgres;

ALTER SEQUENCE IF EXISTS projects_id_seq OWNED BY projects.id;


CREATE INDEX IF NOT EXISTS projects_idx_uuid
    ON public.projects USING btree
    (uuid)
    TABLESPACE pg_default;


-- -----------------------------------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.tasks_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.tasks_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.tasks
(
    id integer NOT NULL DEFAULT nextval('tasks_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    title text NOT NULL,
    message text,
    status text NOT NULL,
    priority text NOT NULL,
    limitDate text,
	CONSTRAINT tasks_pkey PRIMARY KEY (id),
	CONSTRAINT unique_tasks_uuid UNIQUE (uuid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tasks     OWNER to postgres;

ALTER SEQUENCE IF EXISTS tasks_id_seq OWNED BY tasks.id;


CREATE INDEX IF NOT EXISTS tasks_idx_uuid
    ON public.tasks USING btree
    (uuid)
    TABLESPACE pg_default;


-- ------------------------------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.tasks_user_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.tasks_user_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.tasks_user
(
    id integer NOT NULL DEFAULT nextval('tasks_user_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    id_user int NOT NULL,
    id_task int NOT NULL,
	CONSTRAINT tasks_user_pkey PRIMARY KEY (id),
	CONSTRAINT unique_tasks_user_uuid UNIQUE (uuid),
    CONSTRAINT tasks_user_id_user_fkey FOREIGN KEY (id_user)
        REFERENCES public.usuario (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT navbar_role_id_task_fkey FOREIGN KEY (id_task)
        REFERENCES public.tasks (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.tasks_user     OWNER to postgres;

ALTER SEQUENCE IF EXISTS tasks_user_id_seq OWNED BY tasks_user.id;


CREATE INDEX IF NOT EXISTS tasks_user_idx_uuid
    ON public.tasks_user USING btree
    (uuid)
    TABLESPACE pg_default;


-- -------------------------------------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.works_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.works_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.works
(
    id integer NOT NULL DEFAULT nextval('works_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    title text NOT NULL,
    student text NOT NULL,
    teacher text NOT NULL,
    yearPresentation text NOT NULL,
    type text NOT NULL,
    status text NOT NULL,
    career text,
	CONSTRAINT works_pkey PRIMARY KEY (id),
	CONSTRAINT unique_works_uuid UNIQUE (uuid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.works     OWNER to postgres;

ALTER SEQUENCE IF EXISTS works_id_seq OWNED BY works.id;


CREATE INDEX IF NOT EXISTS works_idx_uuid
    ON public.works USING btree
    (uuid)
    TABLESPACE pg_default;


-- --------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.computers_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.computers_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.computers
(
    id integer NOT NULL DEFAULT nextval('computers_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    name text NOT NULL,
    adminUser TEXT NOT NULL,
    adminPassword text NOT NULL,
    ipAddress text,
    remote BOOLEAN DEFAULT FALSE,
    haveStudent BOOLEAN DEFAULT FALSE,
    studentName TEXT,
    studentUser TEXT,
    studentPassword TEXT,
    so TEXT NOT NULL,
    location TEXT NOT NULL,
	CONSTRAINT computers_pkey PRIMARY KEY (id),
	CONSTRAINT unique_computers_uuid UNIQUE (uuid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.computers     OWNER to postgres;

ALTER SEQUENCE IF EXISTS computers_id_seq OWNED BY computers.id;


CREATE INDEX IF NOT EXISTS computers_idx_uuid
    ON public.computers USING btree
    (uuid)
    TABLESPACE pg_default;


-- --------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.softwares_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.softwares_id_seq     OWNER TO postgres;
CREATE TABLE IF NOT EXISTS public.softwares
(
    id integer NOT NULL DEFAULT nextval('softwares_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    name text NOT NULL,
    location text NOT NULL,
    description TEXT,
	CONSTRAINT softwares_pkey PRIMARY KEY (id),
	CONSTRAINT unique_softwares_uuid UNIQUE (uuid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.softwares     OWNER to postgres;

ALTER SEQUENCE IF EXISTS softwares_id_seq OWNED BY softwares.id;


CREATE INDEX IF NOT EXISTS softwares_idx_uuid
    ON public.softwares USING btree
    (uuid)
    TABLESPACE pg_default;


-- --------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.signal_devices_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.signal_devices_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.signal_devices
(
    id integer NOT NULL DEFAULT nextval('signal_devices_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    brand text,
    name TEXT Not NULL,
    type Text NOT NULL,
    freq_start text,
    freq_stop text,
    polarization text,
    visaAddress text,
    conexionType text,
    location TEXT NOT NULL,
	CONSTRAINT signal_devices_pkey PRIMARY KEY (id),
	CONSTRAINT unique_signal_devices_uuid UNIQUE (uuid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.signal_devices     OWNER to postgres;

ALTER SEQUENCE IF EXISTS signal_devices_id_seq OWNED BY signal_devices.id;


CREATE INDEX IF NOT EXISTS signal_devices_idx_uuid
    ON public.signal_devices USING btree
    (uuid)
    TABLESPACE pg_default;


-- --------------------------------------------------------------------


CREATE SEQUENCE IF NOT EXISTS public.material_devices_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.material_devices_id_seq     OWNER TO postgres;


CREATE TABLE IF NOT EXISTS public.material_devices 
(
    id integer NOT NULL DEFAULT nextval('material_devices_id_seq'::regclass),
    uuid text COLLATE pg_catalog."default" NOT NULL,
    creationDate text NOT NULL,
    modificationDate text NOT NULL,
    deletedDate text,
    brand text,
    name TEXT NOT NULL,
    type text NOT NULL,
    use text NOT NULL,
    location TEXT NOT NULL,
	CONSTRAINT material_devices_pkey PRIMARY KEY (id),
	CONSTRAINT unique_material_devices_uuid UNIQUE (uuid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.material_devices     OWNER to postgres;

ALTER SEQUENCE IF EXISTS material_devices_id_seq OWNED BY material_devices.id;


CREATE INDEX IF NOT EXISTS material_devices_idx_uuid
    ON public.material_devices USING btree
    (uuid)
    TABLESPACE pg_default;