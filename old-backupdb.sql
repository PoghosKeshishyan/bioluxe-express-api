PGDMP  *    ;                }            neondb    17.5    17.5 �    !           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            "           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            #           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            $           1262    16389    neondb    DATABASE     �   CREATE DATABASE neondb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = builtin LOCALE = 'C.UTF-8' BUILTIN_LOCALE = 'C.UTF-8';
    DROP DATABASE neondb;
                     neondb_owner    false            %           0    0    DATABASE neondb    ACL     0   GRANT ALL ON DATABASE neondb TO neon_superuser;
                        neondb_owner    false    3620                        2615    16478 	   neon_auth    SCHEMA        CREATE SCHEMA neon_auth;
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
    title text NOT NULL
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
       public         heap r       neondb_owner    false                        1259    17055    HomePagePopularItem    TABLE     �   CREATE TABLE public."HomePagePopularItem" (
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
    category_name text NOT NULL,
    product_number text NOT NULL,
    price double precision NOT NULL,
    heart_icon boolean NOT NULL,
    title jsonb NOT NULL,
    btn_text jsonb NOT NULL,
    descr jsonb NOT NULL,
    product_material jsonb NOT NULL,
    about_delivery jsonb NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public."Item";
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
       public         heap r       neondb_owner    false            �            1259    16806    ProductImage    TABLE     u   CREATE TABLE public."ProductImage" (
    id text NOT NULL,
    image text NOT NULL,
    "productId" text NOT NULL
);
 "   DROP TABLE public."ProductImage";
       public         heap r       neondb_owner    false            �            1259    16813    ProductSize    TABLE     �   CREATE TABLE public."ProductSize" (
    id text NOT NULL,
    size text NOT NULL,
    status text NOT NULL,
    "productId" text NOT NULL
);
 !   DROP TABLE public."ProductSize";
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
       public         heap r       neondb_owner    false            �          0    16479 
   users_sync 
   TABLE DATA           I   COPY neon_auth.users_sync (raw_json, updated_at, deleted_at) FROM stdin;
 	   neon_auth               neondb_owner    false    218   é                 0    16983 
   About_text 
   TABLE DATA           T   COPY public."About_text" (id, lang, heading, content1, content2, image) FROM stdin;
    public               neondb_owner    false    246   �                 0    16976    About_us 
   TABLE DATA           >   COPY public."About_us" (id, lang, heading, image) FROM stdin;
    public               neondb_owner    false    245   x�                 0    17012    Basket_heart_view_link 
   TABLE DATA           G   COPY public."Basket_heart_view_link" (id, lang, text, url) FROM stdin;
    public               neondb_owner    false    250   C�                 0    17047    Categories_link 
   TABLE DATA           �   COPY public."Categories_link" (id, lang, main, catalog, filter_by, category, materials, price, sort_by, "from", "to") FROM stdin;
    public               neondb_owner    false    255   V�       �          0    16792    Category 
   TABLE DATA           C   COPY public."Category" (id, lang, descr, image, title) FROM stdin;
    public               neondb_owner    false    221   Ű                 0    16969    Contact_form 
   TABLE DATA           �   COPY public."Contact_form" (id, lang, title, input_placeholder_name, input_placeholder_email, input_placeholder_phone, btn_text, priacy_policy_text, priacy_policy_url) FROM stdin;
    public               neondb_owner    false    244   �                 0    16962    Contact_info 
   TABLE DATA           z   COPY public."Contact_info" (id, lang, map_image, address, phone, email, address_icon, phone_icon, email_icon) FROM stdin;
    public               neondb_owner    false    243   ]�                 0    16955    Contact_title 
   TABLE DATA           E   COPY public."Contact_title" (id, lang, title, image_url) FROM stdin;
    public               neondb_owner    false    242   ��                 0    16934    Footer_info 
   TABLE DATA           n   COPY public."Footer_info" (id, lang, address, phone, email, address_icon, phone_icon, email_icon) FROM stdin;
    public               neondb_owner    false    239   ��                 0    16857    Footer_privacy_policy 
   TABLE DATA           G   COPY public."Footer_privacy_policy" (id, lang, title, url) FROM stdin;
    public               neondb_owner    false    228   )�                 0    16941    Footer_social_links 
   TABLE DATA           >   COPY public."Footer_social_links" (id, icon, url) FROM stdin;
    public               neondb_owner    false    240   �                 0    16878    Header_icon 
   TABLE DATA           d   COPY public."Header_icon" (id, search_icon, heart_icon, cart_icon, language_arrow_icon) FROM stdin;
    public               neondb_owner    false    231   ��                 0    17055    HomePagePopularItem 
   TABLE DATA           S   COPY public."HomePagePopularItem" (id, "itemId", "order", "createdAt") FROM stdin;
    public               neondb_owner    false    256   �       	          0    16906    Homepage_about_us 
   TABLE DATA           l   COPY public."Homepage_about_us" (id, lang, heading, descr, btn_text, btn_url, image_1, image_2) FROM stdin;
    public               neondb_owner    false    235   9�                 0    16948    Homepage_categories_heading 
   TABLE DATA           H   COPY public."Homepage_categories_heading" (id, lang, title) FROM stdin;
    public               neondb_owner    false    241   ��                 0    16927    Homepage_contact 
   TABLE DATA           S   COPY public."Homepage_contact" (id, lang, heading, map_image, map_url) FROM stdin;
    public               neondb_owner    false    238   ��                 0    16920    Homepage_new_arrivals_heading 
   TABLE DATA           J   COPY public."Homepage_new_arrivals_heading" (id, lang, title) FROM stdin;
    public               neondb_owner    false    237   �       
          0    16913    Homepage_popular_item_heading 
   TABLE DATA           J   COPY public."Homepage_popular_item_heading" (id, lang, title) FROM stdin;
    public               neondb_owner    false    236   ��                 0    17040    Info_about_delivery 
   TABLE DATA           G   COPY public."Info_about_delivery" (id, lang, title, texts) FROM stdin;
    public               neondb_owner    false    254   ��       �          0    16799    Item 
   TABLE DATA           �   COPY public."Item" (id, category_name, product_number, price, heart_icon, title, btn_text, descr, product_material, about_delivery, "createdAt") FROM stdin;
    public               neondb_owner    false    222   `�                 0    17033 	   Item_link 
   TABLE DATA           E   COPY public."Item_link" (id, lang, item, catalog, cribs) FROM stdin;
    public               neondb_owner    false    253   0�                 0    17019    Item_page_field 
   TABLE DATA           �   COPY public."Item_page_field" (id, lang, size_text_field, size_text_field_2, descr_text_field, product_number_text_field, material_text_field, about_delivery_text_field, not_available_text_field) FROM stdin;
    public               neondb_owner    false    251   #�                 0    16850    Items_header 
   TABLE DATA           V   COPY public."Items_header" (id, lang, image, category_name, title, descr) FROM stdin;
    public               neondb_owner    false    227   ��                 0    16885    Language 
   TABLE DATA           <   COPY public."Language" (id, label, image, lang) FROM stdin;
    public               neondb_owner    false    232   ��                 0    17026    Liked_product_heading 
   TABLE DATA           B   COPY public."Liked_product_heading" (id, lang, title) FROM stdin;
    public               neondb_owner    false    252   ��                 0    16864    Logo 
   TABLE DATA           +   COPY public."Logo" (id, image) FROM stdin;
    public               neondb_owner    false    229   ��       �          0    16831    Navbar 
   TABLE DATA           :   COPY public."Navbar" (id, lang, title, route) FROM stdin;
    public               neondb_owner    false    225   ��                 0    16990    Navigation_arrow 
   TABLE DATA           =   COPY public."Navigation_arrow" (id, type, image) FROM stdin;
    public               neondb_owner    false    247   ��       �          0    16806    ProductImage 
   TABLE DATA           @   COPY public."ProductImage" (id, image, "productId") FROM stdin;
    public               neondb_owner    false    223   �       �          0    16813    ProductSize 
   TABLE DATA           F   COPY public."ProductSize" (id, size, status, "productId") FROM stdin;
    public               neondb_owner    false    224   �                0    17004    Saved_basket_item 
   TABLE DATA           r   COPY public."Saved_basket_item" (id, lang, heading, quantity, remove_button_icon, remove_button_text) FROM stdin;
    public               neondb_owner    false    249   �4                0    16997    Saved_heart_item 
   TABLE DATA           �   COPY public."Saved_heart_item" (id, lang, heading, add_button_icon, add_button_text, remove_button_icon, remove_button_text) FROM stdin;
    public               neondb_owner    false    248   �5                0    16871    Shopping_bag_page 
   TABLE DATA           :  COPY public."Shopping_bag_page" (id, lang, main, title, empty_error_text, quantity_and_prais_text, size_title, heart_text, btn_text, order_summary_field, total_text_field, form_input_name_placeholder, form_input_tel_placeholder, form_input_address_placeholder, form_input_checkbox_text, form_btn_text) FROM stdin;
    public               neondb_owner    false    230    7                0    16892    Slider 
   TABLE DATA           f   COPY public."Slider" (id, lang, title, descr, btn_text, btn_url, background_image, image) FROM stdin;
    public               neondb_owner    false    233   �9                0    16899    Slider_icon 
   TABLE DATA           Z   COPY public."Slider_icon" (id, cloud_icon, left_arrow_icon, right_arrow_icon) FROM stdin;
    public               neondb_owner    false    234   �>                 0    16838    Submenu 
   TABLE DATA           G   COPY public."Submenu" (id, lang, title, route, "navbarId") FROM stdin;
    public               neondb_owner    false    226   ?      �          0    16785    User 
   TABLE DATA           8   COPY public."User" (id, username, password) FROM stdin;
    public               neondb_owner    false    220   �A      �          0    16776    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public               neondb_owner    false    219   B                 2606    16489    users_sync users_sync_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY neon_auth.users_sync
    ADD CONSTRAINT users_sync_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY neon_auth.users_sync DROP CONSTRAINT users_sync_pkey;
    	   neon_auth                 neondb_owner    false    218            N           2606    16989    About_text About_text_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."About_text"
    ADD CONSTRAINT "About_text_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."About_text" DROP CONSTRAINT "About_text_pkey";
       public                 neondb_owner    false    246            L           2606    16982    About_us About_us_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."About_us"
    ADD CONSTRAINT "About_us_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."About_us" DROP CONSTRAINT "About_us_pkey";
       public                 neondb_owner    false    245            V           2606    17018 2   Basket_heart_view_link Basket_heart_view_link_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."Basket_heart_view_link"
    ADD CONSTRAINT "Basket_heart_view_link_pkey" PRIMARY KEY (id);
 `   ALTER TABLE ONLY public."Basket_heart_view_link" DROP CONSTRAINT "Basket_heart_view_link_pkey";
       public                 neondb_owner    false    250            `           2606    17053 $   Categories_link Categories_link_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Categories_link"
    ADD CONSTRAINT "Categories_link_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."Categories_link" DROP CONSTRAINT "Categories_link_pkey";
       public                 neondb_owner    false    255                       2606    16798    Category Category_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Category" DROP CONSTRAINT "Category_pkey";
       public                 neondb_owner    false    221            J           2606    16975    Contact_form Contact_form_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Contact_form"
    ADD CONSTRAINT "Contact_form_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Contact_form" DROP CONSTRAINT "Contact_form_pkey";
       public                 neondb_owner    false    244            H           2606    16968    Contact_info Contact_info_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Contact_info"
    ADD CONSTRAINT "Contact_info_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Contact_info" DROP CONSTRAINT "Contact_info_pkey";
       public                 neondb_owner    false    243            F           2606    16961     Contact_title Contact_title_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public."Contact_title"
    ADD CONSTRAINT "Contact_title_pkey" PRIMARY KEY (id);
 N   ALTER TABLE ONLY public."Contact_title" DROP CONSTRAINT "Contact_title_pkey";
       public                 neondb_owner    false    242            @           2606    16940    Footer_info Footer_info_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Footer_info"
    ADD CONSTRAINT "Footer_info_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Footer_info" DROP CONSTRAINT "Footer_info_pkey";
       public                 neondb_owner    false    239            *           2606    16863 0   Footer_privacy_policy Footer_privacy_policy_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."Footer_privacy_policy"
    ADD CONSTRAINT "Footer_privacy_policy_pkey" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public."Footer_privacy_policy" DROP CONSTRAINT "Footer_privacy_policy_pkey";
       public                 neondb_owner    false    228            B           2606    16947 ,   Footer_social_links Footer_social_links_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Footer_social_links"
    ADD CONSTRAINT "Footer_social_links_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."Footer_social_links" DROP CONSTRAINT "Footer_social_links_pkey";
       public                 neondb_owner    false    240            0           2606    16884    Header_icon Header_icon_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Header_icon"
    ADD CONSTRAINT "Header_icon_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Header_icon" DROP CONSTRAINT "Header_icon_pkey";
       public                 neondb_owner    false    231            b           2606    17062 ,   HomePagePopularItem HomePagePopularItem_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."HomePagePopularItem"
    ADD CONSTRAINT "HomePagePopularItem_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."HomePagePopularItem" DROP CONSTRAINT "HomePagePopularItem_pkey";
       public                 neondb_owner    false    256            8           2606    16912 (   Homepage_about_us Homepage_about_us_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Homepage_about_us"
    ADD CONSTRAINT "Homepage_about_us_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."Homepage_about_us" DROP CONSTRAINT "Homepage_about_us_pkey";
       public                 neondb_owner    false    235            D           2606    16954 <   Homepage_categories_heading Homepage_categories_heading_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public."Homepage_categories_heading"
    ADD CONSTRAINT "Homepage_categories_heading_pkey" PRIMARY KEY (id);
 j   ALTER TABLE ONLY public."Homepage_categories_heading" DROP CONSTRAINT "Homepage_categories_heading_pkey";
       public                 neondb_owner    false    241            >           2606    16933 &   Homepage_contact Homepage_contact_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Homepage_contact"
    ADD CONSTRAINT "Homepage_contact_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."Homepage_contact" DROP CONSTRAINT "Homepage_contact_pkey";
       public                 neondb_owner    false    238            <           2606    16926 @   Homepage_new_arrivals_heading Homepage_new_arrivals_heading_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Homepage_new_arrivals_heading"
    ADD CONSTRAINT "Homepage_new_arrivals_heading_pkey" PRIMARY KEY (id);
 n   ALTER TABLE ONLY public."Homepage_new_arrivals_heading" DROP CONSTRAINT "Homepage_new_arrivals_heading_pkey";
       public                 neondb_owner    false    237            :           2606    16919 @   Homepage_popular_item_heading Homepage_popular_item_heading_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."Homepage_popular_item_heading"
    ADD CONSTRAINT "Homepage_popular_item_heading_pkey" PRIMARY KEY (id);
 n   ALTER TABLE ONLY public."Homepage_popular_item_heading" DROP CONSTRAINT "Homepage_popular_item_heading_pkey";
       public                 neondb_owner    false    236            ^           2606    17046 ,   Info_about_delivery Info_about_delivery_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Info_about_delivery"
    ADD CONSTRAINT "Info_about_delivery_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."Info_about_delivery" DROP CONSTRAINT "Info_about_delivery_pkey";
       public                 neondb_owner    false    254            \           2606    17039    Item_link Item_link_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Item_link"
    ADD CONSTRAINT "Item_link_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public."Item_link" DROP CONSTRAINT "Item_link_pkey";
       public                 neondb_owner    false    253            X           2606    17025 $   Item_page_field Item_page_field_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Item_page_field"
    ADD CONSTRAINT "Item_page_field_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."Item_page_field" DROP CONSTRAINT "Item_page_field_pkey";
       public                 neondb_owner    false    251                       2606    16805    Item Item_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Item"
    ADD CONSTRAINT "Item_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Item" DROP CONSTRAINT "Item_pkey";
       public                 neondb_owner    false    222            (           2606    16856    Items_header Items_header_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Items_header"
    ADD CONSTRAINT "Items_header_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."Items_header" DROP CONSTRAINT "Items_header_pkey";
       public                 neondb_owner    false    227            2           2606    16891    Language Language_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Language"
    ADD CONSTRAINT "Language_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Language" DROP CONSTRAINT "Language_pkey";
       public                 neondb_owner    false    232            Z           2606    17032 0   Liked_product_heading Liked_product_heading_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public."Liked_product_heading"
    ADD CONSTRAINT "Liked_product_heading_pkey" PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public."Liked_product_heading" DROP CONSTRAINT "Liked_product_heading_pkey";
       public                 neondb_owner    false    252            ,           2606    16870    Logo Logo_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."Logo"
    ADD CONSTRAINT "Logo_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."Logo" DROP CONSTRAINT "Logo_pkey";
       public                 neondb_owner    false    229            $           2606    16837    Navbar Navbar_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Navbar"
    ADD CONSTRAINT "Navbar_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Navbar" DROP CONSTRAINT "Navbar_pkey";
       public                 neondb_owner    false    225            P           2606    16996 &   Navigation_arrow Navigation_arrow_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Navigation_arrow"
    ADD CONSTRAINT "Navigation_arrow_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."Navigation_arrow" DROP CONSTRAINT "Navigation_arrow_pkey";
       public                 neondb_owner    false    247                        2606    16812    ProductImage ProductImage_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."ProductImage"
    ADD CONSTRAINT "ProductImage_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public."ProductImage" DROP CONSTRAINT "ProductImage_pkey";
       public                 neondb_owner    false    223            "           2606    16819    ProductSize ProductSize_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."ProductSize"
    ADD CONSTRAINT "ProductSize_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."ProductSize" DROP CONSTRAINT "ProductSize_pkey";
       public                 neondb_owner    false    224            T           2606    17010 (   Saved_basket_item Saved_basket_item_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Saved_basket_item"
    ADD CONSTRAINT "Saved_basket_item_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."Saved_basket_item" DROP CONSTRAINT "Saved_basket_item_pkey";
       public                 neondb_owner    false    249            R           2606    17003 &   Saved_heart_item Saved_heart_item_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Saved_heart_item"
    ADD CONSTRAINT "Saved_heart_item_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public."Saved_heart_item" DROP CONSTRAINT "Saved_heart_item_pkey";
       public                 neondb_owner    false    248            .           2606    16877 (   Shopping_bag_page Shopping_bag_page_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Shopping_bag_page"
    ADD CONSTRAINT "Shopping_bag_page_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public."Shopping_bag_page" DROP CONSTRAINT "Shopping_bag_page_pkey";
       public                 neondb_owner    false    230            6           2606    16905    Slider_icon Slider_icon_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Slider_icon"
    ADD CONSTRAINT "Slider_icon_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Slider_icon" DROP CONSTRAINT "Slider_icon_pkey";
       public                 neondb_owner    false    234            4           2606    16898    Slider Slider_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public."Slider"
    ADD CONSTRAINT "Slider_pkey" PRIMARY KEY (id);
 @   ALTER TABLE ONLY public."Slider" DROP CONSTRAINT "Slider_pkey";
       public                 neondb_owner    false    233            &           2606    16844    Submenu Submenu_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Submenu"
    ADD CONSTRAINT "Submenu_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Submenu" DROP CONSTRAINT "Submenu_pkey";
       public                 neondb_owner    false    226                       2606    16791    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public                 neondb_owner    false    220                       2606    16784 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public                 neondb_owner    false    219                       1259    16490    users_sync_deleted_at_idx    INDEX     Y   CREATE INDEX users_sync_deleted_at_idx ON neon_auth.users_sync USING btree (deleted_at);
 0   DROP INDEX neon_auth.users_sync_deleted_at_idx;
    	   neon_auth                 neondb_owner    false    218                       1259    16820    Item_product_number_key    INDEX     ]   CREATE UNIQUE INDEX "Item_product_number_key" ON public."Item" USING btree (product_number);
 -   DROP INDEX public."Item_product_number_key";
       public                 neondb_owner    false    222            f           2606    17063 3   HomePagePopularItem HomePagePopularItem_itemId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."HomePagePopularItem"
    ADD CONSTRAINT "HomePagePopularItem_itemId_fkey" FOREIGN KEY ("itemId") REFERENCES public."Item"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public."HomePagePopularItem" DROP CONSTRAINT "HomePagePopularItem_itemId_fkey";
       public               neondb_owner    false    256    3357    222            c           2606    16821 (   ProductImage ProductImage_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ProductImage"
    ADD CONSTRAINT "ProductImage_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Item"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public."ProductImage" DROP CONSTRAINT "ProductImage_productId_fkey";
       public               neondb_owner    false    223    222    3357            d           2606    16826 &   ProductSize ProductSize_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."ProductSize"
    ADD CONSTRAINT "ProductSize_productId_fkey" FOREIGN KEY ("productId") REFERENCES public."Item"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."ProductSize" DROP CONSTRAINT "ProductSize_productId_fkey";
       public               neondb_owner    false    222    224    3357            e           2606    16845    Submenu Submenu_navbarId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Submenu"
    ADD CONSTRAINT "Submenu_navbarId_fkey" FOREIGN KEY ("navbarId") REFERENCES public."Navbar"(id) ON UPDATE CASCADE ON DELETE SET NULL;
 K   ALTER TABLE ONLY public."Submenu" DROP CONSTRAINT "Submenu_navbarId_fkey";
       public               neondb_owner    false    226    225    3364            �           826    16392     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     {   ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;
          public               cloud_admin    false            �           826    16391    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     x   ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;
          public               cloud_admin    false            �      x������ � �         �  x��Uˎ�6]k��`:���u��(PP9!�W$1hw�'m H� �":���<,e��x~�JO/eMͮ��x_��{u�WQ��( �1�8f�2c�������_����>E�����g�����e�2�iQ�Z6�f�!V�5goT�h"KY3�"�J0�<� ĥ��"A�J�9��LT� ՠ�4xě-4G=�)��|�h6�t�H�鵥�?G�������LЧz���K�/u;B�=���{.W��~��������tg�p�t7�V����x����.����n�����d0����/�JO�!�����,E(�b��~� $����#[�ع#�x}�F5�����t\�^��aL��8��	�%a8�|O84s�c�z3G���ܘ���,�Ϧޝ9�{��~��w��ρU�Y��ks�y���dM�!�
�����12o-y+Qo�ym�-B��}T��f+p92X��O@���7�{:Կ �|p_��.�4p ��2A�ǷC�Osvi�������j ��q�|���um��g ә�V���:4n`j/�-���W����A������~����8&4Č�$�Ȅ}<�nBlI�S������ �+B?��p)�~(&Jq@� �=Ag�d�Æ\�]kv��/���~�4�.N�{L�����s)��X�Y�3�8<w���<�uST����ع�d��j8���6��Q�ˊ?�y�+ �GE�ʆ��#����4ݳ�$
	u(i�r����AUc��7��W�4�U0F9?�J���F9*�B&<��Y������衒�B2IQ�k^YkV���%�]tv���"�(v#�`��S�����4	&$���A��ʢ��g�]�_�� |t�         �   x��α�0@�ڙ"��Nr%{ �;_E"�Ӄ�"T4�f��*j��<}�QKYր����� b]��zf8W�A��t|���AMێ�j7��>��ІU���k&��Ir?s_9�\0�9��㥐��Ԩu*���O�-��#^��O_
&B��2/`E���Xk��l,��Ws^!v��I�$o�`�           x�U�OJ�@FדS�F���\ĕ 3��j��XtU7�@
�EB�R��W�'��Ww�<o�}BIV�iA��9�XÈc�q�J�2����-֣������N쬼�Q}9���xpn� �ƦF�D��$\)EtZ���yZ���Mg�?��w�����#�kH�����Ó��<��_�64aq|Ks��BY�
a�$#�Y0ʙ�iƔ4H_�����2�p|�۸�۾�q_b�ϯ�?0`�7���C\��_��$I��>��         _  x�m�ON�@�ׯ��cʟ2-gq3S���)u��6D�xD� � �
3��<��(�⽙��~�e\�7�#9\n���|&�J����U�uQU�z���"��A���$��R�0@V[t�p�}�0�OD�]�C���l[0ߡU�R2)��$�T�Qu ���\��I@o�H�R��Z��L��Ȥ&�eR3*��g�]�tNqf@�X�,J�=�["�z	��(����M
z�s���9U�y^]��8s=�tٷ��n�zӳAtǸ=&�7�!�+]4�p�Hb��>�_��L�p�=��p��$R|��1J�����O���=������xg]^X�����y      �     x��U�n7}�~?�L�%��\�o����ˡ-����*���K�I�cQ@�$H
+֥JI��J}@��Õ��F�I�BXBs��r'�yb�6�i�
*B�Q%NY�r�c&�H��A�-6C�v�
'(�6gn�����⦨X7��[��ڽ"�:]�s��|�[g��s�/�ʫFpZ�#�Búvyy�:'�����tsֺ�9��п��v{��V�w��m�-�\�7߂�ɵ�5JA$2�M@�T���J$1E�e�dabZ�m�{�$A>�>�{�W�Dv5�}ؕ�H�[�<��v �&p_�n�DF�Df�HN��	U<�{�T�㴝��N+{px�����9��@^��e�odY�O�A,�ܤh&����Y�e�R�(1\��A˾����a��Έ��k{eg�W?W'������@qA�ae���UC;��S��U��oW?ؙ��zz;F�c��-���V���츩�+F:����z$,�1c@C#5�*�M��9��6�C]�����ǈ�ط����c����>%g��_�gY��0�N�d�n�?b�t{X���󍯢:m��ԇ��ɢ�����9� K��Jhd��&��4�a;d&ba���3n�9��,�N	�h����+ϐ���{�e��κ�1�,��"��a��'���$�Ʊ��aRgZE�>�S�Ah��$�L;\��@/���E�����?���Z�Ic�~����@�i%(3>3,�4m��Z�,�i��%��߄l��ێ����݈�8A����X�T��
����B"F��Mu���T�~�`o ��M[~MЀ��L���.{�D�O��,��ʂ\�$�46�KR%�)�B1�%q��k����Ͻ�9Z�K��n���=?�򪩤�����Ag�� 7��\ ���U:�4�q̥	y����{P���C:}"���r���):��;��twoM�\��ꫢ��^~�0<�HHD����������ER� ��~�H6��G��@�h�W�����^� �2o�         h  x�]P�jZA}�bC_s��s��J)�T�ܗ9���&��F���҇>��6%%�1V���3��=]3&������Z{�����IfB��x�r3���y6i%Sv��m/k�.��0�'!5*�*��r��5
�/�/t�i�X���Ȏx)d/K��q���7���{�j�!媅�7(W)�F��4_�R�^�J�2��*e�"��	'}Z<��-7�=�2v޳7p�l&�۶êu&�dK��@�%�1ɖ���H��,6ý�@��r��f-��]1c�-�E��21��.wbR���q`��X�s=�������3��$�ģ�K��Q̹Ĝ����\D�h���
#H.�D1��Y�}�8���|g�\3!��;�veShkW�V���X`�����'���R��^��8�k���p;�0^b����P]o;��4Iݣ2Qk�C�ﱺUB�B�S}�ਜ਼=ڞ��k5����f� X���3e���\�5�<@!ڶՄmU��g���� ,�x�Lum��!l�_��lm$�q�����7z�7�U���8��O�m;f���`�&����B(�US2��'�'�a��%��H��O�ۏ�b "J         C  x��RMk�@]����N2���].Dp'�$�y/��<����kkb�BR�>ik��0���' RP7n�)ý3�s�2s�%B�,"R�	d��4N!&Z#�8�$�T�M�v����b��j<�AZa�fM��Dg�g�-8q��8��EF1��#"|�1p,1��H��>�
�3a1�d�`�O\�!
W5w5�O�H�>3���N7p�`H�$��I�Y��5��6�Ԉ4�"��>iT�lR�\�*���U���8b	�"����P���=��'m�j�k��}=�S n�ʘ<�@ �'*��N��ﭶ��~��Η�Mwx�⋋cp��?��x���?:հ��a��]� 
 �%���Tw\�g�|>���B�u�U٪�}:�i��6�ʠ����p�.���B�Ӂ1ÕT�C��L+	U$c(8b�ϔ"�y������e����*w��V�n.����(�I�0�HA&$���4,H���{����8n���{iO�7���E�i��W{�׃���۱'�օ	���{�$��ĞR'޵G��u��e�;���wف�v�{�S�$�F?�x�         �   x���Aj�0D��]~bI_���5
�K�6��	�����u�u�
���
2D9O�������hS����\�Z��N��[����{���#�q˶���e��_�?�]���M�%�Y�`
@�<�EŕbҬ��Mďx���O�g:L�O�j>F��& *���\���u)}�(��[�N�tK��8�9}=�ON�,�,��hy         �  x�͐AK�@���_1w��Lf2���PP�A
�y�$_�P�,I��mw롨`AA��h�+�.E�3������D�&��7����W�B)�K��OE(B��OCP\$.D�ʝ-U}!��v��4�W�#av�\%e�f1�2�i���{iO#;�����'�!~�p~�ܑ�����(�c{��r��;_�F�ǉ�%���dEZ��e�W�~���rՃ���e�&��$��f\�z����)x�\e��@+�  �G�%�4�9�2��� ��;P����E�@B�+�yV��w�8|ɻ)�!��
��T��S�'Jx��j�b=���~4'�|3C��o���e~�d�̌�i@��s�ȭ���%�������?h��K?�1�fl��IK��V���C         �  x��S[NA��Y�Z��^���-���@���/�@�DC�a��3l�&�Y��:4���]�sn�[�r� 愠B�����F�bS6��qgw����ns��/�!��RF�E%P�$��J2F��dn��8�%|F͘BV�&M@�,��`�]����oF�ۣ��� �v�I�L��QE��D)�J�9�r5�����ChB:Q��� ��pRy0��ă	ً�xwP������a��7u�A�e]��h8����H�i�]}���\M��V�b��į(�-��H]P%_B�l��/���Aw�}뮺�����;ݸ?ꎻZ{N�m:��˾�j�ɸ�PAFR�S����ȹ��������W�?�N����9
��`�]�N�4D���b�}�3�����
z[�ge�<7\H�,�\V��b�㘍i����������ؘe�:Bւ�B��Ɓ`��BՂ���j�8?��9ỵ[t74��y��ΉטbP��9:;��T'�D
	1��^I�z���r>�+�������8%�ȭ.P�:�5�����GO>��9g4��VuJ�S���y����̤���"(˄��r��yd{<�i��\^K�π�S���|�tl76�M��y��f���!�ҦY�]f�[4��Ay�HT*I��Fj��'60ה��{�b8��a         �   x�}λ�0 ��H}���@$&H	�� >Fe���b���)2(����a�Ā��4����F�uL����O��˴�u��ƃ�Χ��߱x��nJ�ऴ`x ���m�(�dޙ�����BF
҆��	'�F��-{v��h�;�I������ʲ���PF         r   x�K652546N�5K5H�5IKLֵL5M�5�4N323OK40�����MLO-��HMLI-�L���/NM,JΈ�����ұ)2�J�=�H)�gDNb^z)P0>��(���+F��� �u@            x������ � �      	   �  x��R�n�P]����!���u�eU��n*�k�����I��I#�Q_�v]A+7��Ju��\K�|@��s/��R�VQ]`�Ϝ3���uk�6�e��IUwtS%�ST�*�L�L��]TZm���wل�m��a�l���A��� p�����[@.RfY̦�6v��.Wv�6 6D f��9;�Y�=a'yϐ#�٫l����.� ?e)d/���	+�Do;M���d��Y�����e(-��\��J�پﱑr���;J�XA;R
�Gj4,��6��H������Zӯ��U�)ۤlPK��ץꆽ�Z�ZRK�DӴ��U���]�,�y�����>+_>��O�0<]��N;��[�"{��V�c䤢8�n�?b�E��	�zB��q`UG�XL�7��>?~�3�E�+���M<��|����� RI�YO��Lߗ�c�}��Ǯb~���8Dn"6�-����b]%u�
�˝.nv3���Q�q�Oғ+��Q����[D+�SV͍bI���d���r�.Ӷt���m!�wۡ�N[(���t�M��"x�#�hDy��hҀj˥���ǔl�~�@C��.m��q���>HÍ:��Q t��:`��֩^ p�	��E��y����^c�>         �   x��;
1 �:����L>[{�d3��ǰ��Fe+�
����O����Bb
@l�4��Ɋ"{�൘�=/6�%蘆�Jm�@� ���#�u�1g�=�r*���<ʽ��]� � ���h rc!3���2�8V�3�sk_/u�v��׳��N�'R���B�         ^  x��=N1���-\Pz�c���B�܀�K"�l�MHJ���QPC!$�
��<xE
A1������QEᨷNS,ߴ6�C�2�d�n���f�²+���;���z]^���u*C�T��wUj|��sB�3
�"D�P��7��𼹔`Ah��x*IDDVr��DЀ:�'|L���XMN��$|��!X�(!��o�ul�L9�@+F����xi�P��2*8Axw�.�Ӗ�t����u�[�(�L��p"�N�j���EG���M�D]��Z#]@��X������������o������x�5��4�CF�S�Ar�����9���sx�����/��d��[~         �   x��=N1@�ھˠ��س��4�#!�"�A�I� -%"Q$D����9[<�{<�dr�|� �� %�"�)�ܩ��4Oi��ͽF7 ��h��@�+Ӂ���!�ܓ���I��V��$r��uS_��^~�Xw:pf��������\,��ǐ�t��k;����>�{�^:,�Yth絾��Z��TP      
   �   x��Mj1@��]�2f��ݢ�&_�P�h�՝�G�� R��-�	�E�<f���C�<P�F�5�$p�+�FG?mX�������-���-�Vܑ"'�����5� �m�D�Ȗk�>�-��M�ˇܥkޥ����~�s��S+t���)�z�#��(P��)�oBt��Xٗ��+�r,�����v,�q[.�s������V�         �  x��WMoG=K���CN� ��(���C��v�I�a�i�Ҝ�GJ��6l8�����,
�Cq�a����UuIIv|��8�]�^�*�U�l߫������^q�Z�/VԽJ���-��jiCy��N�ZڻO��?U�=��O�j�U�t�Tk֛m�u@NC�6=_���S�-�k��U][�9+���'/��ҁ� T�����C^��y`���:�>մ8�n�;^�aR�U�n�����Y�@5Zp�j��j:���A���S�&=Tuzج���	�F���.�G@��z���s��Ax_s=m�C����i�����s�k�m��+���σ8|���z&7��P�r���@WQ�z�ڮ�5��j�;Mͪ�(��9\�)�)���C�i�m�h=9��h�42�t��+�&9u���;-����V̺�E_��p��Ni��.�X�}O��>A$Z���e��. �A��-�tj�lO74 � ;�
���nPM]k�z�@d��S��6�UUw�*CKd��}�ض����+��|R�[)�J�o!�o7��Rq����:���JQmoW�����Ni�n$�I��0=J��d�(����"y�v�Az���7}F��d��WɌ`�+�d�D�="xD�{���9ჩy��o�c��z��䊓s6I��m}�ġ�!�9�8M�8�AB&�-J~§�p��q""#G\�O�!� }����%J,S����+.��**65	�$�Lb�����]�/���f�V������q1I3,~C`.
AG�J��;�whIx��n4�_�ӧ9��"	3����-�S,���8�%p�xv��Q�B�l��(��1�(�Ű{�c���J��X�#���d��'7��	�9�wp�������g��Nf�s�$�� ��&�N>_��´�&�'�=��b�h(�MY&��YFD���]�͊� 	���C	���4�;��00�M��5
�L6��d����9%�E2���ڔ2��08D�C�7���\�����fO���[/y5Snf����Be�O�fh.儗D'�A.z��LL,b���r�{@R�-�_A{��v�ڮZ6İv�ճ�#��s1�c �Ʀu,�u.�6`&e�>>u�|���Mzj����Bo�.�h�(�����DD�6�blWǑ�&��x])<�״����?�h>_�7�u��;��J��������+|t@��<ɍ�N����ᙰt.�eb��
�lI�-%��E�	L��~�L�����X��D������.�s!�<��?B*����,�b2�=|SW*;嚣��wwʕ���r�X��-K�R�[�+�7��ƻ�l�u�g��Q6���^d�E'�f'8�d���~7�u'�� �g�,��0�d�|G8�gonC��);���=<���}ؐs�����8{M�����O��0�
��,6�,�����d�D����^�q8G��xM-'�8��""�Ư]xf����1�y����4�b�eo��3cW �z�B%��T�)hf��c�m,^�b�y$S��Z�Cd0XP�K���>�x!���M�����H�``�	�.^z��e�d3��dI��Z=�Wܬ�d����~d"�YIg��Sӿ��E I�b���^I݂xu=�	�r-��\}Y������59Ow����u���.��09F:�U��EtMl��	�<����@�@��Tz1�]16\������"��p�/e8&f�n�deƜ�@]�al!-'V:g$������3�ޘ"�$DE�F0pS�9O}9�g���!#5�'�LP��V��
F�F8�/3nS�{j���5k'B��j"?�*�f�8doV�Aڶ������dDE��F.��݉��[<��n���^��˷{�v/�����lmnn���T�      �      x��]Ys[Ǖ~���nWw�^��8�LU�����y��B�����qMM�$��ıǎ3���I��٨D����D�/ U�~Ϝ��� @ІA�8�������l���Lp��(x� �CFb�0c>8��}�������
.���
�x%����f��ot�~tspe�?���v�3H��>�����g:O��t��fk��:��7�v�����M��z�z���{��7{���]��^�w����w>\J��U�y����>���>�~�F����6|�������[����q؂���ο�����[y��������w�ޯ{���vzt�=������p���*O�bpw�3x�ޯ��5�u>|:�ރ���t���е��㋝�g�߄��/�o>y��az��:�ll���q��^�n�������[�ן����ޭ�s�S7��.����z{�_c��/��ӑ|�}��S�?��O���������Cz�����vW�?���ׅ��߁���o�������hc�հ�6;�\���+��0��tz�Q�`�/��>:��W_N7������N�x�����+8r{�W8���9���VX��{�|��]�y���Ƞ?ȏ���:�w���f��ޭ|t���D1�sT���(�7�~���SJX�8׈(s:"�	FEG��"Z�������C	�`4	H0�����	z�#�8���~w���ѻ�^OW,C_�ve�0ϱt z����� �:	~0���e�3��L�Y���:if�r�����!���0�G	�����*��إ>�Y3>t���Z�\��s��Λ����p�w׬n=�y9l��;qc��ă	�y%��gg��C����g���?���a����l�����6�0��%`?��O7���w�K��쿞��ۿ�����ԇY\���y~#C��N��۶;"�������4�r�Y?�n���Py��)s��,����3Ƒ2�#f�E�{��&��B�j%)�4c7�潊�א�Ӯ����f�|v���e�.�ru��!�$�����1v��*�$�n�Β�#JZ0��C��#�XB���:�
�r":��-:�zt�([�^�2�����|��Y�Pw�#\S��"�VL[��J	��,���b_�FY�'�!AR~=J�-L�r���V�	-���{� �["b!vJ!�@��NF��I_7��H 99B�d��y"Z�,"*qu�#�TUɏ`��G������lٴI!�.L��_�9ϑ�CTc��"4h�������a0L�G�6���<G��݂��)=��[��N_tX�G�X�k/olx���v^����<���E'�@J�iy(���A�߃�w��iO�����d ���/�{�5�c?~�g����y��H�"����0�HƭZT�H�>���hL�*X���Ń!ڂ!*�|Slm��:f��kp`;��!��m���gOc<�)�}'�6�+#CL�`�����e�΅����"7�C��_1-�A��z��0FY�}�x�G�^���&t�+�Z������AIn��͡�M�`7\2"��>0���1	g��,��;���V�Y�4�m'ַt�����[��ۯ^�^�r����aK���j�%��/�P�%�H����s$�7�Q.�.@�).pt҆zd�+�)&c��#E��E����v���`�υ͑�| *f�t�"r�@sDI�^#J����R0,�*O���١�t�P�ڡ��ڡ��z@Yc�i�Eo�֔"'
Gp��;��:QjV։RG�N�ofe��U�.���͋��I��&�)A������Ιn]����	�72���k4��ۆ%�"CY���LG���	%lf�4�J�(��S2����J�L�<���9Y�{��l��U��(�\648���#Ai��
tFT�"���9�ZA(*n�T����� "�#�b��)�V�˾�ƶjW��Hc��L�]f�`�/C&���Z[A]u"�32yc��ȧ�aT)n|�ċ�����3O�^��8E�x�����L[�XAC��A���<H�v�����e��Nr󧊶p\�'���<��0�U���'���Á{�k�XK9�����n��B�#;or�e��}
�k��B#}��|��0�vr�σ�p��v����5��t�hLe���hJ�a9����˛a�{~��:��/��XM$�Ws|%����v�">ٰ�:>NL�p.G����p����q���E���yi:���R�;�������z���K~<d<��{h`,e0��-�QHĨР�-���x����M�;���;�Cb�T�ct�vQbqw�.��՗*M�K�}hʲ)L�	v�$�ш��V�1E�RfIt��)V�g��4�􇱒�(�c�����F�2Fr�Fs̐� ��BVI��f�K0*&���Y]40���b*�h��@ɯ���5���ܫM�n�!	�[4������f��[���!
���A#�#F #M-��9���T����;]��q���i�6�	��������y���\�S0��[M�w�8X���_迶O�M�Zh��䝕��O�x;�� �,�R=t�>��~�V�9�s��,����>�f9G�d������o��'v�q�&n@�6�ՑU���.�eI$\�c��0	�������t0O7x��A��nfi�]�Z��>���x�Y{e�ð��s�8�U�]�w}9yf���2RK��evo�;^�k��5]����<�4�@�c�t
�{R�(�v�qldv��M>�F����@'�����F��1�zw�����kp��Ū��9$�0�^�b��>���=v!s%�����qt,wŖ���~��A���P3G��7�K�a7��z���[�6�KvC����C?����p���0�w��"�~��`���>��zM�|�� ���*v��-IB��#�cBi�T	ɐbQI��P��	�*XO�`m`�T�SQm&1X[�͂j��(�_%X�B��}�dy/]����0�BPĬ�
H�^��ht!6y�bfO�!�p�	O�l8�	����$�'��%�}oxl)�(wT޲�Q&2�2"F�ALQP1��+8-��84���0�vr��f��v��5��++���w׻k`�lm���Ur�G�6��V�s٩�0�d������ϒQ:�/~A��)�\B�v������o�=N!�|�#�}�h'�VZ��hƮԨ%�6�,|3ثk�I����vwc=[�CY �<����q��2�9�%A<�`���v	����ￖ���`/���o���=�7��ogRy��a����}!/rf;�9�*G'��S��+�<�[�y�F_�$^�f^\Z:��N&��� ƸC�Y��:�`"�K�L�G����H�5W[���P �c�2 $�Hq���D����\A�"���|V��
}N�ے���+��l��j����!dАK��8�Z��똨v��)�!ڈVX֨fff�#��D��2 ��ev^����ֹ��F��z��|�ݥ�&Q����׈	��p�P�:�\�ɋY����"�T��"�b�d-�|9��wsoߩ���j���~oo���I��-,�L���F
S���8sQz�"3��]p찆H�ؚ���^vL�mWە�v��Ke�+��p���Y'lpXx���5�ٔn(+54���(5fJ�e�Z6�i2~DP^ xHK�$�CKY����ii�t��r:��<=��l��-S�e
Α��
���ý`Yk4����(O=o�站�:R��)P�*Ѕ��l�Uz�_�����t�ʩ*�����*<G��H���&�aC�;#Y���9�����0U��V��},i���t%�\)獡	�-I�7���(W�굹�\G��G�uz�5���n�a�b�S�j5{����pQ�|���^)U��h��R
YE�N9C�⿔hٸЙ�ŭR�]4I�g�`��&E~�,�
C�}|�XhF���s�F:��QsY0f�X��\-��R;��OE/��/6F��З4�~v�xK �  %�XDyA�%i��2'>P�-a���'�۟d��$��N�R���I�,��"
ʐ��!��D6$�Q0F,z�p(tE����
̻�@�Ͷ�
��9h��xDш1� aQ� ���A�P3}�9(F�O�1�x�e�[sp9��7 Ƿ@��V	�?xuu�l�q�Knʲ�+&��N!�:92Q)�07�PK�`����6&�w&�nLZ"a�7�)"D�|��
���ֈ'8�BՔ[�f.J��,J�NT�N�E��U�S�AH*8bV�7$uLe��$^O�
M���K��#K�����m	��ܧd�O�I[���J���{���U6��m��Re��7W��Hl==��҄K���(�S@ɐ�T�V��J0R�H8�Zn}�A�J=��@Y	7�(�1���G���v=p���G_��տo�����އN�{���LZ�6!���H�a�!WA`gu�^x�2�Bi*�T�ˤ�H*�ISI���O�Dj�<�f��$����%Y��+ΥB�v�H�(�3�rO�8D��Kx	bf^�hy	m ��Ĝ�-x��Xɑ��ˈ�H���^iLw���(�ǚG(�i�|��~��j�I~�Q��7Og�����ViM�S7U��R9��*�fʬٍ�1*�a|vV<�BFp�G��? ���Hd��#�	Q�1�d֒bB�1s�іh͒�H����6����ag����6��;�:��t&
1����z��Z��B5"!Т���P߭�XQs,�7@��F>�',�� ��n���D~Fxe��"�S� k)ZP�a���'c������$LU�p$9`�����[Jmw�wj��ZC�BĤ�qQI�
*��&0-
+�x<���l�6�U<0\���8b�.�Mn���P>��+k9��}r>)Rʇ��*�LE�Y�O#��-8�Xp
���������",��q�\0�r�vj.pv8/l�v}�7V��}�/lA24o@��M�E͍�ȹ ~t�
ik-�D:�x��ShLu�`�Uhܮs�W�f�Κ����:'�mkb|mM��[��k�;c�ǲ��'�|Ꭽ�Y�����K&<��G)�S���2�X)Aj�R��&��33��z|"F=niċ`�W֔�I�kHK�B#<�(��bB� ��9��
�'F�1���<��nH2>�J1�K�m��%U�՜����T@������L�%C66���m�u�^A�b� ��J�zz�|{��ɛ��yw-!��%��%���Zze1�ށch�CVR�x����aR�&���l6�chN��1����L������h���"�Y�-�)[���dhT(oA���2��L(����ۃ�h��h��S�GU�C.�5j��%��xyMbԸ(f!�NW~��|�9ŵ��I������S{��׆@������%�z�������܂;,W6bl4��$n�H��O��iG�j���/��/����/��/[�K�_�eΖ���Q�R�`�B,RyUI@�Y.m �*�Se�qo6��3��p�Q���Y�tY��� χ���'���x� @h~��!1�)X�c����b�[+fvkE�ֶn�	�ڟgCd/ɭk��x�
�ݵ�	q;�ՋC9�^�%KX+�VF#��$��`��d�e��X����9��i��g��3�Rf���Z�lQ�4(o�=�R�:��5H
��f�=l�a�`�)uv����:���P"�@LU$pD,�@`��T���6�pA!P�1��^���QI�P	r�������jN~x8ɧ��!+��]0�`�m���'��w���σ�[n@1�N�p����s�Y�C '�yp��E���K�n�y���I!�ÝD��I��Ɂ��Á��6�,|�$��H�B�I���zٸP�tα}�ܓ��r߅����{i����Ę���V����=:"V���9���|�"Y�_��{M�{B�mƮd�~-we��="r׼�����Q�.V.n'�d��Y�&QSa�/6��L*8��
�4Dj�����$+���Y2��3n�	�$��q������Z�g�9_�x��&����}��?��6f^�p�%�D�-�4DĨ��Ҵ9��3Bc�A��N1gv|1gv\1�̢��s�x�|�I��l�*p�B�o��)+�
�ȩ��&B���P[q�j�ڪ_6=�v�������!��T�k/	��VY���\����X?�w׎�I���#ȹ�7�ὥ�-tN8����ύ@VI���BR���j_j�����Pڨ�ٛ�����bK=����)~�ּyxMgշd �E�V�IҦq#�EG�]0*�
#��
#Sq�ȸ�[#�S0w�bs�[s�5w�:#'���vE`ȁ#�X�X�3"�Ab���΍�@�ZƌO(c�g.c��2f�
�	V �k
��p/tW_�r��C;��*���8'%R�1�H20X�ۃZ��[[ϝ�+l��_��<3�C;)y��mX?���҃�
��-E�pE�%X�q�GqB��1��s��9f�e��9f�
���6FDe ɐQ1%�Qg�`FJ�%3GCK��(�4u��c7vC�L(���S\cA��BRY��
���Lp�=���b��lJ���K���d{� ��d��;�!�jV��n�^Hϕ�Y��T�%.q(pa�ͼ�F�&f�l� 5�T[ �i��n���j�v��Zy�PE�vH�TvQ��� ���"1cQB=k�PO�ꙣ��U��l������"�q�%#�E����(	�:������Ć��jq�ĤI���)=�Z�}��aK�[c�_YZ6~��2TZ�Hu*
N�8*��[���
6�E\��"##��ת ��E>aŇ#�7�H�X{�=SȊB�`}A�'�P�~��z������U~����l��x#?e�|��iI��
ԝPT���)M4�E`�0e=s��x��1��aI�@�M��<�����*��T|g<*�*�QX�8�1E6z�b���q�D����|��Y����ŒUp���t�����T���Z���\�=���QD�Ě���rw=�٪�2)>������e0+B�
�i�j�t��S�޺�A�5U�(N'���d����t;���� kقٻ��S��e�ʁb?n�tנgk��,/J�Qʭ{�_j�%��$F���.q�2�$m$
�3+�z������DpuK?\@��W��RE�$��$��/?�E�[����|*C�
��v/�0���SO=����u         �   x�-�Kj�0������h��t�n$Y)���4ݻ�	��E��y\h� /��TY�3?ߌ�"��s�r�ѹX��d��\{�	�����6����z�_��!=J�	��}-<9N��
֯0��7}�nh �e��K?����4��[�K:�R?4��v"��J(W+��eE)�\q�ꊴU�
�6�cS�y|ϟ��J�+��K�A>N�+N9Ϯ������16���1���~~         �  x�E��j�@��GO1����X-�
�f3���cE
4+�BBw}�R�^(!�8&V��N^�:z�ɡ���/��AK�n��\���8��k5���Hv�C�?�c�[v?��Oy:��7l��*���lj�$g�bO��Un�T�᝞93v���3L�9S�Pzl=�+��υ�b�wíVz�1
	Y��x�+\6%�O:�����)_3|��w|���5ָdX3����Z~mJ:j�oN������u� @�l����q	�" �#�c�s�מ��m��Q�;�"�	�6���
*mT8T���}q��ĭ���-�%s3�pKW��d���3wE���_�v��K�b�9s7�T}ީ��:��&뉌�}T��|�iQN�䂪nE���^0����w���_o��y��*%L           x����n�6���S��]�P�t.�[� ����D�-��An��v[�E����@���6ۍ��ίm`�@J?@��3����\�(ΐ��|3�I�2��kq�7��t}*U�+��yV>h=O�bG��Ru_�a�"�ʼ���<��������e���PE���ףz�A��U-�E5��),ͪ������lJ���7���w���w��Vs���v���jL@�l��]uS��e���b��]�Q�9>�$�,�D1!�@�T��/8/��ޮ�Q/U�O���I"H"�r7tH��*����=%^���zݤ��Dd1�D��6gI�$��rc�b�QG�1K�"��M-{r�O�Š߇�L_*��*/X@�JD
L��+:J��EŞR%�s%�E��B���2�7%C�
ǲ(�m��r��I6�s[Տㅉ�#Ԃ�A�	���I���%����� H��?��@:�|R���j�	����GdnI}�� �quQ- �ö�y�{�&�w(�m�J�xTFL&nhI�-����#}���
�sx��>][���j���T_=��|�P{�oW�>�a�x��1�gzB�[P;ǣ��]�N��٤�p�;}�f�Ö'��	���ZuFV�P�F��w�'��m/�$N�z�N��Բ��I_m��y���\azO�֧��oZ��յM ���E�W0_T�k�.#إ�9~`����b����������_!$���� q��X��	��xb�ƔG�C"��F�1WR�l�>�ƹ�rwc�;�r��/�2R\�[�C��}g�����z�+��4O��ue��^8`67��x!���ui��kD��ZPe�x�3CÈ���J?�Bx.�-�� �9��-��v�զ����K�;�3]� �c��a��D����W������!|���b����>F��� �n��9����{�zh,��툻�����z96��(���r�6.���>��^R��Y��NA�\$���3��e��n����S��n�QE��Tю-+t��Ҙ)�'�q�P�g�k��gs��a#�q�"��TL���{{d���r���C��Q2Ȣ2�e��=�w�ݶ
'����9QC��W��!}g�"��0�1<YׯeX86<��91%ql��'D�Z/��[�����ySQ!�jO�2��*�4�o���5w
T5�G�Vö���$����Il*]l��bn�]�&�ȓNkZ�Ҙ?_���c�X ����1�ƱƤ�z���`����:�>pj��m}�x����n��ʼ         �   x�u̱�0��}���^i;:'4n.w�ט �_���/�g�hr�1r��}� �E�h$xV��K�߉jYۑ����H��YU-��T"�@. `opA��x��q���y?�h: �t����}t�p�z��Ȁ�ū��v���ʬ?����7A�         �   x��AJ1@��)��$3I�Ep�L2 ��.�Mg�F�AѶ��R�R�
���yW�=��]��Y��h#�������RI�2,ݲ��
���~	���}�uk�
�uU�z�"��ck�݊����P�	_��?!��Ͽ���ߥ��1�/Oe]��pΩj�<*):)Ja����4�/�iK;�wڌt���zz�a���6t�W��?i�e~         I   x�3K12IMJ��M�05�511�е��H�5�0INN6NJ�H�����MLO-���O��w�̏1��ҹb���� ���      �   �  x�M��nSA��=Oa)���_ޅf/3�"6J���J�P Y(��Ȋ��
�b�<�O��:s������dd3��f��*� �Z�sѹ
\����nu�o���񕼄PL덆$U�u��������O��t���p��]�q��I�Q�8\$�*(Y�Z-���n<����t���y#.�j��u=��B�c�`U(�Hp�r`�b_)[Nߏ�c�����t1l��Z����f���HW���}�?ρ�cτGq���v=i�X��N)v��=w�mL1�H-�ݽ8��g/uR�	��\��
"*��ɕ�h�\��~�{��?��N���!���k�,U�Y	�I�"����e�[8���Ȑ���W}^CB�"H4\���U��ʇL�*g������>��ǿ�o�i���Τ         x   x�m�I�0@�ur7M�f�rj;Tb�Ҫ\���g�\eT���� 533/������]v��5�ܝ�3��x��{؎fIg
��&��:�R���%���כV��Z�Kv1�      �      x���ˎd�q���w��;�k����<�%3����5Bwfe��b��s�%H�O�K.��\��]O{��q�*[��?�嗿���o�������������~�k�����oʵ��q���vy��d��y�}�k�q��!�u\�ʇ�oN{�Nf�u��K\��a���'M�wO�c�n��̻�8ޏ�6L��5�#��B��e��u)�Ū%$b�Oa�������ڿ��ߣH�K�.�T.�~���]J�k���n#�}���ޗ˵�2�WkMI��s�7Q��(y�2�D�fP��N�'^�SS�7z���/c�5�c�}͇��}��Y��R�4��ï�o}����n���沝Fj.�����=�Oc��1�Q�g��$qB�5��*�gmsꉟ��dk�+��D���1�����a�@'�.�H?2�e9ϱ+Ax�MٍQ�p>�Ǩ��Uzw��r��t���G*I}�4ƣ�N��%�$�j��v�WZ���C�Q�'�6\K���HS)=�����1�z��+�x����˞�i����<9w~�E�QF�'U秈!Fu}��4%i�i�%���޼���LTFm�U��^�s�?b��1�
{WU�z�|jju��(J�P�O1���������뿊+�ؓ��<�9W!��T�Ȕw�$ q��|(0�zq�%�b�I��ԯ��!�*���S|\T!����t��)<C�����k����E�8t��}�>ھi9��x�*��Vґ�K:QFU��_��؞�[��^��J9�0��SC��e?7����ώ޻�����ݬ���m��nc�,�(]��s!7#����s�N�s���a4�>X��#=� �^wvI���璷�धs큜�\�������^���k��<�hz��bm)n,1����������Ys�U���P2qZ�nή�zp��]�Gw*�E	���Hk$���Ne��Vc�a����^h��V��C�<;�����R� _i�.�ϸ,Kpc�.� ���m~��i�Q`�#*+[�u�q�P�C�/ �UKv��n�F�T/.��ڐ�S{Q��z�0���y����6� �y���1�j���Cr<�1;kC��S�����ZΔ��<��
D�(���Rm��xƘg,��n0z!Zk���h���Dӭ��x�?4ң�<2ΧEw�8�`����㌳7��Ms��1~�'"I�8��6(@C��B�?)�KQΪ~�0d#�hR�#�jI�#���R���B_��Cg�fݚN�]k���>,�m�̱����n�$JuK�`�7��0����W#W�&���Km���_ٿ�<p�.g��@�`*��B��Qڲ�*��ƛR��MI���-�M�2z���?]C	,xq�ՑM��6��~Q����B{��Ob�^%�=Fˤc��4`sE	�"C$�M3-Բf��Q�TE�Co���(�
k:�@ ��7r����f�f��>F�z���ԩ��SJE�7��M�e�]T�� �V�:P\E?̟+�z=��Hq14_UV���8�Ǵ� �X� �T1��"tv�\�ވ���xS��?]���562����ڞ��4/��F���'N2��?�)�p �o����I 0B�n�@��2�C�9�J�U~���ɀ&�p�WO7���|��⌺�XǑM�	�R7�+�?�����}D�b/M�
��!w���5ʊi͒o�a�gI/J��E�K�\�*�b_<�G�Լ&N���/���C�7���GM�y� ��]|��w�?�x�c��+܀�H۠iIQ�I7����������d���!��Y2���Ո�qs��^Y�s���.	� �t���2_TƐ&/+���8UCFW
p��� 7#Jwt�����s)�h��:�+>y�t)v	�I��$���|�͂[��M��D����������bhU���UHŊ �8	|�g/���Z�4#GjT���qgqJǛ] �7Uu�E��m�����/rKF��t�lFy0��v�u���,�KQv��V��!4&$�!��*|a�g�Y��ϭ����Ƈ�Ա
cf�q�s#�K�9z����Q�j�1+��
x��Kqd�d	���J��م���sN�����o���bS0�	�^���i�V�W�S3%�<t]�����Yo�?�z���nz�Hq�S\@�A�!��ox�U��]�+`1R_�2�%��q�`��L��h~�n|�&Otl�,/c�gp)�����f5+�Bp��dS9%�����}����KT��R�9��B����6�"�vˋ	g�����*��o��R�n�V�
��̙	ͥ�Wn|E�jʨ�D/�7z����;~Ӯq�\�5C��Ѻ����YSQ��싶yA�ǥ��ؘ��S	�,>���B��� t,i �ɨ���	��Y�}�e�y�avh�"���M�ŵN��
��y�kql���}�N��� J�<Qu%%EŽ���� �R��ϑǔ;�rG3�'q��H{�S�p�H��&�	��m��*g~�b ��JYn�ݎnỹ�>��5�����'�|��HwP7d�=@kP��4�"�������Yg�/��^��>8��R�Q��(�vI��X:&"qfH��o�������@ �az����� ߆;�,5\��<�D2 ��uK��[}�2��0���t��M�J�m��&5'�XϬo��Qc3�T�	|j����,G�F�-�.���Y?��G�}�2��Xɵ*m�<�23��T鼳�l�/O0S�}|Nf���_���r�[����ГX{�I�*���oIl�:��TA�	巒��5�S[/���`���cV�a(jT%�,�,c���ਾA�����pv�`�Eۮ�G��y�#�;��L#Z��͟u ��4��f�z��D	]iUe �Pv����{���6�{60������b�f�a�ێ��H�3�$�=��m��X�����/�)���Sse`�V,?|<�4,}�~.�>П��1��T����Q����K��h�s#g�z{U'���]��{[��1��z�s#o�&�Z4'o9���s��Δ�Y��Q2ɐ�+�Cqڄ"�E��X�z�Ƕe=�٥�F��y����(��P�nv������l�;��C��x���UB����k�~2kt�Id����;d�mdb���kw��x�+s)��<ʪ�0m�m^��0�o}��Γ�G	#��@�%!�m�68�6��.�e�s!�I�l�a��p%�<����~�O�
�E)s��0�~�`l_#��1Ϡ���٣�F@||������������p��n=U6*vs#t��3��jDt��/�ffv)��e�N��M��L�7���C���ܾ$���eGD�c�\~�Ŵq��ay��4�n�Yَb�5P��ϥ��(�K��Q�2aUA�Z uH��'`�>���{fp�>(np���mx�17���X�c�_o��Hjn%u6UA&c��q��8��6X���Yع�J>%����y�fX��qæʇ]+VBڒp$����~��fXj��i��V�K����F�0p)�ز%D�g0�l�1��J�;�*k?s̳�f
�_a�^�lj���㷊�x���*���4�-:�vơL\BA~rlqU��1h�6܎�&���H�:.��Z/� �Up)N;ӄ�r��fS`44"��R� Ax����Ѣ +_p��#"�2*�(�{��n��/%�1j
-�s�9ؤ��fB���m<�]
���`�	�h'gt���d�ǚЦ�����Q�H2��H山�A���d�P3#k*E=*F����:��S9Ve�J��=�Q՗�٦�� P6��t29�+u���w �(��|�lV�&��%� ��NT(ŖD�'�>
9���Lz�@y���|�8��(6���϶ة�J�u�I�������}p[�*�l�L��sj��Z�q���R��綧��<6�ϔ`�=�YNhQ���Ka��t��ql;(u{��w�G�_i����$�b�����K�I/�'���S�����&8IL1�a{^�e��p��c��5%��Eۓ]�m�����x����������4�l�`D���
3��kA��b���ٞ �  nظ$K 
6��}+��nk���I�^���P��4[��j�T7"�}`�,��v�c�<���p�l*ω�o(L�:M�-�}�4�V�xv��m�ES�>OΞ9�R�ڶ���ٶ��$P��,%7Di���/�iCG6���!`ʇ�6�+�����n' m��Q�͎�U�δ$��P��{�5pq/Z&f;�7c�)��6A�����8+���Tn��4O���`lm����A��fPB�#���n�6Ls���<��7ފΤ=����Z�V7O�������u��B��Z��Z��ş䀰a�4�=_�A/�m�e4��bc˶�L&݇�e,T���+�1�(FjJA�I�UK��ۡ��N]�#�P�R������H�A�wQS�Ѭ��L�K� <8;��[I�DԎӃ�M�4yK��ٲ���6OS�+Q��T�u���E=St������~�Ex��|r��ٶ���e��e�5筤�����u�H/��U��s�}�%|)
���{c�D"6���8b<�!�??�q&8���1ۨ���ެ�c,#�&�4*�.hH��� �۵���ٙ�����g����5�~��y���^��o@h�������1>���Hj&��Hq0x�v� ���d�Ƹ������O?
�
�y
�=k���V�bPWF3�W�Y	�m:)������L/�
7�h��A��GF9�����j��#��E�}x��f��,�;~��|=x��"/azc|h��^8��}x+�˕m|'�X�N�i���c%̌�C�!f�)�ٌ�̘��X	]Oa�7�RDј�gw�����8,��}�|��<[[��v �6��0�_	�%��ֱ6���I�	}0�W�}_�1^��Ky<��#���i�D	��m(�I�[�i��9.6T�dN�o�!��+���X����,[l.��qe�l�)�o�r%����	��)�a���>��?K
��s&��n݇��z����Zsٞɀ���i��A7�϶�U鞽1���Kb�oJ]	�K�ن>�?��<��@��ױ3�oK�]� ���y1G��`/0�
�x���kv4�n��)US�XpG�����z+]qǫ�so�KlC��+�Q���W��
�TE�[��hj��m�4��&��X�o ڱK������m,��ߐ�>T@.ۅT����Ҙv,`|>3��c���=�`�g,Ɏ�k�umѷ�&�����Z�����aӅ�^�L1��[�M�a�%���ǁ �m��u�]
�/�ϙ~"uh���;���\l���tf)v�*�0/>L���B�~���X�d�(�Tmln�Nȸ��s����q֟�����=�7�����(�f�9�����?N��lb�bZv,�&q{�eXp�6Zhl;���G~˺(�\��-_�Żc�	�V�j2/$\%��Z�s��~�{U����lD=?6�N�5W;@2��'M�W�ŕb�k�9	�,=��i�x)��0�H;�d��!4�覈F��&K�& �����cG?�v�J�h��~��������P5u
y-�F��4�q���ο�>���Đ=�Oo����7����9 �+y�#Dvĩ���B�3[�E^���-�A7B�cO|��%w�q|��!+���d��ݗ��r�_��m�|=�I�xt��6�A��v�C��Gl�7�K���	�3���[b��(F9��S�:��iy�.[H�8(oU�8�(�d(�\2Rh;����U� }.��r`?Ef���A�l�]��MQ6P�D����ȼW�z������.ۣ5�������Qٰ�	�N���r�;�Y��p�6��vr��LmGH��~�0��0���c��x���E�![��/;�O�v)L��e$9������}4Kr"گ��1z�^��eUB�ib�,�-7�A&�C�e��c�6w� �����{��Fyٗ{.�kqP����l��KB��~ۨ���FN������^k���?�Az��}8H����[@�_v�ٮ��m�^P�V| ��g���n�������_�i6�����P����n�I�l|B	��Y#|j0)�v�C"2"�NY	yngz�]o��ŕ��s)��k?s)/�tr�����b��2��-{��05������~x���ĢI�;����F���,"}W
�[�v-ڶ(t4�RR�m�s��z/��� iAײ�����~=���v����      �      x���K�d�����{QC���F5퉞@��U��?�L��u'���@����H$͌����<��f��L)��B0=ΚJpˎ�W������?����W������oWs�b��bm�1�=�Ǉ1ڶѤs3r?��}��������֐Z-�����X3���`u���F�ҟ�]����1����f��h�=+�mq��h��iy۝�7.��#�l�<�x�S
���_������m���cJ͸:OҎ��Y��g�O�#�ԗ��G�h���M��浃o�������}��{3v�j8lY��L��Z[Z��S�-�|of�X(�-µ<Vh3�=�v��W��M��N��Z���Fr����'�d���r������!������\�u�'���Y��m�c[�[f�ڍs�Yl�!����NydsF��n�MŲ\9�S}�������'�Xɴ:1����*k;kI��C�]�P|�����-�g{
��1����n퓪mu�j��r���(��f{c�;���Of�ɇ�&����"��x�˙���-{23�\5��u���L�v6�`>�[�����*�xR��6K�B]������N�!v6�v��݈���M��;�ʎ.}l�kw2�(����y�o�9=����=�-��Jk��l�56���{X�$�~�������gU=�˦�dLscx�,��O��{���&[6�4��77��yi���mj��xH����wb�jv�p�f%�O�y�0���t�O�3ˆ�K[��Ԭ��ǵ�������682��6��]Q�����5�`3&�̝n�`�q2�%����Y�j�>v"O[�6-����r~�v$���l������YC�1̲��0��ո��P6[�=��]�>f�ݲ'����i�]k�{6��c| <�u.���Of'N�4+Vˇp�f��Co.���z��k���kE�P�7�Co��9�B�sp���iJ�Z6OBsgMkSox�gX�x�HoR�by�sl���Ex2{`%;UoVȄCe%Z`���VBl����l�d%�^a�C4-�`�L�?Np���`OfG�cL����LR�ݐ'�!��G���i-�:?�s���jt����)���1����X�em]�Ԝ9�l���m���i��v����B}"�d1�Ow���,��v��[�dz�ĭB�mEQ6�)����u�'���_+jEc?Z{~ozpmnV�J㞠�֚��F��x�e:�ˀ}�h}�!�e�����,�����j�@���b��ٳh��Ts�>,_X�y_̶塜��0�j���d�{�z��o�}1�sv�5i<�# �5K`��<z��������1ą�S��y%l�%���}H��Q+e=m6��mf�|7)�����Of٨�ª�~lXM�i�D���'�����W�5u�,i�A�$O�L����:ؓ��0�{@�������rs͑��?fQ��4T�CmT�ژ;�(�e��-M"��'�`�V9" �O��2Ͽ,��ъ@�)@#�Ó��&c/.ȸ������9��$�����h^�]��]���Z�����Qj/��	���Z�_���ꍇ0%�^5��`�o�^{�c�/����
����.[e����>.V�b�e�lɐZq����Ej��y&���_�B�c�,&:�I�!�*kRf�<p�N����"@�,{��$j�0f]L.�8�y&��(i�N�A�-� �'Ă��O���"	i��.��Ơ�sE:D�/rb��������C?��vY��4���%� ]5�'�q�]�4S����H��EB��fW.�J�\�d��W%ݒ�wa�-��I8�
8)�2���2S�J��r�'���M
�PgO�m��oR9�r��[[�J�OfI|�,;�Y�$DdΧ�\��P�*��U	�R{DϮv�jW#���Y#�R"��՛�1�������������������ۿ��d��IFM8o��Y%����q���z�=<|]Ax��'�>rY��}<k��~��ͬY�X���%T��u��]�t��>T
,N��x�-�
/���9�G�{�+�"P�@DF�����X��k�d�f��{���8���Gf��FY<k�dv��Շ 4`�?��~&��ߵ}2�$t��rDj���a-T����k`�sO���W�eqG����.PS�{�"�T�E��	��SZ����O�}�<��3ӑebD��6���\�����'߾Y-�U�֤��x ������X�R5��U���ʑȯ�>��$�*jj֔�e���e���ji!�w���~_��'�	���H�Cfe�ԕ�9m���ݣ]����v�3+�U�S�����/�?5�{q�B/��� �y��ϓvp�c��;�`��X�P��M���ظ�W��$�'�=�-�OTV�����e���Z�RYw{׏�&aǥs^�8¶�`�bfm{�|����B�t΋Y�ڝD��1�9#��&,�MD��Үʸ��;�RD�u�SpE�OQ���`[B3g��MR6m���a���2����/fsl}y���\	i��UXH�x�̞�Gc_eG-��=-���~/.�d�/�6�dBᓨ04$���@zO*��e�3�xz�w;@�(
p�D�S6��`vNo|B��5a�	��6/��9P�?Y��*ҷ"���N����	I���it�͕ß�HG�*}�o�ŒI��wln ����*	�!�]YZ5i��-5��"�b�l��ƒ�1�(f�M˦@�z1��e��$��#v4CWu8,�o:sīk�d6f�̒i6Đ-���	 x�T|�%s^��A3��jm�!v�>�_�풡��� ]�-�V�/�+[9���/8i�2�c���҆�����������k���:F��'iHL\����=2Q�'���דݎ���%Z `Mz$������~�|�������:N�$Û+s�S�^�)�63Ȭ��v8����]d���h^�S������%���m�h����j	1�J��\� ��#���5��k]mn9����T�����i��Dռ?��V�E��D����,o�Q�³K�(͓�hmc���׿�׀~��u\��3�^��Y�;G�-fU�JV�fd�m1@n�)�*�>��}G��_��$����;�h��syB(B��E���� �&~z�9�9������-#Z֩��j���OV3P��������m*b����� �폭�R��ꀎ	���U_ѭ��+��v}�O�����;q�����Sm˕���\���WG�d^� ��P<�;�ke��V�H��X�xڊ#��B$��,�o�����]ݱ�Gŋ�[c�Yb?�܇Z/m^�&��n*i�� e!�t{�#�NȟL�H)`���p�>�	!�K� ���P�9�)io��` Ȳ�6h�Em����I"�lO���)���qB�$������P��(���I�8����{�f�r2��k�A%�[Ί<���E^��� 6BԴ��2��A��b7L��;O�b�$�Y�,/j�1����M�0�Ցl��4/V¾Mi9�@�V]�������ϳB���$O�?A}���e�9A.K�>�/���_F���Y�^�5�����zV� �q�0��m�Ak��}��_Ov��LqI�%�A�Z�7��H���nY�þ��们�IZkL��-���ی���Yˀ9D��['�����Y�z�*��q�7�α��s_]�� 60O�:Ce5��Rm0�E2��;���Ԭ���v����U�oTb�ă�s��kJ'��B�#��:6��n�OI�ζ|�|��ķ����T����E@D��E=^̶���q��uN�~K�ޮ
�v�{�Ŭ�mYҶ�[�c#{���j�gפY/F�b6��>X��#��oY�>���x��=X�R- 	[B���L7����H���I_6{�=�Sjj-�
yn�lW�!�=X�`�{8�M�JZ�ń�'���ͥ���{���l(��f��$�I:�$�D�цȯ�.����R�yBP��v��r�z�K�*��=ZѬf33��xԠ���u�6����37y��c��S/��۩h҉�5n��b7�    T�"[R���sN�?~^���ia��@�o���_#�c�wJX���5�t,�'�j\�Ǭ��e�8i��7f�G���y4��㾪Of��*�(�xM���8w�Z�Of7��b0�Ӻ��G1��س9�Ჷ�]��:;X�! �@R���Vm�MC��j��(��Q����ڙ��a�PM�2F�z}���a�r6����]��a�j�
��AeZ����H�P���_OV�
�؜�"0�fe9Y�����]#͝�2ƒ4�cAYЬ���&���QO5 �r�����<�_ �d6Cd@���O?��m��'mE�OfE1�MRڈ���@.�Z��?�f"㟚%f���_�q@V��ҺvA�oͲ��C���;N3n�TV��e'�:��@�\Fϙ�T����c�� }�@�׾X�3zg�M��y�-N��Hil��/v',>� �y4��7�`PzJ�+I��֩�{P�M�j��ym
ʰ#T
i��Hߥ����Tk����T�/���bk먒�Ƿ;�����԰W>����ϓ�j�B$�˩��Ô��ID�E���2B��f]��-���N�K��ؤ�ar�8�Cz����DXhx�'��: �M�Z��L���#��B]���d�l�7������U'���H%��]]�7��-��+����mə�mѧ��������.�U�5���5�g���ǒ�����]bO�F�G��Ǿ{SK���Y�1(�vU�R�+N ����7G����Of �y�qfB��.����k�F��Gh���:fN$����e���>���T�!V���}�֡�R�=�nE/A�ZIQŴ�y�	��C`�j�;�z���ٶu�Z��F��4��86�\� �k����[��G]X����v>;/<8�KA>�E�VħZG�;���$/f�τ���[I-����;��������s��h�zn@��#Z�d�H�=<o��m�V_��-r�J�⧆� e"KQ�:��O���b�?�[���M��n��܍�5��a���]����L�a�l��8l��2OhzM5JvF�FJϩ��FD%/��U2�[D��vR��[�*����^��9c�,MAfai �j���5=�wU��X#��5YO���+h���9K�m���*��}הL�i��B�d`uzd6H!p�Մ���_0��;BIX����zTb�NM.J<�r4���D��v�,_�vĽ9��G��~��y�v�Q����p�b�=�3�~�A�A���s�i���+ibP�:�sR^S%V�H��ק��F���H*%��sj��>��b��ق<Q%�/r���f�1�k��ɬ���mv�"5w-Z���5��_�)of��K�3�_M�A<�#M&�z9eE{�([a$���M�|��y�Ωi��Z�L�ъ$���:���(1���tΕ��֊��܇%��CXD�����ғٕzN)&��h���
PVNZ��n�}1{�ڪY�3� S[�j��;��vMD��w��}�F�u �N>ɷ���i��z�B���}���"T����������VM&B��9����A+>�Dn����l���+(nUmVAE'W��3O���0����҃ҁ���Xu�N�7���!Ԉ��K�}���j5�ozxI���8�g���������a_=�7k�����<��!N���4��:�,�:��y�E�_̖�u�wK�.�������Wj��ӓY�#)�	�j@剦��`�(cߗ�AKĩ,�j4s}��A{�"W�t
�Z��	<m�:V4Ԧ�>�u�(�̦�����t&Vҿ�N�={M�r½�=��;!�ӻL�l����5YHj�������ck�&ċ��	t&�1$�ʠ�WE�@�G�#��`sU���RV+'�[,�An��A��w���<wI�]k�dv)�Q��!�nuH�tF��ڼN뽘�L���M0�6^8�nI������d6�\U q��e�[���N��A�����u���8�w,md$M-�nT��?��Y�H�Q�ٰ�@Lj$+���3�Of�:IS˰u��Ґ!�������/f��'�&�2M���Q�JhD_�8�Y��ПY����}�-|���B���:T>����htL����c�sҩ9��BֹM|@'�X��ݡ�e�݁{0�l�H2�֪��wb����}�!�̖52{t��Ɇ�e�(C�LV!�z�!̒m���= ����D8��j����F��Xg{t��B@�4CXA�Ƀ���&ɺ����ߡ��ς<�p������yB�':����㰐|�#�7��'���jY�Ggl��ʆ�Y+��D{����HE�������}l:UcW�ʪ���OJӵ�� oq&��X~�p��W��޼�=}�y��|2��-���r�MW��t�iZ����Y{B��`���*�`z��0;髶П�F�F��LfUM�:	��պ�󞾮���A!d���؄珵Ӯ�D�񘲒�"�qD�.{2EC���$�Yۉ30]E[��TBՇ[�u�ZWW���Yb���,ku�MGī%�C��#1�e�'�M�@c����#Åe|��Cߴ�d!�Z@I�Em԰`Ѩ@XN�7�9�,.�b��-�qNR�w�ȗ�~^�b�E��F�m�T�N��ߕ��#d���Ofc:���������6����`Y��֛��[	��J@��8����?��Я9V��k�٦2_�l0��h�*H�~��:����Y�*{i� ���]�{����,m�<��@3t-ɡ�g�:��9��.Z_"u�&�.k�x������p�2������[T�U#��=䕐�� �Ld7��(�vM��M����J`of�-��!�5�G0&$ڕ�H��C>�]h��MZ렚#%L"�%W�9�� ���|
����*~��>1��m\�E����FD@�&�5�ݥ�B�&�~��M2S�_������~cýf3�3#��,RSM�tY1��'<�E���:+�N�U�}O�	Zå�����,�Z�i���A��@6d���>\��;,$�#����ԥ@X���=�C�����������|��M���x1[�V3L]
Dq�p����0�\��Ŭ��_j+�~/��neg%<�w]��d��/�耥�7�Ԁ�����ެ�~߳	$'7 ^�+\� �hv�6�Tꜟ�쨳�[�V��� �"�������JW|#������	J�o�9�'�3h	u&\�R�Z�1�zH?ѭ��>��1��a����r�t��Ng]���2���G,���h�I}C��p�����B���g����E��'x��_������Xܷ���h�ཤ�B�~\�<�������j�w��`Y�/�S������'�"B�0��`)2謪��k�1�� �Y�r��H����ͱ4�3ȷӓ���!L5��WZ��̺�'�dvE���V�8t÷~��^hm{�Ó٭&��u�lA�t�Y-^�z��	Of�Żh�C�k>�c�r�9��^��k�&_�@1�����gT�d�n>���QuڃH�������+H��7��݊|0�q��GD�]KW
� �Ht�V�}��ͽ�!���OƓ�.[*1:��!D�}���lS�YE�pV�XMWi��u&[�j����>a#�#N� T15uE��<7�0u]�j*��a59tB�:�:�/�}2�vj	�hlѕ�H:��{P��)�꽼�Łચ�U	
_Te�
d
�J*��ZOfyQ�Vt�|oJԜpo;����edn�ߩ-\�A�>�V��� ��E�:�tM��.�s8
Uҭ�iN�߰��fM���?Y��|h��%>AϪ�l�K-�ԓ��|�G.��]@�e5��L��]]��X%��ox� �m>{�k���Z�w�����$jt�9�4��t���̢<o�����dq��D�nYHӋ�>�u'x��{iq�7b��m��Of�(��+Ţ�@��vUh;��ls�J���e��|]�����8j?��:���Ϧ;.�x��\u��v"[\��ɬ�| �  �Dj�H0
� �F+-u�'��:����5h�����<~Kr<�޷����2ov�9����J���u��O����Ra�[/�n�9<�����5z����g�O博Y/���!���ux2k!zw10	!/~� YlwB����dv��*0l�T�EEᅢ����4�_P�d�;�ֺa\U3��&FG��6���|�Ҽ�4Cרj���rD�Ub<ՠ������r%2����~o�x�zx���H��P��5���HT�̿3�OV!���z��|��bwq��C����|4�]�i�x���q��N>��l�Gg�g�l��T]G9u[>	��;�d�1$	����Æ��h6s�4��C��j 7D�ݿ�晖fJpR<��gMpvW�q���Z�*�q���$'�� fD�}�� �,���_�!\ؿ�ٟ��sO�ٯ�}V�ڸi�~^���	��� bL���C��j;�o �$V�>�6��_V��9)d���g2����5M��ɘ�YF����G����s�#ơ���?h����t^h�d�hB-����3pU�w2"g�8�2]��'��޹��_�]!��]Ѝ�IW;�j��&p6:,�:�N��Cۡ��ڭ��6vI�` ��`y�,u���ɬ���4]�_����Ƅ�yA��Y�̎�\�F=���M�4��+��i܇=���ۖ�+~I��{���n��苋�4t��mu\�r/�{���r�:U�ӲQ��.ԝ�u�!@��ZL�c\W���ՈK���1h������7��ٯ�}2I�E��wY�&�>{�=τ�]���,��G��l�4f��T	�B�OT���nE���{�ȥ�F�8�� �)*��D6�F����y�2E��0�x�ý���Ґi��EE��8:9!�:���<W���l�6�U5#�+0��P[��Υ �z/fu�n�U~k���Y���Y��
���CpqΕu׌.V���X�2���rw��϶R$�"TfK���8����y�'���uğ�n��ɪ�����	�r�'�A�p2#`���'M[��(���5p���'
���4 �t���X*���l��Ot}�$$�Z�
��U�C"�>�ڙ�5�tp�ԁF����N�\�b��:�u���)ɲe���d5hj(iܳ//f�Ϻ2��b����Aa,s����\ы���>����C           x�E��J�@�ϛ���l�M��-ī��tR{hZJ+xk��� � "*����O�O|�	8y}�z>f~3�ǀ�A�������P��� aÇ��$lw�?t��kt��u2�������g~ʆ������V�.=�p���V-�����p���r���3߱����Wk�/��Ǹ*�e�,��������G@6�A*.�H�4�EÏ��P&��'ZS^���:�&t��-�l{C�,�����#���_"e4�W�UӟSzp����H�         -  x�E��N�0�g�)�FI�8�#0��8��T*��9�b� ԉ��HH�����<�yp_�C������ww�-�U��,��x�%�i!��q�k�Ƒ���5���l��|��^}6�DCG��#�n�?���c"�b!3f1�e��,�V�$�&+4�X@��]	l���3XS7�j�\�f�7Xa��d���K
5���nN�n�p�` ����iO3.�fJ�fTf��ل�>�~�+�A}�-�3E���n��rWv]p�����"��p�����+������ �O��         �  x��R�n�@>/O�/�*��&����^*�b�"a�D�' ��VQ+E9D��@�HI� �(�'K�#���5�i){w����f���\|E,iV2�Ӓ�Ēf
ajɬ����i�	��f�a���r����Ys��-�\^Y@�^�pa��u~s�}��`����N�P���L�`s]�|��E�*\��DI�&f�[�ʵ�;kgj�m�u��T5��Ol^�~�i��qUE�}�ܩ�Y�|�3-��
����v�[�XX$,�X<��O/�5�7-�7RZ6E�0��T�2RV�H3�����=��~e���W�K`ֆ)0
7���.����0z��07�fآ��~�i��T��*�6�]������t<R��V��r���|��������t��|��|�I�#Dxw(��{0 *��@NA�r�Ҳ� �K���&A��t�}ꖦe�S5Y/܉Hc*UG~�r�hcTL��W���3���Z*!�D2�e㺮��e�a�M��!��v0@�`ח8�>��Y���_8�T{�؝7�c�94�μ����HܓZ���������#B<�bO9]YO�tH�D҃n)]i	��C
$ԗ
�>f�Y�����'r��CDv��H�v�F}���7�3Uu�/�!;�g���1�g��D͵����N�M��m�I���tB����^Ȁ4�����4��E,��Ű         �  x��UKo�F>ӿb�r����1ioAQ �^
Kre�D����'?�&�E{�E!�j�Id[R�俰��=�YZ��:��=��|3���ΪN`�&e�Ǩ8�|+�A�ruˏl��ojX�֌Ƚ�QKҜu�}��F�n�GmV��i���1�g ���Sn���NF2�2�%����V=I9�"y�}����γ��G<]X�p=M���5��j�_�\M��nZ��Qðlj���A�rZe��̵�����&��yw�)��[r1������+ǲ���0��1�z�-����?��N����)�C$�o�Ϙ��@����
������1tLE/5"�5Pl# �@����Ã�=�U����3�b��P�Q�!Y�
>T��2C�x���J`���;��!�I��f!������e��u$���`@����m��*	�b��b��33Ua�L��=a����j���=a��z�k���7=÷����8!��O�z�~��&�������W �	��ǿ/3J����\(<�y߭��;R��7���m��#��<r��Z>
�G�*wi�<�MW��*
W�=���HZ�=��)o¸�N�q�Ny��~�I�!yʳ�g�4H���`JҘ/�:���C�^�a'�ۖDvh�<�!sj��<�z3(���k�a��\슋�l���&��M���r���Z�1�r�����}|�,E�t��H�0K]!���쥡ꏩ�S��o�Z�����\j��C}���L$������<�s�Y�Y�������Q�_��Yީ��6Lvg�Ax��4���Q)���6��j��FY%_qB�>ɷ���dJ�����������	��WH��:�K�I���F�9U������8\�\���������Ҷ&~#�N�Ĺ[b*f�V�]� bB�	�ϊ.�6�mM�
�m1*6�D�i�K�9F�LL�qF��i�h@� ?qpS d� }��Č(j��n��_�)���H��:E�kZ�0��v@'݇ܴ�U�-=M�q|�Y������hQ�tmı&~�_��ƙ��*N�rY)��eL�� F�D��5m*	w�@C��@\5='��`���U�e�� ��j� �R��R�S%�I�=POn+�׫+++��         e   x�}�K
� @�q���Wd-�=b�4����s���=�
fY(�i�-�Q �l�M���+�7�0���4�3�i�/Y��}����*�x�����vd�	!s:4�          k  x����jA�ϻO�(����,x��Twuk@�lޒ��ѣ"�W͆�y�Yp�y�Y&d�=LMӿ���8eK��\�
2N�h�.��������^>������׻���Ul9D��\�(�
�9o(�V�-)�XZ�\��J��-"VST5�˃��zr��N�Ԭ��فKd���`Hr6cUu�<9���͏f��l�4�"����94��1��J��)��zxx/�;�Q��\Ib8GQ�V���8�Vq2;�t���tu�]u��r��Zw���bu:�x���҂���l.�ARAK�:�Ц���K
�J�M�\h�:Ж���λew!�b���X�h�[*�k--��I��Q!e�7�B�.����VG�(/�bf퓅��}P*��&
�������vG�'$ؠ��Z�={HZ׈N���	���g�����&�0.v�sy-������������1r䠤�0�|��&+��P+��:u�Zi�Z?��C(�!��٤����!�����\�����GGѢMI1U/+}�Η������1�@�s��p�-�g[=�CY�-�/7M��bL�,c`���Z���
��DI�t�����M�ӿɷ�W      �   v   x�KL1406I2�57�H�5I23�ML53�5KK54L5I�H45�,H��I��T1JR14P	K.
�Ht3�-�6�������.��+��qL��*�
6�p�ҫp,-�q�,��
�	����� �� �      �      x���k�#9���O1��|3�'���� �3@o����2��"%U5��Bw���p���Uc3ދ(ɢ�3��<�VM�4e��9E�}�n�Ե�6�u��MJ-�R���h	��T|��ծ��l�|2�x����7>\�s������I���?������\��~Ԅ�����1mm)u�����T9���֭��Z��؀�I.�%{q�m��Mg����p����Z�>�p�M�J.v"�.;w2E�M�R�݆4kc�lɾ)�'7�T߲�vS��֍4�I-7[�>����9F�[Q�?��d"��D�:{�9>��D�>U��)sW�̠�������t���b���Fm�c��K�&��tI^bM��j��IѴ^lӸ�9��lr6�!xk��S��^���g���F5���>���6e������['�A)$V���;[�l����*��U�\R�=���61Δ������c�΋y=X��Z��\��e���J3����!�p�#4<�-�%�H.bf��l�5��
%����I^�KH�{����}�����
'eo��w��*�L�OuU���|�΋���|��U�{p9FJ��XZg��Vw	�R&�k����q����/�I�zsv1�v��V��^΀�v����k0Z�0A"�R�U(��N��Y�8g�é�a�*�N]��X��v�M[u-����I��$<i>N>�����$��ɥ�5-�Wb�VE3=��@S��Y��N��vZ|���мL=s��l �����GHCoѤPf3.��i�LOrh�t��Ue�6�˞E���/lw�O�Ǯ
0�r�-�Cg<|�[�t1�2)}��Ǩ%ס��I�3=;���ag�D��!��~���Z{N1�<���N�8hOj�[��T��:�S�I���3E*�gR� ��ƒ�!u�|%#p˖���3���H�:�O��_:G�[��0u��5�+�%B����4�M��г�{Ѐ	��"�HM~f IF�t���z�I�I鈔n�ș���I����l�^~�8:�AmsU:� ��2"U��B��z�-@���D��6�g�rt��`{Z��Aܤ�f˓�,��������YF�}��pN��'������	g�ۂw k��$����QՋj��d����i�֬�>�`�����Q�i#�6���g��ia�M���'A�s6lݎ%�����o��Q%:�N(;�.�L���f:�)��oR�&�w��*�Ԡ�e?�ma����v �"��v�� �V��Aa�s���)/v��h�[��\�* 8D��)����#�'��K�Pi<-c9�J�E�V[��`���2G �G�yf��I��H<$3��|:�@���GJC�T�p�MɪP�*�13pj�c�-e��<��ŗ���gH�ikzʚ@*�[�0����V7�^���Vfײ���e��:kd����:Oy6yU=%��V&��4^)2O��\���������L)8⧆���"�k�U���|Tff���$
}�r��ޤ�us�1�Z��eq��R���Ʃ�hR��	."|��.ɔ}��FY�h$��{0Mo�%g�B�4-�l������7�C�I1?*o�}W9���m��T ��YuF��z�V�j���% �Ҩ����p��$�N��J�:�SU�N�O��4q1L�'4qQ�}��K���_����z�A�dTH<svL�1,�Q:��e֓G4� %vʹ$P��MOTK*���C��\-��]s�$�?˽9���#hz����I�q�T�{W^���ìW���jē�>z0��#I`:Y��k4�0�J�m�Sh�C�9�8�˓ ���n�Z��}���L2_�8�vZ0)�}Q��Q���Sk�'"��Q�RAS����!���z����Βy���zTd;��0�d�<Sӽ�ޠ���[��B���G.U_3B\�����C��崴�C��j��`ëd�J:�ѹ�2���\*�~R�K���w�
��5���L���eì�oZ�v���G�T�Y��x:=��(��P�)�h�H�j#7�T��H�F�[Ot�C��o�����C{g��%h}��Tq����~�V��L���`{a
J�}�C�m	6�4�R0�׍�nɱ� m��h��=K}8gge/g�/8�,ri��[�R��U��I��S��VJ� ��\�30�2�"�*�ԑ^��6L�z�Ϯ�\<]aǪ�'Q g3�b_7���g����3�:Is�C��B5�B��'9!�,37X�
���v!�(��mx� q:�H��� ����Z����Rx�9##�Nb.���!��ME��g�>k�}���g{L�[����A6���`�|�r�(�ӒrvB��2U�)&ք[jzĈV���mh r4莀�E+�P��:@t��\�')LKS��8���z�O}<#x?�h9��VDA�����VQK(��`\�)�3<���2��7
S�WP��rXh��p.汋�HN l�O�ެ�'�=�����r��j��C�c#�IT�W� � �39���@���:#�o��X,pq0k
hiqJR뢑ǁ�5=��|��q�y��)ˎ������J=ER߬��
%]�-�B�@!�> �c+��t
gԆ��y�/�^h��s����0ўhq��+a<��}���,ۻ��k� �&d�g#�Z�_N̠���c]��s��4�[��v��uP���F�g����
Y'�Ib91�+l���c&Ԡ��h��H���9@��s�jSb`�2�*��?Tƞ�sױ����������(?G�Q~������9��e,�1�J"�ė�6�ru���!H��p���=��J����z��m"<g�ϖ���
����ɔRj���}>M�Hf��BL�cm=������ȴY� �� �\�@��E\�k`��c��������b��.l��Tڪ>`PR�@��&�-�=�ÿ��x���['�Z9�ë��T�5�9��(�9���2���o�㌱��y���U�Oe[� 3ԌaY�����7@�iDT��W5�aGz�y�7��FzF�k0HOAS��I��*|]ʱ�-�I�c�o-��-��±i�5��0��3�hV�*25��c-��(���]�o,����W�V῍D)����ը�X@�Y����ߢ�v�s��ÿ{jw=��8\�CʎD�K
*w?T5��I��ǚ���w����Ŀk�d�㦆��-����E�*G�H���8�Ŀ�p������g����t�M�+�Q���
b�H��y���EDV�]�o\����qc�����:z�E�l�f*�c�vy�1��U��9������Z��^��(�!�3���e��OF))g�k��R��d�om��:g�fg҉n	m5��K�KhU�A�,����6���r����76�]���+�3�F�:-���&S�-�������_9L�W\��-�]�H}�� M�k��T���b(�Ҏ5�o�{�����u�\%�m���ú���u��;ա0���l��xb�}ݼ3��x�-4t�
��e;�,TW{��:>�ÿ�0Y��o<��-�W������@��q��36m�_�֜�5�R(Pп`���is=�h)� x*��[�?�����A�J=�Ŀ3Ƕ���3���,\O˙#B~�yX*ǮC��<6�d�ݎu�o9\���]��=c�l���@%�È�.H4�j���{��X�+
(v̻�߸�wO�ܵr`�fSR��G| ħi&�r�����~+퍍�T��3����߅�e>�*�i�����i�����C$����ƿ۲|�~y�����rs�*?�b�a2����6�-�:C�76�-z���haΩSzi-M;��7&#�6���N��p��G�y���Ѷ���P�&*�W��{�V�/Jf�T��i��X�o���:j�}��5�z�04�n) nA��(�ă��[��Z�[/�nςޜ�Vc^�1��~F�Vۡ&:���Q��;�&�M���p�ioQ<���ėq��HY���J��o����,�X��Ni������L���   ]Μ^�FB6`��u�"��w޶R�?�|8vL��G���q��ף� ޔ���D�AȪ�J���>hs��Ê�~X��^�ls����q����Y��������[���=��n�8��3
�?\�N�����A^�N��_���s�&�S��}��2������G q��{V���_g�}כ!��8´*I@��	g���8$�9���r�?��������uҺ�g�3�V�!f	A��E��\T��9�3�?s�Ӻg�L�7���u�ڼ�����fe�&�t�?����}Jǹ�+
���r�յ��_�ݏ�nGT>'�}�`�d]XO���LX�m���=��ޢ0��<e���E���~\�*
�c��j'�.�iP���j)�J��{{�۽Eq��,��s���~\	������c]N���0c�-F?2�Z?����_�`G �G�����lQoj����j�Lٓp���*����E;�����Z>����߼���.es��C�mj� �����eЙ��?Ǚ�[iE�2�`眽2�֥��2v@dr�G��*{*򡨏�l�P�z�_���u};������+��q�D��}��il5RȽu����@a�&�1=����6�C��N�����xm�"0A��b��e�1�z�J(e���������*�C(��W��0~\��r�{����BT�u09�)��,�7�9ƟQX~��$+zwD��1~\��� ��ɷ�Z:�)[K����̒t�7���ir򍤽p�ֹd��f[_WEa8h���U�����F��YƟ9t��ڂ�v��_Z��M���Ea�z/f��6���f���W���}�Цu�k����K��q���M��#VQ>ϴZ/2�˭u�&8����Y�[��Ef3��a?�s�:��ν��>*��kA�j�P~g�g��q��g�^��,�vG�_YƏ���ho�B
���ʡk�Vi3�Ջ��fW�C�B���ӝw��l�q�|݂���q���$w˩ϥ���`6�K�8�{ˡ��D�s���/��u6^=ct�v�ϔ�KJ6�ei�Xq� �=��ސ/���f�+��q�{�}��;h���]�y�X8}(M�Pg�s�����C~�x?��7ȉ(�ޅL�@>EfV�K��%���-�ryˇ9��C^ޏ�t�z=�ϲ5!fe�_�HU>�<����=m.7�![��ݿ��ס�����p��qݞ��}����\ ��oQ�5s��%�_;Ə������:%�g�����{�,QU�:�@~�s�7ܳ����=��a]���r����n�l�B, 4��G�z�q���xy�=�=�y�?�[�~�}�'�W#хf]�b`A� T.��j��>��������{v���O�~��V];��V�_|�2��z���B�Ҏ��LJ�z�����u�r�N/h|N�՟��	�臩))i�r旜�q$�D۬�^�K��u�D'�.4Z�A��Хfkg_Qh��7��G�Y��%q����W'���w������?���۟��s|��礳�̤M9�����?(jX`     