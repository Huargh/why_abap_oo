*&---------------------------------------------------------------------*
*& Report ZMA_08_INHERITANCE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zma_08_inheritance.

DATA(lr_salesorder) = NEW zcl_salesdocument_salesorder( ).
DATA(lr_delivery) = NEW zcl_salesdocument_delivery( ).

lr_salesorder->send_mail_to_customer( ).
lr_delivery->send_mail_to_customer( ).
