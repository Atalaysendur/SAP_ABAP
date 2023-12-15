class ZCL_AS_CLASS2 definition
  public
  inheriting from ZCL_AS_CLASS1
  final
  create public .

public section.

  methods CALL
    importing
      !SAYI1 type ZAS_GIT_E_SAYI
      !SAYI2 type ZAS_GIT_E_SAYI
    changing
      !SONUC type ZAS_GIT_E_SAYI .
protected section.

  methods BOLME
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_AS_CLASS2 IMPLEMENTATION.


  METHOD bolme.

    DATA l_exc TYPE REF TO zcx_my_exception.

*    DATA: lv_SONUC TYPE ZAS_GIT_E_SAYI.
*    lv_sonuc = sayi1 + sayi2.

    TRY.
        CALL METHOD super->bolme
          EXPORTING
            sayi1 = sayi1
            sayi2 = sayi2
          CHANGING
            sonuc = sonuc.

*        RAISE EXCEPTION TYPE zcx_my_exception
*          EXPORTING
*            textid = zcx_my_exception=>not_divided_zero
**           previous =
**           msgv1  =
*          .
      CATCH zcx_my_exception INTO l_exc.
        MESSAGE l_exc TYPE 'E'.
    ENDTRY.
  ENDMETHOD.


  method CALL.
TRY.

bolme(
  EXPORTING
    sayi1 = sayi1                 " Sayı
    sayi2 = sayi2                 " Sayı
  CHANGING
    sonuc = sonuc                 " Sayı
).
CATCH zcx_my_exception. " Generic Exception class

ENDTRY.
  endmethod.
ENDCLASS.
