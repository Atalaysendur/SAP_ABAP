*&---------------------------------------------------------------------*
*& Report ZASGIT_001_P_ABAPNWSYNTAX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zasgit_001_p_abapnwsyntax.

TYPES :BEGIN OF ty_first,
         werks  TYPE werks_d,
         arbpl  TYPE arbpl,
         toplam TYPE menge_d,
         meins  TYPE meins,
         islem  TYPE int8,
       END OF ty_first.
TYPES : tt_first TYPE TABLE OF ty_first WITH EMPTY KEY.

DATA(lt_first) = VALUE tt_first( ( werks = '2013' arbpl = '07' toplam = '16' meins = '' )
                                 ( werks = '2013' arbpl = '07' toplam = '32' meins = '' )
                                 ( werks = '2015' arbpl = '09' toplam = '07' meins = ' ') ).

DATA(lt_first_grp) = VALUE tt_first( FOR GROUPS grp OF <fs> IN lt_first GROUP BY ( werks = <fs>-werks arbpl = <fs>-arbpl )
                  LET lv_meins = 'ADT'
                      lv_carp1 = 3
                      lv_carp2 = 5
                  IN (  werks = grp-werks
                        arbpl = grp-arbpl
                        meins = lv_meins
                        toplam = REDUCE #( INIT i TYPE menge_d
                                           FOR ls IN GROUP grp
                                           NEXT i += ls-toplam )
                       islem = lv_carp1 * lv_carp2  ) ).

cl_demo_output=>display( lt_first_grp ).
