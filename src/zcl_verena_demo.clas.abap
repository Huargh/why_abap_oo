CLASS zcl_verena_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA st_instances TYPE TABLE OF spfli.
    CLASS-METHODS do_something.

    METHODS do_another_thing IMPORTING ip_value TYPE char5.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_verena_demo IMPLEMENTATION.
  METHOD do_another_thing.
    IF ip_value = 'ABCDE'.

    ENDIF.
  ENDMETHOD.

  METHOD do_something.

  ENDMETHOD.

ENDCLASS.
