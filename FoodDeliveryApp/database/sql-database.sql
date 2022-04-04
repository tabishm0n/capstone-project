--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-04-04 17:02:55

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

DROP DATABASE capstoneproject;
--
-- TOC entry 3414 (class 1262 OID 16394)
-- Name: capstoneproject; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE capstoneproject WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Canada.1252';


ALTER DATABASE capstoneproject OWNER TO postgres;

\connect capstoneproject

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
-- TOC entry 224 (class 1259 OID 50213)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id bigint NOT NULL,
    category_name character varying(50) NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 50212)
-- Name: category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_category_id_seq OWNER TO postgres;

--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 223
-- Name: category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;


--
-- TOC entry 226 (class 1259 OID 50236)
-- Name: deliverer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deliverer (
    deliverer_id bigint NOT NULL,
    wallet double precision NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.deliverer OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 50235)
-- Name: deliverer_deliverer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deliverer_deliverer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deliverer_deliverer_id_seq OWNER TO postgres;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 225
-- Name: deliverer_deliverer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deliverer_deliverer_id_seq OWNED BY public.deliverer.deliverer_id;


--
-- TOC entry 228 (class 1259 OID 50248)
-- Name: deliverer_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deliverer_info (
    devliererinfo_id bigint NOT NULL,
    deliverer_id bigint NOT NULL,
    order_id bigint NOT NULL,
    earnings double precision NOT NULL
);


ALTER TABLE public.deliverer_info OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 50247)
-- Name: deliverer_info_devliererinfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.deliverer_info_devliererinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deliverer_info_devliererinfo_id_seq OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 227
-- Name: deliverer_info_devliererinfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.deliverer_info_devliererinfo_id_seq OWNED BY public.deliverer_info.devliererinfo_id;


--
-- TOC entry 209 (class 1259 OID 50048)
-- Name: ingredients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingredients (
    ingredients_id bigint NOT NULL,
    ingredients character varying(255) NOT NULL,
    item_name character varying(50) NOT NULL,
    menuitem_id integer NOT NULL
);


ALTER TABLE public.ingredients OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 50051)
-- Name: ingredients_ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ingredients_ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_ingredients_id_seq OWNER TO postgres;

--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 210
-- Name: ingredients_ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ingredients_ingredients_id_seq OWNED BY public.ingredients.ingredients_id;


--
-- TOC entry 211 (class 1259 OID 50052)
-- Name: menu_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_item (
    menuitem_id bigint NOT NULL,
    item_name character varying(50) NOT NULL,
    description character varying(255) NOT NULL,
    price numeric(3,1) NOT NULL,
    active boolean NOT NULL,
    restaurant_id bigint NOT NULL,
    category bigint NOT NULL
);


ALTER TABLE public.menu_item OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 50055)
-- Name: menu_item_menuitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_item_menuitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_item_menuitem_id_seq OWNER TO postgres;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 212
-- Name: menu_item_menuitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_item_menuitem_id_seq OWNED BY public.menu_item.menuitem_id;


--
-- TOC entry 213 (class 1259 OID 50056)
-- Name: orderitems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderitems (
    orderitem_id bigint NOT NULL,
    order_id bigint NOT NULL,
    menuitem_id bigint NOT NULL,
    quantity bigint NOT NULL,
    order_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.orderitems OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 50059)
-- Name: orderitems_orderitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderitems_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orderitems_orderitem_id_seq OWNER TO postgres;

--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 214
-- Name: orderitems_orderitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderitems_orderitem_id_seq OWNED BY public.orderitems.orderitem_id;


--
-- TOC entry 215 (class 1259 OID 50060)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id bigint NOT NULL,
    user_id bigint NOT NULL,
    order_status bigint NOT NULL,
    restaurant_id bigint NOT NULL,
    orders_order_date timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 50063)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 216
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 217 (class 1259 OID 50064)
-- Name: restaurant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant (
    restaurant_id bigint NOT NULL,
    city character varying(50) NOT NULL,
    street_address character varying(50) NOT NULL,
    operational boolean NOT NULL,
    description character varying(50) NOT NULL,
    restaurant_name character varying(50) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.restaurant OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 50067)
-- Name: restaurant_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurant_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurant_restaurant_id_seq OWNER TO postgres;

--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 218
-- Name: restaurant_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurant_restaurant_id_seq OWNED BY public.restaurant.restaurant_id;


--
-- TOC entry 219 (class 1259 OID 50068)
-- Name: status_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status_list (
    status_id bigint NOT NULL,
    status_name character varying(50) NOT NULL
);


ALTER TABLE public.status_list OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 50071)
-- Name: status_list_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_list_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_list_status_id_seq OWNER TO postgres;

--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 220
-- Name: status_list_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.status_list_status_id_seq OWNED BY public.status_list.status_id;


--
-- TOC entry 221 (class 1259 OID 50072)
-- Name: user_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_table (
    id bigint NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    city character varying(20) NOT NULL,
    street_address character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    phone character varying(10) NOT NULL,
    user_type character varying(50) NOT NULL,
    payment character varying(50) NOT NULL,
    registeration_date timestamp without time zone NOT NULL
);


ALTER TABLE public.user_table OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 50075)
-- Name: user_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_table_id_seq OWNER TO postgres;

--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 222
-- Name: user_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_table_id_seq OWNED BY public.user_table.id;


--
-- TOC entry 3216 (class 2604 OID 50216)
-- Name: category category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN category_id SET DEFAULT nextval('public.category_category_id_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 50239)
-- Name: deliverer deliverer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverer ALTER COLUMN deliverer_id SET DEFAULT nextval('public.deliverer_deliverer_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 50251)
-- Name: deliverer_info devliererinfo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverer_info ALTER COLUMN devliererinfo_id SET DEFAULT nextval('public.deliverer_info_devliererinfo_id_seq'::regclass);


--
-- TOC entry 3209 (class 2604 OID 50076)
-- Name: ingredients ingredients_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN ingredients_id SET DEFAULT nextval('public.ingredients_ingredients_id_seq'::regclass);


--
-- TOC entry 3210 (class 2604 OID 50077)
-- Name: menu_item menuitem_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_item ALTER COLUMN menuitem_id SET DEFAULT nextval('public.menu_item_menuitem_id_seq'::regclass);


--
-- TOC entry 3211 (class 2604 OID 50078)
-- Name: orderitems orderitem_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems ALTER COLUMN orderitem_id SET DEFAULT nextval('public.orderitems_orderitem_id_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 50079)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 50080)
-- Name: restaurant restaurant_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant ALTER COLUMN restaurant_id SET DEFAULT nextval('public.restaurant_restaurant_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 50081)
-- Name: status_list status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_list ALTER COLUMN status_id SET DEFAULT nextval('public.status_list_status_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 50082)
-- Name: user_table id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_table ALTER COLUMN id SET DEFAULT nextval('public.user_table_id_seq'::regclass);


--
-- TOC entry 3404 (class 0 OID 50213)
-- Dependencies: 224
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category VALUES (1, 'Appetizer');
INSERT INTO public.category VALUES (2, 'Main Course');
INSERT INTO public.category VALUES (3, 'Sides');
INSERT INTO public.category VALUES (4, 'Dessert');
INSERT INTO public.category VALUES (5, 'Beverages');


--
-- TOC entry 3406 (class 0 OID 50236)
-- Dependencies: 226
-- Data for Name: deliverer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.deliverer VALUES (2, 9.319999694824219, 9);
INSERT INTO public.deliverer VALUES (1, 7.159999847412109, 8);
INSERT INTO public.deliverer VALUES (14, 30.34000015258789, 31);
INSERT INTO public.deliverer VALUES (3, 5.630000114440918, 10);


--
-- TOC entry 3408 (class 0 OID 50248)
-- Dependencies: 228
-- Data for Name: deliverer_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.deliverer_info VALUES (9, 3, 15, 5.630000114440918);


--
-- TOC entry 3389 (class 0 OID 50048)
-- Dependencies: 209
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ingredients VALUES (1, 'Butter', 'Butter Chicken', 1);
INSERT INTO public.ingredients VALUES (2, 'Onion', 'Butter Chicken', 1);
INSERT INTO public.ingredients VALUES (3, 'Garlic', 'Butter Chicken', 1);
INSERT INTO public.ingredients VALUES (4, 'Tomato Sauce', 'Butter Chicken', 1);
INSERT INTO public.ingredients VALUES (5, 'Cream', 'Butter Chicken', 1);
INSERT INTO public.ingredients VALUES (6, 'Chicken', 'Butter Chicken', 1);
INSERT INTO public.ingredients VALUES (7, 'Salt', 'Butter Chicken', 1);
INSERT INTO public.ingredients VALUES (8, 'Oil', 'Butter Chicken', 1);


--
-- TOC entry 3391 (class 0 OID 50052)
-- Dependencies: 211
-- Data for Name: menu_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.menu_item VALUES (1, 'Butter Chicken', 'Delicious Indian Curry with tender Chicken', 30.5, true, 1, 2);
INSERT INTO public.menu_item VALUES (2, 'Biryani', 'Exquisite Hyderabadi Biryani served with Chicken', 42.5, true, 1, 2);
INSERT INTO public.menu_item VALUES (4, 'Samosa', 'Indian Snack filled with flavored masehed Potatoes', 10.5, true, 1, 1);
INSERT INTO public.menu_item VALUES (3, 'Chinese Noodles', 'Hand-made Noodles served in hot Chicken broth', 18.0, true, 2, 2);


--
-- TOC entry 3393 (class 0 OID 50056)
-- Dependencies: 213
-- Data for Name: orderitems; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orderitems VALUES (24, 15, 4, 1, '2022-04-04 00:52:29');


--
-- TOC entry 3395 (class 0 OID 50060)
-- Dependencies: 215
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders VALUES (15, 2, 4, 1, '2022-04-04 00:52:29');


--
-- TOC entry 3397 (class 0 OID 50064)
-- Dependencies: 217
-- Data for Name: restaurant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.restaurant VALUES (1, 'Toronto', 'Carlson St.', true, 'Small Family run Restaurant', 'Indian Curry', 3);
INSERT INTO public.restaurant VALUES (2, 'Sudbury', 'Eglinton St.', true, 'Authentic Chinese Cuisine', 'China Town', 4);
INSERT INTO public.restaurant VALUES (3, 'Toronto', 'Thorn St.', true, 'Country Side beautiful fresh Steak!', 'BBQ Corner', 5);
INSERT INTO public.restaurant VALUES (4, 'Brampton', 'Wellesley St.', true, 'World Famous Burger fast-food chain', 'MC Chicken', 6);


--
-- TOC entry 3399 (class 0 OID 50068)
-- Dependencies: 219
-- Data for Name: status_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.status_list VALUES (1, 'Order Created');
INSERT INTO public.status_list VALUES (2, 'Order Prepared');
INSERT INTO public.status_list VALUES (3, 'Order out for Delivery');
INSERT INTO public.status_list VALUES (4, 'Order Delivered');


--
-- TOC entry 3401 (class 0 OID 50072)
-- Dependencies: 221
-- Data for Name: user_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_table VALUES (31, 'maqdoom', '123', 'Toronto', 'Bay St', 'Maqdoom', 'Bhai', 'maqdoom@gmail.com', '7657640875', 'Delivery', '5478556408', '2022-03-22 18:23:00.720102');
INSERT INTO public.user_table VALUES (5, 'chris', '123', 'Toronto', 'Jarl St.', 'Chris', 'Evans', 'chris.evans@gmail.com', '2345723987', 'Restaurant', '12739084', '2022-03-01 20:05:04.359832');
INSERT INTO public.user_table VALUES (6, 'tom', '123', 'Toronto', 'Bayview St.', 'Tommy', 'Wiseau', 'itstommy@gmail.com', '692354987', 'Restaurant', '984321964', '2022-03-01 20:06:46.655692');
INSERT INTO public.user_table VALUES (1, 'tabishmon', 'Admin123', 'Toronto', 'Wellesley St', 'Tabish', 'Osman', 'tabishmon@gmail.com', '3453453455', 'Admin', '1231231233', '2022-02-21 23:10:45.297816');
INSERT INTO public.user_table VALUES (3, 'bharath', '123', 'Toronto', 'Yonge St.', 'Bharath', 'Kumar', 'bharathkumar@gmail.com', '9872342349', 'Restaurant', '1236548153', '2022-03-01 19:24:33.224157');
INSERT INTO public.user_table VALUES (7, 'naseeh', '123', 'naseeh', 'Manchuria', 'Naseeh', 'Uddin', 'naseeh@gmail.com', '92385692', 'Customer', '346346664', '2022-03-12 00:00:00');
INSERT INTO public.user_table VALUES (8, 'tauseef', '123', 'Tasueef', 'Khammam', 'Tauseef', 'Nihal', 'tauseef@gmail.com', '576597568', 'Delivery', '68760876087', '2022-03-13 00:00:00');
INSERT INTO public.user_table VALUES (9, 'asad', '123', 'Nalgonda', 'Chabutra', 'Asaduddin', 'Owaisi', 'asad123@gmail.com', '4895734987', 'Delivery', '3464574574', '2022-03-13 00:00:00');
INSERT INTO public.user_table VALUES (10, 'jerry', '123', 'Toronto', 'Whale St', 'Jerry', 'Junior', 'jerry123@gmail.com', '234234499', 'Delivery', '23454634', '2022-03-13 00:00:00');
INSERT INTO public.user_table VALUES (14, 'david', '123', 'Mississauga', 'Peel St', 'David', 'Ligma', 'david123@gmail.com', '8943758334', 'Restaurant', '9384759345', '2022-03-14 00:00:00');
INSERT INTO public.user_table VALUES (15, 'carla', '123', 'Toronto', 'Downtown', 'carla', 'sweet', 'carla@gmail.com', '4568737890', 'Restaurant', '9457645679', '2022-03-14 00:00:00');
INSERT INTO public.user_table VALUES (4, 'lee', '123', 'Toronto', 'Chinatown', 'Lee', 'Chaolan', 'lee123@gmail.com', '2345643987', 'Restaurant', '239847984', '2022-03-01 19:54:38.037444');
INSERT INTO public.user_table VALUES (2, 'owais', '123', 'Toronto', 'George St', 'Owais', 'Brother', 'owais123@gmail.com', '0982340982', 'Customer', '0980982348', '2022-02-22 00:00:00');


--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 223
-- Name: category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_category_id_seq', 1, false);


--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 225
-- Name: deliverer_deliverer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deliverer_deliverer_id_seq', 14, true);


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 227
-- Name: deliverer_info_devliererinfo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.deliverer_info_devliererinfo_id_seq', 9, true);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 210
-- Name: ingredients_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ingredients_ingredients_id_seq', 1, false);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 212
-- Name: menu_item_menuitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_item_menuitem_id_seq', 13, true);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 214
-- Name: orderitems_orderitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderitems_orderitem_id_seq', 24, true);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 216
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 15, true);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 218
-- Name: restaurant_restaurant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restaurant_restaurant_id_seq', 11, true);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 220
-- Name: status_list_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_list_status_id_seq', 4, true);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 222
-- Name: user_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_table_id_seq', 31, true);


--
-- TOC entry 3234 (class 2606 OID 50218)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- TOC entry 3238 (class 2606 OID 50253)
-- Name: deliverer_info deliverer_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverer_info
    ADD CONSTRAINT deliverer_info_pkey PRIMARY KEY (devliererinfo_id);


--
-- TOC entry 3236 (class 2606 OID 50241)
-- Name: deliverer deliverer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverer
    ADD CONSTRAINT deliverer_pkey PRIMARY KEY (deliverer_id);


--
-- TOC entry 3220 (class 2606 OID 50084)
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (ingredients_id);


--
-- TOC entry 3222 (class 2606 OID 50086)
-- Name: menu_item menu_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_item
    ADD CONSTRAINT menu_item_pkey PRIMARY KEY (menuitem_id);


--
-- TOC entry 3224 (class 2606 OID 50088)
-- Name: orderitems orderitems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (orderitem_id);


--
-- TOC entry 3226 (class 2606 OID 50090)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3228 (class 2606 OID 50092)
-- Name: restaurant restaraunt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaraunt_pkey PRIMARY KEY (restaurant_id);


--
-- TOC entry 3230 (class 2606 OID 50094)
-- Name: status_list status_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status_list
    ADD CONSTRAINT status_list_pkey PRIMARY KEY (status_id);


--
-- TOC entry 3232 (class 2606 OID 50096)
-- Name: user_table user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3248 (class 2606 OID 50254)
-- Name: deliverer_info deliverer_info_deliverer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverer_info
    ADD CONSTRAINT deliverer_info_deliverer_id_fkey FOREIGN KEY (deliverer_id) REFERENCES public.deliverer(deliverer_id);


--
-- TOC entry 3249 (class 2606 OID 50259)
-- Name: deliverer_info deliverer_info_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverer_info
    ADD CONSTRAINT deliverer_info_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- TOC entry 3247 (class 2606 OID 50242)
-- Name: deliverer deliverer_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deliverer
    ADD CONSTRAINT deliverer_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_table(id);


--
-- TOC entry 3246 (class 2606 OID 50097)
-- Name: restaurant fk_user_table; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT fk_user_table FOREIGN KEY (user_id) REFERENCES public.user_table(id);


--
-- TOC entry 3239 (class 2606 OID 50219)
-- Name: menu_item menu_item_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_item
    ADD CONSTRAINT menu_item_category_fkey FOREIGN KEY (category) REFERENCES public.category(category_id);


--
-- TOC entry 3240 (class 2606 OID 50199)
-- Name: menu_item menu_item_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_item
    ADD CONSTRAINT menu_item_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(restaurant_id);


--
-- TOC entry 3241 (class 2606 OID 50102)
-- Name: orderitems orderitems_menuitem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_menuitem_id_fkey FOREIGN KEY (menuitem_id) REFERENCES public.menu_item(menuitem_id);


--
-- TOC entry 3242 (class 2606 OID 50107)
-- Name: orderitems orderitems_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- TOC entry 3243 (class 2606 OID 50204)
-- Name: orders orders_order_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_status_fkey FOREIGN KEY (order_status) REFERENCES public.status_list(status_id);


--
-- TOC entry 3244 (class 2606 OID 50230)
-- Name: orders orders_restaurant_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(restaurant_id);


--
-- TOC entry 3245 (class 2606 OID 50112)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_table(id);


--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 3414
-- Name: DATABASE capstoneproject; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON DATABASE capstoneproject TO tabishmon;


-- Completed on 2022-04-04 17:02:56

--
-- PostgreSQL database dump complete
--

