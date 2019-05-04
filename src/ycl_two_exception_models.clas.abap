CLASS ycl_two_exception_models DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS get_url_old
      IMPORTING
        !ip_carrid    TYPE s_carr_id
      RETURNING
        VALUE(rv_url) TYPE s_carrurl
      EXCEPTIONS
        not_found
        no_url_maintained .
    CLASS-METHODS get_url_new
      IMPORTING
        !ip_carrid    TYPE s_carr_id
      RETURNING
        VALUE(rv_url) TYPE s_carrurl
      RAISING
        cx_bapi_error.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_two_exception_models IMPLEMENTATION.


  METHOD get_url_old.

    SELECT SINGLE url FROM scarr INTO rv_url
        WHERE carrid = ip_carrid.
    IF sy-subrc <> 0.
      RAISE not_found.
    ELSEIF rv_url IS INITIAL.
      RAISE no_url_maintained.
    ENDIF.

  ENDMETHOD.

  METHOD get_url_new.

    SELECT SINGLE url FROM scarr INTO rv_url
        WHERE carrid = ip_carrid.
    IF rv_url IS INITIAL.
      RAISE EXCEPTION TYPE cx_bapi_error
        EXPORTING
          t100_msgid = '/SAPDMC/LSMW'
          t100_msgno = '004'
          t100_msgv1 = CONV #( ip_carrid )
          t100_msgv2 = 'SCARR'.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
