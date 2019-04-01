class YCL_TWO_EXCEPTION_MODELS definition
  public
  create public .

public section.

  class-methods GET_URL_OLD
    importing
      !IP_CARRID type S_CARR_ID
    returning
      value(RV_URL) type S_CARRURL
    exceptions
      NOT_FOUND
      NO_URL_MAINTAINED .
  class-methods GET_URL_NEW
    importing
      !IP_CARRID type S_CARR_ID
    returning
      value(RV_URL) type S_CARRURL
    raising
      CX_CNV_MBT_PIFD_NO_ENTRY .
protected section.
private section.
ENDCLASS.



CLASS YCL_TWO_EXCEPTION_MODELS IMPLEMENTATION.


  method GET_URL_NEW.
  endmethod.


  method GET_URL_OLD.
  endmethod.
ENDCLASS.
