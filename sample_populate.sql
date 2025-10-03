truncate user_role cascade;
truncate usuario cascade;
truncate navbar cascade;
truncate role_navbar cascade;
truncate articles cascade;
truncate notifications cascade;
truncate user_notifications cascade;


-- User Role

INSERT INTO public.user_role (uuid, creationDate, modificationDate, deletedDate, name) VALUES ('e1b6c0a0-c439-4103-b447-a700edd23507', now(), now(), null, 'Administrador');

-- User

INSERT INTO public.usuario (uuid, creationDate, modificationDate, deletedDate, fullName, phone, email, password, sessionToken, sessionDate, id_role) SELECT 'c90fc766-db1a-4265-ba24-01eb3b7247c2', now(), now(), null, 'Ivan Recio', '644 45 32 91', 'ivan.recio@uah.es', '44d6bfa719f5ba08eaef9cdd5035d0c5f2f894da57f9140c34ab1c842387597889886d0880d314c4246d9a080b2ad10afc4bb41f95ea47e70e3ef201741fe0bc', null, null, r.id from user_role r where r.name = 'Administrador';

INSERT INTO public.usuario (uuid, creationDate, modificationDate, deletedDate, fullName, phone, email, password, sessionToken, sessionDate, id_role) SELECT '79b29c7d-7c09-4b79-9cbb-3d5a3a56fa00', now(), now(), null, 'Jorge Guillén', '644 45 32 91', 'jorge.guillenp@uah.es', '8869c155849c775743ab9ee1ff8f346fa26d89fa8f74cc97fbb422cede6875b95723891c21c6b996836550d43f2ba5146a30961609f5d14c07244244f05e74b0', null, null, r.id from user_role r where r.name = 'Administrador';

-- Navbars

INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('ab13e77b-5dcf-4cc8-ba00-3397c49604dc', now(), now(), null, 'DASH', 'Dashboards');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('188fba85-bd13-47cd-9944-fa789846df57', now(), now(), null, 'LABS', 'Laboratorios');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('82eb8aab-8bda-4f6e-8183-159402acdb82', now(), now(), null, 'ART', 'Artículos');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('a2d74875-7186-4abe-8af1-300dd4c7d7f2', now(), now(), null, 'PRO', 'Proyectos');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('4109bc2a-52bb-4418-b757-ae6f2b31c7d5', now(), now(), null, 'WORK', 'Trabajos');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('5762cbfa-8def-4920-9087-236fa58acf5f', now(), now(), null, 'TASK', 'Lista de Tareas');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES ('09abc513-78b2-4052-bc1d-9ff2b42ce121', now(), now(), null, 'USER', 'Usuarios');
INSERT INTO public.navbar (uuid, creationDate, modificationDate, deletedDate, code, title) VALUES (gen_random_uuid(), now(), now(), null, 'NOTI', 'Notificaciones');

-- Role_Navbar

INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT '61c4fe14-a3ec-4bdd-8e4f-0984d484a304', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'DASH' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT 'f2f7a877-6d80-4335-9c24-788405e4fd81', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'LABS' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT '92842523-8589-4db9-9761-bfbfb806b483', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'ART' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT '444273f0-19d1-43a4-b707-6907bed71603', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'PRO' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT '1240320f-ebe8-4024-a3f7-62e8b17ab8a0', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'WORK' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT 'ed933d9c-494d-462e-91ec-6c0438c42a7a', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'TASK' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT 'bc5622d2-3439-4206-85e3-d20c37d37801', now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'USER' AND r.name = 'Administrador';
INSERT INTO public.role_navbar (uuid, creationDate, modificationDate, deletedDate, id_navbar, id_role) SELECT gen_random_uuid(), now(), now(), null, n.id, r.id FROM navbar n CROSS JOIN user_role r WHERE n.code = 'NOTI' AND r.name = 'Administrador';


-- Articles

INSERT INTO public.articles (uuid, creationDate, modificationDate, deletedDate, title, doi, authors, url_github, type, cites, journal, publishYear) VALUES
(gen_random_uuid(), now(), now(), null, 'Efficient design of electromagnetic field exposure maps with multi-method evolutionary ensembles', '10.1016/j.envres.2025.121636', 'Jorge Guillén-Pina; Jorge Pérez-Aracil; Ricardo Chocano-del-Cerro; Rocío Sánchez-Montero; Pablo-Luis López-Espí; Sancho Salcedo-Sanz', null, 'ARTICLE', 0, 'Environmental Research', '2025'),

(gen_random_uuid(), now(), now(), null, 'Miniaturized Flat Archimedean Spiral Antenna', '10.13052/2025.ACES.J.400104', 'Miguel Fernandez-Munoz; Nerea Munoz-Mateos; Rocio Sanchez-Montero; Pablo Luis Lopez-Espi; Juan Antonio Martinez-Rojas; Efren Diez-Jimenez', null, 'ARTICLE', 0, 'Applied Computational Electromagnetics Society Journal (ACES)', '2025'),

(gen_random_uuid(), now(), now(), null, 'Optimal design of electromagnetic field exposure maps in large areas', '10.1016/J.EIAR.2024.107525', 'Lopez-Espi, P. L.; Sanchez-Montero, R.; Guillen-Pina, J.; Chocano-del-Cerro, R.; Rojas, J. A. M.', null, 'ARTICLE', 2, 'Environmental Impact Assessment Review', '2024'),

(gen_random_uuid(), now(), now(), null, 'Fully Integrated Miniaturized Wireless Power Transfer Rectenna for Medical Applications Tested inside Biological Tissues', '10.3390/electronics13163159', 'Miguel Fernandez-Munoz; Mohamed Missous; Mohammadreza Sadeghi; Pablo Luis Lopez-Espi; Rocio Sanchez-Montero; Juan Antonio Martinez-Rojas; Efren Diez-Jimenez', null, 'ARTICLE', 7, 'Electronics', '2024'),

(gen_random_uuid(), now(), now(), null, 'Model‐based systems engineering approach to the study of electromagnetic interference and compatibility in wireless powered microelectromechanical systems', '10.1002/sys.21733', 'Juan A. Martinez‐Rojas; Jose L. Fernandez‐Sanchez; Miguel Fernandez‐Munoz; Rocio Sanchez‐Montero; Pablo L. Lopez‐Espi; Efren Diez‐Jimenez', null, 'ARTICLE', 2, 'Systems Engineering', '2024'),

(gen_random_uuid(), now(), now(), null, 'Smartphone-Based Methodology Applied to Electromagnetic Field Exposure Assessment', '10.3390/s24113561', 'Pablo-Luis López-Espí; Rocío Sánchez-Montero; Jorge Guillén-Pina; Rubén Castro-Sanz; Ricardo Chocano-del-Cerro; Juan-Antonio Martínez-Rojas', null, 'ARTICLE', 3, 'Sensors', '2024'),

(gen_random_uuid(), now(), now(), null, 'Miniaturized High Gain Flexible Spiral Antenna Tested in Human-Like Tissues', '10.1109/TNANO.2022.3225912', 'Miguel Fernandez-Munoz; Rocio Sanchez-Montero; Pablo Luis Lopez-Espi; Juan A. Martinez-Rojas; Efren Diez-Jimenez', null, 'ARTICLE', 7, 'IEEE Transactions on Nanotechnology', '2022'),

(gen_random_uuid(), now(), now(), null, 'New Cable Delay Measurement System for VGOS Stations', '10.3390/s22062308', 'Pablo García Carreño; Javier González-García; María Patino-Esteban; Francisco Javier Beltrán Martínez; Marta Bautista-Durán; Pablo-Luis Lopez-Espi; José A. López-Pérez', null, 'ARTICLE', 3, 'Sensors', '2022'),

(gen_random_uuid(), now(), now(), null, 'Model-Based Systems Engineering Applied to Trade-Off Analysis of Wireless Power Transfer Technologies for Implanted Biomedical Microdevices', '10.3390/s21093201', 'Juan Antonio Martínez Rojas; José L. Fernández; Rocio Sanchez-Montero; Pablo-Luis Lopez-Espi; Efren Diez-Jimenez', null, 'ARTICLE', 26, 'Sensors', '2021'),

(gen_random_uuid(), now(), now(), null, 'Design of a Multi-Band Microstrip Textile Patch Antenna for LTE and 5G Services with the CRO-SL Ensemble', '10.3390/app10031168', 'Carlos Camacho-Gomez; Rocio Sanchez-Montero; Diego Martínez-Villanueva; Pablo-Luis Lopez-Espi; Sancho Salcedo-Sanz', null, 'ARTICLE', 31, 'Applied Sciences', '2020'),

(gen_random_uuid(), now(), now(), null, 'Analysis of the geometric parameters influence in PCB fixtures for 2D multipole magnetization patterning of thin layer micro-magnets', '10.3233/JAE-180121', 'Martinez-Munoz, Miriam; Diez-Jimenez, Efren; Sanchez-Montero, Rocio; Luis Lopez-Espi, Pablo; Antonio Martinez-Rojas, Juan', null, 'ARTICLE', 8, 'International Journal of Applied Electromagnetics and Mechanics', '2019'),

(gen_random_uuid(), now(), now(), null, 'Bend and Moisture Effects on the Performance of a U-Shaped Slotted Wearable Antenna for Off-Body Communications in an Industrial Scientific Medical (ISM) 2.4 GHz band', '10.3390/S19081804', 'Sanchez-Montero, Rocio; Lopez-Espi, Pablo-Luis; Alen-Cordero, Cristina; Martinez-Rojas, Juan-Antonio', null, 'ARTICLE', 31, 'Sensors', '2019'),

(gen_random_uuid(), now(), now(), null, 'Filtering of Mammograms Based on Convolution with Directional Fractal Masks to Enhance Microcalcifications', '10.3390/app9061194', 'Rocio Sanchez-Montero; Juan-Antonio Martinez-Rojas; Pablo-Luis Lopez-Espi; Luis Nuñez-Martin; Efren Diez-Jimenez', null, 'ARTICLE', 5, 'Applied Sciences', '2019'),

(gen_random_uuid(), now(), now(), null, 'Optimal Design of a Planar Textile Antenna for Industrial Scientific Medical (ISM) 2.4 GHz Wireless Body Area Networks (WBAN) with the CRO-SL Algorithm', '10.3390/s18071982', 'Rocio Sanchez-Montero; Carlos Camacho-Gómez; Pablo-Luis López-Espi; Sancho Salcedo-Sanz', null, 'ARTICLE', 34, 'Sensors', '2018'),

(gen_random_uuid(), now(), now(), null, 'Numerical Study of Focusing Effects of Microwaves inside Wood Due to Timber Ring Structure', '10.3390/f9030106', 'Rocio Sanchez-Montero; Pablo-Luis López-Espi; Juan Antonio Martínez-Rojas; Jesús Alpuente-Hermosilla; Cristina Alen-Cordero', null, 'ARTICLE', 7, 'Forests', '2018'),

(gen_random_uuid(), now(), now(), null, 'Effect of the anatomical structure, wood properties and machining conditions on surface roughness of wood', '10.4067/S0718-221X2017005000018', 'Laina, R.; Sanz-Lobera, A.; Villasante, A.; López-Espí, P.; Martínez-Rojas, J.A.; Alpuente, J.; Sánchez-Montero, R.; Vignote, S.', null, 'ARTICLE', 49, 'Maderas: Ciencia y Tecnologia', '2017'),

(gen_random_uuid(), now(), now(), null, 'Long term variations measurement of electromagnetic field exposures in Alcalá de Henares (Spain)', '10.1016/j.scitotenv.2017.03.131', 'Sánchez-Montero, R.; Alén-Cordero, C.; López-Espí, P.L.; Rigelsford, J.M.; Aguilera-Benavente, F.; Alpuente-Hermosilla, J.', null, 'ARTICLE', 23, 'Science of the Total Environment', '2017'),

(gen_random_uuid(), now(), now(), null, 'Geodetic VLBI ultra low noise broad-band receiver for 13 meter VGOS radiotelescopes', '10.1109/EuMIC.2016.7777595', 'García-Carreño, P.; García-Álvaro, S.; López-Pérez, J.A.; Patino-Esteban, M.; Serna, J.M.; Vaquero-Jiménez, B.; López-Fernández, J.A.; López-Espí, P.-L.; Sánchez-Montero, R.', null, 'CONFERENCE', 11, 'EuMIC 2016 - 11th European Microwave Integrated Circuits Conference', '2016'),

(gen_random_uuid(), now(), now(), null, 'Multi frequency feed system for high magnification Cassegrain radiotelescopes at millimeter wavelengths', '10.1109/EuMC.2016.7824583', 'Ruiz, S.L.; Martínez, F.T.; Fernández, J.A.L.; Han, S.-T.;López-Espí, P.-L.; Sánchez-Montero, R.; Martínez, F.J.B.', null, 'CONFERENCE', 1, 'European Microwave Week 2016: ''Microwave Everywhere'', EuMW 2016 - Conference Proceedings; 46th European Microwave Conference, EuMC 2016', '2016'),

(gen_random_uuid(), now(), now(), null, 'Optimization of a Conical Corrugated Antenna Using Multiobjective Heuristics for Radio-Astronomy Applications', '10.1155/2016/7024704', 'S. López-Ruiz; R. Sánchez Montero; F. Tercero-Martínez; P. L. López-Espí; J. A. López-Fernandez', null, 'ARTICLE', 6, 'International Journal of Antennas and Propagation', '2016'),

(gen_random_uuid(), now(), now(), null, 'A decision aid method for lesion delineation based on directional fractal filtering', null, 'Sanchez-Montero, R.; Nunez-Martin, L.; Lopez-Espi, P. L.; Martinez-Rojas, J. A.; Castro-Tejero, P.; Alpuente-Hermosilla, J.', null, 'ARTICLE', 0, 'Radiotherapy and Oncology', '2015'),

(gen_random_uuid(), now(), now(), null, 'An active multiband antenna for future wireless communications', '10.1109/EuCAP.2014.6902456', 'Sanchez-Montero, R.; Rigelsford, J.M.; Lopez-Espi, P.L.; Alpuente-Hermosilla, J.', null, 'CONFERENCE', 2, '8th European Conference on Antennas and Propagation, EuCAP 2014', '2014'),

(gen_random_uuid(), now(), now(), null, 'Polyspectral technique for the analysis of stress-waves characteristics and species recognition in wood veneers', '10.1016/j.apacoust.2014.06.003', 'Sánchez Montero, R.; López Espí, P.L.; Alpuente, J.; Rojas, J.A.M.; Vignote, S.', null, 'ARTICLE', 2, 'Applied Acoustics', '2014'),

(gen_random_uuid(), now(), now(), null, 'Multiple band antenna optimization using heuristics and bio-inspired optimization algorithms', '10.1109/LAPC.2012.6403028', 'Sanchez-Montero, R.; Lopez-Espi, P.L.; Cruz-Rodriguez, A.C.; Rigelsford, J.M.', null, 'CONFERENCE', 6, 'LAPC 2012 - 2012 Loughborough Antennas and Propagation Conference', '2012'),

(gen_random_uuid(), now(), now(), null, 'Spectral biomimetic technique for wood classification inspired by human echolocation', '10.1155/2012/378361', 'Martínez Rojas, J.A.; Vignote Peña, S.; Alpuente Hermosilla, J.; Sánchez Montero, R.; López Espí, P.L.; Martínez Rojas, I.', null, 'ARTICLE', 2, 'Advances in Acoustics and Vibration', '2012'),

(gen_random_uuid(), now(), now(), null, 'An experience to include advanced optimization techniques in microwave undergraduate laboratories', null, 'López-Espi, P.; Salcedo-Sanz, S.; Sánchez-Montero, R.; Portilla-Figueras, A.', null, 'CONFERENCE', 0, 'CSEDU 2010 - 2nd International Conference on Computer Supported Education, Proceedings', '2010'),

(gen_random_uuid(), now(), now(), null, 'Nitrates/nitrites concentration estimation in wastewater samples using transmittance curve models optimized by evolutionary computation techniques', '10.2166/hydro.2010.016', 'López-Espí, P.; Salcedo-Sanz, S.; Pérez-Bellido, Á.M.; De Bustamante, I.; López-Ferreras, F.', null, 'ARTICLE', 1, 'Journal of Hydroinformatics', '2010'),

(gen_random_uuid(), now(), now(), null, 'Physical Analysis of Several Organic Signals for Human Echolocation: Hand and Finger Produced Pulses', '10.3813/AAA.918368', 'Martinez Rojas, Juan Antonio; Alpuente Hermosilla, Jesús; Sanchez Montero, Rocio; Lopez Espi, Pablo Luis', null, 'ARTICLE', 40, 'Acta Acustica United with Acustica', '2010'),

(gen_random_uuid(), now(), now(), null, 'Curve fitting using heuristics and bio-inspired optimization algorithms for experimental data processing in chemistry', '10.1016/j.chemolab.2008.11.004', 'Polo-Corpa, M.J.; Salcedo-Sanz, S.; Pérez-Bellido, A.M.; López-Espí, P.; Benavente, R.; Pérez, E.', null, 'ARTICLE', 18, 'Chemometrics and Intelligent Laboratory Systems', '2009'),

(gen_random_uuid(), now(), now(), null, 'Estimating the Concentration of Nitrates in Water Samples Using PSO and VNS Approaches', '10.1007/978-3-642-01129-0_17', 'Lopez-Espi, Pablo; Salcedo-Sanz, Sancho; Perez-Bellido, A. M.; Ortiz-Garcia, Emilio G.; Alonso-Garrido, Oscar; Portilla-Figueras, Antonio', null, 'CONFERENCE', 0, 'International Conference on Medical Image Computing and Computer Assisted Intervention - MICCAI', '2009'),

(gen_random_uuid(), now(), now(), null, 'Physical Analysis of Several Organic Signals for Human Echolocation: Oral Vacuum Pulses', '10.3813/AAA.918155', 'Martinez Rojas, Juan Antonio; Alpuente Hermosilla, Jesús; Sanchez Montero, Rocio; Lopez Espi, Pablo Luis', null, 'ARTICLE', 96, 'Acta Acustica United with Acustica', '2009'),

(gen_random_uuid(), now(), now(), null, 'Using electrical resistivity tomography (ERT) to evaluate the infiltration in land application systems. A case study in the Carrion de los Cespedes wastewater treatment plant (Seville, Spain)', '10.5004/DWT.2009.364', 'Lillo, F. J.; Gomez-Ortiz, D.; Martin-Crespo, T.; Carreno, F.; De Bustamante, I.; Lopez, P. L.', null, 'ARTICLE', 0, 'Desalination and Water Treatment', '2009'),

(gen_random_uuid(), now(), now(), null, 'Electromagnetic Analysis of Band-Pass Filters Using Half Wavelength Hollow Resonators', null, 'Lopez, Pablo L.; Zamanillo, Jose M.; Sanchez, Rocio; Pasamon, Jose F.; Calvo, Francisco; Perez, Carlos', null, 'ARTICLE', 0, 'DIWEB '' 09: PROCEEDINGS OF THE 9TH WSEAS INTERNATIONAL CONFERENCE ON DISTANCE LEARNING AND WEB ENGINEERING', '2008'),

(gen_random_uuid(), now(), now(), null, 'Empirical characterization of wood surfaces by means of iterative autocorrelation of laser speckle patterns', '10.2528/PIER07112706', 'Rojas, J.A.M.; Alpuente, J.; Bolívar, E.; López-Espí, P.; Rojas, I.M.; Vignote, S.', null, 'ARTICLE', 7, 'Progress in Electromagnetics Research', '2008'),

(gen_random_uuid(), now(), now(), null, 'Fractal convolution techniques for speckle noise reduction', null, 'Martínez-Rojas, J.-A.; Sánchez-Montero, R.; Alpuente-Hermosilla, J.; López-Espí, P.', null, 'CONFERENCE', 1, '2008 5th European Radar Conference Proceedings, EuRAD 2008', '2008'),

(gen_random_uuid(), now(), now(), null, 'High Frequency Circuits and Systems', null, 'Sainz de la Maza, Jose Maria Zamanillo; Espi, Pablo Luis Lopez', null, 'ARTICLE', 0, 'DIWEB '' 09: PROCEEDINGS OF THE 9TH WSEAS INTERNATIONAL CONFERENCE ON DISTANCE LEARNING AND WEB ENGINEERING', '2008'),

(gen_random_uuid(), now(), now(), null, 'Microwave Active Devices modeling using Verilog-A description language', null, 'Zamanillo, J. M.; Lopez-Espi, P. L.; Rivera, Sergio; Cobo, Beatriz; Torres, Raquel; Mediavilla, Angel; Perez-Vega, C', null, 'ARTICLE', 0, 'DIWEB '' 09: PROCEEDINGS OF THE 9TH WSEAS INTERNATIONAL CONFERENCE ON DISTANCE LEARNING AND WEB ENGINEERING', '2008'),

(gen_random_uuid(), now(), now(), null, 'The Versatility of Verilog-A Based Models on Commercial Microwave Simulators', '10.1109/INMMIC.2008.4745740', 'Zamanillo, J. M.; Zamanillo, I.; Campelo, J.; Mediavilla, A.; Perez-Vega, C.; Lopez-Espi, P. L.; Torres, R.', null, 'ARTICLE', 2, 'WORKSHOP ON INTEGRATED NONLINEAR MICROWAVE AND MILLIMETRE- WAVE CIRCUITS (INMMIC)', '2008'),

(gen_random_uuid(), now(), now(), null, 'Accurate model of electromagnetic wave propagation in unidimensional photonic crystals with defects', '10.1163/156939307781749795', 'Rojas, J.A.M.; Alpuente, J.; López-Espí, P.; García, P.', null, 'ARTICLE', 15, 'Journal of Electromagnetic Waves and Applications', '2007'),

(gen_random_uuid(), now(), now(), null, 'A general development for fleets control system', null, 'Granja-Antón, J.C.; Alpuente-Hermosilla, J.; Sánchez-Montero, R.; López-Espí, P.L.', null, 'ARTICLE', 0, 'WSEAS Transactions on Communications', '2006'),

(gen_random_uuid(), now(), now(), null, 'Study of the Optimal Waveforms for Non-Destructive Spectral Analysis of Aqueous Solutions by Means of Audible Sound and Optimization Algorithms', '10.3390/app11167301', 'Pilar García Díaz; Manuel Utrilla Manso; Jesús Alpuente Hermosilla; Juan A. Martínez Rojas', null, 'ARTICLE', 1, 'Applied Sciences', '2021'),

(gen_random_uuid(), now(), now(), null, 'A collapsed-cone based transit EPID dosimetry method', '10.1016/j.ejmp.2018.01.006', 'Jaime Martínez-Ortega; María Pinto-Monedero; Nuría Gómez-González; Naresh B.-Tolani; Pablo Castro-Tejero; Miguel Castanedo-Álvarez; Luis Núñez-Martín; Rocio Sanchez-Montero', null, 'ARTICLE', 6, 'Physica Medica', '2018'),

(gen_random_uuid(), now(), now(), null, 'Towards Miniaturization of Magnetic Gears: Torque Performance Assessment', '10.3390/mi9010016', 'Efren Díaz-Jimenez; Rocio Sanchez-Montero; Miriam Martinez-Muñoz', null, 'ARTICLE', 23, 'Micromachines', '2017'),

(gen_random_uuid(), now(), now(), null, 'HYBRID PIFA-PATCH ANTENNA OPTIMIZED BY EVOLUTIONARY PROGRAMMING', '10.2528/pier10072804', 'Rocio Sanchez-Montero; Sancho Salcedo-Sanz; J. A. Portilla-Figueras; Richard Langley', null, 'ARTICLE', 24, 'Progress In Electromagnetics Research', '2010'),

(gen_random_uuid(), now(), now(), null, 'RIGOROUS FULL VECTORIAL ANALYSIS OF ELECTROMAGNETIC WAVE PROPAGATION IN 1D', '10.2528/pier06042501', 'Juan Antonio Martinez Rojas; Jesús Alpuente; JosÃ© PiÃ±eiro; Rocio Sanchez-Montero', null, 'ARTICLE', 41, 'Progress In Electromagnetics Research', '2006'),

(gen_random_uuid(), now(), now(), null, 'Design Accelerator: uso de videotutoriales para el diseño de máquinas en el MUII', '978-84-16978-11-3', 'Del Castillo, H. y Nogueiras, G. (Ed.)', null, 'BOOK', 0, 'Nuevas apuestas educativas [Recurso electrónico]', '2017'),

(gen_random_uuid(), now(), now(), null, 'Microondas prácticas con genesys', '978-84-8138-902-9', 'Rocio Sánchez Montero', null, 'BOOK', 0, null, '2011'),

(gen_random_uuid(), now(), now(), null, 'Wood species identification using stress-wave analysis in the audible range', '10.1016/j.apacoust.2011.05.016', 'Juan A. Martinez‐Rojas; Jesús Alpuente-Hermosilla; D. Postigo; I.M Rojas; Santiago Vignote', null, 'ARTICLE', 0, 'Applied Acoustics', '2011'),

(gen_random_uuid(), now(), now(), null, 'Fractal-based image enhancement techniques inspired by differential interference contrast microscopy', '10.1088/1464-4258/11/6/065503', 'Juan A. Martinez‐Rojas; Jesús Alpuente-Hermosilla; I.M Rojas; Santiago Vignote', null, 'ARTICLE', 6, 'Journal of Optics A: Pure and Applied Optics', '2009'),

(gen_random_uuid(), now(), now(), null, 'Modelado eficiente de dispositivos activos de microondas utilizando código Verilog-A', '978-84-613-4894-7', 'Maciá Pérez, F. (Ed.)', null, 'BOOK', 0, 'Desarrollo de grandes aplicaciones de red', '2009'),

(gen_random_uuid(), now(), now(), null, 'Study of leaky modes in high contrast Bragg fibres', '10.1088/1464-4258/9/10/009', 'Juan A. Martinez‐Rojas; Jesús Alpuente-Hermosilla; P. Lopez; Rocio Sanchez-Montero', null, 'ARTICLE', 5, 'Journal of Optics A: Pure and Applied Optics', '2007'),

(gen_random_uuid(), now(), now(), null, 'Líneas de transmisión y redes de adaptación en circuitos de microondas', '84-8138-461-5', 'Alpuente Hermosilla, Jesús', null, 'BOOK', 4, null, '2006'),

(gen_random_uuid(), now(), now(), null, 'Microondas prácticas', '84-8138-617-0', 'Sanchez-Montero, R.; Lopez-Espi, P.L.; Alpuente-Hermosilla, Jesús', null, 'BOOK', 1, null, '2004'),

(gen_random_uuid(), now(), now(), null, 'Teoría de circuitos de microondas: parámetros S.', '84-8138-623-5', 'Sanchez-Montero, R.', null, 'BOOK', 0, null, '2004'),

(gen_random_uuid(), now(), now(), null, 'Aplicación de tecnologías limpias en riegos con aguas residuales: distribución automatizada y reutilización', '84-7800-811-X', 'Márquez Moreno, M.C.; Ramos Castellanos P. (Ed.)', null, 'BOOK', 0, 'Avances en calidad ambiental', '2002'),

(gen_random_uuid(), now(), now(), null, 'Bone density changes in mouse offspring after 50-Hz, 15-μT electromagnetic field long-term exposure of two generations', null, 'R. Vera,M. L. Picazo,M. Royuela,M. A. Romo,J. Alpuente &J. L. Bardasano', null, 'ARTICLE', 0, 'Electromagnetic Biology and Medicine', '1999'),

(gen_random_uuid(), now(), now(), null, 'Televisión', '84-86981-02-6', 'Alpuente Hermosilla, Jesús', null, 'BOOK', 0, null, '1988'),

(gen_random_uuid(), now(), now(), null, 'Comparison Between Broadband and Personal Exposimeter Measurements for EMF Exposure Map Development Using Evolutionary Programming', 'https://doi.org/10.3390/app15137471', 'Nájera, Alberto; Sánchez Montero, Rocio; González Rubio, Jesús; Guillén Pina, Jorge; Chocano del Cerro, Ricardo; López Espí, Pablo Luis', null, 'ARTICLE', 0, 'Applied Science', '2025');

-- Notifications

INSERT INTO public.notifications (uuid, creationDate, modificationDate, deletedDate, priority, title, message) VALUES ('78d95d24-bc28-4428-8999-bbd7597eb879', now(), now(), null, 'HIGH', 'Usuarios CAU', 'Recordatorio para dar de alta nuevamente el accesso de los usuarios en el CAU');

-- User_Notifications

INSERT INTO public.user_notifications (uuid, creationDate, modificationDate, deletedDate, id_notification, id_user) SELECT gen_random_uuid(), now(), now(), null, n.id, u.id FROM notifications n CROSS JOIN usuario u WHERE n.uuid = '78d95d24-bc28-4428-8999-bbd7597eb879' AND u.email = 'ivan.recio@uah.es';