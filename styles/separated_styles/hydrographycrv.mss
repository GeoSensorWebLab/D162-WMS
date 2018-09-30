// River, Permanent
#hydrographycrv[F_CODE = 'BH140'][OSM_T_WAT != 'drain']{
  [zoom > 11] {
      line-width:3; 
      line-color:#00A0C6;
  }
  [zoom >= 15] {
      line-width:5; 
      line-color:#00A0C6;
  }
  [zoom >= 17] {
      line-width:10; 
      line-color:#00A0C6;
  }
}
//River, Intermittent
#hydrographycrv[F_CODE = 'BH140'][OSM_T_WAT = 'drain'] {
  [zoom > 11] {
      line-width:3;
      line-dasharray: 10, 2.5;
      line-color:#00A0C6;
  }
  [zoom >= 15] {
      line-width:5;
      line-dasharray: 10, 2.5;
      line-color:#00A0C6;
  }
  [zoom >= 17] {
      line-width:10;
      line-dasharray: 10, 2.5;
      line-color:#00A0C6;
  }
}