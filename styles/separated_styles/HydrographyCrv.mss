// River, Permanent
#hydrographycrv[F_CODE = 'BH140'][OSM_T_WAT != 'drain']{
  [zoom > 11] {
      line-width:1; 
      line-color:#00A0C6;
  }
}
//River, Intermittent
#hydrographycrv[F_CODE = 'BH140'][OSM_T_WAT = 'drain'] {
  [zoom > 11] {
      line-width:1;
      line-dasharray: 10, 2.5;
      line-color:#00A0C6;
  }
}