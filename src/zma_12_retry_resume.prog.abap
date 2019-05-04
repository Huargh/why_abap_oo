*&---------------------------------------------------------------------*
*& Report zma_12_retry_resume
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zma_12_retry_resume.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RETRY restarts the program flow at the beginning of the TRY-block, with the hope that the problem is resolved
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
DATA ld_spras TYPE spras.
DATA ld_second_try TYPE xfeld.

CLASS lcl_class DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS return_mealtext IMPORTING ip_spras       TYPE spras
                                  RETURNING VALUE(rv_text) TYPE s_mealtext
                                  RAISING   cx_iuuc_entry_not_found.
ENDCLASS.

ld_spras = sy-langu. "replace with 'Y', to see the effect of the exception

TRY.
    DATA(ld_text) = lcl_class=>return_mealtext( ld_spras ).

  CATCH cx_iuuc_entry_not_found INTO DATA(lr_exc).
    cl_demo_output=>new( )->begin_section( 'Error getting your meal'
                       )->write_text( |{ lr_exc->get_longtext( ) }|
                       )->display( ).
    ld_spras = 'E'. "Default Language
    RETRY.
ENDTRY.
cl_demo_output=>new( )->begin_section( 'The dish of the day is:'
                   )->write_text( |{ ld_text }|
                   )->display( ).


"BUT: When there is no entry with ld_spras = 'E' as well for some reason, we run into an endless loop. Therefore, it'd be better to use a helper flag
TRY.
    DATA(ld_text2) = lcl_class=>return_mealtext( ld_spras ).

  CATCH cx_iuuc_entry_not_found INTO DATA(lr_exc2).
    IF ld_second_try = abap_true.
      cl_demo_output=>new( )->begin_section( 'Error getting your meal'
                         )->write_text( |{ lr_exc->get_longtext( ) }|
                         )->display( ).
      ld_spras = 'E'. "Default Language
      ld_second_try = abap_true.
      RETRY.
    ELSE.
      cl_demo_output=>new( )->begin_section( 'Out of food'
                       )->write_text( |No food for you today. Sorry.|
                       )->display( ).
    ENDIF.
ENDTRY.


"Bonus question: What happens, if we remove the exception class from the signature of RETURN_MEALTEXT and why?





CLASS lcl_class IMPLEMENTATION.
  METHOD return_mealtext.
    SELECT SINGLE text FROM smealt INTO rv_text
    WHERE sprache = ip_spras.
    CHECK sy-subrc <> 0.
    RAISE EXCEPTION TYPE cx_iuuc_entry_not_found.
  ENDMETHOD.
ENDCLASS.
