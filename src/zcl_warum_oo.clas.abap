class ZCL_WARUM_OO definition
  public
  final
  create protected .

public section.

  types:
    tty_t005 TYPE TABLE OF t005 .

  class-methods IS_FUNCTION_ACTIVE
    importing
      !IP_CONDITION1 type CHAR4
      !IP_CONDITION2 type CHAR4
      !IS_T005 type T005
    returning
      value(RV_IS_ACTIVE) type XFELD .
  class-methods I_AM_A_PUBLIC_METHOD .
  class-methods RETURN_COUNTRY_LIST
    importing
      !IP_LAND1 type LAND1
    returning
      value(RT_EU_COUNTRIES) type TT_CME_COUNTRY_T005 .
  class-methods GET_COUNTRY_SELECTED
    returning
      value(RV_COUNTRY_SELECTED) type LAND1 .
protected section.
private section.

  class-data SV_COUNTRY_SELECTED type LAND1 .

  class-methods I_AM_A_PRIVATE_METHOD .
ENDCLASS.



CLASS ZCL_WARUM_OO IMPLEMENTATION.


  METHOD get_country_selected.
    rv_country_selected = sv_country_selected.
  ENDMETHOD.


  method IS_FUNCTION_ACTIVE.

    if ip_condition1 = '0001' and ip_condition2 = 'ABCD'.

    endif.
    check is_t005-xegld = abap_true.

    rv_is_active = abap_true.

  endmethod.


  method I_AM_A_PRIVATE_METHOD.
  endmethod.


  METHOD i_am_a_public_method.
    i_am_a_private_method( ).
  ENDMETHOD.


  METHOD return_country_list.

    DATA ld_xegld TYPE xfeld.

*    CHECK methodenaufruf( ip_land1 ) = abap_true.

    SELECT SINGLE xegld FROM t005 INTO ld_xegld
      WHERE land1 = ip_land1.

    SELECT * FROM t005 INTO TABLE rt_eu_countries
      WHERE xegld = ld_xegld.

    sv_country_selected = ip_land1.

  ENDMETHOD.
ENDCLASS.
