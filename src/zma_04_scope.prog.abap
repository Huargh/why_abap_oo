*&---------------------------------------------------------------------*
*& Report ZMA_04_SCOPE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zma_04_scope.

DATA gs_scarr TYPE scarr.

PARAMETERS p_carrid TYPE s_carr_id DEFAULT 'LH'.

START-OF-SELECTION.

  SELECT SINGLE * FROM scarr INTO gs_scarr WHERE carrid = p_carrid.


  PERFORM add_stars_to_name CHANGING gs_scarr-carrname.



  cl_demo_output=>new( )->begin_section( 'What is this nonsense'
                       )->write_text( |The details for Carrier { p_carrid } are|
                       )->write_data( gs_scarr
                       )->display( ).



























FORM add_stars_to_name CHANGING cv_carrname TYPE s_carrname.

  cv_carrname = '*' && cv_carrname && '*'.

  gs_scarr-carrid = 'AA'.
  gs_scarr-url = 'Who allowed you to do that???'.

ENDFORM.
