*&---------------------------------------------------------------------*
*& Report ZMA_08_CLASS_BASED_EXCEPTIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zma_08_two_exception_models.

PARAMETERS p_carrid TYPE s_carr_id.

START-OF-SELECTION.

*ycl_two_exception_models=>get_url_old(
*  EXPORTING
*    ip_carrid           =     " Airline Code
**  RECEIVING
**    rv_url              =     " Airline URL
**  EXCEPTIONS
**    not_found           = 1
**    no_url_maintained = 2
**    others              = 3
*).
*IF sy-subrc <> 0.
** MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
**            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*ENDIF
*





*ycl_two_exception_models=>get_url_new( ip_carrid =  ).
**  CATCH cx_cnv_mbt_pifd_no_entry.    "
