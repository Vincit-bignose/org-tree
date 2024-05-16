--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6 (Debian 15.6-1.pgdg120+2)
-- Dumped by pg_dump version 15.6 (Debian 15.6-1.pgdg120+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: django_org_tree
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO django_org_tree;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: django_org_tree
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: django_org_tree
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO django_org_tree;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django_org_tree
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: django_org_tree
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO django_org_tree;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: django_org_tree
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: django_org_tree
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO django_org_tree;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: django_org_tree
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO django_org_tree;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: django_org_tree
--

ALTER TABLE public.auth_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: django_org_tree
--

ALTER TABLE public.auth_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: django_org_tree
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO django_org_tree;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: django_org_tree
--

ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: django_org_tree
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO django_org_tree;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: django_org_tree
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: django_org_tree
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO django_org_tree;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: django_org_tree
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: django_org_tree
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO django_org_tree;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: django_org_tree
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: django_org_tree
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO django_org_tree;

--
-- Name: organization_company; Type: TABLE; Schema: public; Owner: django_org_tree
--

CREATE TABLE public.organization_company (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    headquarters_location character varying(255) NOT NULL,
    logo character varying(100) NOT NULL
);


ALTER TABLE public.organization_company OWNER TO django_org_tree;

--
-- Name: organization_company_id_seq; Type: SEQUENCE; Schema: public; Owner: django_org_tree
--

ALTER TABLE public.organization_company ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.organization_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: organization_department; Type: TABLE; Schema: public; Owner: django_org_tree
--

CREATE TABLE public.organization_department (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    company_id bigint NOT NULL,
    parent_department_id bigint,
    responsible_id bigint,
    supervisor_id bigint
);


ALTER TABLE public.organization_department OWNER TO django_org_tree;

--
-- Name: organization_department_id_seq; Type: SEQUENCE; Schema: public; Owner: django_org_tree
--

ALTER TABLE public.organization_department ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.organization_department_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: organization_employee; Type: TABLE; Schema: public; Owner: django_org_tree
--

CREATE TABLE public.organization_employee (
    id bigint NOT NULL,
    last_name character varying(100) NOT NULL,
    first_name character varying(100) NOT NULL,
    surname character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    phone1 character varying(30) NOT NULL,
    phone2 character varying(30) NOT NULL,
    photo character varying(100) NOT NULL,
    "position" character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    schedule character varying(255) NOT NULL
);


ALTER TABLE public.organization_employee OWNER TO django_org_tree;

--
-- Name: organization_employee_departments; Type: TABLE; Schema: public; Owner: django_org_tree
--

CREATE TABLE public.organization_employee_departments (
    id bigint NOT NULL,
    employee_id bigint NOT NULL,
    department_id bigint NOT NULL
);


ALTER TABLE public.organization_employee_departments OWNER TO django_org_tree;

--
-- Name: organization_employee_departments_id_seq; Type: SEQUENCE; Schema: public; Owner: django_org_tree
--

ALTER TABLE public.organization_employee_departments ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.organization_employee_departments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: organization_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: django_org_tree
--

ALTER TABLE public.organization_employee ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.organization_employee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: django_org_tree
--

COPY public.auth_group (id, name) FROM stdin;
1	Администрация
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: django_org_tree
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	32
2	1	33
3	1	34
4	1	35
5	1	36
6	1	25
7	1	26
8	1	27
9	1	28
10	1	29
11	1	30
12	1	31
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: django_org_tree
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Компания	7	add_company
26	Can change Компания	7	change_company
27	Can delete Компания	7	delete_company
28	Can view Компания	7	view_company
29	Can add Отдел	8	add_department
30	Can change Отдел	8	change_department
31	Can delete Отдел	8	delete_department
32	Can view Отдел	8	view_department
33	Can add Сотрудник	9	add_employee
34	Can change Сотрудник	9	change_employee
35	Can delete Сотрудник	9	delete_employee
36	Can view Сотрудник	9	view_employee
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: django_org_tree
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$720000$PZYe7VR2LjJNFBPG4Osg9x$jEmSwYlXkB2yX5vIj6v6bSU+yz/jKvYr6oZEwxUGnDQ=	2024-04-05 10:32:53.136596+00	t	rino			it@vinsit.ru	t	t	2024-04-04 13:42:17.630396+00
2	pbkdf2_sha256$720000$QKXdJMvmrMfqCKZHGLEMIi$7BidQVS6jCWw9N9TgQyN0pSJe44uDS6fx2j5o86XBps=	2024-04-05 11:31:13.918084+00	f	Vitalina	Виталина	Юхимчук		t	t	2024-04-04 13:58:20+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: django_org_tree
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	2	1
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: django_org_tree
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: django_org_tree
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-04-04 13:57:44.18234+00	1	Администрация	1	[{"added": {}}]	3	1
2	2024-04-04 13:58:21.121625+00	2	Vitalina	1	[{"added": {}}]	4	1
3	2024-04-04 14:00:25.939506+00	2	Vitalina	2	[{"changed": {"fields": ["First name", "Last name", "Staff status", "Groups"]}}]	4	1
4	2024-04-05 11:35:03.758551+00	1	СДЭК	1	[{"added": {}}]	7	2
5	2024-04-05 11:35:21.90808+00	1	СДЭК	2	[]	7	2
6	2024-04-05 13:22:48.117009+00	1	СДЭК - Отдел продаж	1	[{"added": {}}]	8	2
7	2024-04-05 13:23:56.410872+00	2	СДЭК - Отдел сопровождения	1	[{"added": {}}]	8	2
8	2024-04-05 13:24:25.612254+00	3	СДЭК - Отдел развития клиентской базы	1	[{"added": {}}]	8	2
9	2024-04-05 13:25:11.080031+00	4	СДЭК - Отдел логистики	1	[{"added": {}}]	8	2
10	2024-04-05 13:25:40.815364+00	5	СДЭК - Клиентский отдел	1	[{"added": {}}]	8	2
11	2024-04-05 13:26:56.797532+00	2	ВИНСИТ ЛОГИСТИК	1	[{"added": {}}]	7	2
12	2024-04-05 13:37:23.421451+00	6	СДЭК - Отдел развития	1	[{"added": {}}]	8	2
13	2024-04-05 13:41:32.635056+00	1	Торхачев Кирилл 	1	[{"added": {}}]	9	2
14	2024-04-05 13:43:41.45907+00	2	Юхимчук Виталина 	1	[{"added": {}}]	9	2
15	2024-04-05 13:47:42.008391+00	7	СДЭК - ИТ отдел	1	[{"added": {}}]	8	2
16	2024-04-05 13:48:38.97734+00	8	СДЭК - Бухгалтерия	1	[{"added": {}}]	8	2
17	2024-04-05 13:49:23.73354+00	9	ВИНСИТ ЛОГИСТИК - Отдел логистики	1	[{"added": {}}]	8	2
18	2024-04-05 13:50:27.932734+00	10	ВИНСИТ ЛОГИСТИК - Бухгалтерия	1	[{"added": {}}]	8	2
19	2024-04-06 10:55:37.649024+00	3	Курносов Кирилл 	1	[{"added": {}}]	9	2
20	2024-04-06 10:58:20.580918+00	4	Венедиктов Михаил 	1	[{"added": {}}]	9	2
21	2024-04-06 10:58:32.772493+00	3	Курносов Кирилл 	2	[{"changed": {"fields": ["\\u0410\\u0434\\u0440\\u0435\\u0441"]}}]	9	2
22	2024-04-06 10:58:40.314547+00	2	Юхимчук Виталина 	2	[{"changed": {"fields": ["\\u0410\\u0434\\u0440\\u0435\\u0441"]}}]	9	2
23	2024-04-06 10:58:47.5734+00	1	Торхачев Кирилл 	2	[{"changed": {"fields": ["\\u0410\\u0434\\u0440\\u0435\\u0441"]}}]	9	2
24	2024-04-06 11:02:21.230937+00	5	Мазуркевич Михаил 	1	[{"added": {}}]	9	2
25	2024-04-06 11:02:39.729876+00	5	Мазуркевич Михаил 	2	[{"changed": {"fields": ["\\u0422\\u0435\\u043b\\u0435\\u0444\\u043e\\u043d"]}}]	9	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: django_org_tree
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	organization	company
8	organization	department
9	organization	employee
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: django_org_tree
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-04-04 13:40:11.926566+00
2	auth	0001_initial	2024-04-04 13:40:11.984717+00
3	admin	0001_initial	2024-04-04 13:40:12.004809+00
4	admin	0002_logentry_remove_auto_add	2024-04-04 13:40:12.014414+00
5	admin	0003_logentry_add_action_flag_choices	2024-04-04 13:40:12.024338+00
6	contenttypes	0002_remove_content_type_name	2024-04-04 13:40:12.04475+00
7	auth	0002_alter_permission_name_max_length	2024-04-04 13:40:12.05495+00
8	auth	0003_alter_user_email_max_length	2024-04-04 13:40:12.064943+00
9	auth	0004_alter_user_username_opts	2024-04-04 13:40:12.073898+00
10	auth	0005_alter_user_last_login_null	2024-04-04 13:40:12.085907+00
11	auth	0006_require_contenttypes_0002	2024-04-04 13:40:12.087952+00
12	auth	0007_alter_validators_add_error_messages	2024-04-04 13:40:12.096186+00
13	auth	0008_alter_user_username_max_length	2024-04-04 13:40:12.107373+00
14	auth	0009_alter_user_last_name_max_length	2024-04-04 13:40:12.115982+00
15	auth	0010_alter_group_name_max_length	2024-04-04 13:40:12.126592+00
16	auth	0011_update_proxy_permissions	2024-04-04 13:40:12.135041+00
17	auth	0012_alter_user_first_name_max_length	2024-04-04 13:40:12.145046+00
18	organization	0001_initial	2024-04-04 13:40:12.199494+00
19	organization	0002_alter_company_options	2024-04-04 13:40:12.204461+00
20	organization	0003_alter_department_options_alter_employee_options_and_more	2024-04-04 13:40:12.226424+00
21	organization	0004_employee_address_employee_schedule	2024-04-04 13:40:12.24156+00
22	sessions	0001_initial	2024-04-04 13:40:12.250756+00
23	organization	0005_remove_department_logo	2024-04-05 07:59:58.405256+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: django_org_tree
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
zlfdwszxfjz3nccxifvynokor7olwkby	.eJxVjDsOwjAQBe_iGlle4_WHkj5niDbeNQ6gRIqTCnF3iJQC2jcz76V62tbab02WfmR1UaBOv9tA-SHTDvhO023WeZ7WZRz0ruiDNt3NLM_r4f4dVGr1W8dosvPOCkkM5xQCQ0jgTWJEKYixIFkPOUMx0RUvQoksDsLkgAHU-wPIljex:1rsgsP:ic9UuBvTPg94tpQGQiluymPhh3jZij0RViDsU3FFvpY	2024-04-19 10:32:53.143008+00
1zdf740804ht4azff2zme90pioljvra6	.eJxVjMsOwiAQRf-FtSEwAwO6dN9vIDylaiAp7cr479qkC93ec859Mee3tbpt5MXNiV0YsNPvFnx85LaDdPft1nnsbV3mwHeFH3Twqaf8vB7u30H1o35rlc4YyIhilQpRSdQ-QyGSpZBGiQmsklDAR9CYDVEQRgksBBasTpG9P8aCNuE:1rshmr:9eDsu-p-0eKv9ytQyQbYkgpYwdLu7X7hAz4ulBwxw0o	2024-04-19 11:31:13.921242+00
\.


--
-- Data for Name: organization_company; Type: TABLE DATA; Schema: public; Owner: django_org_tree
--

COPY public.organization_company (id, name, description, headquarters_location, logo) FROM stdin;
1	СДЭК		г. Щелково, ул. Талсинская, д. 6-Б	images/company_logos/sdek-logo-1190x600.jpg
2	ВИНСИТ ЛОГИСТИК		г. Щелково, ул. Талсинская, д. 6-Б	images/company_logos/Винсит_лого.jpeg
\.


--
-- Data for Name: organization_department; Type: TABLE DATA; Schema: public; Owner: django_org_tree
--

COPY public.organization_department (id, name, description, company_id, parent_department_id, responsible_id, supervisor_id) FROM stdin;
1	Отдел продаж		1	\N	\N	\N
2	Отдел сопровождения		1	\N	\N	\N
3	Отдел развития клиентской базы		1	\N	\N	\N
4	Отдел логистики		1	\N	\N	\N
5	Клиентский отдел		1	\N	\N	\N
6	Отдел развития		1	\N	\N	\N
7	ИТ отдел		1	\N	\N	\N
8	Бухгалтерия		1	\N	\N	\N
9	Отдел логистики		2	\N	\N	\N
10	Бухгалтерия		2	\N	\N	\N
\.


--
-- Data for Name: organization_employee; Type: TABLE DATA; Schema: public; Owner: django_org_tree
--

COPY public.organization_employee (id, last_name, first_name, surname, email, phone1, phone2, photo, "position", address, schedule) FROM stdin;
4	Венедиктов	Михаил		venediktov.m@cdek.ru	+79255703655			Руководитель отдела продаж	МО, г. Щёлково, ул. Талсинская, 6Б	Пн-Пт, 09:00-18:00
3	Курносов	Кирилл		kurnosov.k@cdek.ru	+79185156515			Бухгалтер	МО, г. Щёлково, ул. Талсинская, 6Б	Пн-Пт, 09:00-18:00
2	Юхимчук	Виталина		v.iukhimchuk@cdek.ru	+79852920515			Помощник директора по развитию	МО, г. Щёлково, ул. Талсинская, 6Б	Пн-Пт, 09:00-18:00
1	Торхачев	Кирилл		torhachev.k@cdek.ru	+79167184024			Директор по развитию	МО, г. Щёлково, ул. Талсинская, 6Б	Пн-Пт, 09:00-18:00
5	Мазуркевич	Михаил		md.mazurkevich@cdek.ru	+79035882236			Руководитель отдела сопровождения	МО, г. Щёлково, ул. Талсинская, 6Б	Пн-Пт, 09:00-18:00
\.


--
-- Data for Name: organization_employee_departments; Type: TABLE DATA; Schema: public; Owner: django_org_tree
--

COPY public.organization_employee_departments (id, employee_id, department_id) FROM stdin;
1	1	6
2	2	6
3	3	8
4	4	1
5	5	2
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_org_tree
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_org_tree
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 12, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_org_tree
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_org_tree
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_org_tree
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_org_tree
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_org_tree
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 25, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_org_tree
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_org_tree
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 23, true);


--
-- Name: organization_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_org_tree
--

SELECT pg_catalog.setval('public.organization_company_id_seq', 2, true);


--
-- Name: organization_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_org_tree
--

SELECT pg_catalog.setval('public.organization_department_id_seq', 10, true);


--
-- Name: organization_employee_departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_org_tree
--

SELECT pg_catalog.setval('public.organization_employee_departments_id_seq', 5, true);


--
-- Name: organization_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: django_org_tree
--

SELECT pg_catalog.setval('public.organization_employee_id_seq', 5, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: organization_company organization_company_pkey; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.organization_company
    ADD CONSTRAINT organization_company_pkey PRIMARY KEY (id);


--
-- Name: organization_department organization_department_pkey; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.organization_department
    ADD CONSTRAINT organization_department_pkey PRIMARY KEY (id);


--
-- Name: organization_employee_departments organization_employee_de_employee_id_department_i_95a52663_uniq; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.organization_employee_departments
    ADD CONSTRAINT organization_employee_de_employee_id_department_i_95a52663_uniq UNIQUE (employee_id, department_id);


--
-- Name: organization_employee_departments organization_employee_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.organization_employee_departments
    ADD CONSTRAINT organization_employee_departments_pkey PRIMARY KEY (id);


--
-- Name: organization_employee organization_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.organization_employee
    ADD CONSTRAINT organization_employee_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: organization_department_company_id_0ca6d3ca; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX organization_department_company_id_0ca6d3ca ON public.organization_department USING btree (company_id);


--
-- Name: organization_department_parent_department_id_f5fbe15b; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX organization_department_parent_department_id_f5fbe15b ON public.organization_department USING btree (parent_department_id);


--
-- Name: organization_department_responsible_id_d2dee7db; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX organization_department_responsible_id_d2dee7db ON public.organization_department USING btree (responsible_id);


--
-- Name: organization_department_supervisor_id_684925c9; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX organization_department_supervisor_id_684925c9 ON public.organization_department USING btree (supervisor_id);


--
-- Name: organization_employee_departments_department_id_ceb74d62; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX organization_employee_departments_department_id_ceb74d62 ON public.organization_employee_departments USING btree (department_id);


--
-- Name: organization_employee_departments_employee_id_1e3f0344; Type: INDEX; Schema: public; Owner: django_org_tree
--

CREATE INDEX organization_employee_departments_employee_id_1e3f0344 ON public.organization_employee_departments USING btree (employee_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organization_department organization_departm_company_id_0ca6d3ca_fk_organizat; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.organization_department
    ADD CONSTRAINT organization_departm_company_id_0ca6d3ca_fk_organizat FOREIGN KEY (company_id) REFERENCES public.organization_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organization_department organization_departm_parent_department_id_f5fbe15b_fk_organizat; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.organization_department
    ADD CONSTRAINT organization_departm_parent_department_id_f5fbe15b_fk_organizat FOREIGN KEY (parent_department_id) REFERENCES public.organization_department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organization_department organization_departm_responsible_id_d2dee7db_fk_organizat; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.organization_department
    ADD CONSTRAINT organization_departm_responsible_id_d2dee7db_fk_organizat FOREIGN KEY (responsible_id) REFERENCES public.organization_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organization_department organization_departm_supervisor_id_684925c9_fk_organizat; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.organization_department
    ADD CONSTRAINT organization_departm_supervisor_id_684925c9_fk_organizat FOREIGN KEY (supervisor_id) REFERENCES public.organization_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organization_employee_departments organization_employe_department_id_ceb74d62_fk_organizat; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.organization_employee_departments
    ADD CONSTRAINT organization_employe_department_id_ceb74d62_fk_organizat FOREIGN KEY (department_id) REFERENCES public.organization_department(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organization_employee_departments organization_employe_employee_id_1e3f0344_fk_organizat; Type: FK CONSTRAINT; Schema: public; Owner: django_org_tree
--

ALTER TABLE ONLY public.organization_employee_departments
    ADD CONSTRAINT organization_employe_employee_id_1e3f0344_fk_organizat FOREIGN KEY (employee_id) REFERENCES public.organization_employee(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--
