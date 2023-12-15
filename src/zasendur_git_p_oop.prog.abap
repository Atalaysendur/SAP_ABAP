*&---------------------------------------------------------------------*
*& Report ZASENDUR_GIT_P_OOP
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zasendur_git_p_oop.

DATA(lo_class1) = NEW zcl_as_class1( ).
DATA(lo_class1_v2) = NEW zcl_as_class1( ).
DATA(lo_class2) = NEW zcl_as_class2( ).

PARAMETERS p_sayi1 TYPE ZAS_GIT_E_sayi.
PARAMETERS p_sayi2 TYPE ZAS_GIT_E_sayi.
PARAMETERS p_sayi3 TYPE ZAS_GIT_E_sayi.
PARAMETERS p_sayi4 TYPE ZAS_GIT_E_sayi.
DATA: lv_toplam TYPE ZAS_GIT_E_sayi.
DATA: lv_toplam2 TYPE ZAS_GIT_E_sayi.
DATA: lv_kalan2 TYPE ZAS_GIT_E_sayi.
DATA: lv_kalan TYPE ZAS_GIT_E_sayi.
DATA: lv_sonuc TYPE ZAS_GIT_E_sayi.

*BİRİNCİ OBJE
lo_class1->zcl_as_interface1~topla(
  EXPORTING
    sayi1 = p_sayi1                 " Sayı
    sayi2 = p_sayi2                 " Sayı
  IMPORTING
    sonuc = lv_toplam                 " Sayı
).

zcl_as_class1=>zcl_as_interface2~cikarma(
  EXPORTING
    sayi1 = p_sayi1                 " Sayı
    sayi2 = p_sayi2                 " Sayı
  RECEIVING
    sonuc = lv_kalan                 " Sayı
).


*İKİNCİ OBJE
lo_class1_v2->zcl_as_interface1~topla(
  EXPORTING
    sayi1 = p_sayi3                 " Sayı
    sayi2 = p_sayi4                 " Sayı
  IMPORTING
    sonuc = lv_toplam2                 " Sayı
).

zcl_as_class1=>zcl_as_interface2~cikarma(
  EXPORTING
    sayi1 = p_sayi3                 " Sayı
    sayi2 = p_sayi4                 " Sayı
  RECEIVING
    sonuc = lv_kalan2                 " Sayı
).

"İkinci Class 1.Obje
lo_class2->call(
  EXPORTING
    sayi1 = p_sayi1                 " Sayı
    sayi2 = p_sayi2                 " Sayı
  CHANGING
    sonuc = lv_sonuc                 " Sayı
).

WRITE: / 'CLASS 1 OBJ1 Toplam Değişkeni' , lo_class1->zcl_as_interface1~toplam,
       / 'CLASS 1 OBJ1 STATİK KALAN Değişkeni ' , zcl_as_class1=>zcl_as_interface2~kalan,
       / 'CLASS 1 OBJ1 Topla Fonksiyonundan Dönen Sonuç' , lv_toplam,
       / 'CLASS 1 OBJ1 Cikarma Fonksiyonundan Dönen Sonuç ' , lv_kalan,
       / 'CLASS 1 OBJ2 Toplam Değişkeni' , lo_class1_v2->zcl_as_interface1~toplam,
       / 'CLASS 1 OBJ2 STATİK KALAN Değişkeni ' , zcl_as_class1=>zcl_as_interface2~kalan,
       / 'CLASS 1 OBJ2 Topla Fonksiyonundan Dönen Sonuç' , lv_toplam2,
       / 'CLASS 1 OBJ2 Cikarma Fonksiyonundan Dönen Sonuç ' , lv_kalan2,
       / 'CLASS 2 Bölme INHERIT Fonksiyonundan Dönen Sonuç ' , lv_sonuc.
BREAK-POINT.
