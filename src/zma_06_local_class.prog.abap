*&---------------------------------------------------------------------*
*& Report ZMA_06_INSTANCE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zma_06_local_class.
*
CLASS lcl_class DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS get_spfli_entry IMPORTING ip_scarr        TYPE s_carr_id
                                  RETURNING VALUE(rs_spfli) TYPE spfli.

  PRIVATE SECTION.
    DATA ms_spfli TYPE spfli.
    CLASS-DATA ss_spfli TYPE spfli.

ENDCLASS.

CLASS lcl_class IMPLEMENTATION.
  METHOD get_spfli_entry.
    SELECT SINGLE * FROM spfli INTO rs_spfli
      WHERE carrid = ip_scarr.
  ENDMETHOD.

ENDCLASS.


PARAMETERS p_scarr TYPE s_carr_id.

START-OF-SELECTION.

  DATA(ls_scarr) = lcl_class=>get_spfli_entry( p_scarr ).

  IF 1 = 2.

    IF 1 = 1.

    ENDIF.

  ENDIF.
