PGDMP                      }            neondb    17.5    17.5 �    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            8           1262    16389    neondb    DATABASE     �   CREATE DATABASE neondb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = builtin LOCALE = 'C.UTF-8' BUILTIN_LOCALE = 'C.UTF-8';
    DROP DATABASE neondb;
                     neondb_owner    false            9           0    0    DATABASE neondb    ACL     0   GRANT ALL ON DATABASE neondb TO neon_superuser;
                        neondb_owner    false    3640                        2615    16478 	   neon_auth    SCHEMA        CREATE SCHEMA neon_auth;
    DROP SCHEMA neon_auth;
                     neondb_owner    false            �            1259    16479 
   users_sync    TABLE     E  CREATE TABLE neon_auth.users_sync (
    raw_json jsonb NOT NULL,
    id text GENERATED ALWAYS AS ((raw_json ->> 'id'::text)) STORED NOT NULL,
    name text GENERATED ALWAYS AS ((raw_json ->> 'display_name'::text)) STORED,
    email text GENERATED ALWAYS AS ((raw_json ->> 'primary_email'::text)) STORED,
    created_at timestamp with time zone GENERATED ALWAYS AS (to_timestamp((trunc((((raw_json ->> 'signed_up_at_millis'::text))::bigint)::double precision) / (1000)::double precision))) STORED,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);
 !   DROP TABLE neon_auth.users_sync;
    	   neon_auth         heap r       neondb_owner    false    6            �            1259    16983 
   About_text    TABLE     �   CREATE TABLE public."About_text" (
    id text NOT NULL,
    lang text NOT NULL,
    heading text NOT NULL,
    content1 text NOT NULL,
    content2 text NOT NULL,
    image text NOT NULL
);
     DROP TABLE public."About_text";
       public         heap r       neondb_owner    false            �            1259    16976    About_us    TABLE     �   CREATE TABLE public."About_us" (
    id text NOT NULL,
    lang text NOT NULL,
    heading text NOT NULL,
    image text NOT NULL
);
    DROP TABLE public."About_us";
       public         heap r       neondb_owner    false            �            1259    17012    Basket_heart_view_link    TABLE     �   CREATE TABLE public."Basket_heart_view_link" (
    id text NOT NULL,
    lang text NOT NULL,
    text text NOT NULL,
    url text NOT NULL
);
 ,   DROP TABLE public."Basket_heart_view_link";
       public         heap r       neondb_owner    false            �            1259    17047    Categories_link    TABLE     G  CREATE TABLE public."Categories_link" (
    id text NOT NULL,
    lang text NOT NULL,
    main text NOT NULL,
    catalog text NOT NULL,
    filter_by text NOT NULL,
    category text NOT NULL,
    materials text NOT NULL,
    price text NOT NULL,
    sort_by text NOT NULL,
    "from" text NOT NULL,
    "to" text NOT NULL
);
 %   DROP TABLE public."Categories_link";
       public         heap r       neondb_owner    false            �            1259    16792    Category    TABLE     �   CREATE TABLE public."Category" (
    id text NOT NULL,
    lang text NOT NULL,
    descr text NOT NULL,
    image text NOT NULL,
    title text NOT NULL,
    category_name text
);
    DROP TABLE public."Category";
       public         heap r       neondb_owner    false            �            1259    16969    Contact_form    TABLE     U  CREATE TABLE public."Contact_form" (
    id text NOT NULL,
    lang text NOT NULL,
    title text NOT NULL,
    input_placeholder_name text NOT NULL,
    input_placeholder_email text NOT NULL,
    input_placeholder_phone text NOT NULL,
    btn_text text NOT NULL,
    priacy_policy_text text NOT NULL,
    priacy_policy_url text NOT NULL
);
 "   DROP TABLE public."Contact_form";
       public         heap r       neondb_owner    false            �            1259    16962    Contact_info    TABLE       CREATE TABLE public."Contact_info" (
    id text NOT NULL,
    lang text NOT NULL,
    map_image text NOT NULL,
    address text NOT NULL,
    phone text NOT NULL,
    email text NOT NULL,
    address_icon text NOT NULL,
    phone_icon text NOT NULL,
    email_icon text NOT NULL
);
 "   DROP TABLE public."Contact_info";
       public         heap r       neondb_owner    false            �            1259    16955    Contact_title    TABLE     �   CREATE TABLE public."Contact_title" (
    id text NOT NULL,
    lang text NOT NULL,
    title text NOT NULL,
    image_url text NOT NULL
);
 #   DROP TABLE public."Contact_title";
       public         heap r       neondb_owner    false            �            1259    16934    Footer_info    TABLE     �   CREATE TABLE public."Footer_info" (
    id text NOT NULL,
    lang text NOT NULL,
    address text NOT NULL,
    phone text NOT NULL,
    email text NOT NULL,
    address_icon text NOT NULL,
    phone_icon text NOT NULL,
    email_icon text NOT NULL
);
 !   DROP TABLE public."Footer_info";
       public         heap r       neondb_owner    false            �            1259    16857    Footer_privacy_policy    TABLE     �   CREATE TABLE public."Footer_privacy_policy" (
    id text NOT NULL,
    lang text NOT NULL,
    title text NOT NULL,
    url text NOT NULL
);
 +   DROP TABLE public."Footer_privacy_policy";
       public         heap r       neondb_owner    false            �            1259    16941    Footer_social_links    TABLE     s   CREATE TABLE public."Footer_social_links" (
    id text NOT NULL,
    icon text NOT NULL,
    url text NOT NULL
);
 )   DROP TABLE public."Footer_social_links";
       public         heap r       neondb_owner    false            �            1259    16878    Header_icon    TABLE     �   CREATE TABLE public."Header_icon" (
    id text NOT NULL,
    search_icon text NOT NULL,
    heart_icon text NOT NULL,
    cart_icon text NOT NULL,
    language_arrow_icon text NOT NULL
);
 !   DROP TABLE public."Header_icon";
       public         heap r       neondb_owner    false            �            1259    17055    HomePagePopularItem    TABLE     �   CREATE TABLE public."HomePagePopularItem" (
    id text NOT NULL,
    "itemId" text NOT NULL,
    "order" integer,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 )   DROP TABLE public."HomePagePopularItem";
       public         heap r       neondb_owner    false            �            1259    16906    Homepage_about_us    TABLE     �   CREATE TABLE public."Homepage_about_us" (
    id text NOT NULL,
    lang text NOT NULL,
    heading text NOT NULL,
    descr text NOT NULL,
    btn_text text NOT NULL,
    btn_url text NOT NULL,
    image_1 text NOT NULL,
    image_2 text NOT NULL
);
 '   DROP TABLE public."Homepage_about_us";
       public         heap r       neondb_owner    false            �            1259    16948    Homepage_categories_heading    TABLE     }   CREATE TABLE public."Homepage_categories_heading" (
    id text NOT NULL,
    lang text NOT NULL,
    title text NOT NULL
);
 1   DROP TABLE public."Homepage_categories_heading";
       public         heap r       neondb_owner    false            �            1259    16927    Homepage_contact    TABLE     �   CREATE TABLE public."Homepage_contact" (
    id text NOT NULL,
    lang text NOT NULL,
    heading text NOT NULL,
    map_image text NOT NULL,
    map_url text NOT NULL
);
 &   DROP TABLE public."Homepage_contact";
       public         heap r       neondb_owner    false            �            1259    16920    Homepage_new_arrivals_heading    TABLE        CREATE TABLE public."Homepage_new_arrivals_heading" (
    id text NOT NULL,
    lang text NOT NULL,
    title text NOT NULL
);
 3   DROP TABLE public."Homepage_new_arrivals_heading";
       public         heap r       neondb_owner    false                        1259    66698    Homepage_partner    TABLE     Z   CREATE TABLE public."Homepage_partner" (
    id text NOT NULL,
    image text NOT NULL
);
 &   DROP TABLE public."Homepage_partner";
       public         heap r       neondb_owner    false            �            1259    50285    Homepage_partners_heading    TABLE     }   CREATE TABLE public."Homepage_partners_heading" (
    id text NOT NULL,
    lang text NOT NULL,
    heading text NOT NULL
);
 /   DROP TABLE public."Homepage_partners_heading";
       public         heap r       neondb_owner    false            �            1259    16913    Homepage_popular_item_heading    TABLE        CREATE TABLE public."Homepage_popular_item_heading" (
    id text NOT NULL,
    lang text NOT NULL,
    title text NOT NULL
);
 3   DROP TABLE public."Homepage_popular_item_heading";
       public         heap r       neondb_owner    false            �            1259    17040    Info_about_delivery    TABLE     �   CREATE TABLE public."Info_about_delivery" (
    id text NOT NULL,
    lang text NOT NULL,
    title text NOT NULL,
    texts jsonb NOT NULL
);
 )   DROP TABLE public."Info_about_delivery";
       public         heap r       neondb_owner    false            �            1259    16799    Item    TABLE     �  CREATE TABLE public."Item" (
    id text NOT NULL,
    product_number text NOT NULL,
    price double precision NOT NULL,
    heart_icon boolean NOT NULL,
    title jsonb NOT NULL,
    btn_text jsonb NOT NULL,
    descr jsonb NOT NULL,
    product_material jsonb NOT NULL,
    about_delivery jsonb NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    color text NOT NULL,
    group_code text,
    size text NOT NULL,
    category_name text NOT NULL
);
    DROP TABLE public."Item";
       public         heap r       neondb_owner    false                       1259    76148    Item_faq    TABLE     �   CREATE TABLE public."Item_faq" (
    id text NOT NULL,
    lang text NOT NULL,
    question text NOT NULL,
    answer text NOT NULL
);
    DROP TABLE public."Item_faq";
       public         heap r       neondb_owner    false                       1259    74921    Item_faq_heading    TABLE     t   CREATE TABLE public."Item_faq_heading" (
    id text NOT NULL,
    lang text NOT NULL,
    heading text NOT NULL
);
 &   DROP TABLE public."Item_faq_heading";
       public         heap r       neondb_owner    false            �            1259    17033 	   Item_link    TABLE     �   CREATE TABLE public."Item_link" (
    id text NOT NULL,
    lang text NOT NULL,
    item text NOT NULL,
    catalog text NOT NULL,
    cribs text NOT NULL
);
    DROP TABLE public."Item_link";
       public         heap r       neondb_owner    false            �            1259    17019    Item_page_field    TABLE     q  CREATE TABLE public."Item_page_field" (
    id text NOT NULL,
    lang text NOT NULL,
    size_text_field text NOT NULL,
    size_text_field_2 text NOT NULL,
    descr_text_field text NOT NULL,
    product_number_text_field text NOT NULL,
    material_text_field text NOT NULL,
    about_delivery_text_field text NOT NULL,
    not_available_text_field text NOT NULL
);
 %   DROP TABLE public."Item_page_field";
       public         heap r       neondb_owner    false            �            1259    16850    Items_header    TABLE     �   CREATE TABLE public."Items_header" (
    id text NOT NULL,
    lang text NOT NULL,
    image text NOT NULL,
    category_name text NOT NULL,
    title text NOT NULL,
    descr text NOT NULL
);
 "   DROP TABLE public."Items_header";
       public         heap r       neondb_owner    false            �            1259    16885    Language    TABLE     z   CREATE TABLE public."Language" (
    id text NOT NULL,
    label text NOT NULL,
    image text NOT NULL,
    lang text
);
    DROP TABLE public."Language";
       public         heap r       neondb_owner    false            �            1259    17026    Liked_product_heading    TABLE     w   CREATE TABLE public."Liked_product_heading" (
    id text NOT NULL,
    lang text NOT NULL,
    title text NOT NULL
);
 +   DROP TABLE public."Liked_product_heading";
       public         heap r       neondb_owner    false            �            1259    16864    Logo    TABLE     N   CREATE TABLE public."Logo" (
    id text NOT NULL,
    image text NOT NULL
);
    DROP TABLE public."Logo";
       public         heap r       neondb_owner    false            �            1259    16831    Navbar    TABLE     �   CREATE TABLE public."Navbar" (
    id text NOT NULL,
    lang text NOT NULL,
    title text NOT NULL,
    route text NOT NULL
);
    DROP TABLE public."Navbar";
       public         heap r       neondb_owner    false            �            1259    16990    Navigation_arrow    TABLE     r   CREATE TABLE public."Navigation_arrow" (
    id text NOT NULL,
    type text NOT NULL,
    image text NOT NULL
);
 &   DROP TABLE public."Navigation_arrow";
       public         heap r       neondb_owner    false                       1259    132367    ProductImage    TABLE     u   CREATE TABLE public."ProductImage" (
    id text NOT NULL,
    image text NOT NULL,
    "productId" text NOT NULL
);
 "   DROP TABLE public."ProductImage";
       public         heap r       neondb_owner    false            �            1259    17004    Saved_basket_item    TABLE     �   CREATE TABLE public."Saved_basket_item" (
    id text NOT NULL,
    lang text NOT NULL,
    heading text NOT NULL,
    quantity text NOT NULL,
    remove_button_icon text NOT NULL,
    remove_button_text text NOT NULL
);
 '   DROP TABLE public."Saved_basket_item";
       public         heap r       neondb_owner    false            �            1259    16997    Saved_heart_item    TABLE       CREATE TABLE public."Saved_heart_item" (
    id text NOT NULL,
    lang text NOT NULL,
    heading text NOT NULL,
    add_button_icon text NOT NULL,
    add_button_text text NOT NULL,
    remove_button_icon text NOT NULL,
    remove_button_text text NOT NULL
);
 &   DROP TABLE public."Saved_heart_item";
       public         heap r       neondb_owner    false            �            1259    16871    Shopping_bag_page    TABLE     Y  CREATE TABLE public."Shopping_bag_page" (
    id text NOT NULL,
    lang text NOT NULL,
    main text NOT NULL,
    title text NOT NULL,
    empty_error_text text NOT NULL,
    quantity_and_prais_text text NOT NULL,
    size_title text NOT NULL,
    heart_text text NOT NULL,
    btn_text text NOT NULL,
    order_summary_field text NOT NULL,
    total_text_field text NOT NULL,
    form_input_name_placeholder text NOT NULL,
    form_input_tel_placeholder text NOT NULL,
    form_input_address_placeholder text NOT NULL,
    form_input_checkbox_text text NOT NULL,
    form_btn_text text NOT NULL
);
 '   DROP TABLE public."Shopping_bag_page";
       public         heap r       neondb_owner    false            �            1259    16892    Slider    TABLE     �   CREATE TABLE public."Slider" (
    id text NOT NULL,
    lang text NOT NULL,
    title text NOT NULL,
    descr text NOT NULL,
    btn_text text NOT NULL,
    btn_url text NOT NULL,
    background_image text NOT NULL,
    image text NOT NULL
);
    DROP TABLE public."Slider";
       public         heap r       neondb_owner    false            �            1259    16899    Slider_icon    TABLE     �   CREATE TABLE public."Slider_icon" (
    id text NOT NULL,
    cloud_icon text NOT NULL,
    left_arrow_icon text NOT NULL,
    right_arrow_icon text NOT NULL
);
 !   DROP TABLE public."Slider_icon";
       public         heap r       neondb_owner    false            �            1259    16838    Submenu    TABLE     �   CREATE TABLE public."Submenu" (
    id text NOT NULL,
    lang text NOT NULL,
    title text NOT NULL,
    route text NOT NULL,
    "navbarId" text
);
    DROP TABLE public."Submenu";
       public         heap r       neondb_owner    false            �            1259    16785    User    TABLE     m   CREATE TABLE public."User" (
    id text NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);
    DROP TABLE public."User";
       public         heap r       neondb_owner    false            �            1259    16776    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap r       neondb_owner    false            	          0    16479 
   users_sync 
   TABLE DATA           I   COPY neon_auth.users_sync (raw_json, updated_at, deleted_at) FROM stdin;
 	   neon_auth               neondb_owner    false    218   �       #          0    16983 
   About_text 
   TABLE DATA           T   COPY public."About_text" (id, lang, heading, content1, content2, image) FROM stdin;
    public               neondb_owner    false    244   1�       "          0    16976    About_us 
   TABLE DATA           >   COPY public."About_us" (id, lang, heading, image) FROM stdin;
    public               neondb_owner    false    243   ɶ       '          0    17012    Basket_heart_view_link 
   TABLE DATA           G   COPY public."Basket_heart_view_link" (id, lang, text, url) FROM stdin;
    public               neondb_owner    false    248   ��       ,          0    17047    Categories_link 
   TABLE DATA           �   COPY public."Categories_link" (id, lang, main, catalog, filter_by, category, materials, price, sort_by, "from", "to") FROM stdin;
    public               neondb_owner    false    253   ��                 0    16792    Category 
   TABLE DATA           R   COPY public."Category" (id, lang, descr, image, title, category_name) FROM stdin;
    public               neondb_owner    false    221   �       !          0    16969    Contact_form 
   TABLE DATA           �   COPY public."Contact_form" (id, lang, title, input_placeholder_name, input_placeholder_email, input_placeholder_phone, btn_text, priacy_policy_text, priacy_policy_url) FROM stdin;
    public               neondb_owner    false    242   O�                  0    16962    Contact_info 
   TABLE DATA           z   COPY public."Contact_info" (id, lang, map_image, address, phone, email, address_icon, phone_icon, email_icon) FROM stdin;
    public               neondb_owner    false    241   ��                 0    16955    Contact_title 
   TABLE DATA           E   COPY public."Contact_title" (id, lang, title, image_url) FROM stdin;
    public               neondb_owner    false    240   *�                 0    16934    Footer_info 
   TABLE DATA           n   COPY public."Footer_info" (id, lang, address, phone, email, address_icon, phone_icon, email_icon) FROM stdin;
    public               neondb_owner    false    237   �                 0    16857    Footer_privacy_policy 
   TABLE DATA           G   COPY public."Footer_privacy_policy" (id, lang, title, url) FROM stdin;
    public               neondb_owner    false    226   ��                 0    16941    Footer_social_links 
   TABLE DATA           >   COPY public."Footer_social_links" (id, icon, url) FROM stdin;
    public               neondb_owner    false    238   `�                 0    16878    Header_icon 
   TABLE DATA           d   COPY public."Header_icon" (id, search_icon, heart_icon, cart_icon, language_arrow_icon) FROM stdin;
    public               neondb_owner    false    229   �       -          0    17055    HomePagePopularItem 
   TABLE DATA           S   COPY public."HomePagePopularItem" (id, "itemId", "order", "createdAt") FROM stdin;
    public               neondb_owner    false    254   ��                 0    16906    Homepage_about_us 
   TABLE DATA           l   COPY public."Homepage_about_us" (id, lang, heading, descr, btn_text, btn_url, image_1, image_2) FROM stdin;
    public               neondb_owner    false    233   ��                 0    16948    Homepage_categories_heading 
   TABLE DATA           H   COPY public."Homepage_categories_heading" (id, lang, title) FROM stdin;
    public               neondb_owner    false    239   j�                 0    16927    Homepage_contact 
   TABLE DATA           S   COPY public."Homepage_contact" (id, lang, heading, map_image, map_url) FROM stdin;
    public               neondb_owner    false    236   #�                 0    16920    Homepage_new_arrivals_heading 
   TABLE DATA           J   COPY public."Homepage_new_arrivals_heading" (id, lang, title) FROM stdin;
    public               neondb_owner    false    235   ��       /          0    66698    Homepage_partner 
   TABLE DATA           7   COPY public."Homepage_partner" (id, image) FROM stdin;
    public               neondb_owner    false    256   f�       .          0    50285    Homepage_partners_heading 
   TABLE DATA           H   COPY public."Homepage_partners_heading" (id, lang, heading) FROM stdin;
    public               neondb_owner    false    255   ��                 0    16913    Homepage_popular_item_heading 
   TABLE DATA           J   COPY public."Homepage_popular_item_heading" (id, lang, title) FROM stdin;
    public               neondb_owner    false    234   ��       +          0    17040    Info_about_delivery 
   TABLE DATA           G   COPY public."Info_about_delivery" (id, lang, title, texts) FROM stdin;
    public               neondb_owner    false    252   z�                 0    16799    Item 
   TABLE DATA           �   COPY public."Item" (id, product_number, price, heart_icon, title, btn_text, descr, product_material, about_delivery, "createdAt", color, group_code, size, category_name) FROM stdin;
    public               neondb_owner    false    222   '�       1          0    76148    Item_faq 
   TABLE DATA           @   COPY public."Item_faq" (id, lang, question, answer) FROM stdin;
    public               neondb_owner    false    258   1�       0          0    74921    Item_faq_heading 
   TABLE DATA           ?   COPY public."Item_faq_heading" (id, lang, heading) FROM stdin;
    public               neondb_owner    false    257   ��       *          0    17033 	   Item_link 
   TABLE DATA           E   COPY public."Item_link" (id, lang, item, catalog, cribs) FROM stdin;
    public               neondb_owner    false    251   ��       (          0    17019    Item_page_field 
   TABLE DATA           �   COPY public."Item_page_field" (id, lang, size_text_field, size_text_field_2, descr_text_field, product_number_text_field, material_text_field, about_delivery_text_field, not_available_text_field) FROM stdin;
    public               neondb_owner    false    249   ��                 0    16850    Items_header 
   TABLE DATA           V   COPY public."Items_header" (id, lang, image, category_name, title, descr) FROM stdin;
    public               neondb_owner    false    225   o�                 0    16885    Language 
   TABLE DATA           <   COPY public."Language" (id, label, image, lang) FROM stdin;
    public               neondb_owner    false    230   ��       )          0    17026    Liked_product_heading 
   TABLE DATA           B   COPY public."Liked_product_heading" (id, lang, title) FROM stdin;
    public               neondb_owner    false    250   F�                 0    16864    Logo 
   TABLE DATA           +   COPY public."Logo" (id, image) FROM stdin;
    public               neondb_owner    false    227   4�                 0    16831    Navbar 
   TABLE DATA           :   COPY public."Navbar" (id, lang, title, route) FROM stdin;
    public               neondb_owner    false    223   ��       $          0    16990    Navigation_arrow 
   TABLE DATA           =   COPY public."Navigation_arrow" (id, type, image) FROM stdin;
    public               neondb_owner    false    245   8�       2          0    132367    ProductImage 
   TABLE DATA           @   COPY public."ProductImage" (id, image, "productId") FROM stdin;
    public               neondb_owner    false    259   ��       &          0    17004    Saved_basket_item 
   TABLE DATA           r   COPY public."Saved_basket_item" (id, lang, heading, quantity, remove_button_icon, remove_button_text) FROM stdin;
    public               neondb_owner    false    247   ��       %          0    16997    Saved_heart_item 
   TABLE DATA           �   COPY public."Saved_heart_item" (id, lang, heading, add_button_icon, add_button_text, remove_button_icon, remove_button_text) FROM stdin;
    public               neondb_owner    false    246   ��                 0    16871    Shopping_bag_page 
   TABLE DATA           :  COPY public."Shopping_bag_page" (id, lang, main, title, empty_error_text, quantity_and_prais_text, size_title, heart_text, btn_text, order_summary_field, total_text_field, form_input_name_placeholder, form_input_tel_placeholder, form_input_address_placeholder, form_input_checkbox_text, form_btn_text) FROM stdin;
    public               neondb_owner    false    228   ��                 0    16892    Slider 
   TABLE DATA           f   COPY public."Slider" (id, lang, title, descr, btn_text, btn_url, background_image, image) FROM stdin;
    public               neondb_owner    false    231   ��                 0    16899    Slider_icon 
   TABLE DATA           Z   COPY public."Slider_icon" (id, cloud_icon, left_arrow_icon, right_arrow_icon) FROM stdin;
    public               neondb_owner    false    232                   0    16838    Submenu 
   TABLE DATA           G   COPY public."Submenu" (id, lang, title, route, "navbarId") FROM stdin;
    public               neondb_owner    false    224   �                0    16785    User 
   TABLE DATA           8   COPY public."User" (id, username, password) FROM stdin;
    public               neondb_owner    false    220   �	      
          0    16776    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public               neondb_owner    false    219   V
      !           2606    16489    users_sync users_sync_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY neon_auth.users_sync
    ADD CONSTRAINT users_sync_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY neon_auth.users_sync DROP CONSTRAINT users_sync_pkey;
    	   neon_auth                 neondb_owner    false    218            V           2606    16989    About_text About_text_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."About_text"
    ADD CONSTRAINT "About_text_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."About_text" DROP CONSTRAINT "About_text_pkey";
       public                 neondb_owner    false    244            T           2606    16982    About_us About_us_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."About_us"
    ADD CONSTRAINT "About_us_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."About_us" DROP CONSTRAINT "About_us_pkey";
       public                 neondb_owner    false    243            ^           2606    17018 2   Basket_heart_view_link Basket_heart_view_link_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."Basket_heart_view_link"
    ADD CONSTRAINT "Basket_heart_view_link_pkey" PRIMARY KEY (id);
 `   ALTER TABLE ONLY public."Basket_heart_view_link" DROP CONSTRAINT "Basket_heart_view_link_pkey";
       public                 neondb_owner    false    248            h           2606    17053 $   Categories_link Categories_link_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Categories_link"
    ADD CONSTRAINT "Categories_link_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."Categories_link" DROP CONSTRAINT "Categories_link_pkey";
       public                 neondb_owner    false    253            '           2606    16798    Category Category_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_pkey";
       public                 neondb_owner    false    221            R           2606    16975    Contact_form Contact_form_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Contact_form"
    ADD CONSTRAINT "Contact_form_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Contact_form" DROP CONSTRAINT "Contact_form_pkey";
       public                 neondb_owner    false    242            P           2606    16968    Contact_info Contact_info_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Contact_info"
    ADD CONSTRAINT "Contact_info_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Contact_info" DROP CONSTRAINT "Contact_info_pkey";
       public                 neondb_owner    false    241            N           2606    16961     Contact_title Contact_title_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Contact_title"
    ADD CONSTRAINT "Contact_title_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."Contact_title" DROP CONSTRAINT "Contact_title_pkey";
       public                 neondb_owner    false    240            H           2606    16940    Footer_info Footer_info_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Footer_info"
    ADD CONSTRAINT "Footer_info_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Footer_info" DROP CONSTRAINT "Footer_info_pkey";
       public                 neondb_owner    false    237            2           2606    16863 0   Footer_privacy_policy Footer_privacy_policy_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."Footer_privacy_policy"
    ADD CONSTRAINT "Footer_privacy_policy_pkey" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public."Footer_privacy_policy" DROP CONSTRAINT "Footer_privacy_policy_pkey";
       public                 neondb_owner    false    226            J           2606    16947 ,   Footer_social_links Footer_social_links_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Footer_social_links"
    ADD CONSTRAINT "Footer_social_links_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."Footer_social_links" DROP CONSTRAINT "Footer_social_links_pkey";
       public                 neondb_owner    false    238            8           2606    16884    Header_icon Header_icon_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Header_icon"
    ADD CONSTRAINT "Header_icon_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Header_icon" DROP CONSTRAINT "Header_icon_pkey";
       public                 neondb_owner    false    229            j           2606    17062 ,   HomePagePopularItem HomePagePopularItem_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."HomePagePopularItem"
    ADD CONSTRAINT "HomePagePopularItem_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."HomePagePopularItem" DROP CONSTRAINT "HomePagePopularItem_pkey";
       public                 neondb_owner    false    254            @           2606    16912 (   Homepage_about_us Homepage_about_us_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Homepage_about_us"
    ADD CONSTRAINT "Homepage_about_us_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."Homepage_about_us" DROP CONSTRAINT "Homepage_about_us_pkey";
       public                 neondb_owner    false    233            L           2606    16954 <   Homepage_categories_heading Homepage_categories_heading_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public."Homepage_categories_heading"
    ADD CONSTRAINT "Homepage_categories_heading_pkey" PRIMARY KEY (id);
 j   ALTER TABLE ONLY public."Homepage_categories_heading" DROP CONSTRAINT "Homepage_categories_heading_pkey";
       public                 neondb_owner    false    239            F           2606    16933 &   Homepage_contact Homepage_contact_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Homepage_contact"
    ADD CONSTRAINT "Homepage_contact_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."Homepage_contact" DROP CONSTRAINT "Homepage_contact_pkey";
       public                 neondb_owner    false    236            D           2606    16926 @   Homepage_new_arrivals_heading Homepage_new_arrivals_heading_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Homepage_new_arrivals_heading"
    ADD CONSTRAINT "Homepage_new_arrivals_heading_pkey" PRIMARY KEY (id);
 n   ALTER TABLE ONLY public."Homepage_new_arrivals_heading" DROP CONSTRAINT "Homepage_new_arrivals_heading_pkey";
       public                 neondb_owner    false    235            n           2606    66704 &   Homepage_partner Homepage_partner_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Homepage_partner"
    ADD CONSTRAINT "Homepage_partner_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."Homepage_partner" DROP CONSTRAINT "Homepage_partner_pkey";
       public                 neondb_owner    false    256            l           2606    50291 8   Homepage_partners_heading Homepage_partners_heading_pkey 
   CONSTRAINT     z   ALTER TABLE ONLY public."Homepage_partners_heading"
    ADD CONSTRAINT "Homepage_partners_heading_pkey" PRIMARY KEY (id);
 f   ALTER TABLE ONLY public."Homepage_partners_heading" DROP CONSTRAINT "Homepage_partners_heading_pkey";
       public                 neondb_owner    false    255            B           2606    16919 @   Homepage_popular_item_heading Homepage_popular_item_heading_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Homepage_popular_item_heading"
    ADD CONSTRAINT "Homepage_popular_item_heading_pkey" PRIMARY KEY (id);
 n   ALTER TABLE ONLY public."Homepage_popular_item_heading" DROP CONSTRAINT "Homepage_popular_item_heading_pkey";
       public                 neondb_owner    false    234            f           2606    17046 ,   Info_about_delivery Info_about_delivery_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Info_about_delivery"
    ADD CONSTRAINT "Info_about_delivery_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."Info_about_delivery" DROP CONSTRAINT "Info_about_delivery_pkey";
       public                 neondb_owner    false    252            p           2606    74927 &   Item_faq_heading Item_faq_heading_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Item_faq_heading"
    ADD CONSTRAINT "Item_faq_heading_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."Item_faq_heading" DROP CONSTRAINT "Item_faq_heading_pkey";
       public                 neondb_owner    false    257            r           2606    76154    Item_faq Item_faq_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Item_faq"
    ADD CONSTRAINT "Item_faq_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Item_faq" DROP CONSTRAINT "Item_faq_pkey";
       public                 neondb_owner    false    258            d           2606    17039    Item_link Item_link_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Item_link"
    ADD CONSTRAINT "Item_link_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Item_link" DROP CONSTRAINT "Item_link_pkey";
       public                 neondb_owner    false    251            `           2606    17025 $   Item_page_field Item_page_field_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Item_page_field"
    ADD CONSTRAINT "Item_page_field_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."Item_page_field" DROP CONSTRAINT "Item_page_field_pkey";
       public                 neondb_owner    false    249            )           2606    16805    Item Item_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Item"
    ADD CONSTRAINT "Item_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Item" DROP CONSTRAINT "Item_pkey";
       public                 neondb_owner    false    222            0           2606    16856    Items_header Items_header_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Items_header"
    ADD CONSTRAINT "Items_header_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Items_header" DROP CONSTRAINT "Items_header_pkey";
       public                 neondb_owner    false    225            :           2606    16891    Language Language_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Language"
    ADD CONSTRAINT "Language_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Language" DROP CONSTRAINT "Language_pkey";
       public                 neondb_owner    false    230            b           2606    17032 0   Liked_product_heading Liked_product_heading_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."Liked_product_heading"
    ADD CONSTRAINT "Liked_product_heading_pkey" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public."Liked_product_heading" DROP CONSTRAINT "Liked_product_heading_pkey";
       public                 neondb_owner    false    250            4           2606    16870    Logo Logo_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Logo"
    ADD CONSTRAINT "Logo_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Logo" DROP CONSTRAINT "Logo_pkey";
       public                 neondb_owner    false    227            ,           2606    16837    Navbar Navbar_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Navbar"
    ADD CONSTRAINT "Navbar_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Navbar" DROP CONSTRAINT "Navbar_pkey";
       public                 neondb_owner    false    223            X           2606    16996 &   Navigation_arrow Navigation_arrow_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Navigation_arrow"
    ADD CONSTRAINT "Navigation_arrow_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."Navigation_arrow" DROP CONSTRAINT "Navigation_arrow_pkey";
       public                 neondb_owner    false    245            t           2606    132373    ProductImage ProductImage_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."ProductImage"
    ADD CONSTRAINT "ProductImage_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."ProductImage" DROP CONSTRAINT "ProductImage_pkey";
       public                 neondb_owner    false    259            \           2606    17010 (   Saved_basket_item Saved_basket_item_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Saved_basket_item"
    ADD CONSTRAINT "Saved_basket_item_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."Saved_basket_item" DROP CONSTRAINT "Saved_basket_item_pkey";
       public                 neondb_owner    false    247            Z           2606    17003 &   Saved_heart_item Saved_heart_item_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Saved_heart_item"
    ADD CONSTRAINT "Saved_heart_item_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."Saved_heart_item" DROP CONSTRAINT "Saved_heart_item_pkey";
       public                 neondb_owner    false    246            6           2606    16877 (   Shopping_bag_page Shopping_bag_page_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Shopping_bag_page"
    ADD CONSTRAINT "Shopping_bag_page_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."Shopping_bag_page" DROP CONSTRAINT "Shopping_bag_page_pkey";
       public                 neondb_owner    false    228            >           2606    16905    Slider_icon Slider_icon_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Slider_icon"
    ADD CONSTRAINT "Slider_icon_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Slider_icon" DROP CONSTRAINT "Slider_icon_pkey";
       public                 neondb_owner    false    232            <           2606    16898    Slider Slider_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Slider"
    ADD CONSTRAINT "Slider_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Slider" DROP CONSTRAINT "Slider_pkey";
       public                 neondb_owner    false    231            .           2606    16844    Submenu Submenu_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Submenu"
    ADD CONSTRAINT "Submenu_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Submenu" DROP CONSTRAINT "Submenu_pkey";
       public                 neondb_owner    false    224            %           2606    16791    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public                 neondb_owner    false    220            #           2606    16784 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public                 neondb_owner    false    219                       1259    16490    users_sync_deleted_at_idx    INDEX     Y   CREATE INDEX users_sync_deleted_at_idx ON neon_auth.users_sync USING btree (deleted_at);
 0   DROP INDEX neon_auth.users_sync_deleted_at_idx;
    	   neon_auth                 neondb_owner    false    218            *           1259    16820    Item_product_number_key    INDEX     ]   CREATE UNIQUE INDEX "Item_product_number_key" ON public."Item" USING btree (product_number);
 -   DROP INDEX public."Item_product_number_key";
       public                 neondb_owner    false    222            v           2606    17063 3   HomePagePopularItem HomePagePopularItem_itemId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."HomePagePopularItem"
    ADD CONSTRAINT "HomePagePopularItem_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public."Item"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public."HomePagePopularItem" DROP CONSTRAINT "HomePagePopularItem_itemId_fkey";
       public               neondb_owner    false    254    222    3369            w           2606    132374 (   ProductImage ProductImage_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ProductImage"
    ADD CONSTRAINT "ProductImage_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Item"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public."ProductImage" DROP CONSTRAINT "ProductImage_productId_fkey";
       public               neondb_owner    false    3369    259    222            u           2606    16845    Submenu Submenu_navbarId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Submenu"
    ADD CONSTRAINT "Submenu_navbarId_fkey" FOREIGN KEY ("navbarId") REFERENCES public."Navbar"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Submenu" DROP CONSTRAINT "Submenu_navbarId_fkey";
       public               neondb_owner    false    3372    223    224            �           826    16392     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     {   ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;
          public               cloud_admin    false            �           826    16391    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     x   ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;
          public               cloud_admin    false            	      x������ � �      #   �  x��Uˎ�6]k��`:���u��(PP9!�W$1hw�'m H� �":���<,e��x~�JO/eMͮ��x_��{u�WQ��( �1�8f�2c�������_����>E�����g�����e�2�iQ�Z6�f�!V�5goT�h"KY3�"�J0�<� ĥ��"A�J�9��LT� ՠ�4xě-4G=�)��|�h6�t�H�鵥�?G�������LЧz���K�/u;B�=���{.W��~��������tg�p�t7�V����x����.����n�����d0����/�JO�!�����,E(�b��~� $����#[�ع#�x}�F5�����t\�^��aL��8��	�%a8�|O84s�c�z3G���ܘ���,�Ϧޝ9�{��~��w��ρU�Y��ks�y���dM�!�
�����12o-y+Qo�ym�-B��}T��f+p92X��O@���7�{:Կ �|p_��.�4p ��2A�ǷC�Osvi�������j ��q�|���um��g ә�V���:4n`j/�-���W����A������~����8&4Č�$�Ȅ}<�nBlI�S������ �+B?��p)�~(&Jq@� �=Ag�d�Æ\�]kv��/���~�4�.N�{L�����s)��X�Y�3�8<w���<�uST����ع�d��j8���6��Q�ˊ?�y�+ �GE�ʆ��#����4ݳ�$
	u(i�r����AUc��7��W�4�U0F9?�J���F9*�B&<��Y������衒�B2IQ�k^YkV���%�]tv���"�(v#�`��S�����4	&$���A��ʢ��g�]�_�� |t�      "   �   x��α�0@�ڙ"��Nr%{ �;_E"�Ӄ�"T4�f��*j��<}�QKYր����� b]��zf8W�A��t|���AMێ�j7��>��ІU���k&��Ir?s_9�\0�9��㥐��Ԩu*���O�-��#^��O_
&B��2/`E���Xk��l,��Ws^!v��I�$o�`�      '     x�U�OJ�@FדS�F���\ĕ 3��j��XtU7�@
�EB�R��W�'��Ww�<o�}BIV�iA��9�XÈc�q�J�2����-֣������N쬼�Q}9���xpn� �ƦF�D��$\)EtZ���yZ���Mg�?��w�����#�kH�����Ó��<��_�64aq|Ks��BY�
a�$#�Y0ʙ�iƔ4H_�����2�p|�۸�۾�q_b�ϯ�?0`�7���C\��_��$I��>��      ,   _  x�m�ON�@�ׯ��cʟ2-gq3S���)u��6D�xD� � �
3��<��(�⽙��~�e\�7�#9\n���|&�J����U�uQU�z���"��A���$��R�0@V[t�p�}�0�OD�]�C���l[0ߡU�R2)��$�T�Qu ���\��I@o�H�R��Z��L��Ȥ&�eR3*��g�]�tNqf@�X�,J�=�["�z	��(����M
z�s���9U�y^]��8s=�tٷ��n�zӳAtǸ=&�7�!�+]4�p�Hb��>�_��L�p�=��p��$R|��1J�����O���=������xg]^X�����y         )  x��V�n7>KO�0����s�����K�`K�j��7Yv�I[ȱ(�F��e[R�8�^��~�>I�����n��%��ٙ���7R$��$�i�2�Bɱ	�$I)S1a<-��r���[�w��6#؎�������,�M��Dn��n	����^�ө;�/�������n�Mc8�ֱ[���ry}�:GW_#�;����q�qgOl���Lz����G����&���
��gnݺ~�wd��5թ
+Ř)�b�C��N��1�R�מK�Џ��䍛���������tw{Ŏ�3�:ı�3�H,�,�:f�P�Ĝ�~u�_��ˏE:��_؛�2��2���M4�\W��Ag�n\>��N1�u��R�F&8�4c)M9���������=�@��c�8�cw�{���!峺�7�0��X7�ju�����]��p,?��/DQ�߇*'$1!���4Y`&cJ#���*烖��S;C���ع����[T~g/�̾�gY��_��.�|Z�>��6���^l!{n�޿�I�}��]�G�:Bv����]��򨉘}�C���dQ*�v�'L�V�i�01<�6�
�,Y���J�Xm �~�l��yM�?�Vy{Y>o$��O^�� E�f��Q�CNC�=�B��*V&�&i�᝿?x�5�;��zV]�8��ϕ
L�yS�9�>g�T\7�,3�Ĕ�Ȍ���Zb�b�C�T��fJ�t��tG��':?@��i��#���;f��L��]���j���FYo�����B��uȪ'>����u�LC�p*$�"�8a�d�<DV��Z��n�@4�����츮���G:b\I����1Ò%��+���0��;�������zWo����nѻ{�Mxnʶ���a4�a��L�K.3�AFSr������w0��� G�:7:+��	���B��Y,�̤F�X�ѢZ`�P�	���4J���]>{(���ʾ/�+�z>��2�2u�a���^�d6)��Դ�J��/���s��ʯ��%c�R�a��_(~���n��^�\      !   |  x�eQ�j�0�V�BP�N��� ��l��VX ���r״e4��]�j#c�h����$�+H�y�Ii
��_�w�?�A�n�ȭ��3�+��c����;� p���y���KΎ9m5�"4�M4iț�R=���NO*��"y�j����C��M�"��^�k�B�����U�YТ��j%h��FD�G��V�8�X�Ҩ� b� �? ﰕ���^�ͺV������躞��,t�AȜ�KX���U�&j�����)U���j����z��*�(S�}5��ڡ�US5P�V_{����(�[��2PK���C�>S1Yݩ�.]�c"D�t#R�w��܉�c�5Fd�4��ث��N��U;�6I���0훀�l�+[�`����:T���ƛ��������+Nu�g�幬[��+��+����S���]�T,��興o�-��XLd�-�m1�H�x��0�օ�*�8.6��Ysyi4�'bq�c[�Рp��H���f��?bV�T��)�"�=���qR��h*n ���gb	=��%I;���."��;z3M��﷗�@c�i�	�X�d&���؀f��P�ˎf¦���nڦ�Y[��N�s�|sD��ɳ��n7�����1{          ?  x��RMk�@]����N2���].Dp'�d2�|II�Wwmu!V�_ Tp!Ul��El���{�����q�M��3��{.J�	!�
L c�@e����$㘓4Pe��u��f/�hZ�ә�t]ƥ���)3�ߞg�B\�tL�'�"�D�$e�J��I�Xı�4I14g("H�p�Y�P���E!�A�(}���`!)���ba�{�ȵh�!��\R&�a9���
��xj�:�"Zѐ��f�Z���.�6kUe��q�8%�5$���j��{���v-��i �ͺ�q��� �0|���/��aw�5��gp~���>��8�߇�aσ'���W���_���u0��q�T���l}Ƿ|���c냸(�Դ���N���(�g�V]QWQ�>�����2��KU�Fv�,WR#2�$T�L���y?5E6Lu5�1���39XiT�E�:�^��	WL�T�D"��f��вL i5F��ڕ���~�ʝ�o����~ӝ�o��oF��Y�ҝ�[��w�k/9t'�t�z�;���-��S��~�����K�'�d2���         �   x���Aj�0D��]~bI_���5
�K�6��	�����u�u�
���
2D9O�������hS����\�Z��N��[����{���#�q˶���e��_�?�]���M�%�Y�`
@�<�EŕbҬ��Mďx���O�g:L�O�j>F��& *���\���u)}�(��[�N�tK��8�9}=�ON�,�,��hy         �  x�͐AK�@���_1w��Lf2���PP�A
�y�$_�P�,I��mw롨`AA��h�+�.E�3������D�&��7����W�B)�K��OE(B��OCP\$.D�ʝ-U}!��v��4�W�#av�\%e�f1�2�i���{iO#;�����'�!~�p~�ܑ�����(�c{��r��;_�F�ǉ�%���dEZ��e�W�~���rՃ���e�&��$��f\�z����)x�\e��@+�  �G�%�4�9�2��� ��;P����E�@B�+�yV��w�8|ɻ)�!��
��T��S�'Jx��j�b=���~4'�|3C��o���e~�d�̌�i@��s�ȭ���%�������?h��K?�1�fl��IK��V���C         �  x��S[NA��Y�Z��^���-���@���/�@�DC�a��3l�&�Y��:4���]�sn�[�r� 愠B�����F�bS6��qgw����ns��/�!��RF�E%P�$��J2F��dn��8�%|F͘BV�&M@�,��`�]����oF�ۣ��� �v�I�L��QE��D)�J�9�r5�����ChB:Q��� ��pRy0��ă	ً�xwP������a��7u�A�e]��h8����H�i�]}���\M��V�b��į(�-��H]P%_B�l��/���Aw�}뮺�����;ݸ?ꎻZ{N�m:��˾�j�ɸ�PAFR�S����ȹ��������W�?�N����9
��`�]�N�4D���b�}�3�����
z[�ge�<7\H�,�\V��b�㘍i����������ؘe�:Bւ�B��Ɓ`��BՂ���j�8?��9ỵ[t74��y��ΉטbP��9:;��T'�D
	1��^I�z���r>�+�������8%�ȭ.P�:�5�����GO>��9g4��VuJ�S���y����̤���"(˄��r��yd{<�i��\^K�π�S���|�tl76�M��y��f���!�ҦY�]f�[4��Ay�HT*I��Fj��'60ה��{�b8��a         �   x�}λ�0 ��H}���@$&H	�� >Fe���b���)2(����a�Ā��4����F�uL����O��˴�u��ƃ�Χ��߱x��nJ�ऴ`x ���m�(�dޙ�����BF
҆��	'�F��-{v��h�;�I������ʲ���PF         �   x���A�0�ᵽ��J-�[w����iiDHZ��[�qq����#S���+��G˦e����G��A�βg�qjiefLԻXv������f�~�(.��}�=��F�kt����,�Ô��g�k%�xK$Y      -      x������ � �         �  x��R�n�P]����!���u�eU��n*�k�����I��I#�Q_�v]A+7��Ju��\K�|@��s/��R�VQ]`�Ϝ3���uk�6�e��IUwtS%�ST�*�L�L��]TZm���wل�m��a�l���A��� p�����[@.RfY̦�6v��.Wv�6 6D f��9;�Y�=a'yϐ#�٫l����.� ?e)d/���	+�Do;M���d��Y�����e(-��\��J�پﱑr���;J�XA;R
�Gj4,��6��H������Zӯ��U�)ۤlPK��ץꆽ�Z�ZRK�DӴ��U���]�,�y�����>+_>��O�0<]��N;��[�"{��V�c䤢8�n�?b�E��	�zB��q`UG�XL�7��>?~�3�E�+���M<��|����� RI�YO��Lߗ�c�}��Ǯb~���8Dn"6�-����b]%u�
�˝.nv3���Q�q�Oғ+��Q����[D+�SV͍bI���d���r�.Ӷt���m!�wۡ�N[(���t�M��"x�#�hDy��hҀj˥���ǔl�~�@C��.m��q���>HÍ:��Q t��:`��֩^ p�	��E��y����^c�>         �   x��;
1 �:����L>[{�d3��ǰ��Fe+�
����O����Bb
@l�4��Ɋ"{�൘�=/6�%蘆�Jm�@� ���#�u�1g�=�r*���<ʽ��]� � ���h rc!3���2�8V�3�sk_/u�v��׳��N�'R���B�         ^  x��=N1���-\Pz�c���B�܀�K"�l�MHJ���QPC!$�
��<xE
A1������QEᨷNS,ߴ6�C�2�d�n���f�²+���;���z]^���u*C�T��wUj|��sB�3
�"D�P��7��𼹔`Ah��x*IDDVr��DЀ:�'|L���XMN��$|��!X�(!��o�ul�L9�@+F����xi�P��2*8Axw�.�Ӗ�t����u�[�(�L��p"�N�j���EG���M�D]��Z#]@��X������������o������x�5��4�CF�S�Ar�����9���sx�����/��d��[~         �   x��=N1@�ھˠ��س��4�#!�"�A�I� -%"Q$D����9[<�{<�dr�|� �� %�"�)�ܩ��4Oi��ͽF7 ��h��@�+Ӂ���!�ܓ���I��V��$r��uS_��^~�Xw:pf��������\,��ǐ�t��k;����>�{�^:,�Yth絾��Z��TP      /   _  x���ˎZ1��uy�8�����T�NLO�pЁѴo� kPwY}�m�4e)�`6f�J�]KW��_>�0.����8�׏�l����������O�z�f����s nE�K���j��;�U�*��NU*�u�Yc06qt�nfB$��"i���*�F�1tZ�2H��2r�NX�s����y9�;ƥ��tÄ
�!�d���?���Ñ4<���z��;P����*�L�ӫپ���i�9VrH�0�>�b��Z��z�K��#i�q�)J�=)h��ȅ�I�K��uS�Kn=H�K��#���kC�e�<��h��_��c����!�Y��O+��T�	S��U��v��?�|�      .   �   x��1��0Ek������q�)���$vG� }��@�� h���v��V4{G�9�y��7��2B�X�E�#x�X��Q�S��Xq��B�ե8�k �-X��,��MY�k1�߫tI��E��c�<�>il��C����Z�[n�����Py��?��4�{~LC��������7�z��Z� nME         �   x��Mj1@��]�2f��ݢ�&_�P�h�՝�G�� R��-�	�E�<f���C�<P�F�5�$p�+�FG?mX�������-���-�Vܑ"'�����5� �m�D�Ȗk�>�-��M�ˇܥkޥ����~�s��S+t���)�z�#��(P��)�oBt��Xٗ��+�r,�����v,�q[.�s������V�      +   �  x��WMoG=K���CN� ��(���C��v�I�a�i�Ҝ�GJ��6l8�����,
�Cq�a����UuIIv|��8�]�^�*�U�l߫������^q�Z�/VԽJ���-��jiCy��N�ZڻO��?U�=��O�j�U�t�Tk֛m�u@NC�6=_���S�-�k��U][�9+���'/��ҁ� T�����C^��y`���:�>մ8�n�;^�aR�U�n�����Y�@5Zp�j��j:���A���S�&=Tuzج���	�F���.�G@��z���s��Ax_s=m�C����i�����s�k�m��+���σ8|���z&7��P�r���@WQ�z�ڮ�5��j�;Mͪ�(��9\�)�)���C�i�m�h=9��h�42�t��+�&9u���;-����V̺�E_��p��Ni��.�X�}O��>A$Z���e��. �A��-�tj�lO74 � ;�
���nPM]k�z�@d��S��6�UUw�*CKd��}�ض����+��|R�[)�J�o!�o7��Rq����:���JQmoW�����Ni�n$�I��0=J��d�(����"y�v�Az���7}F��d��WɌ`�+�d�D�="xD�{���9ჩy��o�c��z��䊓s6I��m}�ġ�!�9�8M�8�AB&�-J~§�p��q""#G\�O�!� }����%J,S����+.��**65	�$�Lb�����]�/���f�V������q1I3,~C`.
AG�J��;�whIx��n4�_�ӧ9��"	3����-�S,���8�%p�xv��Q�B�l��(��1�(�Ű{�c���J��X�#���d��'7��	�9�wp�������g��Nf�s�$�� ��&�N>_��´�&�'�=��b�h(�MY&��YFD���]�͊� 	���C	���4�;��00�M��5
�L6��d����9%�E2���ڔ2��08D�C�7���\�����fO���[/y5Snf����Be�O�fh.儗D'�A.z��LL,b���r�{@R�-�_A{��v�ڮZ6İv�ճ�#��s1�c �Ʀu,�u.�6`&e�>>u�|���Mzj����Bo�.�h�(�����DD�6�blWǑ�&��x])<�״����?�h>_�7�u��;��J��������+|t@��<ɍ�N����ᙰt.�eb��
�lI�-%��E�	L��~�L�����X��D������.�s!�<��?B*����,�b2�=|SW*;嚣��wwʕ���r�X��-K�R�[�+�7��ƻ�l�u�g��Q6���^d�E'�f'8�d���~7�u'�� �g�,��0�d�|G8�gonC��);���=<���}ؐs�����8{M�����O��0�
��,6�,�����d�D����^�q8G��xM-'�8��""�Ư]xf����1�y����4�b�eo��3cW �z�B%��T�)hf��c�m,^�b�y$S��Z�Cd0XP�K���>�x!���M�����H�``�	�.^z��e�d3��dI��Z=�Wܬ�d����~d"�YIg��Sӿ��E I�b���^I݂xu=�	�r-��\}Y������59Ow����u���.��09F:�U��EtMl��	�<����@�@��Tz1�]16\������"��p�/e8&f�n�deƜ�@]�al!-'V:g$������3�ޘ"�$DE�F0pS�9O}9�g���!#5�'�LP��V��
F�F8�/3nS�{j���5k'B��j"?�*�f�8doV�Aڶ������dDE��F.��݉��[<��n���^��˷{�v/�����lmnn���T�         �  x��Mo�����_A�W�b���؛�=h���p>�\(N��( ��*�� AMӠ	ꦊ#يc�����%}I{��//�HZ���w�`f��U���(� �He(�<(�11�b�3��K�k��4��ew��|��~XUYQ?�_�Q��_�ݼ�O�G�=9?(�CL:��8�߶IR\�Z\�����݈�����k{;e,~o�:��Vs��O�cu\}_Vϗ��S�CQ=�N�gՋ����&,�1�Qu�y�V'�-�pQ���{g�g�p�q�A�W�=ƃ�������냳�.����]���϶~�V�O��UW��W�W������+����ST_�������&G(��?q��_w�h����GE�u���k�U?h�7a���u1���U�����\�ܰ��ͫ�����\'mż�����w��7�^,��q���w;��b������~#�u�H{;q7\-މ�����f��w�p���n/����:n��z\�u��s[+���V���i��r����˻��W����'x�������⻸��yR�����ty����{M���>i��&���wqs\��x�����۹C�έ[a����w���y��g�)��v��Q[�cL>�|���p�#��� P���e����o0ǝU���l�;m�wvۋ�{�͍���Ui5q�`xt���-�	�I���	4%{�I?`�8�@�"��/��[!gW�n���I=ky�d!�0�$�,��h�����`)��o=�v9v�aϰOv���%�ٕ�׷��mo�΂�Z&E���H#1R3¥)}�^${;���C/�0vȰg�'���܂F�lq�{��GA����^�%'�1!�V2���fr�U/�j8�*Þa��`v�4̮�k-�밗M^��2I�"%�@$8��Prs1f�3v���ΰgا�ZH;��ƫ�����ҧ����"m*I#>Y�g!@���(�h�/��o�aϰ��î�tN�n���3�n�>�R$���W*��CJ�)i��Zv`�:`���ᰳ{�}���efSЭ`W�k)�#)Xl�!:b��D%iB�A��t��Q�^��p�y�=�>�m��!躖=zW
��4�1�b�i�AQ�X�E�A�<;�g�<Ϟa��.��9�.�V������%#�iK������q�I.�v9����yv>�y�=�>���ʹ4zCЭ`����q lٍ%%��X(#��v�GЩ^A��:�]�}"��WsN7W��U7�ym}�H�������,q�S�`GЩ^A��:�]�}"���\3�!�V�k�5MJb{=��Jb�K�&�#S�1�M��q��tj��SY�e�'�ZH>W���t+ؓ�6%���"R�-�&>�5Js����:�+��pA���˰Ov��fΰ�.�V�K��'P��"V4�ȣ��T�[.��t�WЩ�NeA�a�즱����5A�����<�$ҁ$NzF��"�3��n�]�#�t�����΂.�>�m��.耮�쁻D�#"E��#��X-��T!XP8R_�>��ӽ�Nt:��D`g���n���`��&K]$:�H��c��$۬��`!uSozA�{�.�tt����\̙�낮��p<�cv��1;rnY�L��0�8�N�
:=\��,�2���'?�����;�Q+&�ba/�$�(��1�����v��r�ƀ�W���NgA�a��y�[���v�ː�gD�F�G�	��k�g�y���q��tf��3Y�eا�d욳A�V���;%'�����=�\� JM���p�`GЙ^Ag�:�]�}"��PsEن�c����h��y���=A�#qT10���^�>��3���t&��D`a�V�AǺ�7�:8NJ0; ��S ���BA�Rw�pҌ#�L��3��ɂ.�>��Bȹ�rCЭ`/�� 4F��ز'�H+�3LI.:��YAgz�.�Lt���a��t쿝_�t�4��      1   �  x��T�n�6]�_�=��?tS�uC��@�egl���v��ڢ@�]�� ��fb�u��
(�==��`Ҡ�By��s/� ���,	)+�G�<ti�
/�Egq�Ȟ�e#�u�����&�WV�R�f�-��:"/�rHz�a=h���A^��&5�.��>��?0A�<��,�l4��,�c��EBE���i쇅�+G���~���s����~����81�����G`��+���⮎���o�;�vXw&�D�#͠L�f?ƺ�o�� �o:�y�I�̍(�yFS&�	�gY��ޓ�|G�Fu+pl�{=5����\�_�{�����ψ�ᴁۜm���[]��+=� �3��D��,��9��,��o��`L���l�D�'��i��)��ʃ�S/���,{"'x&�R���[��{k��������z6��eڱ5;֋���0�S�`�� `����A��ԹnY{z�F�۽��i�Y��"�蘑�&yJ���1���s�G���j׎Զ5�T�������3�l'�O���� h���S� �D��wD���ڨ-�8K����!����ؚ� PK��w��"u�T$�7�of��:��i��\fF�����Q/�_$�4��♎��:@4�*2�(�k�������	2�C�ͳ:����#zfUZ}�X��g��V���PS	�jϞʟ 鷶�5��(�d�D��͝��O��e��K�4��0z�<y����Hy2l*"����˚�J�G$���2�e��|�'�0/{/���q�eʲ̧������'a<�{�2~��;_I"�fX��eu�����M�&M}x�$���I*���	�/����u%�\,��\.�Ҹ��E�	6W�8�7�L/�f;���l�]}0�n4���k5o'�
��s�B�aÄF��4  z��`��'��lG99�|s��t��F�      0   �   x��?N�0���>E.���da��b'��۵��*DT�`@�^�����7|҇
��a�h]�\�l��d��>+?��,�w��L��0�6�ɦ�T5x��ɕP�xy�N�_�t�C3}7��J둮]��nk��]G�%d�� ��x�!G5BS�>&����$�򉿚���߶����O[����U�x'����\@      *   �   x�-�Kj�0������h��t�n$Y)���4ݻ�	��E��y\h� /��TY�3?ߌ�"��s�r�ѹX��d��\{�	�����6����z�_��!=J�	��}-<9N��
֯0��7}�nh �e��K?����4��[�K:�R?4��v"��J(W+��eE)�\q�ꊴU�
�6�cS�y|ϟ��J�+��K�A>N�+N9Ϯ������16���1���~~      (   �  x�E��j�@��GO1����X-�
�f3���cE
4+�BBw}�R�^(!�8&V��N^�:z�ɡ���/��AK�n��\���8��k5���Hv�C�?�c�[v?��Oy:��7l��*���lj�$g�bO��Un�T�᝞93v���3L�9S�Pzl=�+��υ�b�wíVz�1
	Y��x�+\6%�O:�����)_3|��w|���5ָdX3����Z~mJ:j�oN������u� @�l����q	�" �#�c�s�מ��m��Q�;�"�	�6���
*mT8T���}q��ĭ���-�%s3�pKW��d���3wE���_�v��K�b�9s7�T}ީ��:��&뉌�}T��|�iQN�䂪nE���^0����w���_o��y��*%L           x����n�6���S��]�P�t.�[� ����D�-��An��v[�E����@���6ۍ��ίm`�@J?@��3����\�(ΐ��|3�I�2��kq�7��t}*U�+��yV>h=O�bG��Ru_�a�"�ʼ���<��������e���PE���ףz�A��U-�E5��),ͪ������lJ���7���w���w��Vs���v���jL@�l��]uS��e���b��]�Q�9>�$�,�D1!�@�T��/8/��ޮ�Q/U�O���I"H"�r7tH��*����=%^���zݤ��Dd1�D��6gI�$��rc�b�QG�1K�"��M-{r�O�Š߇�L_*��*/X@�JD
L��+:J��EŞR%�s%�E��B���2�7%C�
ǲ(�m��r��I6�s[Տㅉ�#Ԃ�A�	���I���%����� H��?��@:�|R���j�	����GdnI}�� �quQ- �ö�y�{�&�w(�m�J�xTFL&nhI�-����#}���
�sx��>][���j���T_=��|�P{�oW�>�a�x��1�gzB�[P;ǣ��]�N��٤�p�;}�f�Ö'��	���ZuFV�P�F��w�'��m/�$N�z�N��Բ��I_m��y���\azO�֧��oZ��յM ���E�W0_T�k�.#إ�9~`����b����������_!$���� q��X��	��xb�ƔG�C"��F�1WR�l�>�ƹ�rwc�;�r��/�2R\�[�C��}g�����z�+��4O��ue��^8`67��x!���ui��kD��ZPe�x�3CÈ���J?�Bx.�-�� �9��-��v�զ����K�;�3]� �c��a��D����W������!|���b����>F��� �n��9����{�zh,��툻�����z96��(���r�6.���>��^R��Y��NA�\$���3��e��n����S��n�QE��Tю-+t��Ҙ)�'�q�P�g�k��gs��a#�q�"��TL���{{d���r���C��Q2Ȣ2�e��=�w�ݶ
'����9QC��W��!}g�"��0�1<YׯeX86<��91%ql��'D�Z/��[�����ySQ!�jO�2��*�4�o���5w
T5�G�Vö���$����Il*]l��bn�]�&�ȓNkZ�Ҙ?_���c�X ����1�ƱƤ�z���`����:�>pj��m}�x����n��ʼ         �   x�uα�0��}
_ࠥWJG����^`���K�����OQ:2����u��ؑ��5�	�k����;Q��i.�^u� M��+�&m#�ΤbdI��XȃE̝����߯3i�i�t������Z4��i!d�&�){u{��$�If����SRBY      )   �   x��AJ1@��)��$3I�Ep�L2 ��.�Mg�F�AѶ��R�R�
���yW�=��]��Y��h#�������RI�2,ݲ��
���~	���}�uk�
�uU�z�"��ck�݊����P�	_��?!��Ͽ���ߥ��1�/Oe]��pΩj�<*):)Ja����4�/�iK;�wڌt���zz�a���6t�W��?i�e~         I   x�3K12IMJ��M�05�511�е��H�5�0INN6NJ�H�����MLO-���O��w�̏1��ҹb���� ���         �  x�M��nT1��{�b��C�c{l���Qd%��n��(�JE�J@����+x%n����l�ߙs|�Ƭ3;p������KIr-CYI�����m��FϚSeu Ú ��\�E1s.���жǛ��}o��M۵]����p�R�`jb�� PF�(�5��i�����ڶ�O�����zD	�p��EG0
-�tWT줆�k�M�^/���,߿��=[R9k�k���6M}5����0}����e�=m���v?�=mz�Ĉ6K����"%@e<'�R�%v�����?O��Z�z,��h�@��lD�x$ȥPuU8H�U�3��~t�}�q����fF�`��I�'�f>��9��{x��7�!U�eK�`�+�EYp�7���k<��7��n����x����W�8�����      $   x   x�m�I�0@�ur7M�f�rj;Tb�Ҫ\���g�\eT���� 533/������]v��5�ܝ�3��x��{؎fIg
��&��:�R���%���כV��Z�Kv1�      2   �  x��X]��|f�KC������H��n#"�A�P�}jΒd����:��Sc�\U^��}ROZ%�4��,Iދ�J�w>����������a}�d��_��?�~|狦l�i�^��I�s����e�u�B��k��f�X��ONBM�n%�.Q������?o�i�)��&y"1MF�S��&Ҭp��������m_�I߽�i)��1GR.��W�%.9�c�aܸ�K�% 椣Y*���]�����(��J^�S���Zs�5%��<J-nW@_��_&T|�A�)�p�I�&��*M[�V���x��J2�H����Z�� _�T����(��:l��@��v�s�D���k��\�ۗ>��]��5���'�$�j�ZZ�Մ���lYMc8x]ZO6#RSq�ۗ}{�������{��)��+���R��*e^�{���
���IB����'���t�í�u(s��%�+�`;'��l�J�"O(���F�kA�dK��A9J��f2�a�;�?I���-�����V�
c���3԰�Y@���'�m��j���K9�Q�- ]so��@q(\�q�j����zC6��99��m%�����L�y�3��TvHՑ�V#��ܻ��~_�|a� �L���xaΙ�aR��V���$�+I�Q�Ԅn�q}k��F��e�GPdf͂Ʊ-�A����{�@?�L襠[@<kTl� �V!����ap��ߐ���Z�P;?��!**�����g�r�܋�k� �tE9���E
����D�e@w����h�{5=ੋ)��O�Uޒ�.�N�3u4 �8$��f�Pȩ�2>$U7�m8��[����Oa���'�*��n�Ʉ�ʎyjf�X9����q=��J�h]�0���Pp0�>�}l0`����}�>�NT*v�k�I��.>I	�Q�-$�2��h�ս�v6<Ś,����e=�5Aא��wR���kϦQ��:���� ��&�t[�#C�VۻNms�'��[H<V�:+��c8�(˼�1�I<zCF�$<5d?�G&D ���v�5�~M�n�5	Q�-�
�zz&
?+��KZ1�'�Q��(�����B~#(v�	=BO>��H�>�Le�aD$�X
��Ha��$�E�˚�w��?	
?��4E�GZ�$A�@�~1c��~�ۯe��5ms�hJ�*���s��(� �`0DCn�7��
���CY
uO��KE���i��A��P���p/��\`͊��1ٳ%��i/$F,�w�m�yȘ�A�������Z
�3T�O����}H���#Iꙵv!<9�ސb�%^���pGM-6� X���vn�`��P[��Ia�(hә�%��2"��Ĉ^��-��a�4:����Fa�z���(`�!�3�����|�#>��h�Յ<�g�B��ݑ�jo.�������o�٘��*�y�@St/9G4�	�ʎ[���5��,2.�@]r�cf�gLFV�t�{��#��K��%j���g�"�V0���7�D�6k�V/��kI������3m��M ;�0�9dl������zE��)�`Y��N	�Bu�%^*�GE��J�^;Ȭ+�a	v¸�m6�C�>�A�����89��,s��]}y=ڂ��N��7>q�Ƹ#���,k����f�i�Ȣg�?2#<}C��.Хݽ���8jp�;������p�=}�~�Rgj��&�ޮ'�a8,��q*��Moq�$ֳM#�n1�ӓ������W����$-GFx���l�>s�Q��Q��ĘaD��:��J3gƽyi���- ���v���YY(M�3q+�16-�K1��$��Λ��<�:�a"��nt5�A�mG����g9��(蓖�F���.���lzɫ�V���(�F>�^�O��.�(��?(��:�)�Li,�4�]+�9��A�������;3��A|p� CBy�:��,��Xo!���q��;�      &     x�E��J�@�ϛ���l�M��-ī��tR{hZJ+xk��� � "*����O�O|�	8y}�z>f~3�ǀ�A�������P��� aÇ��$lw�?t��kt��u2�������g~ʆ������V�.=�p���V-�����p���r���3߱����Wk�/��Ǹ*�e�,��������G@6�A*.�H�4�EÏ��P&��'ZS^���:�&t��-�l{C�,�����#���_"e4�W�UӟSzp����H�      %   -  x�E��N�0�g�)�FI�8�#0��8��T*��9�b� ԉ��HH�����<�yp_�C������ww�-�U��,��x�%�i!��q�k�Ƒ���5���l��|��^}6�DCG��#�n�?���c"�b!3f1�e��,�V�$�&+4�X@��]	l���3XS7�j�\�f�7Xa��d���K
5���nN�n�p�` ����iO3.�fJ�fTf��ل�>�~�+�A}�-�3E���n��rWv]p�����"��p�����+������ �O��         �  x��R�n�@>/O�/�*��&����^*�b�"a�D�' ��VQ+E9D��@�HI� �(�'K�#���5�i){w����f���\|E,iV2�Ӓ�Ēf
ajɬ����i�	��f�a���r����Ys��-�\^Y@�^�pa��u~s�}��`����N�P���L�`s]�|��E�*\��DI�&f�[�ʵ�;kgj�m�u��T5��Ol^�~�i��qUE�}�ܩ�Y�|�3-��
����v�[�XX$,�X<��O/�5�7-�7RZ6E�0��T�2RV�H3�����=��~e���W�K`ֆ)0
7���.����0z��07�fآ��~�i��T��*�6�]������t<R��V��r���|��������t��|��|�I�#Dxw(��{0 *��@NA�r�Ҳ� �K���&A��t�}ꖦe�S5Y/܉Hc*UG~�r�hcTL��W���3���Z*!�D2�e㺮��e�a�M��!��v0@�`ח8�>��Y���_8�T{�؝7�c�94�μ����HܓZ���������#B<�bO9]YO�tH�D҃n)]i	��C
$ԗ
�>f�Y�����'r��CDv��H�v�F}���7�3Uu�/�!;�g���1�g��D͵����N�M��m�I���tB����^Ȁ4�����4��E,��Ű         9  x��V�oE?o���8��I���~pl��R\����l���Mwע��4)R@���AU�u��u>���R����MjR8�-{w���y��Ʊ�<bIC?hR�u��P���	�[�,ֶn%)��} �>Ի��~��{N��0�=�O,������pG���=���=�Ǻ��{����7ۂ'j��mX���� ��'��.�W"z����P���#�lc�����eds�Ԙ��O�l�c�L�lE�7�V"dv3b��J�v;�c�X^�,ʼd,�B���}7�n4�K�
4}��v(��\&�^"n�$_M׬۫IKd�븛u����I��R$��YQd2�eNXG��X�a�)���iF��nF"�[wA��N[-ɋ$��������#�^ӣ.�CE�K��vm���B+�Z�5P�{��jB^�V���|�ʇj��,�=���X�s
�}����kDM��M�Pո�a��@���Qc0��װ�dA�� �C��CX6���������:���}��f�fu/r�e<`P ^���i��톢0�.��9��i��`QKZd��t��~���bBf	k]9y�E�� �xea��t'�h�-#ʙS7\��AY��F�y�����qS}f:�g��ӳ�%M������E�{�=	<z���FM���7�Y�܌Pl�������x}E�m�Dö �6.�,���H��u�g��L�������D�+�f���G·&�3��p�;�0�Y9�-b���������"��@�Z�@���d_]c�5@�.����M`A�zX����~�i�N�0�H�����}H�iT��S��j9�{�jZ�������m�,^ݧ�o�	&$ �@8nh�u�4��-���� }j(�@��@ �i�U!��3Z@�q�rD��b�7T<��pbtC^���u���Թ���4jO��{4����h`�>u��GC��ǜ& P����hz')��$�e��e��[i�H�w�����V�I��$_�q�߸:~e��v��+ӷV��*��Ig�۫cx�|(	W<�O�k�+����%j�k��E�&EJ`����Z��W*�����c��CS��w,h�#A��<��2��gj��ģW��&�ݤ|�#�|��Q��e`�����D��c(��:B���p�}�bL[��������K@�����:4e�Z;�_ ����yL���?].� ��e��@x
�{,����Ic����\��!�G&�!�/�	v^ի3�`��m7�����g��s&����m��������q         e   x�}�K
� @�q���Wd-�=b�4����s���=�
fY(�i�-�Q �l�M���+�7�0���4�3�i�/Y��}����*�x�����vd�	!s:4�         �  x��U�n\E]�|E~�H?����H����'D�D�c�α,6�d��b���؊�����{8wb[�+Y�{�u��9uz���ρ�uG<���j �):c�m����������i�G��_?}�w��&�b�L�m�M��\..���#��bm4F��%6J�F�ūjw�t����������"�֤�IiL���l�'��d�E��3�'�/��;@ΖA�aFT�д�Ҩ�P���٘�:C}�����ὡ�.+�k�Ĝ# J'��)�wQZ������j�~�؜n^Mo�7�œ���d�{�c:ߜ�G�S�R��ţ8�Q2V�:k�VDƺ��)R��&� x�,KV�C}�;�����t���=.��Ά2R%�+��M���M�h.�����H���k��^�e�@� ����)��}c"~�ޠ�Apy�y��v��� 9d�&2y1د���%k{T����_��g۟�����:?�O���v�����W|����=�}�fUk��>C-�aB!�ҊKE���	���}s}�}��ڣjE�r�X���[o�X��h��\럫]ws��볽z����RSO
J�=R�1�Ѧ�Z�>�;�f���3b��l��-bX����a�)� ֱ�K�#M�[�L=z���9����G�.͉����
��:��
�-ca�:F�2اN� 
chإ<���ɤ�˾-���+`#\U!��o��_�d�1����<�A���*:k����#lJ�=��m^� �M�g� l�t�Qp��<13�}d��'B
wN`D#��M%W����^�">b+e��];j�����^�G�)7'[*�7�-f�����m/=��f��@��L���il�Q��==��(*�Y��yѴg��+�{7_nv��� �[��u��A�E֠}��"����;��@�bڃ�T��HU�w����,��Ֆ��s��|�����V�מF��coG���<��Sm賏������P�         �   x�5�In�0 �5>[#>�6�ҪT� "CE���O0)C՚�=}�E��l���v�89%���C�$1���Dc&MqX�捥紼��>�۪�r_E~(L�s��=��!���Y-���>0Ѡ���V1G��k�- J�.=%Bg:�/Qo���jM}�]�ϧy�7K��Z�j�]��ʘ1�j�612�_^v{�c��)=\      
      x���[�c9����V��
4���4�u���j�&{���\r]B��2+Q�!�������{.F#U�	nSw�f�U��Tcv���e��m{�S߮ZW�H�����-VR����}��$?�~8뢱�x�7�~��C�I|������������>�����/?�R	Q?*۾�Rf4ۮE�n���6���}	c�ql���+?B=I��ۀ??ZN�Ƙ�3�2%ƽ�Ys�ᑇi1$SB�DC��5Y��(�O���s��'���X�J��!�>]�!���J��:|w�Q�6�r�!�B��FW�DB|=�����l��>��E�6=�aB�Ӕ���n�8g�0�G.�6缴��X39�����v��`[��{��{C��n����.���hO�V���>��>��mI�}���lD3K�z�k���0n��!��>��(��VJYs���V_���%Q��P[�u��K�.�]j~�P �8y�>Dqo��˪\+��]�33�jB���6���gN }ؕ�K�Ķ��^�6q��1d�F��@�RG�sG��j�זJ�� ��IEry�>Qp�m��Sjt����O�?\�Om7��e�Λݭ�����6�jΔ�����-������L$��=�i�'�/o�E�Fw
9�P�r_��Ͻ� �����䬩i�2Dl�e 	�PRX+}�1v<�ޝ����ZZ���m&�$�e�&���޴�W���=$�h�x*������"�?��%�riZ���ڽ�nG g�6�ó���E�/���}kiD�v�^�9@"?sw+�T�ٕ��p���i�./r�Ot�}���m��=�$�^^��
»X����4`��6G�)�����s��:��ʤ�� '��ڗ�\��>n gJvO�V�μ�"�R�S�.��k���"��I�v��@{Rk@�|����U�|�M���8�K&��f%���JK6�L�l�9��|��-[W,� '�2���|������5K���N���x_�)10�k�m�ލ�ݓL�ˊ�&��]$Y�ӵ��%�6�#Ҧo�V�>�՛O�U�?V��ql:�� 慪l�IF7me�>dEM=D����� ��:�9��m�؞��d������uCβb�Vl+�Cu�E
ө�R��w#Z+�7u�N6�p	>���f�lZ6N�j63B��o��돵d{�5�cMAa���I�ن�3�v��˒�{zдAl���E�T[��l�]���O�W��V'����P.L@��8�$;���]������AUE�����-�bpR�~�r�����_�A����8��q�=�SQ�%zd�Go��j7����E�� ��Y�J����xZh9�JuV�kTAt�앀��m��y��zB�>����,�3_N�P�3�Uʒ ��uӪiT���k�N�|��)��A(���^��vߩ�a���Z�T�n�-�[j��
��rO-��oZ6�|�N.U_����3�M֪�dʴ�e6��kM����|3C\�0���@���B^Q�������_�Q�2K�E�$����{W���y�<n�
��	��)I��M0�d�	."��hCjR)�f�����$�mgM(����V�B�4-�l��U����!z���\�*���U����D���
䴾�	!���j�}h��j*^ *���u�l�+� u�N>Q"����z|�b����^�D�8���$/�[i^g3,x�Y�q	U5D<<�6���n5����1M6�F���3��J���k)�E~J�x�k�0mA`�Y�ܻ���@����Խ`L�����<��ք9(�ޔ�Dvڈq��p�S�̮"	v��7h����o�S�B�����ˋ �����z��}��\q_ڸ�vY�)p��J�v]���^��>(推�)P��wRw�Ff�x���g4y�dު��GŶc^SpO�TB�5����
k�������ȹ�{ň�7��y�V�|�w�yHԭ�%-6�A��4iB4����TYϗVp�mt�E�����L��7nC+N����i� ��쀺,Ӡ#ziȬ^"<���P�j��RP46��;¨#�+�+2hv���z(�����$z9a�$?�}��}��X�<U�hv$�C�mY[iٝj/)ࠑ��$8f�05@ڏUPc���K��O<Z7'����a
Ԍ�{��t��˳�������_/-K$�׬�L��3e�+�� �?B��Y��M��YIH��Q.O���0q.���Kk�E�ي�x�����eI���E�#B�#҂�c$p4�&�q�"�%�&�G�
Z ��#$Ep�FG�g����.�����H ?��'��G�N���$3��\�H?0�P�0h'��s,�о掕g{L���m�G�\$΃-lf�M F)�QL��%V�y�X��3^uZҎe�Ѣ;���"�
� �U�N�^�����鑨�Ez�O}>ax?��\�1aś�T�j	����²���:�h�-+Ft��R������#ӖEs��!�9	�پ�z�UO�Ϻ��N��)��EC�H�A�@T��VD ��;;�XM�����3�����Z�Z�R/��IZ�,�8�!��WU_��8?e>��e�1ܠ���y�fs2e�L�7�A0i�����%�"�{@[i��dR8�\���s�}����T^�������X#'^�S������S�l��?f.P�ZBq���D��,��*8vj��z!�'O�vl|;���JT�ut�D��D�Q�>�ur[$�h��&����H���t��"�`��s���� ծ��Bxy_��'~���X�0�����s�s������������_뿾m�Ow�$,�P3vթNut 0��m����N���噺�N��6�s��Q���
�1��dJ�J=ޱ~l�H��r!��S2r��al�nx �s�E�T ��&�{%ly!y�N�O��n}o��D,uH��miC�x ���$���P��cg�����?���։�V���Y�nu��3�69#�V�}�ֱ3�[���S弙��U\,ɦC/ f����b-�czU7 �iD\�3��Z��I�����tC�ѳjVbJ����>�)��)�:z]ڱ#�[
����ߎ��,^Ǘ����@\����j��E�a��r��+
5�����Sǫd���A���
9�C����:ˈ�cg���Ϲ3ÿ{�p=�����CƯB�[I�θLw��M����oe������]��丰-"�L�ɽ�gk\^�cYv��!�-�z���C��=K��f�&�܉>��nO�0#|!����S��(2�2=E�f���5_�~E���+��_	�m�m�u���,;�c��_c�Ob�����{wI�𓲐��3�!��=7�P))�y���R�?���c�ۺ��e�I'5�f�ܷ��hucA�*c�5��c�[��l�O�ތ��=�Y������V=-_�٠&,�(���c���W��w[v=�*��h� 8����L�L�~��(�6���b���?���9w��~���Lz1A�w[�;3�0���<Ŀ��"�u�n��K�h�	�s5h_=��вH]�Lz(|������y��f��e���6��h�G�2e�1��U{���!�W
	�/�o묻A��b<^#�鏊c�s�6Q5�V����c���?���Y����#B~0�uy*�����®Ɏc�������)�ݞ�3}	?�_�Ĵ��
Mk�َ���#my��+
$v�Oѿ���=u	��A�C4p,iB�= �Ӵ��C�;���"�z+������g�mTAL��@�|�t@�ϰP��ǎ�o�GH<Λ1�ݖի)�:�!xDL�j��v��Gɸiw�ǎ�o9���3ƿEO�.��R�{��"/��i�4�������>v~+���r�N�o�hۋ�BP:�&5z���}�dNY�|��(��r�	�v~[G\���T��e�м�R�܂�+�Ւ���o9���������,��$g�\�Ƒ��L�Z����5�1�pw�����@b:��/Q���������3��&��)�����t��������7���2k��ܽN� �	  �"#��@�Q'��Ev�;�MSD��)����w�m�뢿=���M����,��%�`�qG���Ic:E�����G��D��̖MFOdQ���H:�8�{I)W;�q���(B�<puO��Q��2���)��:�4{��iS8��9W�!��?nحQ�x���}Ve����9d��fȆW���$� <��i9�C�[��ݗ�^�npxa�a]B�^�Hp�ek��F0��Ue��*Uz���a�gm�{����p���NG������j<?	�l���͠ϑ�8�X�q�n�"(t��ພ���L��ݎ�b-��`�D/�CS��N_)����v_�pzm�2+1<E�ʹ�q�(]�If铌׮��E񣗇�*���q��K���"9�sv?�C�_�����K/'�OI��X��W�tӘ�M�?�W�ؑ�q�����q�Q_��`~�C��I���[�gA�x�j1�v2���|�Q��XXW��j��>-�S ��rP�2�0���q��KE�(�49�n�����z��!S+�8C�Z�T<��Pe�摎��y�gR��v����˻�͋�Iv��ϙ>�c�F��A_���/jB�yܼ�R�����0���¿�?���ڴMP��Z���SsT#�r�0��Txؼ�3��
�
�iV����q^*\�1�sS��*`r�01�U,�F�����x�OGT�M����a��7����@�ca���2p��٭81�����g��/"훉�úP�\�l�zU��Jz�ԙ�LG�P�h��J=nd����ί-8�\��#�u�&_زJ���ŨHk�z5HO�S�6x��3���.%֧��oGƏ���Wo��_����y�J_dN�[�qlphཏ_r�/2����oFƏ�B��մuΠ?���)��O辺��0X�wN�O�����:��96��Hat�����m�u�y��`x4�Q�b���O�fgߝ�>���[P�в=/��M���f?�V���x_r��/������oޏ�|�Ό�6L>�V֗�|5:�0��pG �?p�}A��9O�s��M�ס�/�����L3^��������#i�Y:�p����C��d C�I!7�~XG'^ '����YP)�|]��BV�%nd���q�K
���<�4�v����֯���nz�	�U(-������|�}ܼ����;��Fl�Gu����q��R�<���d�=�A����-� v9pb|�"*��?���~?1~\Ǉ����-?��ջ�z�[b0�!L��7����?+Ţf�Ϧ��r�W��b�S2;}���@h�=��N����Ǘ����>��o���T�_r?�}5_����l P;�0�;��4C�U)��{u��ߟ�}�CV];���wT��[���^Aw�K���co �R����l���@�Z'��+{!�k�W��\5ЏR3���r�o�@ƑTm��^$JG�M��$�!Zf �
�ȥ��d_qh���T���h}	Bn�>z��~���������?��_�3��?�\�>��{��G8��{u���K��7`K�����u��Ǵ��lˢ83��!$	ɺ:+1�&Xݬ���G�X΂K׉��+�iZᵒ����l��@��uy��]6J~����۔�Tѫ^���c��G��<�((�7�MGh����C�~iC�N��v�V�[��_Q��Q���

��4h��K�E_?�������dȡ��(&����(ɀڴX��!����u:u�|��-��ܳO�S�Ğ����E&M���-�!���z}�Z��+�}��A�E�����W�/7� ���h�͂Ϫ'�eO�",��܇����iO�Q.4k vI��͐t�"�0��vQ�vGL�1���zJrB�Ż/�轷/t��:w�%_����6f�j���͆������X�?�,���,��:^@�.:gL�z5���e�֑Pm�>����z�)�{��;��&�,s��q��� :�n��!gަN����ĩ7�>�
\t�J__	H�(�Zs��J�= �j�[@Cd(���Y�����N�%x/z���eo�<�^��3T�=j��! ` �5�r�<z'|�]H%v��8�H��.蛨��!;:�'P5p��"�N�T���t�I��^P�w��~�u���r��<@G��f�gD�L����C�X5u=�2���R��uܖ������#�����>ElQ�=�٥��-�E�@��x��M �j�s�N�p<�%����YRI�wm��J�ͭ�'�|��}Ab�
�Dԍ��&�GQ�&���Q,h�1(��z�QV����\����'@FܗV�a�_�LB��O�Ym����f#�b�d�<��ߺ?���RC5�L3.����dEJ]�k �m��u�I�i]y�;���ۗb�����L0�W������o����     