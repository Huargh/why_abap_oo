*&---------------------------------------------------------------------*
*& Report ZMA_08_CLASS_BASED_EXCEPTIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zma_10_two_exception_models.

DATA lv_url TYPE s_carrurl.

PARAMETERS p_carrid TYPE s_carr_id.

START-OF-SELECTION.

  ycl_two_exception_models=>get_url_old(
    EXPORTING
      ip_carrid           = p_carrid     " Airline Code
    RECEIVING
      rv_url              = lv_url    " Airline URL
    EXCEPTIONS
      not_found           = 1
      no_url_maintained   = 2
      OTHERS              = 3 ).
  IF sy-subrc <> 0.
* MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.


  TRY.
      lv_url = ycl_two_exception_models=>get_url_new( ip_carrid = p_carrid ).
    CATCH cx_bapi_error INTO DATA(gr_exc).
      cl_demo_output=>new( )->begin_section( 'Someting went wrong'
                       )->write_text( gr_exc->get_text( )
                       )->display( ).

  ENDTRY.
