*&---------------------------------------------------------------------*
*& Report ZMA_03_VISIBILITY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zma_03_visibility.

PARAMETERS p_land TYPE land1 DEFAULT 'AT'.

"In classes, you have visibility levels for both methods as well as attributes. This allows for a more "maintenance-proof" design.

zcl_warum_oo=>i_am_a_public_method( ).
*ZCL_WARUM_OO=>I_AM_A_PRIVATE_METHOD( ).
DATA(lt_t005) = zcl_warum_oo=>return_country_list( p_land ).
if lt_t005 is initial.

endif.

cl_demo_output=>new( )->begin_section( 'Exclamation mark!'
                     )->write_text( |You selected country { zcl_warum_oo=>get_country_selected( ) }|
                     )->display( ).
