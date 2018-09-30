// River, Permanent
#hydrographycrv[F_CODE = 'BH140'][OSM_T_WAT != 'drain']{
  [zoom > 11] {
    ::case {
      line-width:3;
      line-color:#00A0C6;      
    }
    ::fill {
      line-width:2.5;
      line-color:#B0E1ED;
    }
  }
  [zoom >= 15] {
    ::case {
      line-width:5;
      line-color:#00A0C6;      
    }
    ::fill {
      line-width:4;
      line-color:#B0E1ED;
    }
  }
  [zoom >= 17] {
    ::case {
      line-width:10;
      line-color:#00A0C6;      
    }
    ::fill {
      line-width:8;
      line-color:#B0E1ED;
    }
  }
}
//River, Intermittent
#hydrographycrv[F_CODE = 'BH140'][OSM_T_WAT = 'drain'] {
  [zoom > 11] {
      line-width:3;
      line-dasharray: 10, 2.5;
      line-color:#00A0C6;
  }
  [zoom > 11] {
      line-width:5;
      line-dasharray: 10, 2.5;
      line-color:#00A0C6;
  }
  [zoom > 11] {
      line-width:10;
      line-dasharray: 10, 2.5;
      line-color:#00A0C6;
  }
}