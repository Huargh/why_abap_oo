class ZCL_SALESDOCUMENT definition
  public
  create public .

public section.

  methods RETURN_SOLDTO_PARTY
    importing
      !IP_VBELN type VBELN
      !IP_POSNR type POSNR optional
    returning
      value(RV_KUNNR) type KUNNR .
  methods GET_PREDECESSOR_ITEM
    importing
      !IP_VBELN type VBELN
      !IP_POSNR type POSNR
    exporting
      !EP_VBELN_PRED type VBELN
      !EP_POSNR_PRED type POSNR .
  methods SEND_MAIL_TO_CUSTOMER .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SALESDOCUMENT IMPLEMENTATION.


  method GET_PREDECESSOR_ITEM.
  endmethod.


  METHOD return_soldto_party.

    SELECT SINGLE kunnr FROM zvbak INTO rv_kunnr
      WHERE vbeln = ip_vbeln.

  ENDMETHOD.


  method SEND_MAIL_TO_CUSTOMER.
  endmethod.
ENDCLASS.
