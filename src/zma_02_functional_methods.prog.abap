*&---------------------------------------------------------------------*
*& Report ZMA_02_FUNCTIONAL_METHODS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zma_02_functional_methods.

"Functional Methods are methods which have exactly 1 RETURNING (RECEIVING) parameter --> EXPORTING & RETURNING is not the same!
*sh. ZCL_WARUM_OO=>IS_FUNCTION_ACTIVE
PARAMETERS p_land TYPE land1 DEFAULT 'AT'.


*if zcl_warum_oo=>is_in_validity_period( ld_vbeln_vf ) = abap_true.

*endif.


*DATA lt_t005 TYPE zcl_warum_oo=>tty_t005.
DATA ld_land1 TYPE land1.

DATA(lt_t005) = zcl_warum_oo=>return_country_list( p_land ).
*ld_land1 = zcl_warum_oo=>return_country_list( p_land ).

LOOP AT lt_t005 INTO DATA(ls_t005).
  IF ls_t005-xegld = abap_true.

  ENDIF.
ENDLOOP.



IF 1 = 2.

ENDIF.

IF ls_t005-xegld = abap_true.

ENDIF.

LOOP AT lt_t005 INTO ls_t005.
  IF ls_t005-xegld = abap_true.

  ENDIF.
ENDLOOP.
