// River, Permanent
#hydrographycrv[F_CODE = 'BH140'][OSM_T_WAT != 'drain']{
  [zoom > 11] {
    ::case {
      line-width:1;
      line-color:#00A0C6;      
    }
    ::fill {
      line-width:0.8;
      line-color:#B0E1ED;
    }
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