truncate user_role cascade;
truncate usuario cascade;

-- User Role

INSERT INTO public.user_role (uuid, creationDate, modificationDate, deletedDate, name) VALUES ('e1b6c0a0-c439-4103-b447-a700edd23507', now(), now(), null, 'Administrador');

-- User

INSERT INTO public.usuario (uuid, creationDate, modificationDate, deletedDate, fullName, phone, email, password, sessionToken, sessionDate, id_role) SELECT 'c90fc766-db1a-4265-ba24-01eb3b7247c2', now(), now(), null, 'Ivan Recio', '644 45 32 91', 'ivan.recio@uah.es', 'HolaBuenas', null, null, r.id from user_role r where r.name = 'Administrador';

-- Navbars

INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('ab13e77b-5dcf-4cc8-ba00-3397c49604dc', now(), now(), null, 'DASH', 'Dashboards');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('188fba85-bd13-47cd-9944-fa789846df57', now(), now(), null, 'LABS', 'Laboratorios');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('09abc513-78b2-4052-bc1d-9ff2b42ce121', now(), now(), null, 'USER', 'Usuarios');

-- Role_Navbar

INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT '61c4fe14-a3ec-4bdd-8e4f-0984d484a304', now(), now(), NULL, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'DASH' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT 'f2f7a877-6d80-4335-9c24-788405e4fd81', now(), now(), NULL, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'LABS' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT 'bc5622d2-3439-4206-85e3-d20c37d37801', now(), now(), NULL, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'USER' AND r.name = 'Administrador';
