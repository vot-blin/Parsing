PGDMP      *                |            postgres    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     |   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE postgres;
                postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4808                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            �           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    16582 
   candidates    TABLE     �   CREATE TABLE public.candidates (
    id integer NOT NULL,
    name character varying,
    city character varying,
    skills text[]
);
    DROP TABLE public.candidates;
       public         heap    postgres    false            �            1259    16581    candidates_id_seq    SEQUENCE     �   CREATE SEQUENCE public.candidates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.candidates_id_seq;
       public          postgres    false    217            �           0    0    candidates_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.candidates_id_seq OWNED BY public.candidates.id;
          public          postgres    false    216            �            1259    17092 	   vacancies    TABLE     �   CREATE TABLE public.vacancies (
    id integer NOT NULL,
    name character varying,
    company character varying,
    salary character varying,
    url text
);
    DROP TABLE public.vacancies;
       public         heap    postgres    false            �            1259    17091    vacancies_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vacancies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.vacancies_id_seq;
       public          postgres    false    221            �           0    0    vacancies_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.vacancies_id_seq OWNED BY public.vacancies.id;
          public          postgres    false    220            �            1259    17027 
   vacanciess    TABLE     �   CREATE TABLE public.vacanciess (
    id integer NOT NULL,
    name character varying,
    company character varying,
    salary character varying,
    url text
);
    DROP TABLE public.vacanciess;
       public         heap    postgres    false            �            1259    17026    vacanciess_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vacanciess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.vacanciess_id_seq;
       public          postgres    false    219            �           0    0    vacanciess_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.vacanciess_id_seq OWNED BY public.vacanciess.id;
          public          postgres    false    218            %           2604    16585    candidates id    DEFAULT     n   ALTER TABLE ONLY public.candidates ALTER COLUMN id SET DEFAULT nextval('public.candidates_id_seq'::regclass);
 <   ALTER TABLE public.candidates ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            '           2604    17095    vacancies id    DEFAULT     l   ALTER TABLE ONLY public.vacancies ALTER COLUMN id SET DEFAULT nextval('public.vacancies_id_seq'::regclass);
 ;   ALTER TABLE public.vacancies ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            &           2604    17030    vacanciess id    DEFAULT     n   ALTER TABLE ONLY public.vacanciess ALTER COLUMN id SET DEFAULT nextval('public.vacanciess_id_seq'::regclass);
 <   ALTER TABLE public.vacanciess ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �          0    16582 
   candidates 
   TABLE DATA           <   COPY public.candidates (id, name, city, skills) FROM stdin;
    public          postgres    false    217   I       �          0    17092 	   vacancies 
   TABLE DATA           C   COPY public.vacancies (id, name, company, salary, url) FROM stdin;
    public          postgres    false    221   f       �          0    17027 
   vacanciess 
   TABLE DATA           D   COPY public.vacanciess (id, name, company, salary, url) FROM stdin;
    public          postgres    false    219   �#       �           0    0    candidates_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.candidates_id_seq', 1, false);
          public          postgres    false    216            �           0    0    vacancies_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.vacancies_id_seq', 50, true);
          public          postgres    false    220            �           0    0    vacanciess_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.vacanciess_id_seq', 1, false);
          public          postgres    false    218            )           2606    16589    candidates candidates_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.candidates
    ADD CONSTRAINT candidates_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.candidates DROP CONSTRAINT candidates_pkey;
       public            postgres    false    217            -           2606    17099    vacancies vacancies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.vacancies DROP CONSTRAINT vacancies_pkey;
       public            postgres    false    221            +           2606    17034    vacanciess vacanciess_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.vacanciess
    ADD CONSTRAINT vacanciess_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.vacanciess DROP CONSTRAINT vacanciess_pkey;
       public            postgres    false    219            �      x������ � �      �   R  x��X]o�F}��)
6��p�!��v�nv�l���@��L�V�IN6oq>��m��E�nG��K_��κq,���s��l��/�1B�C�޹��{�{Lof�uO�ĵ���g'[�n���ˍ:{�ҥ���4���ΰ�v{�������͵�+�bR_�6幾�*O��`��ަ�a�������zj!��%5~n��ٺ����=�Zv=�	�۸���=I�v?J��t|��b��5[~�{x�3��/���r3Y�䫺�.�^��9�w>;����Wj�\��#ٻ�F��֗���JZk��Mv���ZlV/�̷����w��L��� �x�O�w�n�n�����������g!�)b�	��Z�W�I�;�O��t۲+�P�H:���#If�1n��k}��_8U�`q�)�TW{9C/���]x��>7Ǝw|(��0�
Ϸ�K<��=�dv�=�����fv�h� ���ns�m��}�������[��Cf^��K�Y���/��/�*i��	H��I��ƥ6_H��	��X[e�k���(�=���3���-��g{�Pn�x�ؗ`כ��g�?&}�m��PƱ�O�����Zt�A�UE�s���z��	���~E9�$�d:�7ױ�.�Ϩ�X�G�x��ű�<?��g92
�Wʀ�A�=�����6P���p<9l���$�_n���`p��X��������P]Z����K�rb �q旄>@x��]G��F	�<�9�>?}耩�&�ԥo(9�A�y$��J�W��� ��Q�=����]�9��=j��D��%�1Ax��
5s���)f�>�Oɑ:���7����#�-$���3��I�^�_���qv��1��@�n;�eE���p��f���J��q�q�Ѷ�5�ȏ�W%�+��S���
�-�!dm����nv{�B�w�������r��e7��`0n����+C���5�\Һ�n�D̍ ���K�,�@i�O�W1�v�-3UhK�|��P"�C���G��ʘ|e��OP]6��W����`�~J�k
��0�e*NQ�ǀ����}f�1eG�P��|G�2%���o����\8���g-�$R1ZQ9B��y��+0Vy1H�3ְ�ߏNd4?q��t0R���g��]3�!�13�X�b�Ҿ�C�H���	��C�/H�t�����-3���~�@�;&�7��$�}m�'P�'$�:��g`��7ݝ�� Tu�~�\�0��]yN��H�-��VOa��V�GfR��?VO�?7?��[o��E��P9�;LK�u�
�q0��$�Mj���uqy�����zR��j���Jc��E()l�V���j3m�l{v}?�=��{�Qè/���Ä���4i/�Il,�|d���cKD~e�#�2$��p�a�Z�0�cJΗ�(�u�����������s�7��={]Q�(r�9�G�@Ġ(y��B���O��]�����TQ�#�ơ���4��Yl14h�cI�!��M|���|�VDA�	D���)�Z�&>�D��"I��gY-@�n�tD�� ��,�/%3���3��*�"�%Ue�r�8�h@m~��g�w�2��CG�����PR��s�W&�kOp�9�D?�B�i����bDt�q�fҫ�Vz2�Z����(G��T�Nx���ٙIA�HY��ð�X1�a�Δ�	1F���d=(�g��1�;4y�G���������)zS�q�=�����q�vT��8��Q�r?�H³�)p�C{:rܟJ��$5�m��lx�n��@@��V��ԝ\��D7҃�).��"���Z�ޖBJ���/��������}��Ei6�PV(}�.�"-F4�Y��.u������8��,��      �      x������ � �     