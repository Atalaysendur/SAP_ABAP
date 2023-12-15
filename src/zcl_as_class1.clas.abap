class ZCL_AS_CLASS1 definition
  public
  create public .

public section.

  interfaces ZCL_AS_INTERFACE1 .
  interfaces ZCL_AS_INTERFACE2 .
protected section.

  methods BOLME
    importing
      !SAYI1 type ZAS_GIT_E_SAYI
      !SAYI2 type ZAS_GIT_E_SAYI
    changing
      !SONUC type ZAS_GIT_E_SAYI
    raising
      ZCX_MY_EXCEPTION .
private section.
ENDCLASS.



CLASS ZCL_AS_CLASS1 IMPLEMENTATION.


  METHOD bolme.
    DATA l_exc TYPE REF TO zcx_my_exception.


    TRY.
        sonuc =    sayi1 / sayi2.
*        RAISE EXCEPTION TYPE zcx_my_exception
*          EXPORTING
*            textid = zcx_my_exception=>not_divided_zero
**           previous =
**           msgv1  =
*        .
*      CATCH zcx_my_exception INTO l_exc.
        CATCH cx_sy_zerodivide.

*      message l_exc type 'E'.
MESSAGE 'sayı1 ve sayi 2 Sıfıra bölünemez.' TYPE 'I' DISPLAY LIKE 'E'.
    ENDTRY.
  ENDMETHOD.


  method ZCL_AS_INTERFACE1~TOPLA.
    sonuc = sayi1 + sayi2.
        zcl_as_interface1~toplam = sonuc.
  endmethod.


  METHOD zcl_as_interface2~cikarma.
    sonuc = sayi1 - sayi2.
    zcl_as_interface2~kalan = sonuc.
  ENDMETHOD.
ENDCLASS.
