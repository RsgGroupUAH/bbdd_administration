truncate user_role cascade;
truncate usuario cascade;
truncate navbar cascade;
truncate role_navbar cascade;
truncate articles cascade;
truncate notifications cascade;
truncate user_notifications cascade;
truncate projects cascade;
truncate tasks_user cascade;
truncate tasks cascade;


-- User Role

INSERT INTO public.user_role (uuid, creationDate, modificationDate, deletedDate, name) VALUES ('e1b6c0a0-c439-4103-b447-a700edd23507', now(), now(), null, 'Administrador');

-- User

INSERT INTO public.usuario (uuid, creationDate, modificationDate, deletedDate, fullName, phone, email, password, imagePath, sessionToken, sessionDate, id_role) SELECT 'c90fc766-db1a-4265-ba24-01eb3b7247c2', now(), now(), null, 'Ivan Recio', '644 45 32 91', 'ivan.recio@uah.es', '8869c155849c775743ab9ee1ff8f346fa26d89fa8f74cc97fbb422cede6875b95723891c21c6b996836550d43f2ba5146a30961609f5d14c07244244f05e74b0', 'IVAN-RECIO.jpg', null, null, r.id from user_role r where r.name = 'Administrador';

INSERT INTO public.usuario (uuid, creationDate, modificationDate, deletedDate, fullName, phone, email, password, imagepath, sessionToken, sessionDate, id_role) SELECT '79b29c7d-7c09-4b79-9cbb-3d5a3a56fa00', now(), now(), null, 'Jorge Guillén', '644 45 32 91', 'jorge.guillenp@uah.es', '8869c155849c775743ab9ee1ff8f346fa26d89fa8f74cc97fbb422cede6875b95723891c21c6b996836550d43f2ba5146a30961609f5d14c07244244f05e74b0', 'JORGE-GUILLEN.jpg', null, null, r.id from user_role r where r.name = 'Administrador';

INSERT INTO public.usuario (uuid, creationDate, modificationDate, deletedDate, fullName, phone, email, password, imagepath, sessionToken, sessionDate, id_role) SELECT '93c73d47-5df7-4bfb-8925-925a458f1254', now(), now(), null, 'María Samper', '644 45 32 91', 'maria.samper@uah.es', '8869c155849c775743ab9ee1ff8f346fa26d89fa8f74cc97fbb422cede6875b95723891c21c6b996836550d43f2ba5146a30961609f5d14c07244244f05e74b0', 'MARIA-SAMPER.jpg', null, null, r.id from user_role r where r.name = 'Administrador';

INSERT INTO public.usuario (uuid, creationDate, modificationDate, deletedDate, fullName, phone, email, password, imagepath, sessionToken, sessionDate, id_role) SELECT '38eea687-c52d-442f-8b14-677e98f8aacb', now(), now(), null, 'Ricardo Chocano', '644 45 32 91', 'ricardo.chocano@uah.es', '8869c155849c775743ab9ee1ff8f346fa26d89fa8f74cc97fbb422cede6875b95723891c21c6b996836550d43f2ba5146a30961609f5d14c07244244f05e74b0', 'NO-USER.png', null, null, r.id from user_role r where r.name = 'Administrador';

-- Navbars

INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('ab13e77b-5dcf-4cc8-ba00-3397c49604dc', now(), now(), null, 'DASH', 'Dashboards');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('188fba85-bd13-47cd-9944-fa789846df57', now(), now(), null, 'LABS', 'Laboratorios');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('54b726f0-8229-4df0-ae34-09e03b0b517f', now(), now(), null, 'GEO', 'Geoportal');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('82eb8aab-8bda-4f6e-8183-159402acdb82', now(), now(), null, 'ART', 'Artículos');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('be22634a-7a80-4376-b389-91e752025485', now(), now(), null, 'JOU', 'Revistas');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('a2d74875-7186-4abe-8af1-300dd4c7d7f2', now(), now(), null, 'PRO', 'Proyectos');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('4109bc2a-52bb-4418-b757-ae6f2b31c7d5', now(), now(), null, 'WORK', 'Trabajos');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('5762cbfa-8def-4920-9087-236fa58acf5f', now(), now(), null, 'TASK', 'Lista de Tareas');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('09abc513-78b2-4052-bc1d-9ff2b42ce121', now(), now(), null, 'USER', 'Usuarios');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES (gen_random_uuid(), now(), now(), null, 'NOTI', 'Notificaciones');

-- Role_Navbar

INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT '61c4fe14-a3ec-4bdd-8e4f-0984d484a304', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'DASH' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT 'f2f7a877-6d80-4335-9c24-788405e4fd81', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'LABS' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT 'a73a2fe5-7b47-4cb5-90e5-f2e6912c0ac4', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'GEO' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT '92842523-8589-4db9-9761-bfbfb806b483', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'ART' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT '0e656e11-21f9-4491-8e62-e03c9b594b1e', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'JOU' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT '444273f0-19d1-43a4-b707-6907bed71603', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'PRO' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT '1240320f-ebe8-4024-a3f7-62e8b17ab8a0', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'WORK' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT 'ed933d9c-494d-462e-91ec-6c0438c42a7a', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'TASK' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT 'bc5622d2-3439-4206-85e3-d20c37d37801', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'USER' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT gen_random_uuid(), now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'NOTI' AND r.name = 'Administrador';

-- Journals 

INSERT INTO public.journals (uuid, creationDate, modificationDate, deletedDate, name, quartil) VALUES

(gen_random_uuid(), now(), now(), null, 'Environmental Research', 'Q1'),

(gen_random_uuid(), now(), now(), null, 'Applied Computational Electromagnetics Society Journal (ACES)', 'Q3'),

(gen_random_uuid(), now(), now(), null, 'Environmental Impact Assessment Review', 'Q1'),

(gen_random_uuid(), now(), now(), null, 'Electronics', 'Q2'),

(gen_random_uuid(), now(), now(), null, 'Systems Engineering', 'Q3'),

(gen_random_uuid(), now(), now(), null, 'Sensors', 'Q1'),

(gen_random_uuid(), now(), now(), null, 'IEEE Transactions on Nanotechnology', 'Q2'),

(gen_random_uuid(), now(), now(), null, 'Applied Sciences', 'Q2'),

(gen_random_uuid(), now(), now(), null, 'International Journal of Applied Electromagnetics and Mechanics', 'Q4'),

(gen_random_uuid(), now(), now(), null, 'Maderas: Ciencia y Tecnologia', 'Q2'),

(gen_random_uuid(), now(), now(), null, 'Science of the Total Environment', 'Q1'),

(gen_random_uuid(), now(), now(), null, 'EuMIC 2016 - 11th European Microwave Integrated Circuits Conference', 'N/A'),

(gen_random_uuid(), now(), now(), null, 'European Microwave Week 2016', 'N/A'),

(gen_random_uuid(), now(), now(), null, 'International Journal of Antennas and Propagation', 'Q3'),

(gen_random_uuid(), now(), now(), null, 'Radiotherapy and Oncology', 'Q1'),

(gen_random_uuid(), now(), now(), null, '8th European Conference on Antennas and Propagation, EuCAP 2014', 'N/A'),

(gen_random_uuid(), now(), now(), null, 'Applied Acoustics', 'Q1'),

(gen_random_uuid(), now(), now(), null, 'LAPC 2012 - Loughborough Antennas and Propagation Conference', 'N/A'),

(gen_random_uuid(), now(), now(), null, 'Advances in Acoustics and Vibration', 'Q4'),

(gen_random_uuid(), now(), now(), null, 'CSEDU 2010 - Computer Supported Education', 'N/A'),

(gen_random_uuid(), now(), now(), null, 'Journal of Hydroinformatics', 'Q2'),

(gen_random_uuid(), now(), now(), null, 'Acta Acustica United with Acustica', 'N/A'),

(gen_random_uuid(), now(), now(), null, 'Chemometrics and Intelligent Laboratory Systems', 'Q2'),

(gen_random_uuid(), now(), now(), null, 'MICCAI', 'N/A'),

(gen_random_uuid(), now(), now(), null, 'Desalination and Water Treatment', 'Q2'),

(gen_random_uuid(), now(), now(), null, 'WSEAS: Distance Learning and Web Engineering', 'N/A'),

(gen_random_uuid(), now(), now(), null, 'Progress in Electromagnetics Research', 'Q1'),

(gen_random_uuid(), now(), now(), null, 'INMMIC', 'N/A'),

(gen_random_uuid(), now(), now(), null, 'Journal of Electromagnetic Waves and Applications', 'Q3'),

(gen_random_uuid(), now(), now(), null, 'WSEAS Transactions on Communications', 'N/A'),

(gen_random_uuid(), now(), now(), null, 'Micromachines', 'Q2'),

(gen_random_uuid(), now(), now(), null, 'Physica Medica', 'Q1'),

(gen_random_uuid(), now(), now(), null, 'Journal of Optics A: Pure and Applied Optics', 'N/A'),

(gen_random_uuid(), now(), now(), null, 'Electromagnetic Biology and Medicine', 'Q3'),

(gen_random_uuid(), now(), now(), null, 'Televisión', 'N/A'),

(gen_random_uuid(), now(), now(), null, 'Applied Science', 'Q1'),

(gen_random_uuid(), now(), now(), null, 'Nuevas apuestas educativas', 'N/A'),

(gen_random_uuid(), now(), now(), null, 'Desarrollo de grandes aplicaciones de red', 'N/A'),

(gen_random_uuid(), now(), now(), null, 'Avances en calidad ambiental', 'N/A');

-- Articles

INSERT INTO public.articles (uuid, creationDate, modificationDate, deletedDate, title, doi, authors, url_github, type, cites, publishYear, id_journal) 

SELECT gen_random_uuid(), now(), now(), null, 'Efficient design of electromagnetic field exposure maps with multi-method evolutionary ensembles', '10.1016/j.envres.2025.121636', 'Jorge Guillén-Pina; Jorge Pérez-Aracil; Ricardo Chocano-del-Cerro; Rocío Sánchez-Montero; Pablo-Luis López-Espí; Sancho Salcedo-Sanz', null, 'ARTICLE', 0, '2025', j.id FROM journals j WHERE j.name = 'Environmental Research' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Miniaturized Flat Archimedean Spiral Antenna', '10.13052/2025.ACES.J.400104', 'Miguel Fernandez-Munoz; Nerea Munoz-Mateos; Rocio Sanchez-Montero; Pablo Luis Lopez-Espi; Juan Antonio Martinez-Rojas; Efren Diez-Jimenez', null, 'ARTICLE', 0, '2025', j.id FROM journals j WHERE j.name = 'Applied Computational Electromagnetics Society Journal (ACES)' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Optimal design of electromagnetic field exposure maps in large areas', '10.1016/J.EIAR.2024.107525', 'Lopez-Espi, P. L.; Sanchez-Montero, R.; Guillen-Pina, J.; Chocano-del-Cerro, R.; Rojas, J. A. M.', null, 'ARTICLE', 2, '2024', j.id FROM journals j WHERE j.name = 'Environmental Impact Assessment Review' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Fully Integrated Miniaturized Wireless Power Transfer Rectenna for Medical Applications Tested inside Biological Tissues', '10.3390/electronics13163159', 'Miguel Fernandez-Munoz; Mohamed Missous; Mohammadreza Sadeghi; Pablo Luis Lopez-Espi; Rocio Sanchez-Montero; Juan Antonio Martinez-Rojas; Efren Diez-Jimenez', null, 'ARTICLE', 7, '2024', j.id FROM journals j WHERE j.name = 'Electronics' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Model‐based systems engineering approach to the study of electromagnetic interference and compatibility in wireless powered microelectromechanical systems', '10.1002/sys.21733', 'Juan A. Martinez‐Rojas; Jose L. Fernandez‐Sanchez; Miguel Fernandez‐Munoz; Rocio Sanchez‐Montero; Pablo L. Lopez‐Espi; Efren Diez‐Jimenez', null, 'ARTICLE', 2, '2024', j.id FROM journals j WHERE j.name = 'Systems Engineering' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Smartphone-Based Methodology Applied to Electromagnetic Field Exposure Assessment', '10.3390/s24113561', 'Pablo-Luis López-Espí; Rocío Sánchez-Montero; Jorge Guillén-Pina; Rubén Castro-Sanz; Ricardo Chocano-del-Cerro; Juan-Antonio Martínez-Rojas', null, 'ARTICLE', 3, '2024', j.id FROM journals j WHERE j.name = 'Sensors' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Miniaturized High Gain Flexible Spiral Antenna Tested in Human-Like Tissues', '10.1109/TNANO.2022.3225912', 'Miguel Fernandez-Munoz; Rocio Sanchez-Montero; Pablo Luis Lopez-Espi; Juan A. Martinez-Rojas; Efren Diez-Jimenez', null, 'ARTICLE', 7, '2022', j.id FROM journals j WHERE j.name = 'IEEE Transactions on Nanotechnology' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'New Cable Delay Measurement System for VGOS Stations', '10.3390/s22062308', 'Pablo García Carreño; Javier González-García; María Patino-Esteban; Francisco Javier Beltrán Martínez; Marta Bautista-Durán; Pablo-Luis Lopez-Espi; José A. López-Pérez', null, 'ARTICLE', 3, '2022', j.id FROM journals j WHERE j.name = 'Sensors' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Model-Based Systems Engineering Applied to Trade-Off Analysis of Wireless Power Transfer Technologies for Implanted Biomedical Microdevices', '10.3390/s21093201', 'Juan Antonio Martínez Rojas; José L. Fernández; Rocio Sanchez-Montero; Pablo-Luis Lopez-Espi; Efren Diez-Jimenez', null, 'ARTICLE', 26, '2021', j.id FROM journals j WHERE j.name = 'Sensors' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Design of a Multi-Band Microstrip Textile Patch Antenna for LTE and 5G Services with the CRO-SL Ensemble', '10.3390/app10031168', 'Carlos Camacho-Gomez; Rocio Sanchez-Montero; Diego Martínez-Villanueva; Pablo-Luis Lopez-Espi; Sancho Salcedo-Sanz', null, 'ARTICLE', 31, '2020', j.id FROM journals j WHERE j.name = 'Applied Sciences' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Analysis of the geometric parameters influence in PCB fixtures for 2D multipole magnetization patterning of thin layer micro-magnets', '10.3233/JAE-180121', 'Martinez-Munoz, Miriam; Diez-Jimenez, Efren; Sanchez-Montero, Rocio; Luis Lopez-Espi, Pablo; Antonio Martinez-Rojas, Juan', null, 'ARTICLE', 8, '2019', j.id FROM journals j WHERE j.name = 'International Journal of Applied Electromagnetics and Mechanics' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Bend and Moisture Effects on the Performance of a U-Shaped Slotted Wearable Antenna for Off-Body Communications in an Industrial Scientific Medical (ISM) 2.4 GHz band', '10.3390/S19081804', 'Sanchez-Montero, Rocio; Lopez-Espi, Pablo-Luis; Alen-Cordero, Cristina; Martinez-Rojas, Juan-Antonio', null, 'ARTICLE', 31, '2019', j.id FROM journals j WHERE j.name = 'Sensors' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Filtering of Mammograms Based on Convolution with Directional Fractal Masks to Enhance Microcalcifications', '10.3390/app9061194', 'Rocio Sanchez-Montero; Juan-Antonio Martinez-Rojas; Pablo-Luis Lopez-Espi; Luis Nuñez-Martin; Efren Diez-Jimenez', null, 'ARTICLE', 5, '2019', j.id FROM journals j WHERE j.name = 'Applied Sciences' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Optimal Design of a Planar Textile Antenna for Industrial Scientific Medical (ISM) 2.4 GHz Wireless Body Area Networks (WBAN) with the CRO-SL Algorithm', '10.3390/s18071982', 'Rocio Sanchez-Montero; Carlos Camacho-Gómez; Pablo-Luis López-Espi; Sancho Salcedo-Sanz', null, 'ARTICLE', 34, '2018', j.id FROM journals j WHERE j.name = 'Sensors' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Numerical Study of Focusing Effects of Microwaves inside Wood Due to Timber Ring Structure', '10.3390/f9030106', 'Rocio Sanchez-Montero; Pablo-Luis López-Espi; Juan Antonio Martínez-Rojas; Jesús Alpuente-Hermosilla; Cristina Alen-Cordero', null, 'ARTICLE', 7, '2018', j.id FROM journals j WHERE j.name = 'Forests' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Effect of the anatomical structure, wood properties and machining conditions on surface roughness of wood', '10.4067/S0718-221X2017005000018', 'Laina, R.; Sanz-Lobera, A.; Villasante, A.; López-Espí, P.; Martínez-Rojas, J.A.; Alpuente, J.; Sánchez-Montero, R.; Vignote, S.', null, 'ARTICLE', 49, '2017', j.id FROM journals j WHERE j.name = 'Maderas: Ciencia y Tecnologia' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Long term variations measurement of electromagnetic field exposures in Alcalá de Henares (Spain)', '10.1016/j.scitotenv.2017.03.131', 'Sánchez-Montero, R.; Alén-Cordero, C.; López-Espí, P.L.; Rigelsford, J.M.; Aguilera-Benavente, F.; Alpuente-Hermosilla, J.', null, 'ARTICLE', 23, '2017', j.id FROM journals j WHERE j.name = 'Science of the Total Environment' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Geodetic VLBI ultra low noise broad-band receiver for 13 meter VGOS radiotelescopes', '10.1109/EuMIC.2016.7777595', 'García-Carreño, P.; García-Álvaro, S.; López-Pérez, J.A.; Patino-Esteban, M.; Serna, J.M.; Vaquero-Jiménez, B.; López-Fernández, J.A.; López-Espí, P.-L.; Sánchez-Montero, R.', null, 'CONFERENCE', 11, '2016', j.id FROM journals j WHERE j.name = 'EuMIC 2016 - 11th European Microwave Integrated Circuits Conference' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Multi frequency feed system for high magnification Cassegrain radiotelescopes at millimeter wavelengths', '10.1109/EuMC.2016.7824583', 'Ruiz, S.L.; Martínez, F.T.; Fernández, J.A.L.; Han, S.-T.;López-Espí, P.-L.; Sánchez-Montero, R.; Martínez, F.J.B.', null, 'CONFERENCE', 1, '2016', j.id FROM journals j WHERE j.name = 'European Microwave Week 2016: ''Microwave Everywhere'', EuMW 2016 - Conference Proceedings; 46th European Microwave Conference, EuMC 2016' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Optimization of a Conical Corrugated Antenna Using Multiobjective Heuristics for Radio-Astronomy Applications', '10.1155/2016/7024704', 'S. López-Ruiz; R. Sánchez Montero; F. Tercero-Martínez; P. L. López-Espí; J. A. López-Fernandez', null, 'ARTICLE', 6, '2016', j.id FROM journals j WHERE j.name = 'International Journal of Antennas and Propagation' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'A decision aid method for lesion delineation based on directional fractal filtering', null, 'Sanchez-Montero, R.; Nunez-Martin, L.; Lopez-Espi, P. L.; Martinez-Rojas, J. A.; Castro-Tejero, P.; Alpuente-Hermosilla, J.', null, 'ARTICLE', 0, '2015', j.id FROM journals j WHERE j.name = 'Radiotherapy and Oncology' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'An active multiband antenna for future wireless communications', '10.1109/EuCAP.2014.6902456', 'Sanchez-Montero, R.; Rigelsford, J.M.; Lopez-Espi, P.L.; Alpuente-Hermosilla, J.', null, 'CONFERENCE', 2, '2014', j.id FROM journals j WHERE j.name = '8th European Conference on Antennas and Propagation, EuCAP 2014' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Polyspectral technique for the analysis of stress-waves characteristics and species recognition in wood veneers', '10.1016/j.apacoust.2014.06.003', 'Sánchez Montero, R.; López Espí, P.L.; Alpuente, J.; Rojas, J.A.M.; Vignote, S.', null, 'ARTICLE', 2, '2014', j.id FROM journals j WHERE j.name = 'Applied Acoustics' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Multiple band antenna optimization using heuristics and bio-inspired optimization algorithms', '10.1109/LAPC.2012.6403028', 'Sanchez-Montero, R.; Lopez-Espi, P.L.; Cruz-Rodriguez, A.C.; Rigelsford, J.M.', null, 'CONFERENCE', 6, '2012' , j.id FROM journals j WHERE j.name = 'LAPC 2012 - 2012 Loughborough Antennas and Propagation Conference' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Spectral biomimetic technique for wood classification inspired by human echolocation', '10.1155/2012/378361', 'Martínez Rojas, J.A.; Vignote Peña, S.; Alpuente Hermosilla, J.; Sánchez Montero, R.; López Espí, P.L.; Martínez Rojas, I.', null, 'ARTICLE', 2, '2012', j.id FROM journals j WHERE j.name = 'Advances in Acoustics and Vibration' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'An experience to include advanced optimization techniques in microwave undergraduate laboratories', null, 'López-Espi, P.; Salcedo-Sanz, S.; Sánchez-Montero, R.; Portilla-Figueras, A.', null, 'CONFERENCE', 0, '2010', j.id FROM journals j WHERE j.name = 'CSEDU 2010 - 2nd International Conference on Computer Supported Education, Proceedings' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Nitrates/nitrites concentration estimation in wastewater samples using transmittance curve models optimized by evolutionary computation techniques', '10.2166/hydro.2010.016', 'López-Espí, P.; Salcedo-Sanz, S.; Pérez-Bellido, Á.M.; De Bustamante, I.; López-Ferreras, F.', null, 'ARTICLE', 1, '2010', j.id FROM journals j WHERE j.name = 'Journal of Hydroinformatics' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Physical Analysis of Several Organic Signals for Human Echolocation: Hand and Finger Produced Pulses', '10.3813/AAA.918368', 'Martinez Rojas, Juan Antonio; Alpuente Hermosilla, Jesús; Sanchez Montero, Rocio; Lopez Espi, Pablo Luis', null, 'ARTICLE', 40, '2010', j.id FROM journals j WHERE j.name = 'Acta Acustica United with Acustica' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Curve fitting using heuristics and bio-inspired optimization algorithms for experimental data processing in chemistry', '10.1016/j.chemolab.2008.11.004', 'Polo-Corpa, M.J.; Salcedo-Sanz, S.; Pérez-Bellido, A.M.; López-Espí, P.; Benavente, R.; Pérez, E.', null, 'ARTICLE', 18, '2009', j.id FROM journals j WHERE j.name = 'Chemometrics and Intelligent Laboratory Systems' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Estimating the Concentration of Nitrates in Water Samples Using PSO and VNS Approaches', '10.1007/978-3-642-01129-0_17', 'Lopez-Espi, Pablo; Salcedo-Sanz, Sancho; Perez-Bellido, A. M.; Ortiz-Garcia, Emilio G.; Alonso-Garrido, Oscar; Portilla-Figueras, Antonio', null, 'CONFERENCE', 0, '2009', j.id FROM journals j WHERE j.name = 'International Conference on Medical Image Computing and Computer Assisted Intervention - MICCAI' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Physical Analysis of Several Organic Signals for Human Echolocation: Oral Vacuum Pulses', '10.3813/AAA.918155', 'Martinez Rojas, Juan Antonio; Alpuente Hermosilla, Jesús; Sanchez Montero, Rocio; Lopez Espi, Pablo Luis', null, 'ARTICLE', 96, '2009', j.id FROM journals j WHERE j.name = 'Acta Acustica United with Acustica' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Using electrical resistivity tomography (ERT) to evaluate the infiltration in land application systems. A case study in the Carrion de los Cespedes wastewater treatment plant (Seville, Spain)', '10.5004/DWT.2009.364', 'Lillo, F. J.; Gomez-Ortiz, D.; Martin-Crespo, T.; Carreno, F.; De Bustamante, I.; Lopez, P. L.', null, 'ARTICLE', 0, '2009', j.id FROM journals j WHERE j.name = 'Desalination and Water Treatment' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Electromagnetic Analysis of Band-Pass Filters Using Half Wavelength Hollow Resonators', null, 'Lopez, Pablo L.; Zamanillo, Jose M.; Sanchez, Rocio; Pasamon, Jose F.; Calvo, Francisco; Perez, Carlos', null, 'ARTICLE', 0, '2008', j.id FROM journals j WHERE j.name = 'DIWEB '' 09: PROCEEDINGS OF THE 9TH WSEAS INTERNATIONAL CONFERENCE ON DISTANCE LEARNING AND WEB ENGINEERING' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Empirical characterization of wood surfaces by means of iterative autocorrelation of laser speckle patterns', '10.2528/PIER07112706', 'Rojas, J.A.M.; Alpuente, J.; Bolívar, E.; López-Espí, P.; Rojas, I.M.; Vignote, S.', null, 'ARTICLE', 7, '2008', j.id FROM journals j WHERE j.name = 'Progress in Electromagnetics Research' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Fractal convolution techniques for speckle noise reduction', null, 'Martínez-Rojas, J.-A.; Sánchez-Montero, R.; Alpuente-Hermosilla, J.; López-Espí, P.', null, 'CONFERENCE', 1, '2008', j.id FROM journals j WHERE j.name = '2008 5th European Radar Conference Proceedings, EuRAD 2008' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'High Frequency Circuits and Systems', null, 'Sainz de la Maza, Jose Maria Zamanillo; Espi, Pablo Luis Lopez', null, 'ARTICLE', 0, '2008', j.id FROM journals j WHERE j.name = 'DIWEB '' 09: PROCEEDINGS OF THE 9TH WSEAS INTERNATIONAL CONFERENCE ON DISTANCE LEARNING AND WEB ENGINEERING' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Microwave Active Devices modeling using Verilog-A description language', null, 'Zamanillo, J. M.; Lopez-Espi, P. L.; Rivera, Sergio; Cobo, Beatriz; Torres, Raquel; Mediavilla, Angel; Perez-Vega, C', null, 'ARTICLE', 0, '2008', j.id FROM journals j WHERE j.name = 'DIWEB '' 09: PROCEEDINGS OF THE 9TH WSEAS INTERNATIONAL CONFERENCE ON DISTANCE LEARNING AND WEB ENGINEERING' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'The Versatility of Verilog-A Based Models on Commercial Microwave Simulators', '10.1109/INMMIC.2008.4745740', 'Zamanillo, J. M.; Zamanillo, I.; Campelo, J.; Mediavilla, A.; Perez-Vega, C.; Lopez-Espi, P. L.; Torres, R.', null, 'ARTICLE', 2, '2008', j.id FROM journals j WHERE j.name = 'WORKSHOP ON INTEGRATED NONLINEAR MICROWAVE AND MILLIMETRE- WAVE CIRCUITS (INMMIC)' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Accurate model of electromagnetic wave propagation in unidimensional photonic crystals with defects', '10.1163/156939307781749795', 'Rojas, J.A.M.; Alpuente, J.; López-Espí, P.; García, P.', null, 'ARTICLE', 15, '2007', j.id FROM journals j WHERE j.name = 'Journal of Electromagnetic Waves and Applications' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'A general development for fleets control system', null, 'Granja-Antón, J.C.; Alpuente-Hermosilla, J.; Sánchez-Montero, R.; López-Espí, P.L.', null, 'ARTICLE', 0, '2006', j.id FROM journals j WHERE j.name = 'WSEAS Transactions on Communications' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Study of the Optimal Waveforms for Non-Destructive Spectral Analysis of Aqueous Solutions by Means of Audible Sound and Optimization Algorithms', '10.3390/app11167301', 'Pilar García Díaz; Manuel Utrilla Manso; Jesús Alpuente Hermosilla; Juan A. Martínez Rojas', null, 'ARTICLE', 1, '2021', j.id FROM journals j WHERE j.name = 'Applied Sciences' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'A collapsed-cone based transit EPID dosimetry method', '10.1016/j.ejmp.2018.01.006', 'Jaime Martínez-Ortega; María Pinto-Monedero; Nuría Gómez-González; Naresh B.-Tolani; Pablo Castro-Tejero; Miguel Castanedo-Álvarez; Luis Núñez-Martín; Rocio Sanchez-Montero', null, 'ARTICLE', 6, '2018', j.id FROM journals j WHERE j.name = 'Physica Medica' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Towards Miniaturization of Magnetic Gears: Torque Performance Assessment', '10.3390/mi9010016', 'Efren Díaz-Jimenez; Rocio Sanchez-Montero; Miriam Martinez-Muñoz', null, 'ARTICLE', 23, '2017', j.id FROM journals j WHERE j.name = 'Micromachines' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'HYBRID PIFA-PATCH ANTENNA OPTIMIZED BY EVOLUTIONARY PROGRAMMING', '10.2528/pier10072804', 'Rocio Sanchez-Montero; Sancho Salcedo-Sanz; J. A. Portilla-Figueras; Richard Langley', null, 'ARTICLE', 24, '2010', j.id FROM journals j WHERE j.name = 'Progress In Electromagnetics Research' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'RIGOROUS FULL VECTORIAL ANALYSIS OF ELECTROMAGNETIC WAVE PROPAGATION IN 1D', '10.2528/pier06042501', 'Juan Antonio Martinez Rojas; Jesús Alpuente; JosÃ© PiÃ±eiro; Rocio Sanchez-Montero', null, 'ARTICLE', 41, '2006', j.id FROM journals j WHERE j.name = 'Progress In Electromagnetics Research' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Design Accelerator: uso de videotutoriales para el diseño de máquinas en el MUII', '978-84-16978-11-3', 'Del Castillo, H. y Nogueiras, G. (Ed.)', null, 'BOOK', 0, '2017', j.id FROM journals j WHERE j.name = 'Nuevas apuestas educativas [Recurso electrónico]' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Microondas prácticas con genesys', '978-84-8138-902-9', 'Rocio Sánchez Montero', null, 'BOOK', 0, '2011', null UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Wood species identification using stress-wave analysis in the audible range', '10.1016/j.apacoust.2011.05.016', 'Juan A. Martinez‐Rojas; Jesús Alpuente-Hermosilla; D. Postigo; I.M Rojas; Santiago Vignote', null, 'ARTICLE', 0, '2011', j.id FROM journals j WHERE j.name = 'Applied Acoustics' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Fractal-based image enhancement techniques inspired by differential interference contrast microscopy', '10.1088/1464-4258/11/6/065503', 'Juan A. Martinez‐Rojas; Jesús Alpuente-Hermosilla; I.M Rojas; Santiago Vignote', null, 'ARTICLE', 6, '2009', j.id FROM journals j WHERE j.name = 'Journal of Optics A: Pure and Applied Optics' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Modelado eficiente de dispositivos activos de microondas utilizando código Verilog-A', '978-84-613-4894-7', 'Maciá Pérez, F. (Ed.)', null, 'BOOK', 0, '2009', j.id FROM journals j WHERE j.name = 'Desarrollo de grandes aplicaciones de red' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Study of leaky modes in high contrast Bragg fibres', '10.1088/1464-4258/9/10/009', 'Juan A. Martinez‐Rojas; Jesús Alpuente-Hermosilla; P. Lopez; Rocio Sanchez-Montero', null, 'ARTICLE', 5, '2007', j.id FROM journals j WHERE j.name = 'Journal of Optics A: Pure and Applied Optics' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Líneas de transmisión y redes de adaptación en circuitos de microondas', '84-8138-461-5', 'Alpuente Hermosilla, Jesús', null, 'BOOK', 4, '2006', null UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Microondas prácticas', '84-8138-617-0', 'Sanchez-Montero, R.; Lopez-Espi, P.L.; Alpuente-Hermosilla, Jesús', null, 'BOOK', 1, '2004', null UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Teoría de circuitos de microondas: parámetros S.', '84-8138-623-5', 'Sanchez-Montero, R.', null, 'BOOK', 0, '2004', null UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Aplicación de tecnologías limpias en riegos con aguas residuales: distribución automatizada y reutilización', '84-7800-811-X', 'Márquez Moreno, M.C.; Ramos Castellanos P. (Ed.)', null, 'BOOK', 0, '2002', j.id FROM journals j WHERE j.name = 'Avances en calidad ambiental' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Bone density changes in mouse offspring after 50-Hz, 15-μT electromagnetic field long-term exposure of two generations', null, 'R. Vera,M. L. Picazo,M. Royuela,M. A. Romo,J. Alpuente &J. L. Bardasano', null, 'ARTICLE', 0, '1999', j.id FROM journals j WHERE j.name = 'Electromagnetic Biology and Medicine' UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Televisión', '84-86981-02-6', 'Alpuente Hermosilla, Jesús', null, 'BOOK', 0, '1988', null UNION ALL

SELECT gen_random_uuid(), now(), now(), null, 'Comparison Between Broadband and Personal Exposimeter Measurements for EMF Exposure Map Development Using Evolutionary Programming', 'https://doi.org/10.3390/app15137471', 'Nájera, Alberto; Sánchez Montero, Rocio; González Rubio, Jesús; Guillén Pina, Jorge; Chocano del Cerro, Ricardo; López Espí, Pablo Luis', null, 'ARTICLE', 0, '2025',j.id FROM journals j WHERE j.name = 'Applied Science';


-- Notifications

INSERT INTO public.notifications (uuid, creationDate, modificationDate, deletedDate, priority, title, message) VALUES ('78d95d24-bc28-4428-8999-bbd7597eb879', now(), now(), null, 'HIGH', 'Usuarios CAU', 'Recordatorio para dar de alta nuevamente el accesso de los usuarios en el CAU');

-- User_Notifications

INSERT INTO public.user_notifications (uuid, creationDate, modificationDate, deletedDate, id_notification, id_user) SELECT gen_random_uuid(), now(), now(), null, n.id, u.id FROM notifications n CROSS JOIN usuario u WHERE n.uuid = '78d95d24-bc28-4428-8999-bbd7597eb879' AND u.email = 'ivan.recio@uah.es';

-- Projects 

INSERT INTO public.projects (
    uuid, creationDate, modificationDate, deletedDate,
    title, ref, authors, finance, type, startDate, endDate
) VALUES 
(gen_random_uuid(), now(), now(), NULL,
'Metodología para la evaluación de la exposición personal en nuevas redes de telefonía móvil 5G.',
'REF 2022/00042/001, CM/JIN/2021-032', 'UAH, UCLM', 'Comunidad de Madrid', 'INVESTIGACION', '01/01/2022', '31/12/2023'),

(gen_random_uuid(), now(), now(), NULL,
'Medida de contaminación electromagnética en redes 5G',
'UAH INFR. B 2021-012', 'UAH', 'UAH', 'INVESTIGACION', '30/09/2021', '31/12/2021'),

(gen_random_uuid(), now(), now(), NULL,
'Monitorización, vigilancia y caracterización de la exposición personal ante el segundo dividendo digital y el despliegue de la 5ª generación de telefonía móvil (5G)',
'CM/JIN/2019-036', 'UAH', 'UAH', 'INVESTIGACION', '01/01/2019', '31/12/2021'),

(gen_random_uuid(), now(), now(), NULL,
'Ultra-efficient wireless powered micro-robotic joint for health applications UWIPOM2.',
'H2020-FETOPEN-2018-2019-2020-01', 'Universidad de Alcalá, Advanced Hall Sensors Ltd, Politechnika Warszawska, Fundacion Imdea Nanociencia Y Boston Scientific Limited .', 'Unión Europea', 'INVESTIGACION', '01/10/2019', '30/09/2022'),

(gen_random_uuid(), now(), now(), NULL,
'Bomba para ultra-alto vacío turbomolecular y sensor de presión para ultra-alto vacío',
'', 'UAH', 'UAH', 'INVESTIGACION', '16/11/2016', '20/12/2018'),

(gen_random_uuid(), now(), now(), NULL,
'Magnetización multipolar 3D de imanes permanentes orientada a sistemas microelectrónicos.',
'CCGP2017-EXP/011', 'UAH', 'UAH', 'INVESTIGACION', '01/12/2017', '31/12/2018'),

(gen_random_uuid(), now(), now(), NULL,
'Diseño y optimización de INVESTIGACION de bocina UWB para observaciones radioastronómicas para estudio de datos geodésicos',
'CCG2016/EXP-073', 'UAH-OAN', 'UAH', 'INVESTIGACION', '16/12/2016', '15/12/2017'),

(gen_random_uuid(), now(), now(), NULL,
'Caracterización automática de la superficie de madera mediante métodos ópticos no invasivos.',
'AGL2013-44631-P', 'UAH-UCM-UDL', 'Ministerio de Economía y Competitividad', 'INVESTIGACION', '01/01/2014', '31/12/2017'),

(gen_random_uuid(), now(), now(), NULL,
'Diseño de INVESTIGACION planares cuatribanda para aplicaciones móviles de nueva generación.',
'2011/047', 'UAH', 'UAH', 'INVESTIGACION', '01/02/2012', '27/02/2013'),

(gen_random_uuid(), now(), now(), NULL,
'Telegestión de alumbrado exterior mediante utilización de tecnología inalámbrica.',
'82/2010', 'SOCELEC, UAH.', 'Junta de Comunidades de Castilla la Mancha', 'INVESTIGACION', '01/01/2009', '31/12/2010'),

(gen_random_uuid(), now(), now(), NULL,
'Elaboración de materiales docentes adaptados a alumnos con problemas de asistencia o seguimiento en asignaturas de postgrado.',
'UAH/EV 209', 'UAH', 'UAH', 'DOCENCIA', '01/01/2008', '31/12/2009'),

(gen_random_uuid(), now(), now(), NULL,
'Incorporación de materiales didácticos prácticos a un entorno de e-learning: aplicación a asignaturas relacionadas con los sistemas de comunicación en ingenierías.',
'UAH/EV 196', 'UAH', 'UAH', 'DOCENCIA', '01/01/2007', '31/12/2008'),

(gen_random_uuid(), now(), now(), NULL,
'Regeneración de aguas mediante técnicas pasivas in situ: reutilización para riego y recarga.',
'CGL2007-65712-C03-01/HID', 'UAH,URJC,CENTA', 'Ministerio de Educación y Ciencia', 'INVESTIGACION', '01/01/2007', '31/12/2007'),

(gen_random_uuid(), now(), now(), NULL,
'Filtrado del “clutter” marino en series temporales de imágenes radar.',
'CCG06-UAH/TIC-0726', 'UAH', 'Comunidad de Madrid', 'INVESTIGACION', '01/01/2007', '31/12/2007'),

(gen_random_uuid(), now(), now(), NULL,
'Integración de contenidos didácticos en un entorno on-line para el aprendizaje en Ingeniería de Telecomunicación e Ingeniería Técnica de Telecomunicación',
'UAH/EV 132', 'UAH', 'UAH', 'DOCENCIA', '01/01/2006', '31/12/2007'),

(gen_random_uuid(), now(), now(), NULL,
'Tratamiento y Reutilización de Aguas Residuales para una Gestión Sostenible',
'', 'Varios', 'Ministerio de Educacion y Ciencia ', 'INVESTIGACION', '01/01/2006', '31/12/2011'),

(gen_random_uuid(), now(), now(), NULL,
'Control de la contaminación de las aguas subterráneas por nitratos: Desarrollo de un prototipo de sonda con métodos ópticos para su determinación en continuo.',
'2005/025', 'UAH', 'CAM-UAH', 'INVESTIGACION', '01/01/2006', '31/12/2006'),

(gen_random_uuid(), now(), now(), NULL,
'Desarrollo de instrumentación y sistemas para el seguimiento y control remotos de la calidad de las aguas subterráneas: aplicación en la depuración y reutilización de aguas residuales mediante filtros verdes',
'', 'UAH, UPM', 'CICYT', 'INVESTIGACION', '01/01/2003', '31/12/2006'),

(gen_random_uuid(), now(), now(), NULL,
'Filtros Verdes: Diseño de sensores para la monitorización in situ de parámetros de control contaminantes.',
'', 'UAH', 'CAM', 'INVESTIGACION', '01/01/2001', '31/12/2003'),

(gen_random_uuid(), now(), now(), NULL,
'Aplicación de nuevas tecnologías de la información y comunicaciones en la implantación y gestión de Filtros Verdes (creación de una planta experimental en el filtro verde de Redueña)',
'LA CAIXA 2001-001', 'UAH', 'Fundacion LA Caixa', 'INVESTIGACION', '01/01/2001', '31/12/2003'),

(gen_random_uuid(), now(), now(), NULL,
'Implantación y gestión de filtros verdes: una alternativa para la depuración y reutilización de aguas residuales (creación de una planta experimental en el filtro verde de Redueña)',
'REN2000-0759-C02-0', 'UAH, UPM, CSIC', 'CICTY', 'INVESTIGACION', '01/01/2001', '31/12/2003'),

(gen_random_uuid(), now(), now(), NULL,
'Desarrollo de un sistema de medida de deformaciones y resistencia a la rotura de huesos de ratas',
'E050/2000', 'UAH', 'UAH', 'INVESTIGACION', '01/01/2000', '31/12/2000'),

(gen_random_uuid(), now(), now(), NULL,
'Experiencia piloto para el anillamineto y seguimiento de las aves fringilidas en Andalucía.',
'2024/149', 'UAH', 'Junta de Andalucía', 'INVESTIGACION', '07/11/2024', '07/10/2025'),

(gen_random_uuid(), now(), now(), NULL,
'Prevención Inteligente del Riesgo de Incendios Forestales basada en estimación de Masa y Humedad de Combustible Vegetal en Guadalajara',
'UAH-CORTES CLM 2025-007', 'UAH', 'JCCLM', 'INVESTIGACION', '16/09/2025', '31/12/2025');

-- Tasks 

INSERT INTO public.tasks (uuid, creationDate, modificationDate, deletedDate, title, message, status, priority, limitDate) VALUES

('b36a1afe-38e5-436c-ab57-1359ef168062', now(), now(), null, 'Despliegue del Geoportal', 'Desplegar el geoportal en un ordenador del laboratorio para empezar a trabajar con el y poder hacer pruebas', 'TODO', 'HIGH', '09/10/2025'),

('1f91b849-ee9e-4e6b-8c08-46aaaa8dff05', now(), now(), null, 'Desplegar Web del grupo', 'Hay que desplegar la web del grupo en el CAU y revisar que todo funcione correctamente', 'DONE', 'MEDIUM', '09/10/2025'),

('9a094003-4843-49f9-9ffa-b69dfbd64b5d', now(), now(), null, 'Limpieza Medidas Interiores/Exteriores', 'Hay que hacer la limpieza de los CSVs y filtrar los datos obtenidos para poder graficar las cosas', 'DOING', 'LOW', '09/10/2025'),

('e041e5cd-8610-43af-92a9-2e18c07055f1', now(), now(), null, 'Imagenes Satelitales CCLM', 'Sacar imagenes satelitales para poder calcular el indice pre-incendios', 'TODO', 'HIGH', '09/10/2025');

-- Tasks_User

INSERT INTO public.tasks_user (uuid, creationDate, modificationDate, deletedDate, id_user, id_task)  

-- Ivan
SELECT gen_random_uuid(), now(), now(), null, u.id, t.id FROM usuario u CROSS JOIN tasks t WHERE u.uuid = 'c90fc766-db1a-4265-ba24-01eb3b7247c2' AND t.uuid = 'b36a1afe-38e5-436c-ab57-1359ef168062' UNION ALL
SELECT gen_random_uuid(), now(), now(), null, u.id, t.id FROM usuario u CROSS JOIN tasks t WHERE u.uuid = 'c90fc766-db1a-4265-ba24-01eb3b7247c2' AND t.uuid = '1f91b849-ee9e-4e6b-8c08-46aaaa8dff05' UNION ALL

--Jorge
SELECT gen_random_uuid(), now(), now(), null, u.id, t.id FROM usuario u CROSS JOIN tasks t WHERE u.uuid = '79b29c7d-7c09-4b79-9cbb-3d5a3a56fa00' AND t.uuid = 'b36a1afe-38e5-436c-ab57-1359ef168062' UNION ALL
SELECT gen_random_uuid(), now(), now(), null, u.id, t.id FROM usuario u CROSS JOIN tasks t WHERE u.uuid = '79b29c7d-7c09-4b79-9cbb-3d5a3a56fa00' AND t.uuid = 'e041e5cd-8610-43af-92a9-2e18c07055f1' UNION ALL

--Maria
SELECT gen_random_uuid(), now(), now(), null, u.id, t.id FROM usuario u CROSS JOIN tasks t WHERE u.uuid = '93c73d47-5df7-4bfb-8925-925a458f1254' AND t.uuid = '9a094003-4843-49f9-9ffa-b69dfbd64b5d' UNION ALL

--Ricardo
SELECT gen_random_uuid(), now(), now(), null, u.id, t.id FROM usuario u CROSS JOIN tasks t WHERE u.uuid = '38eea687-c52d-442f-8b14-677e98f8aacb' AND t.uuid = 'b36a1afe-38e5-436c-ab57-1359ef168062';

-- Trabajos --------------------------------------

INSERT INTO public.works (uuid, creationDate, modificationDate, deletedDate, title, student, teacher, yearPresentation, type, status, career) VALUES

(gen_random_uuid(), now(), now(), null, 'Desarrollo de una aplicación Android para la recogida y envío de datos característicos de las aves', 'Razvan Virgil Craciun', 'Pablo Luis López Espí', '2021/22', 'TFG', 'DEFENDED', 'GISI (G581)'),

(gen_random_uuid(), now(), now(), null, 'Estudio y análisis de las nuevas redes inteligentes de distribución eléctrica SMAR GRIDS', 'Cesar Pedrero Cánovas', 'Pablo Luis López Espí', '2014/15', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Estudio de Fuentes de Ruido en Frecuencias de Microondas', 'Óscar Martínez Sanz', 'Pablo Luis López Espí', '2013/14', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Optimización de elementos RFID con aplicaciones para el seguimiento de juetos de azar', 'Samuel López Ruiz', 'Pablo Luis López Espí', '2013/14', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Estudio de la emisiones radioelectricas en banda ancha de la ciudad de Alcala de Henares.', 'Sergio Diaz Camacho', 'Pablo Luis López Espí', '2014/15', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Sistema de comunicaciones internas tetra en un buque.', 'Javier Castellanos Cañadas', 'Pablo Luis López Espí', '2014/15', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Radioenlaces para televisión local', 'Javier Mayoral de Lucas', 'Pablo Luis López Espí', '2014/15', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Enlace optico para conexiones USB.', 'Victor Serrano Bazan', 'Pablo Luis López Espí', '2015/16', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Aplicaciones de Advanced Desing System (ADS) para el diseño de dispositivos de RF y microondas.', 'Jesus Lopez Paniego', 'Pablo Luis López Espí', '2016/17', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Diseño de filtro paso-banda (Hairpin) de microondas.', 'Verónica Carrera Burgos', 'Pablo Luis López Espí', '2016/17', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Estudio de las emisiones radioeléctricas en banda ancha del municipio de Meco', 'Natalia Cañadilla Fernández-Layos', 'Pablo Luis López Espí', '2016/17', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Optimización del ancho de banda de una bocina cónica', 'Mohamed Jihad Douas Maadi', 'Pablo Luis López Espí', '2017/18', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Técnicas de filtrado en bocinas cónicas', 'Noelia Soriano Virgil', 'Pablo Luis López Espí', '2017/18', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Desarrollo de un plan de alertas y comunicaciones para presas.', 'Jarmi Recio Martínez', 'Pablo Luis López Espí', '2017/18', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Medidas de seguridad de datos para la industria de tarjeas de pago', 'Omar Vicente Sanchéz', 'Pablo Luis López Espí', '2017/18', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Diseño de filtros de microondas de doble banda', 'Miriam Ruiz Guijarro', 'Pablo Luis López Espí', '2018/19', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Despliegue de FTTH en poligonos industriales', 'Yuriy Ratych', 'Pablo Luis López Espí', '2018/19', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Despliegue FTTH', 'Sergio Rosa Vellisca', 'Pablo Luis López Espí', '2019/20', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Desarrollo de una aplicación en Android para recogida y envio de datos característicos de las aves.', 'Daniel Galán Pérez', 'Pablo Luis López Espí', '2020/21', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Propuesta de diseño de un servicio de televisión por satélite', 'Juan Adrián Tomé Velázquez', 'Pablo Luis López Espí', '2022/23', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Puesta en marcha de un radioenlace con diversidad en frecuencia mediante elementos realizados con impresión 3D.', 'Alexis Javier Pardo García', 'Pablo Luis López Espí', '2023/24', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Diseño de un Phased Array de antenas de parche', 'Emilio Prieto Guardiola', 'Pablo Luis López Espí', '2024/25', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Protocolo para la instalación y puesta en marcha de equipos con tecnología de multiplexación de longitud de onda CWDM.', 'Jean Fernando Sellán Arias', 'Pablo Luis López Espí', '2021/22', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Diseño e implementación de un geoportal para datos de exposición a campos electromagnéticos.', 'Ricardo Martínez Guadalajara', 'Pablo Luis López Espí, Jorge Guillen Pina', '2024/25', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Proyecto de plató virtual de grabación de contenido audiovisual en la Escuela Politécnica', 'David Villa Bergaz', 'Pablo Luis López Espí', '2024/25', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Diseño y simulación de elementos en guía de onda construidos mediante impresión 3D.', 'Rubén Nieto Capuchino', 'Pablo Luis López Espí', '2014/15', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Entorno para la medida simultánea de las señales ECG y Doppler.', 'Miguel Ángel Giraldo Nogues', 'Pablo Luis López Espí', '2014/15', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Diseño de una antena multibanda para telefonía movil.', 'Javier Camino Fuentes', 'Pablo Luis López Espí', '2016/17', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Filtros de microondas de banda ultra-ancha', 'Manuel Soler Borrego', 'Pablo Luis López Espí', '2016/17', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Análisis de los sistemas de navegacioón por satélite', 'Álvaro Catalina Madrid', 'Pablo Luis López Espí', '2016/17', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Implementación de una antena de bocina cónica con CST y su posterior impresión en 3D.', 'Diego Alonso Condori Bravo', 'Pablo Luis López Espí', '2017/18', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Antenas monopolo para sistemas Ultra Wide Band', 'Sandra Gutiérrez Serrano', 'Pablo Luis López Espí', '2017/18', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Despliegue de FTTH en ámbito rural', 'María Gutiérrez Luque', 'Pablo Luis López Espí', '2019/20', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Herramienta de análisis basada en tickets para el estudio de incidencias en redes móviles', 'Javier Piquero de Mingo', 'Pablo Luis López Espí, Mario Esgueva Acero', '2022/23', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Estudio, diseño y puesta a punto de la integración del sistema de comunicaciones de control de tráfico en un aeropuerto.', 'Guillermo Tudela Ciudad-Real', 'Pablo Luis López Espí', '2023/24', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Estudio y diseño de filtro paso banda en cavidades para aplicaciones radioastronómicas.', 'Mª Gabriela del Pino Linares', 'Pablo Luis López Espí', '2022/23', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Desarrollo de una aplicación móvil híbrida para la recogida de datos de contaminación electromagética', 'Rubén Castro Sanz', 'Pablo Luis López Espí', '2023/24', 'TFG', 'DEFENDED', 'GII (G781)'),

(gen_random_uuid(), now(), now(), null, 'Desarrollo de sistemas alimentadores multihaz en ondas milimétricas para observaciones 
radioastronómicas simultáneas', 'Samuel López Ruiz', 'Pablo Luis López Espí', '2015/16', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Front-End de banda ancha (2-14 Ghz) para receptor radioastronómico geodésico.
', 'Pablo García Carreño', 'Pablo Luis López Espí', '2015/16', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Diseño y optimización de una antena de apertura de banda ancha', 'Jorge Javier Díez Martín', 'Pablo Luis López Espí', '2016/17', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Diseño de un array de antenas de parche a 24 GHz para un módulo radar Doppler.', 'Ionut Bodgan Gheorghe', 'Pablo Luis López Espí', '2019/20', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Diseño y optimización de una antena monopolo impresa de banda ultra ancha (UWB) para 
aplicaciones de comunicación inalámbrica.
', 'Sergio Bermúde Onrubia', 'Pablo Luis López Espí', '2021/22', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Diseño y caracterización de una antena reconfigurable para aplicaciones de banda ultra-ancha', 'Diego Alonso Condori Bravo', 'Pablo Luis López Espí', '2021/22', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Optimización de antenas de apertura mediante variaciones del perfil de corrugado.', 'Mohamed Jihad Douas Maadi', 'Pablo Luis López Espí', '2021/22', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Estudio de las Formas de las Microcalcificaciones empleando Máscaras Fractales.', 'Alejandro Romero Róman', 'Rocío Sánchez Montero', '2014/15', 'TFG', 'DEFENDED', 'GIEC (G37)'),

(gen_random_uuid(), now(), now(), null, 'Estudio de una antena con triple polarización para LTE', 'Miguel Angel Blanco Galeano', 'Rocío Sánchez Montero', '2014/15', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Diseño y simulación de antenas con materiales textiles', 'Patricia Navas Gómez', 'Rocío Sánchez Montero', '2016/17', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Estudio comparativo de las diferentes técnicas disponibles en el tratamiento y mejora de imágenes mamográficas', 'Rocío Franco Sánchez', 'Rocío Sánchez Montero', '2016/17', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Estudio del empleo de la técnica de corrugación en antenas impresas.', 'Eva María Colino Gómez', 'Rocío Sánchez Montero', '2016/17', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Estudio y caracterización de antenas de localización frente a fenómenos bélicos', 'Luis Alberto Fernández Pérez', 'Rocío Sánchez Montero', '2017/18', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Estudio de las características radioeléctricas en las antenas con variaciones de temperatura', 'Elena Ayeceba Obiang Mibuy', 'Rocío Sánchez Montero', '2017/18', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Implementación de una antena de bocina corrugada en el programa de diseño CST para su estudio', 'Ana María de la Fuente Aguilar', 'Rocío Sánchez Montero', '2016/17', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Diseño y simulación de una antena UWB para LTE', 'Óscar Martín Martín', 'Rocío Sánchez Montero', '2016/17', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Análisis de las características de propagación en el entorno WiFi para áreas urbanas', 'Rebeca González Moreno', 'Rocío Sánchez Montero', '2016/17', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Diseño de antena flexible de banda ancha en tecnología microstrip en ranura para aplicaciones RFID y LTE', 'Diego Martínez Villanueva', 'Rocío Sánchez Montero', '2017/18', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Caracterización de una antena monopolo de banda ultra ancha en forma de ala con material textil para aplicaciones RFID', 'Rafael Hidalgo Cazallas', 'Rocío Sánchez Montero', '2017/18', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Análisis de los cambios térmicos en el comportamiento de una antena embarcada en un satélite', 'Beatriz Vadillo Cortés', 'Rocío Sánchez Montero', '2017/18', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Implantación del sistema de telecomunicaciones móviles GSM-R en una línea ferroviaria', 'Eduardo Ibarra Pérez', 'Rocío Sánchez Montero, Eder Fernández Latasa', '2020/21', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Detección, análisis y optimización de emplazamientos con sombras de cobertura en tecnología radio destinada a servicios de emergencia', 'Marco Antonio Osado Barcones', 'Rocío Sánchez Montero, Ignacio Guerra Rodríguez', '2022/23', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Optimización y validación de urna de protección planetaria para ensayos de EMC', 'Antonio del Fresno Almagro', 'Rocío Sánchez Montero, María Jiménez Lorenzo', '2023/24', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Estudio y diseño de un filtro microstrip para supresión de interferencias en radioastronomía', 'Lucía Rubio Escribano', 'Rocío Sánchez Montero, Pablo García Carreño', '2022/23', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Desarrollo de conversores de frecuencia en bandas Q y W para observaciones radioastronómicas de líneas moleculares', 'Sonia Garcia Álvaro', 'Rocío Sánchez Montero', '2015/16', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Sistema de control de dos radiotelescopios en red local para su uso simultáneo en VLBI geodésico', 'Francisco Javier Beltrán Martínez', 'Rocío Sánchez Montero', '2015/16', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Diseño y optimización de un transductor ortomodal para aplicaciones de radioastronomía', 'Diego Martínez Villanueva', 'Rocío Sánchez Montero', '2019/20', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Diseño y optimización de una antena plana en la banda X', 'Nerea Muñoz Mateos', 'Rocío Sánchez Montero', '2021/22', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Micro-mecanizado de antenas de perfil reducido mediante sistema automático CNC de alta precisión', 'Miguel Fernández Muñoz', 'Rocío Sánchez Montero', '2022/23', 'TFM', 'DEFENDED', 'MUII (M141)'),

(gen_random_uuid(), now(), now(), null, 'Estudio de las resonancias mecánicas del cuerpo humano mediante técnicas de impacto indirecto', 'Alfredo Fernández Toloba', 'Juan Antonio Martínez Rojas', '2016/17', 'TFG', 'DEFENDED', 'GIEC (G37)'),

(gen_random_uuid(), now(), now(), null, 'Actual view of natural gas supply in Europe', 'Pedro Torcal Calleja', 'Juan Antonio Martínez Rojas', '2017/18', 'TFG', 'DEFENDED', 'GIEAI (G60)'),

(gen_random_uuid(), now(), now(), null, 'Composición de imágenes acústicas en el rango audible mediante un único micrófono', 'Javier Aguilera Goméz', 'Juan Antonio Martínez Rojas', '2022/23', 'TFG', 'DEFENDED', 'GIEAI (G60)'),

(gen_random_uuid(), now(), now(), null, 'Automatización y registro de parametros geométricos con significancia diagnostica en imagenes médicas', 'Francisco Javier Beltran Martinez', 'Juan Antonio Martínez Rojas', '2013/14', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Delimitación objetiva de superficie de masas en mamografias', 'Zahira Almazan Martínez', 'Juan Antonio Martínez Rojas', '2014/15', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Estudio de costes entre instalación de fibra en áreas de baja población y alternativas', 'Israa Mohamed Abbas', 'Juan Antonio Martínez Rojas', '2016/17', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Caracterización de defectos en metales mediante técnicas acústicas no destructivas', 'Adrián de la Torre Moreno', 'Juan Antonio Martínez Rojas', '2016/17', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Optimización de un sismógrafo basado en resonadores de cavidad', 'Óscar Sousa Martín', 'Juan Antonio Martínez Rojas', '2016/17', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Detección de anomalías esféricas incrustadas en una matriz elástica mediante espectrometría de impacto indirecto', 'Mariam Bouchebti', 'Juan Antonio Martínez Rojas', '2017/18', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Ingeniería de la capa física de un sistema de comunicaciones ópticas interplanetario', 'Ricardo Mattone Alén', 'Juan Antonio Martínez Rojas', '2019/20', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Ingeniería de sistemas de una arquitectura de red de comunicaciones interplanetarias', 'Ignacio del Paso Rodríguez', 'Juan Antonio Martínez Rojas', '2019/20', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Trade-off analysis of different photonic technologies applied to quantum communications', 'Ana Martínez Jiménez-Alfaro', 'Juan Antonio Martínez Rojas', '2020/21', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Diseño de una micro nave espacial propulsada por láser', 'Eduardo García Arenas', 'Juan Antonio Martínez Rojas', '2020/21', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Análisis no destructivo de alimentos mediante espectrometría acústica por impacto indirecto', 'Leticia Monasterio Expósito', 'Juan Antonio Martínez Rojas', '2016/17', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Análisis no destructivo de bebidas mediante espectrometría acústíca por impacto indirecto', 'Assma Mohamed Abbas', 'Juan Antonio Martínez Rojas', '2016/17', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Revisión y diseño de antenas de THz no fotoconductivas', 'Rocío Serrano Camacho', 'Juan Antonio Martínez Rojas', '2019/20', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Detección de concentraciones de glucosa mediante láseres de diversas longitudes de onda', 'Víctor Ramos Jiménez', 'Juan Antonio Martínez Rojas', '2023/24', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Caracterización Acústica de Tubos Elásticos para Simular Lesiones en Arterias', 'Miriam Martínez Gil', 'Juan Antonio Martínez Rojas', '2023/24', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Análisis de los efectos de diferentes aditivos en las propiedades de la madera mediante espectroscopía acústica', 'Jorge Sánchez-Mariscal Gil', 'Juan Antonio Martínez Rojas', '2022/23', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Análisis y determinación de la malignidad de clúster de microcalcificaciones en mamografías', 'Clara Iriso Dallo', 'Juan Antonio Martínez Rojas', '2016/17', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Análisis comparativo de manchas de sangre en tejidos con aplicaciones forenses', 'Zhaira Almazán Martínez', 'Juan Antonio Martínez Rojas', '2017/18', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Estudio del envejecimiento de la madera y su datación por medio de moteado láser', 'Rubén Martín Montaño', 'Juan Antonio Martínez Rojas', '2022/23', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Mejora de imágen y reconstrucción del árbol bronquial en TC pulmonares de alta resolución.', 'Pablo García Carreño', 'Jesús Alpuente Hermosilla', '2013/14', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Planificación de mediads de EMC en camara reverberante por encima de 1 GHz.', 'Carlos Rodriguez LLanos', 'Jesús Alpuente Hermosilla', '2015/16', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Diseño y caracterización de una cámara reverberante para la médida de dispositivos por encima de 1 GHz', 'Antonio José Martinez Casares', 'Jesús Alpuente Hermosilla', '2015/16', 'TFG', 'DEFENDED', 'GIST (G39)'),

(gen_random_uuid(), now(), now(), null, 'Control de presencia en interiores mediante tecnologías inalámbricas', 'Daniel Pascual Antón', 'Jesús Alpuente Hermosilla', '2016/17', 'TFG', 'DEFENDED', 'GITT (G35)'),

(gen_random_uuid(), now(), now(), null, 'Estudio y análisis de los efectos de la telefonía móvil sobre el cuerpo humano de diferentes características', 'Sara Martínez Santolaya', 'Jesús Alpuente Hermosilla', '2015/16', 'TFM', 'DEFENDED', 'MUIT (M125)'),

(gen_random_uuid(), now(), now(), null, 'Desarrollo de filtros superconductores para aplicaciones Radioastronómicas', 'Pablo García Carreño', 'Pablo Luis López Espí, José Antonio López Pérez', '2024/25', 'TD', 'DEFENDED', null),

(gen_random_uuid(), now(), now(), null, 'Caracterización Automática de Especies de Madera mediante técnicas de clasificación de imágenes', 'Jesús Alpuente Hermosilla', 'Pablo Luis López Espí, Juan Antonio Martínez Rojas', '2014/15', 'TD', 'DEFENDED', null);

-- Computers 

INSERT INTO public.computers (
    uuid, creationDate, modificationDate, deletedDate,
    name, adminUser, adminPassword, ipAddress,
    remote, haveStudent, studentName, studentUser, studentPassword, so, location
) VALUES (
    gen_random_uuid(),
    now()::text,
    now()::text,
    NULL,
    'PC-LAB-01',
    'admin_lab',
    'securePass123',
    '192.168.1.10',
    TRUE,
    TRUE,
    'Juan Pérez',
    'juanp',
    'studPass456',
    'Windows 11 Pro',
    'S24'
);

INSERT INTO public.computers (
    uuid, creationDate, modificationDate, deletedDate,
    name, adminUser, adminPassword, ipAddress,
    remote, haveStudent, studentName, studentUser, studentPassword, so, location
) VALUES (
    gen_random_uuid(),
    now()::text,
    now()::text,
    NULL,
    'PC-OFFICE-02',
    'sysadmin',
    'rootPass789',
    '10.0.0.15',
    FALSE,
    FALSE,
    NULL,
    NULL,
    NULL,
    'Ubuntu 22.04 LTS',
    'S24'
);

-- Softwares

INSERT INTO public.softwares (uuid, creationDate, modificationDate, deletedDate, name, location, description)
VALUES (gen_random_uuid(), now(), now(), null, 'Ansys R15', 'S24', 'Software para desarrollo, caracterización, optimización y simulación de antenas.');


-- Signal Devices

INSERT INTO public.signal_devices (uuid, creationDate, modificationDate, deletedDate, brand, name, type, freq_start, freq_stop, polarization, visaAddress, conexionType, location) VALUES 

(gen_random_uuid(), now(), now(), null, 'Agilent', '8714ES', 'PROCESING', '300 kHz', '3 GHz', null, 'TCPIP::192.168.79.150::SOCKET', 'Ethernet', 'PL15'),

(gen_random_uuid(), now(), now(), null, 'Rohde & Schwarz', 'FSH8', 'PROCESING', '300 kHz', '6 GHz', null, 'TCPIP::192.168.77.203::INSTR', 'Ethernet', 'S24'),

(gen_random_uuid(), now(), now(), null, 'Aaronia', 'ISOLog 3D Mobile 9030 PRO', 'ANTENA', '300 kHz', '8 GHz', 'X, Y, Z', null, 'Axial', 'S24');


-- Material Devices

INSERT INTO public.material_devices (uuid, creationDate, modificationDate, deletedDate, brand, name, type, use, location) VALUES 

(gen_random_uuid(), now(), now(), null, 'ADALM Pluto', 'SDR', 'ELECTRONIC', 'INVESTIGACION', 'S24');

