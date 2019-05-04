*&---------------------------------------------------------------------*
*& Report ZMA_09_CLASS_BASED_EXCEPTIONS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zma_11_class_based_exceptions.

PARAMETERS rb_stati RADIOBUTTON GROUP exc DEFAULT 'X'.
PARAMETERS rb_dynam RADIOBUTTON GROUP exc.
PARAMETERS rb_noche RADIOBUTTON GROUP exc.

START-OF-SELECTION.

  CASE abap_true.
    WHEN rb_stati.
      PERFORM something_static..
    WHEN rb_dynam.
      PERFORM something_dynamic.
    WHEN rb_noche.
      PERFORM something_nocheck USING 'HOWL' '0000000001'.
  ENDCASE.

  "Difference between the three class-based exception types
  " - STATIC_CHECK
  " - DYNAMIC_CHECK
  " - NO_CHECK

  " 1. Static Check:
  " - Used for local or nearby error handling
  " - RAISE of this exception type has to be caught locally or declared in the signature
FORM something_static RAISING zcx_static_check.

  IF 1 = 2.
    RAISE EXCEPTION TYPE zcx_static_check.
  ENDIF.

  TRY.
      "do something
      IF 1 = 2. "in case, something goes wrong
        RAISE EXCEPTION TYPE zcx_static_check.
      ENDIF.
    CATCH zcx_static_check.
      "Here, we handle the error locally, i.e. close to where the exception was thrown.
      "For example we reset the data to a consistent state or do some default logic
  ENDTRY.


ENDFORM.


" 2. Dynamic Check:
" - Used for local or nearby error handling
" - Similar to CX_STATIC_CHECK but the syntax check does not warn you, if you don't handle the exception accordingly
" - If you prefer designtime over runtime errors, don't use this exception type
FORM something_dynamic. "<-- no raising zcx_dynamic_check

  IF 1 = 2.
    RAISE EXCEPTION TYPE zcx_dynamic_check. "<-- in AiE, try switching this to zcx_static_check: Gives warn message
  ENDIF.

  TRY.
      "do something
      IF 1 = 2. "in case, something goes wrong
        RAISE EXCEPTION TYPE zcx_dynamic_check.
      ENDIF.
    CATCH zcx_static_check.
      "this will not execute, see the CATCH statement
  ENDTRY.

ENDFORM.


" 3. No Check:
" - Used for remote handling: The exception wanders up the stack until it finds an appropriate handler or results in a runtime error
" - No syntax checks/warning messages, if you don't specify a handler nearby
" - Can be used, if you
" a. trigger a specific exception type deep down in the stack or along a lengthy process
" b. are sure that there is a handler somewhere above
" c. handling makes little or no difference to where it has been raised (example zcx_user_cancelled --> CATCH do_rollback)

FORM something_nocheck USING id_ucomm TYPE sy-ucomm
                             ip_monster_key TYPE char10.
  DATA mo_chosen_monster TYPE REF TO zcl_attf_monster.

  TRY.
      PERFORM get_chosen_monster USING ip_monster_key
                                 CHANGING mo_chosen_monster.

      PERFORM lock_monster USING mo_chosen_monster.

      CASE id_ucomm.
        WHEN 'HOWL'.
          mo_chosen_monster->howl_at_moon( ).
        WHEN 'TERROR'.
          mo_chosen_monster->terrorise_village( ).
        WHEN 'SUBPRIME'.
          mo_chosen_monster->sell_mortgages( ).
        WHEN OTHERS.
          MESSAGE 'Function is not available' TYPE 'I'.
      ENDCASE.

    CATCH zcx_bc_user_cancelled.
      MESSAGE 'Processing Cancelled' TYPE 'S'.
      PERFORM unlock_monster USING mo_chosen_monster.
      RETURN.
  ENDTRY.


ENDFORM.


FORM get_chosen_monster USING ip_monster_key TYPE char10
                       CHANGING co_monster TYPE REF TO zcl_attf_monster.
ENDFORM.

FORM lock_monster USING is_monster TYPE REF TO zcl_attf_monster.
ENDFORM.

FORM unlock_monster USING is_monster TYPE REF TO zcl_attf_monster..
ENDFORM.
