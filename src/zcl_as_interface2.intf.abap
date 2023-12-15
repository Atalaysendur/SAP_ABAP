interface ZCL_AS_INTERFACE2
  public .


  class-data KALAN type ZAS_GIT_E_SAYI .

  class-methods CIKARMA
    importing
      !SAYI1 type ZAS_GIT_E_SAYI
      !SAYI2 type ZAS_GIT_E_SAYI
    returning
      value(SONUC) type ZAS_GIT_E_SAYI .
endinterface.
