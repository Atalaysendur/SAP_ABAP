FUNCTION zas_git_009_fm_mlzmeinfo.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IV_MATNR) TYPE  MATNR OPTIONAL
*"  CHANGING
*"     VALUE(IS_MLZMEINFO) TYPE  ZAS_GIT_009_S_MLZMEINFO OPTIONAL
*"     VALUE(IT_MLZMEINFO) TYPE  ZAS_GIT_009_TT_MLZMEINFO2 OPTIONAL
*"     VALUE(IS_MLZMEINFORTRN) TYPE  ZAS_GIT_009_SS_MLZMEINFO3 OPTIONAL
*"----------------------------------------------------------------------

  SELECT SINGLE mara~matnr,
                makt~maktx,
                mara~mtart,
                mara~meins
    FROM mara
    INNER JOIN makt ON makt~matnr EQ mara~matnr
    WHERE mara~matnr EQ @iv_matnr
    INTO @is_mlzmeinfo.

  SELECT mard~werks,
         mard~lgort,
         mard~labst
    FROM mard
    WHERE mard~matnr EQ @iv_matnr
    INTO TABLE @it_mlzmeinfo.

  IF sy-subrc IS NOT INITIAL.
    is_mlzmeinfortrn = VALUE #( resultcode = '1'
                                resultdesc = 'Malzeme Numarasına Ait Bulunamıyor. '
                                resulttype = 'Error' ).
  ELSE.
    is_mlzmeinfortrn = VALUE #( resultcode = '0'
                                resultdesc = 'İşlem Başarılı '
                                resulttype = 'Success' ).
  ENDIF.


ENDFUNCTION.
