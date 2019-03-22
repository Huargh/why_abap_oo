*&---------------------------------------------------------------------*
*& Report ZMA_08_ALV_EIGENBAU
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zma_07_oo_salv.

TYPES: BEGIN OF ty_heinz,
         fldate    TYPE	s_date,
         price     TYPE s_price,
         currency  TYPE	s_currcode,
         planetype TYPE  s_planetye,
         seatsmax  TYPE	s_seatsmax,
       END OF ty_heinz.

PARAMETERS p_carrid TYPE s_carr_id.

DATA lt_heinz TYPE TABLE OF ty_heinz.

SELECT * FROM sflight INTO CORRESPONDING FIELDS OF TABLE lt_heinz
    WHERE carrid = p_carrid.



cl_salv_table=>factory( IMPORTING r_salv_table   = DATA(lr_alv)
                        CHANGING  t_table        = lt_heinz ).

DATA(lr_functions) = lr_alv->get_functions( ).
lr_functions->set_all( ).

lr_alv->display( ).
