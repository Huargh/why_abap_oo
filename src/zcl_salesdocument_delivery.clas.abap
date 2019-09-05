class ZCL_SALESDOCUMENT_DELIVERY definition
  public
  inheriting from ZCL_SALESDOCUMENT
  create public .

public section.

  methods GET_PREDECESSOR_ITEM
    redefinition .
  methods RETURN_SOLDTO_PARTY
    redefinition .
  methods SEND_MAIL_TO_CUSTOMER
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SALESDOCUMENT_DELIVERY IMPLEMENTATION.


  method GET_PREDECESSOR_ITEM.

  endmethod.


  METHOD return_soldto_party.

    me->get_predecessor_item( EXPORTING ip_vbeln = ip_vbeln
                                        ip_posnr = ip_posnr
                              IMPORTING ep_vbeln_pred = DATA(ld_vbeln) ).
*                                        ep_posnr_pred = DATA(ld_posnr) ).

    SELECT SINGLE kunnr FROM zvbak INTO rv_kunnr
      WHERE vbeln = ld_vbeln.

  ENDMETHOD.


  METHOD send_mail_to_customer.

    super->send_mail_to_customer( ).

    cl_demo_output=>new( )->begin_section( 'Delivery'
                           )->write_text( |Mail to Ship-To Party has been sent|
                           )->display( ).

  ENDMETHOD.
ENDCLASS.
