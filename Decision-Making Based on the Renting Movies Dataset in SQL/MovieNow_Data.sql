PGDMP         6            	    |            MOVIEOWN    12.17    12.17                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            !           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            "           1262    49159    MOVIEOWN    DATABASE     �   CREATE DATABASE "MOVIEOWN" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE "MOVIEOWN";
                postgres    false            �            1259    49168    actors    TABLE     �   CREATE TABLE public.actors (
    actor_id integer NOT NULL,
    name character varying,
    year_of_birth integer,
    nationality character varying,
    gender character varying
);
    DROP TABLE public.actors;
       public         heap    postgres    false            �            1259    49176    actsin    TABLE     k   CREATE TABLE public.actsin (
    actsin_id integer NOT NULL,
    movie_id integer,
    actor_id integer
);
    DROP TABLE public.actsin;
       public         heap    postgres    false            �            1259    49181 	   customers    TABLE     �   CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    name character varying,
    country character varying,
    gender character varying,
    date_of_birth date,
    date_account_start date
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    49160    movies    TABLE     �   CREATE TABLE public.movies (
    movie_id integer NOT NULL,
    title text,
    genre text,
    runtime integer,
    year_of_release integer,
    renting_price numeric
);
    DROP TABLE public.movies;
       public         heap    postgres    false            �            1259    49189    renting    TABLE     �   CREATE TABLE public.renting (
    renting_id integer NOT NULL,
    customer_id integer NOT NULL,
    movie_id integer NOT NULL,
    rating integer,
    date_renting date
);
    DROP TABLE public.renting;
       public         heap    postgres    false                      0    49168    actors 
   TABLE DATA           T   COPY public.actors (actor_id, name, year_of_birth, nationality, gender) FROM stdin;
    public          postgres    false    203   .                 0    49176    actsin 
   TABLE DATA           ?   COPY public.actsin (actsin_id, movie_id, actor_id) FROM stdin;
    public          postgres    false    204   �                 0    49181 	   customers 
   TABLE DATA           j   COPY public.customers (customer_id, name, country, gender, date_of_birth, date_account_start) FROM stdin;
    public          postgres    false    205   ]                  0    49160    movies 
   TABLE DATA           a   COPY public.movies (movie_id, title, genre, runtime, year_of_release, renting_price) FROM stdin;
    public          postgres    false    202   �+                 0    49189    renting 
   TABLE DATA           Z   COPY public.renting (renting_id, customer_id, movie_id, rating, date_renting) FROM stdin;
    public          postgres    false    206   1       �
           2606    49175    actors actors_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (actor_id);
 <   ALTER TABLE ONLY public.actors DROP CONSTRAINT actors_pkey;
       public            postgres    false    203            �
           2606    49180    actsin actsin_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.actsin
    ADD CONSTRAINT actsin_pkey PRIMARY KEY (actsin_id);
 <   ALTER TABLE ONLY public.actsin DROP CONSTRAINT actsin_pkey;
       public            postgres    false    204            �
           2606    49188    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    205            �
           2606    49167    movies movies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movie_id);
 <   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_pkey;
       public            postgres    false    202            �
           2606    49193    renting renting_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.renting
    ADD CONSTRAINT renting_pkey PRIMARY KEY (renting_id);
 >   ALTER TABLE ONLY public.renting DROP CONSTRAINT renting_pkey;
       public            postgres    false    206               [  x�mX�r�8}�|��`
��c�LY
����}����%�a���d�%S�US�>�Z��Ow㐇�Ap:��UF�8������#G^��ßRV�=+Ӝ+����� �蒇�nY"J	�7�,y(�TZ�z��铇2U�ѝ��A*ٜ���)QkWZ` �<	�+�%K�|�TD�*y������GD������}e��^g��ҕ<��R��wOƙ�S�K��!���eax�G#ԕn��lh
'd�J�� S2�H����W�Zs�m�U-AE"[�d]s�-��w���L�9}�L?ǋG�������F^K�1M[8��	�i_�����:ak�$Kܣ)��Չ`��/Y��
�]�Jm���x��}����Ƌ���:�*G:U��T��3�5��v�L��Tt4_t�yi������)��ť(O���M�]��?u�]���Wer*��l�>�sw��*Dڠ��g����/��/6���7L��=ID��풰� ����O}O`_K�iD�)M�����4%���泅�y����@>r?�>���D�M�d��+�t��8iD4BLo�K�\����(]�,x�	��2��-a�� Y�@Of�^Ч���B�,O龹%�NXP]���4��mu6U�"�r��Ov-����0P	�P�Rލa�YN5��� �)݄<��_��I٫kt�cQ0��w�ڨ�8oj�o��̹�d,��K�\<��s�+���� %��"技��L�-�'?�7	�P��
˟� ↢T��J�(�B��FJ�����%�U��_�1���հ��Nh:�#�H���B)nQ
J^�z�CW��J�$�ꯪ�e�k!S�!(�ܵ��	.�q�� i�˛����
���g5R�����$�Tt�d��:@[��J]�-* *�]c|�	!�֍@��V�G��#�Bs�K���C�B������W|��o�}��)c�C~"�6��a|qG�L�� ��U"s�,�6�n��%�4�$��Mh7�<�������u6��A(
���zy�>q���%SV������gv��	�5�E=T����"BqL/F`Yast����W��S�ҴFn���'QЙ�,=��i8�$��Λ
���еFS�U��ѳ����ض�������؇�k6�\��'Ye�94�3�1��US��V�z���&�c�ml�~��EɬuK_5�="p�����}�@!��e��Ǝ��>�{��{�X�!k���C��m�5��Z�58��rؚ1�=s4T8]�9;+!�a�B�,0�xQ]�����B�z�ܲ��s�FM=���u�Z�j����W;ߋ{7�t�˫�⌱�+�H%�����]j�}8D!� i?^e����ow���gy��aO�cO��x�������}��Z�`4�m3��Ƙ��h�n�K��?�ڿ���^��٠"��] :;1�
/��-/���w%���JW��o�ya��g��p2�;D��L�Q���Y)\��\�23b(mK%p�����;�0�USk��Q�i|�N|Ĩ3	�#�H�&~��	v��S_�E��<��o�����b@)�-_оGas�FmY���C5�(pV�m&rq�{~-d� ����pJv�#E�ft���s�F�(��X�4j~a�����2gvXp�Ov��g��휣-
k�=��ߐ���°�8X�4F�D���n�H|��f����ĺ�M��,�^�s�N7@�����N����~�v�l{X� �J"�Hæ?8D6g}��W;k7N,J{T�N�V��؎�
��5(z��<`S�c��(����-��9�~�}�k"F@�ze31���$���ef.�)n�K�d;�tV��{��:�Zm>��~��c,F{�[�3�q��<�3�0�Lq욧,E�c���3��}�E����:���V4h6�=&��jڰ |]����/߫q�a0�C�3��	�x�}�""�5�B�*b�����VU�L��ד��`8�%N@7�B l��aK�/�����אc:7��6g�He��Bd��%��w���l�߿�#m~��wN�u�����Rb�X�
�X���?߿}��?E��         �  x�-�[r�0D�a1SF�����cN�[���زA����a;m���l��X��6.�R��Ӗ��kۯKg�J;a'�<�ű�1�|���i��Z��ū�,��(��v�I���N>�6o�ǰd��1m���� �m�AJT@hl>|����7f�+`��d�
���m�����s���y:�J^�eIv�Y@��:g�@��`;�g8���ወg�>m�y4㭠l���O�g�k6ۤ*d��D�3�26��7I�I:#]�8�$ϳ\iD���G��t���=����s��Y�\��\p����*r��~�#��tȅr.?�����u:�~�Z��[W]���G�����Hn/Lц���[���+��Ƶ���E�񳗲,���% ��d�ŏ�)���T\�����J��<���%��W&�'/>
�'���v��?��H��[r`�^=J9����-��U�S��P��+����`��&T�+����C,��w�;p�C,�t>*����^��, ���NC�!�Ӕ����bT�b�1N�O!6Z���x�]�q���(40������� ����v� ��)哋��v�B�ָhѝ�CJ�.JKc%��y45皖�@�$����ZMԵ����V=�>D��ƚ��)ҏd����������`�z�[��a�4���ʉ#��fn�{��P�'� �C�M�,4��;��`	�S=��	H��M��D2��N�6��~Х����)�apif>�o-����L���SH�8u�L V��t7�04l���S����y�5t���ãNƚ`ɔx�� ����4p'�j�L��y�=����<�l�8�����l'4��1��>-fu0d
���<nP��}S6jĂ\{�긘����� j\7�}L]���1���m��Z���f\j
�D��H������؝5;         "  x�uY�n�H]��v����K?�r�$myҘ�l�RE.�by����n�f3��ec����l��ל[�HI��BG�}��d�/3Y����Qٹ,Kv�T�Ւ�e���S1�KY��l$�����]�R�B�ʮ̬�|Q[T4��P��F"�"v�Z�˦<�����_D��L���R���V��#vґ��v/a7�+"Q��4O�6;S�L7�k�q���A����4�J=A�.�à��K��/R��%���_�b���Ov�H��y9Lֲp�+c�Cۀ2|,�l�G��=�S[��柕*�]P-EHm.�� �`����V�ϧe#��j��{��Z#��'�J6Vו*م*��>���
j������ˊߞ���n��#?���h"��}@_U����5���&���&���&�%���@ﭙ�]L]G!����J��|�~<�Jv<8����O����T�W'��U����'�ܩ�:~Џ����_��HZ����M-(��@�,0nT�OZMe�(���r�vb(�"�.B/���U��]k��!��̑�M�C@Eo���;��.K\K��hT�"*t��Z]�N���νޜȼ d��XU׈�̕-�l�]�Д��#/����kUL߭�ܫ��nI6����Ϙ��rb�6e��Y���Q�ؘ
�v��Zډ*�XOvB�z��ߙ;�C� ��I�C�"�.�Cdl���Z�7����oV5��ݜm}\rve� �S;1��-��7�JF=�}c�TV�ALi��m�!:�'����N��硏�뤤 �c��rI,��Cl[�%k~v����h����c��r4
�5;�̄[Qgk$���
��c|�P��&ý��`j/��]���<{�v�豳��ܙ;�ؓ:�Js�uҞ�"/LQxU���6��1�{�~�v����{aƮ1n�,m���M�j��.�~Ⅰ����2��^��n�d�bED>������4/���n햘��H�����Z�4��K��ݬg���v+��u�Og���-���T�Pi�g0��j�GQ����+�Rw�!2nI��"���]�GY���3ɏ!,rM��0������%� �9ׂ-{1y���O������#�h���;V󢔽_?�k5�/�f��(�ޤ)FB�1r�q֚by�iI��'
�R��X�jɝ60_ �˝{�Ա��+c��犯�a1��UlY��H���x��/���!�K�\���^���IU��)���P�>�-oHSC�(�*m�Х�4��f����r���o�ċ#����%X�l@��S�z1v���l�Y h�=�n� 5�]hSj��J���йvE�݀JiM�����d�krʼgP͓��g���0� ?�I����c�_��aKQ�=g^��Sb!��[S{:��{5J� ��d�v� �Ipє��^QA�d�����jI��I��e9�`�OrjG`��<]3���4����%[S�a�V��^~�u�r=^��]�sӰek�o�%	�K���$�5Xk� E;0�4�S��I�.��[4���;K"�z����w�	I�h:Æ��V���C9�2�r8+B�w�TO�>�_�Ε�U9�z��DACŤFR��JY���6;;��h$�c���l;:3�Ґ}V��șn�8��>����K#=�V������pL���	;R������>�	�
��$DO�Х��(q˙��<)uĳM����CS��9l����pM}�Q�Z�A>����!Y���R����������i�O�K8P��n�sk������}��TNw�<�3z��2�e�#���J}������s�e8[��GSխ-s���@�K C"[�Y~�����̖�#g-�Z��O�a�����m�^U�^c[�l���`����<`��㞣"/K�iq�3�R~��`HX�]�H��X
M����#�	N��<�1韇Ҷ�^��3�Z���ԑ�J��V���
/��{({U�K�����r�ܓ�q�7y��~6��t*���q��ф�2��8��W�-��R�\;9�r�0Z�g�'���'mwm�!{�����#���0U�=��l��:��Xi�)�P}��,�]��~Ad^cY� �0�jr�X�>
u��N���~P�{�[Ț�vĠc���r�gʾ��v���ۯ���i��&�F���3��J�K7��1T�+�6��������7f���2q�ms)(<�L�à���A���i�f����m��[ .����5DF��v���"P�K���e쪩�,ji�� ̛����A��MS��!,h�Tw4@S	,�=�����x��yD��OR����!j�1-�
~.����ȕ�R�����wH\��� ,k��HB^k��V���s�P=ҍ��^T3���^7��,���{_�����\����Y����o����"98�^Z��B.�hKU�_���2�	��&�M#(C8+�jksOC���(��і��i�!W8ҞK,��^u�F/�#��W�Ȣ�ݰ���ٴ����y�O�����AK���$� �J���eP�������a �靿��YѺ?�%��1�^,�{��)-��39�E1 ���[5����g�����\V�X�s"ea`ܽ��~��И(��і~j���СG����O/r !o��X���<XY����7¡הtήt������3��x��,�o��bU�1n=��z����t�]q�>�Z���ԊߜPQKzc L�N�r����}���rv�ϱ��t�:��%x�@T���J��ȹ�s/o�$�apO�������;\         x  x�}VAr�6<C��)>�� )R�M�c�{�%yW��\`S ��hO�C~���4�%�J===�a�A
��^W�rC�W�J5g�TQ�I��8��ϣb��N���*r������Y1JȲB�%NJ��҄$,�Cظ��Q�Z�rM�����űa�y1��J�k�4j�UuK�35�2�!�X�B��^�ZI���]��=�dpOFn��{�U#4�t9�Vu�:�VB�uta��R��2+F��5W{��G!�|��M�c���QäMȒ��"����t.��Ie>��,p�,*��"F�5b���b�4�7,ꍅ|�����phQ���7��j �V;��;E�N��$�EȜ�dr��ˊ;���B��0'Sfl&�d�ض6�~�!��m�
�	��'��ō�5�
��q3 �tV��7�M���Ǧ�7j�{*�|���f�l7\BP�QQ�X�'e*YV��;����`����3���ǩ��)"w�U���ly�����<F;0d�Z������ /��v��~ئz-��%'Sm,/���[��%�ix�r��R/�8����.F�b<)�/�-E�B�(z�T'Z��OSaSb*�1��u��~��;����[�\�N�����dF�ov��2���=Z�B��E�mٞ|���e^��/���S�M�a��c���K���OV�NZ�'��2o�������6SO(��Z���<��$&S�U�5ax��y��|w��Y
�P?��r�ӹ�u�ծ�w|+W���!�^ox������7NI�u��$#K�����K����V����lɲ��eß7w�Ex��{�l})�
r{��_��������P�L{�ʨ-H��vQ_�G�]�6=�C�Sd�E�Kd1�e�����{9؄��&.�|�%���rB���@t��4%d��)�$��Ԃ�ZK�>۔��ҚʁL����3�Ȣ�����-�E��x.sr�V�)�4\=-_�g(|�!'4�Nȴ3Z��?]��(�Z��x�7�y�t�X�c��3���gt"GdY[����!um�������k�����٣��8�AMg|#�Y� ��o��]� � �M��b�A�7U�������Ͽ�+�o��է�K�ߢܭ����W=b�;�8#�������n�wK
;l~p�?�p<"�1A*iHc���y#�6\�ѰC��5~�s�z9���wB|YD.��q�3vק�������D�z2�+-D��y�NY9��9K��_\��{�!��㬏�(Sr٨mI����B��!JA��R�������.�Z���a�k���c���n�����eW�8����ks�Pz�v�0��aA�|G!���=E�����������o\�e��x�L[�=�[�� ��=�vs+zS�=|�X9#�Z������N=��F���B�3            x�e[i�&!����]�	��.1'����E�`j�VKMQN�5�t~<?���Ky���_�?{rzl����T���+��x�>���/��?e>���G��Wq՟\���Iy��S���:��՟j���A�~���i��`}������*�"��d���}`,��Ͼ���ޤm�ry�?u,�p��˸�|��̥�/��S�x�=����M�	���2������_n�<��(�}\�Y���L��!2y��Q�ch�.�i��H��R��+ٶB6�3߻.U�ѝ6���^�J}ni��#����l�����l���e|1m�Nʪ�Կ�N��0�e���dJ�y�<��!�%��+0P*�|�%��Q���x��� ��G�#}|f�)�mIF���L{���~�g�W���?���@����`p�Du��I�Q�*��4����t���K'��}
C��f����(���|_,��w�ޘ��y�z��D�Z�a��S�
V.�A8��t��>�\��T��~��
S?D�A��>܂�x*K���YWh��	E���ShQ�$��U��T�S&���l����x�:)��O�����0��@��>!��7D<�1�|n!�O4��<�
M�^<FB�G�xv,]"��6x��}�]��a�m?�P�]��=: XF��3b������J��w�)�87o����
��p1~�ڎ��]~���;"�N�����!'�Yr9-���67�c��d���_茦!���T�'�PSCLf~9.�~�®�-��5������r�)q��$V:�k��aL�C�vE!PQ�W�����A��Ȅ�̬ �HT�1�����7-��1r޾�}�Ta��R�\~�ٰӪg�8�F�)<�@1�c���Ŀc�`�m?�4J.��)��� ~"��@x�"!c o-\���L��o�rIi��%~T)8�-��e�`!�QJ�5��|&3���� Wv��n��e������M�������L�&+ ��a�Q�*�4�@�M%�#j-/�㾥n�Hc��-��{ȱ׋(B�J��k��YI�r��Dkp'} E	V�9�܏��#@�ȼt����!�fsh��� oe�|P�X�T�G���bb:�SJk�����,�s�b�8�,����|<CX��V�� <�h�+���8�ۢ�g���#�K���H��D ȥ	�(��8��W%�x�!��z�ݗ��x��U�^:��#��s��V�E��]2�%��' �+4����/r��.�(͈��ك?���>_��}�J�W��7ҙT���L�L�X©��P/���*��iU ���NC�����G�6ZD��&3� ���GY�v#
i�-�y71������mj�}��-
Hm��łI�X%ϸxi
�eW��#JȎ�~}��R��Ā�d�m^�!u�"��ܯB:]?(!��Ȉ�����m|D���K<@��r�-�O�2D�ս�=D��s��u�O���8�S�R�� K���O��$zhq�r�`���0�p���Ǌ��|s�)�&�� T0'֭ya�]�1dH�ޮ��_XX�Ի����j�ͬW!���G��DK�eb�Bx���|�H B`<S�0��|g��FȐvB�#�
q���f��'��h�T!��Ż�Z�-	Uf�������QU!�NK��6+p�n>Xwl�S��R�eI��'�WKꗘGM%��7�����}'��+���d2�Է�t�K�)�JF2�3�UB�ǃu����׃����H�c}h�D��ZN�#tR@��M��X^m��b����?�9_Hf�J\�e/�@B+���@��O
�߱����{�X�����W�֑0�>����f(޵"υ���i�5�sS��o0
\�ݴ���~ �z�n�W��P��dzj=�����x��h`<��)�M	�L�J<��u�Vq/r�(Q.X�}+�M��8�;��.Y����U�/4 �ZZBO���AO��vV	�R��1����,���Vfh����U�4&c�Hu[��<6���ΐ�VO$3�V�v(�	ަ�+������F�����E�t��A<�ǟ�k���� ;��>����>�zSU���M��*��T8�`�SuFhB�y6k�n�2Ţ�(���
<��]��}Х>b�s��~�NR%,���BD���(�����.��ra�/9���5�`��5��?�4u5���cf~)
ܳ%�ǏM����Ak��_���j�E��s��!2!n�l-!��c.��U�^�0ͬ^V,�Nc
y���*O��C���R@ ��ˊ�y]�q�쳧U`XW�ޮV/�(_
)����~��զ��ƦQҗ�h��i5aBZgg��߾�5Z�rH������9c�Bk����8Be���;.x防yϗ����V���N��Q:��s�*�΢�Y��A�N�k!t�|3$�~�o��"0��q,��aT%��~�Tz�5B;�v�j�1���3�U��Vo����>������"|�N"g�|��2���fq}�7�|�A�|�N�C����(iհW#Y����O�?yU�gz��pɚJ��pNcL�:3�R�r�K��V�"S�y��F��b!pjO>n �Q�
X�������)Z6y�$SJ�rµ���	=��I���w��h�dkV�jE����1��Y�ٶ���X��|�H��d����S��1(�a��'��P��N���bO�/*j񴹕�l��BQ�4V���'r&��u!�RV�%%�RT���"������M~2���G;�����
./-d�n�
�ל��i�U|5����Q��l��|��k��/(U���J��Id�=����\�.�ٟ�r��P�6p�ٍ����U�l��(`�۝�O�qp]ݵí�8;?#���S]܈�y��S��BݐBԴ�
BN ���yE�(��9��+�}��ղ�쩽���bMgC�h%|Vc�&!�<d3�2e�1Y�k�+��Œ>*n*:ƽ5�+u��X�'��#�6OkרQC�B�D;����L�`�F���#���[��inQ���,P^ȸ�^<��g�����݆z�y���8�K�/b����/l7%���e��`{���!8�'���1V��v��~eB˶�H�54)�\ع��6B�Y��%4p'�[ZX9�ס����$Os�25�#�=�8N�����s'��;�vt�����r�<��ɟ�<�6رd|ҥȳ0)W{��C\-a�S9�G�����6[s���n�S���m@yZ�@��T$xZ@xD5�yZٵ����꾗��YM���s��Ք�]`P��wpx�pd'fbK-BA���{5{k<��ϗ�q%�{ٌ�I���s�&�yP���-��m8��W"q�n$%�8��@���׵�o�ʹL��#����<v�H\S̞��DsS3��p!���.W�G���b5�*5n��Z)�M��6��Q��a^k�(֐$2���RF�O��ù�N�i� �3R��J^Uq4|��b�����/���7E}�zB� �3Q����2�l��*�F9�-G��Ă��#���vc�h���5���`��c돣��?�չ�4.H�n�#������WY+�n`Ƨ�Ln�n��hܮ��!�7^wh�0 ŴFS`0�M���޳�2�`^d��.F5�����\Nt�jk/.�'�O}����z����oXU�|`h�1���Y�n`	��ť�?��5x];P��p�.ꆤ���Ng�ۤH�	y���W
;[N�,V.�C��닛<�$��gF��,9��{��	o��om�)Ks�o��@�����X	A*�iZK&��}Ʊ��\㨡 �f��=�t���΅&��h	]!���Y��P vv՝q��.��ō@�A�kw�Q˴/x��Cp-���Ckw� 6�8�N\�ӎ��jj�Pp��aŉ�}�:4���{A''t�'W/���CEf��H��>b�.���t��֌���j��f���a�Wsƞ��,2��#K�4�;V͹�5g2�x���r����.����	�=\'��P�9 EmSj�]CE�q_z�'R�O�D k  O5��Y��R �O��5�h�`��l}�������u��5'���r���_���kM:l�
�լ�zl��&�Y�o�r�f��Xwƨ��i;�)�{���V۶�BW5���g3�ӿ+H $�k������L2B��c�6.-��yM`c;C;%��=�Z�OUω��:.��)]�5>ɨ�ݛ
_������ڢ��v�0�{���z�;�T���".%��v�̏N��S9j+��w4y� �+P�/�-D[�gX�^
$�1�ja�@��ܳ~j��pu�W����)�cHE�N�X��x��\b[���`]
�S-��J��@��+�����% �����'!��O�������Ĩ�6�����6��kO���Z�)�HL��S��-�ܪJ6���.�l�+2�o��Q�Ac_[��ה�N�`�j��3Է4�ղ�<�+�\K ��<&�G()��p�_:�ժʨq�Җ7̈́|����;��
A>�K���,�����v���Fu���.�ԥ�z��v���+���Q\C����\a�T�.m _�N[��6�]���T�{zI�D�҄]_%7��'_�Gd�3��fh��k�rJ�];���Ҵ)U����Zȃ���~���FI��     