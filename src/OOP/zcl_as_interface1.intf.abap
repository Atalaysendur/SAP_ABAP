interface ZCL_AS_INTERFACE1
  public .


  data TOPLAM type ZAS_GIT_E_SAYI .

  methods TOPLA
    importing
      value(SAYI1) type ZAS_GIT_E_SAYI
      value(SAYI2) type ZAS_GIT_E_SAYI
    exporting
      !SONUC type ZAS_GIT_E_SAYI .
endinterface.
