*&---------------------------------------------------------------------*
*& Report ZMA_01_DESIGNTIME_RUNTIME
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zma_01_designtime_runtime.

"Unterschied Designtime vs. Runtime Error:
"Designtime Error: Ist zum Zeitpunkt des Kompilierens evident, d.h. auf dem DEV:
"Runtime Error: ist zum Zeitpunkt des Ausführens evident, d.h. entweder auf dem DEV beim Unit-Test, auf dem QAS beim Integrationstest oder erst auf PROD

PARAMETERS p_funct TYPE xfeld RADIOBUTTON GROUP rb.
PARAMETERS p_class TYPE xfeld RADIOBUTTON GROUP rb DEFAULT 'X'.

START-OF-SELECTION.
  IF p_funct = abap_true.
    CALL FUNCTION 'ZMA_GIBTS_NED'.
  ELSE.
*    zcl_gibts_ned=>gibts_ned( ).
  ENDIF.

  "Same holds true for parameters:
  " If a method-parameter is supplied incorrectly, we'll discover that during Syntax Check.
  " For a FM, we learn this only at runtime
  DATA ld_carrier TYPE s_carr_id VALUE 'LH'.
  DATA lt_plane_list TYPE TABLE OF scarplan.
  CALL FUNCTION 'FPM_DEMO_FLIGHT_GET_PLANE'
    EXPORTING
      carrier    = ld_carrier
    IMPORTING
      plane_list = lt_plane_list.

  DATA ld_wrong_type TYPE s_planetye VALUE 'LH'.
  CALL FUNCTION 'FPM_DEMO_FLIGHT_GET_PLANE'
    EXPORTING
      carrier    = ld_wrong_type
    IMPORTING
      plane_list = lt_plane_list.

*  "Same situation but with a static method
*  DATA lt_spfli TYPE spfli_tab.
*  CALL METHOD cl_demo_spfli=>get_spfli
*    EXPORTING
*      carrid = ld_carrier
*    RECEIVING
*      spfli  = lt_spfli.

*  CALL METHOD cl_demo_spfli=>get_spfli
*    EXPORTING
*      carrid = ld_wrong_type
*    RECEIVING
*      spfli  = lt_spfli.

if 1 = 2.

endif.
