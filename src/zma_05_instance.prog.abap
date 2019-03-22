*&---------------------------------------------------------------------*
*& Report ZMA_05_INSTANCE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zma_05_instance.

DATA gd_input TYPE string VALUE '491#SU#Aeroflot Russian Airlines#RUB#https://www.aeroflot.ru'.
DATA rs_response TYPE string.

***********************************************************************
* Instantiation the old way
DATA gr_aero TYPE REF TO zcl_scarr_create.
DATA gr_hansa TYPE REF TO zcl_scarr_create.

*CREATE OBJECT gr_aero
*  EXPORTING
*    ip_string    = gd_input
*    ip_separator = '#'.
*
*gr_aero->create_scarr_record( ).
*
*IF 1 = 2.
*
*ENDIF.

********************************************************************
* Instantiation with the NEW Constructor
TRY.
    DATA(gr_carrier) = NEW zcl_scarr_create( ip_string = gd_input
                                             ip_separator = '#' ).

    gr_carrier->create_scarr_record( ).
  CATCH zcx_bc_user_cancelled INTO DATA(go_exc).
    "Send message back:
    rs_response = go_exc->get_text( ).
ENDTRY.
