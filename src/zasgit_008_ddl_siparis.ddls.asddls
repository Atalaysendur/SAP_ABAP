@AbapCatalog.sqlViewName: 'ZASGIT008CDSSPRS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Siparis CDS View'
define view ZASGIT_008_DDL_SIPARIS as select from vbap
{
   vbeln,
   matnr,
   sum(vbap.netwr) as toplam_netwr,
   sum(vbap.kwmeng) as toplam_kwmeng
}
group by
vbeln,matnr
