class ZCL_SALESDOCUMENT_SALESORDER definition
  public
  inheriting from ZCL_SALESDOCUMENT
  create public .

public section.

  methods SEND_MAIL_TO_CUSTOMER
    redefinition .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SALESDOCUMENT_SALESORDER IMPLEMENTATION.


  METHOD send_mail_to_customer.

    super->send_mail_to_customer( ).

    cl_demo_output=>new( )->begin_section( 'Sales Order'
                       )->write_text( |Mail to Sold-To Party has been sent|
                       )->display( ).

  ENDMETHOD.
ENDCLASS.
