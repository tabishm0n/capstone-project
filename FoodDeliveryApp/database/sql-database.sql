

CREATE TABLE public.ingredients (
    ingredients_id bigint NOT NULL,
    ingredients character varying(255) NOT NULL,
    item_name character varying(50) NOT NULL,
    menuitem_id integer NOT NULL
);



CREATE SEQUENCE public.ingredients_ingredients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE public.ingredients_ingredients_id_seq OWNED BY public.ingredients.ingredients_id;



CREATE TABLE public.menu_item (
    menuitem_id bigint NOT NULL,
    item_name character varying(50) NOT NULL,
    description character varying(255) NOT NULL,
    price numeric(3,1) NOT NULL,
    active boolean NOT NULL,
    restaurant_id bigint NOT NULL,
    category bigint NOT NULL
);


CREATE SEQUENCE public.menu_item_menuitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE public.menu_item_menuitem_id_seq OWNED BY public.menu_item.menuitem_id;



CREATE TABLE public.orderitems (
    orderitem_id bigint NOT NULL,
    order_id bigint NOT NULL,
    menuitem_id bigint NOT NULL,
    quantity bigint NOT NULL,
    order_date timestamp(0) without time zone NOT NULL
);

CREATE TABLE public.orderitems_completed (
    orderitem_id bigint NOT NULL,
    order_id bigint NOT NULL,
    menuitem_id bigint NOT NULL,
    quantity bigint NOT NULL,
    order_date timestamp(0) without time zone NOT NULL
);

CREATE SEQUENCE public.orderitems_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE SEQUENCE public.orderitems_completed_orderitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orderitems_orderitem_id_seq OWNED BY public.orderitems.orderitem_id;


ALTER SEQUENCE public.orderitems_completed_orderitem_id_seq OWNED BY public.orderitems.orderitem_id;



CREATE TABLE public.orders (
    order_id bigint NOT NULL,
    user_id bigint NOT NULL,
    order_status bigint NOT NULL,
    restaurant_id bigint NOT NULL
);



CREATE SEQUENCE public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


CREATE TABLE public.restaurant (
    restaurant_id bigint NOT NULL,
    city character varying(50) NOT NULL,
    street_address character varying(50) NOT NULL,
    operational boolean NOT NULL,
    description character varying(50) NOT NULL,
    restaurant_name character varying(50) NOT NULL,
    user_id bigint NOT NULL
);



CREATE SEQUENCE public.restaurant_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.restaurant_restaurant_id_seq OWNED BY public.restaurant.restaurant_id;



CREATE TABLE public.status_list (
    status_id bigint NOT NULL,
    status_name character varying(50) NOT NULL
);


CREATE SEQUENCE public.status_list_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE public.status_list_status_id_seq OWNED BY public.status_list.status_id;


CREATE TABLE public.category (
    category_id bigint NOT NULL,
    category_name character varying(50) NOT NULL
);


CREATE SEQUENCE public.category_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



ALTER SEQUENCE public.category_category_id_seq OWNED BY public.category.category_id;



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
    registeration_date timestamp(0) without time zone NOT NULL
);



CREATE SEQUENCE public.user_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_table_id_seq OWNED BY public.user_table.id;


ALTER TABLE ONLY public.ingredients ALTER COLUMN ingredients_id SET DEFAULT nextval('public.ingredients_ingredients_id_seq'::regclass);


ALTER TABLE ONLY public.menu_item ALTER COLUMN menuitem_id SET DEFAULT nextval('public.menu_item_menuitem_id_seq'::regclass);


ALTER TABLE ONLY public.orderitems ALTER COLUMN orderitem_id SET DEFAULT nextval('public.orderitems_orderitem_id_seq'::regclass);



ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);



ALTER TABLE ONLY public.restaurant ALTER COLUMN restaurant_id SET DEFAULT nextval('public.restaurant_restaurant_id_seq'::regclass);


ALTER TABLE ONLY public.status_list ALTER COLUMN status_id SET DEFAULT nextval('public.status_list_status_id_seq'::regclass);



ALTER TABLE ONLY public.user_table ALTER COLUMN id SET DEFAULT nextval('public.user_table_id_seq'::regclass);



ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (ingredients_id);



ALTER TABLE ONLY public.menu_item
    ADD CONSTRAINT menu_item_pkey PRIMARY KEY (menuitem_id);


ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (orderitem_id);

    ALTER TABLE ONLY public.orderitems_completed
    ADD CONSTRAINT orderitems_completed_pkey PRIMARY KEY (orderitem_id);


ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);



ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT restaraunt_pkey PRIMARY KEY (restaurant_id);



ALTER TABLE ONLY public.status_list
    ADD CONSTRAINT status_list_pkey PRIMARY KEY (status_id);

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);



ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);



ALTER TABLE ONLY public.restaurant
    ADD CONSTRAINT fk_user_table FOREIGN KEY (user_id) REFERENCES public.user_table(id);



ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_menuitem_id_fkey FOREIGN KEY (menuitem_id) REFERENCES public.menu_item(menuitem_id);




ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);

    
ALTER TABLE ONLY public.orderitems_completed
    ADD CONSTRAINT orderitems_completed_menuitem_id_fkey FOREIGN KEY (menuitem_id) REFERENCES public.menu_item(menuitem_id);


ALTER TABLE ONLY public.orderitems_completed
    ADD CONSTRAINT orderitems_completed_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);



ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_table(id);

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(restaurant_id);


ALTER TABLE ONLY public.menu_item
    ADD CONSTRAINT menu_item_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant(restaurant_id);

ALTER TABLE ONLY public.menu_item
    ADD CONSTRAINT menu_item_category_fkey FOREIGN KEY (category) REFERENCES public.category(category_id);

    
ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_status_fkey FOREIGN KEY (order_status) REFERENCES public.status_list(status_id);



INSERT INTO public.ingredients VALUES (1, 'Butter', 'Butter Chicken', 1);
INSERT INTO public.ingredients VALUES (2, 'Onion', 'Butter Chicken', 1);
INSERT INTO public.ingredients VALUES (3, 'Garlic', 'Butter Chicken', 1);
INSERT INTO public.ingredients VALUES (4, 'Tomato Sauce', 'Butter Chicken', 1);
INSERT INTO public.ingredients VALUES (5, 'Cream', 'Butter Chicken', 1);
INSERT INTO public.ingredients VALUES (6, 'Chicken', 'Butter Chicken', 1);
INSERT INTO public.ingredients VALUES (7, 'Salt', 'Butter Chicken', 1);
INSERT INTO public.ingredients VALUES (8, 'Oil', 'Butter Chicken', 1);


INSERT INTO public.menu_item VALUES (1, 'Butter Chicken', 'Delicious Indian Curry with tender Chicken', 30.5, true,1,2);
INSERT INTO public.menu_item VALUES (2, 'Biryani', 'Exquisite Hyderabadi Biryani served with Chicken', 42.5, true,1,2);
INSERT INTO public.menu_item VALUES (3, 'Chinese Noodles', 'Hand-made Noodles served in hot Chicken broth', 18.0, true,2,2);
INSERT INTO public.menu_item VALUES (4, 'Samosa', 'Indian Snack filled with flavored masehed Potatoes', 10.5, true,1,1);



INSERT INTO public.restaurant VALUES (1, 'Toronto', 'Carlson St.', true, 'Small Family run Restaurant', 'Indian Curry', 3);
INSERT INTO public.restaurant VALUES (2, 'Sudbury', 'Eglinton St.', true, 'Authentic Chinese Cuisine', 'China Town', 4);
INSERT INTO public.restaurant VALUES (3, 'Toronto', 'Thorn St.', true, 'Country Side beautiful fresh Steak!', 'BBQ Corner', 5);
INSERT INTO public.restaurant VALUES (4, 'Brampton', 'Wellesley St.', true, 'World Famous Burger fast-food chain', 'MC Chicken', 6);



INSERT INTO public.user_table VALUES (1, 'tabishmon', 'Admin123', 'Toronto', 'Wellesley St', 'Tabish', 'Osman', 'tabishmon@gmail.com', '3453453455', 'Admin', '1231231233', '2022-02-21 23:10:45.297816');
INSERT INTO public.user_table VALUES (2, 'owais', '123', 'Toronto', 'George St', 'Owais', 'Siddique', 'owais123@gmail.com', '0982340982', 'Customer', '0980982348', '2022-02-22 00:00:00');
INSERT INTO public.user_table VALUES (4, 'lee', '123', 'Sudbury', 'Chinatown', 'Lee', 'Chaolan', 'lee123@gmail.com', '2345643987', 'Restaurant', '239847984', '2022-03-01 19:54:38.037444');
INSERT INTO public.user_table VALUES (3, 'bharath', '123', 'Toronto', 'Yonge St.', 'Bharath', 'Kumar', 'bharathkumar@gmail.com', '9872342349', 'Restaurant', '1236548153', '2022-03-01 19:24:33.224157');
INSERT INTO public.user_table VALUES (5, 'chris', '123', 'Toronto', 'Jarl St.', 'Chris', 'Evans', 'chris.evans@gmail.com', '2345723987', 'Restaurant', '12739084', '2022-03-01 20:05:04.359832');
INSERT INTO public.user_table VALUES (6, 'tom', '123', 'Toronto', 'Bayview St.', 'Tommy', 'Wiseau', 'itstommy@gmail.com', '692354987', 'Restaurant', '984321964', '2022-03-01 20:06:46.655692');
INSERT INTO public.user_table VALUES (7, 'naseeh', '123', 'Toronto', 'William St', 'Naseeh', 'Uddin', 'naseeh123@gmail.com', '28435640982', 'Customer', '6549821212', '2022-03-02 00:00:00');


INSERT INTO public.status_list VALUES (1,'Order Created'),(2,'Order Prepared'),(3,'Order out for Delivery'),(4,'Order Delivered');

INSERT INTO public.category VALUES (1,'Appetizer'),(2,'Main Course'),(3,'Sides'),(4,'Dessert'),(5,'Beverages');
