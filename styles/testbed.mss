Map {
  background-color: @water-color;
}

@water-color: #aad3df;
@land-color: #f2efe9;

#world {
  polygon-fill: @land-color;
}
#culturesrf [F_CODE = "AL030"][OSM_T_LAN = 'cemetery'][zoom < 20] {
  line-color:#000000;
  line-width:1;
  line-dasharray: 5, 2.5;
  polygon-opacity:1;
  polygon-fill:#FAF5F5;
}
#agriculturesrf [F_CODE = 'EA010'] [OSM_T_LAN = 'farmland'][zoom < 20]{
  line-color:#594;
  line-width:1;
  polygon-opacity:1;
  //filling a polygon
  polygon-fill:#F7EDED;
  polygon-pattern-file: url("Green_AP77_Fill.svg");
}
//lake F_Code=BH082
#hydrographysrf [F_CODE='BH082']::z1 {
  line-color:#00A0C6;
  line-width:0.5;
  polygon-opacity:1;
  polygon-fill:#B0E1ED;
}
//Bridge F_Code=BI020,"Dam"
#hydrographysrf[F_CODE='BI020']::z2 {
  line-color:#333333;
  line-width:2;
  polygon-fill:#555555;
}
// not drain
#hydrographycrv[F_CODE = 'BH140'][OSM_T_WAT != 'drain'] {
  line-width:1; 
  line-color:#00A0C6;
}
//drain
#hydrographycrv[F_CODE = 'BH140'][OSM_T_WAT = 'drain'] {
  line-width:1;
  line-dasharray: 10, 2.5;
  line-color:#00A0C6;
}
#informationpnt[OSM_T_IIN=~'Syria.*'][OSM_T_PLA = 'locality'] {
  text-name: [OSM_T_ENG];
  text-face-name: 'Open Sans Regular','Noto','Hanazono','Unifont','DejaVu'; 
  text-size: 10;
  text-fill: #000000;
  text-halo-fill: #ffffff;
  text-halo-radius: 1;
  text-dx: 0;
  text-dy: -6;
  marker-width:6;
  marker-fill:#f45;
  marker-line-color:#813;
  marker-allow-overlap:true; 
}
#recreationsrf [F_CODE="AK040"]{
  [zoom < 8]{  
     line-color:#3EA250;
     line-width:1;
     polygon-fill:#E8F3E2;
     line-dasharray: 5, 2.5;}
  [zoom > 8] [zoom < 20]{
     line-width:1;  
     line-color:#3EA250;
     line-dasharray: 5, 2.5;	 
     polygon-pattern-file: url("sports_ground_wilson.svg");
	 }
}
#settlementsrf [F_CODE = "AL020"] {
  line-color:#000000;
  line-width:2;
  polygon-opacity:1;
  polygon-fill:#E8C3B2;
}
//StructurePnt/////////////////////////////

#structurepnt[F_CODE = 'AL013'] {
  [zoom < 12]{
      marker-file: url(building.svg);
      marker-width:4;
      marker-height:4; }
  [zoom >= 12][zoom < 20]{
      marker-file: url(building.svg);
      marker-width:3;
      marker-height:3; }
}
#structurepnt[F_CODE = 'AL013'][OSM_T_REL = 'muslim'][OSM_T_AME = 'place_of_worship']  {
  [zoom < 12]{
      marker-file: url(AR_Black_Mosque.svg);
      marker-width:13;
      marker-height:13; }
  [zoom >= 12][zoom < 20]{
      marker-file: url(PT_Black_Mosque.svg);
      marker-width:15;
      marker-height:15; }
}

#structurepnt[F_CODE = 'AL013'][OSM_T_AME = 'college']  {
  [zoom < 12]{
      marker-file: url(PT_Black_School.svg);
      marker-width:13;
      marker-height:13; }
  [zoom >= 12][zoom < 20]{
      marker-file: url(PT_Black_School.svg);
      marker-width:15;
      marker-height:15; }
}

#structurepnt[F_CODE = 'AL013'][OSM_T_AME = 'public_building']  {
   marker-file: url(building.svg);
   marker-width:7;
   marker-height:7;
}
//TransportationCrv
// Primary Road
#transportationgroundcrv [F_CODE = 'AP030'] [RIN_ROI = 3] {
  [zoom >= 19][zoom <= 20] {   
    ::case {
      line-cap:butt;
      line-width:27;
      line-color:#dc2a67;      
    }
    ::fill {
      line-cap:round;
      line-width:22.5;
      line-color:#e892a2;
      }
 }
    [zoom >= 18][zoom < 19] {   
    ::case {
      line-cap:butt;
      line-width:21;
      line-color:#dc2a67;      
    }
    ::fill {
      line-cap:round;
      line-width:17.1;
      line-color:#e892a2;
      }
 }
    [zoom >= 17][zoom < 18] {   
    ::case {
      line-cap:butt;
      line-width:18;
      line-color:#dc2a67;      
    }
    ::fill {
      line-cap:round;
      line-width:14.4;
      line-color:#e892a2;
      }
 }
    [zoom >= 15][zoom < 17] {   
    ::case {
      line-cap:butt;
      line-width:10;
      line-color:#dc2a67;      
    }
    ::fill {
      line-cap:round;
      line-width:7.74;
      line-color:#e892a2;
      }
 }
    [zoom >= 12][zoom < 15] {   
    ::case {
      line-cap:butt;
      line-width:8;
      line-color:#dc2a67;      
    }
    ::fill {
      line-cap:round;
      line-width:6.12;
      line-color:#e892a2;
      }
 }
   [zoom >= 11][zoom < 12] {   
    ::case {
      line-cap:butt;
      line-width:6;
      line-color:#dc2a67;      
    }
    ::fill {
      line-cap:round;
      line-width:4.5;
      line-color:#e892a2;
      }
 }
   [zoom >= 10][zoom < 11] {
    line-cap:round;
    line-width:2;
    line-color:#e892a2;
 }
   [zoom >= 9][zoom < 10] {
    line-cap:round;
    line-width:1.9;
    line-color:#e892a2;
 }
   [zoom >= 8][zoom < 9] {
    line-cap:round;
    line-width:1.4;
    line-color:#e892a2;
 }
   [zoom >= 7][zoom < 8] {
    line-cap:round;
    line-width:1;
    line-color:#e892a2;
 }
   [zoom >= 5][zoom < 7] {
    line-cap:round;
    line-width:0.8;
    line-color:#e892a2;
 }
  [zoom < 5] {
    line-cap:round;
    line-width:0.5;
    line-color:#e892a2;
 }
}
// Secondary Road
#transportationgroundcrv [F_CODE = 'AP030'] [RIN_ROI = 4] {
    [zoom >= 19][zoom <= 20] {   
    ::case {
      line-opacity:0.4;
      line-cap:butt;
      line-width:27;
      line-color:#707d05;      
    }
    ::fill {
      line-opacity:1;
      line-cap:round;
      line-width:25;
      line-color:#e892a2;
      }
 }
  [zoom >= 18][zoom < 19] {   
    ::case {
      line-opacity:0.4;
      line-cap:butt;
      line-width:21;
      line-color:#707d05;      
    }
    ::fill {
      line-opacity:1;
      line-cap:round;
      line-width:19;
      line-color:#e892a2;
      }
 }
  [zoom >= 17][zoom < 18] {   
    ::case {
      line-opacity:0.4;
      line-cap:butt;
      line-width:18;
      line-color:#707d05;      
    }
    ::fill {
      line-opacity:1;
      line-cap:round;
      line-width:16;
      line-color:#e892a2;
      }
 }
     [zoom >= 16][zoom < 17] {   
    ::case {
      line-opacity:0.4;
      line-cap:butt;
      line-width:10;
      line-color:#707d05;      
    }
    ::fill {
      line-opacity:1;
      line-cap:round;
      line-width:8.5;
      line-color:#e892a2;
      }
 }
  [zoom >= 15][zoom < 16] {   
    ::case {
      line-opacity:0.4;
      line-cap:butt;
      line-width:9;
      line-color:#707d05;      
    }
    ::fill {
      line-opacity:1;
      line-cap:round;
      line-width:7.5;
      line-color:#e892a2;
      }
 }
  [zoom >= 12][zoom < 15] {   
    ::case {
      line-opacity:0.4;
      line-cap:butt;
      line-width:5;
      line-color:#707d05;      
    }
    ::fill {
      line-opacity:1;
      line-cap:round;
      line-width:4;
      line-color:#e892a2;
      }
 }
  [zoom >= 11][zoom < 12] {   
    ::case {
      line-opacity:0.4;
      line-cap:butt;
      line-width:0.8;
      line-color:#9eae23;      
    }
    ::fill {
      line-opacity:1;
      line-cap:round;
      line-width:0.8;
      line-color:#e892a2;
      }
 }
[zoom >= 5] [zoom < 11]{
    line-cap:round;
    line-width:0.8;
    line-color:#e892a2;
 }
 }
//Street
#transportationgroundcrv [F_CODE = 'AP030'] [RIN_ROI = 5] {
    [zoom >= 19][zoom <= 20] {   
    ::case {
      line-cap:butt;
      line-width:27;
      line-color:#633f2f;      
    }
    ::fill {
      line-cap:round;
      line-width:25;
      line-color:#edddd6;
      }
 }
    [zoom >= 18][zoom < 19] {   
    ::case {
      line-cap:butt;
      line-width:21;
      line-color:#633f2f;      
    }
    ::fill {
      line-cap:round;
      line-width:19;
      line-color:#edddd6;
      }
 }
    [zoom >= 17][zoom < 18] {   
    ::case {
      line-cap:butt;
      line-width:18;
      line-color:#633f2f;      
    }
    ::fill {
      line-cap:round;
      line-width:16;
      line-color:#edddd6;
      }
 }
  [zoom >= 16][zoom < 17] {   
    ::case {
      line-cap:butt;
      line-width:10;
      line-color:#633f2f;      
    }
    ::fill {
      line-cap:round;
      line-width:8.5;
      line-color:#edddd6;
      }
 }
    [zoom >= 15][zoom < 16] {   
    ::case {
      line-cap:butt;
      line-width:9;
      line-color:#633f2f;      
    }
    ::fill {
      line-cap:round;
      line-width:7.5;
      line-color:#edddd6;
      }
 }
    [zoom >= 13][zoom < 15] {   
    ::case {
      line-cap:butt;
      line-width:4;
      line-color:#633f2f;      
    }
    ::fill {
      line-cap:round;
      line-width:3;
      line-color:#edddd6;
      }
 }
  [zoom >= 12][zoom < 13] {   
    ::case {
      line-cap:butt;
      line-width:2;
      line-color:#633f2f;      
    }
    ::fill {
      line-cap:round;
      line-width:1.2;
      line-color:#edddd6;
      }
 }
  [zoom <= 11] [zoom < 12]{
    ::case {
      line-cap:butt;
      line-width:1;
      line-color:#633f2f;      
    }
    ::fill {
      line-cap:round;
      line-width:0.8;
      line-color:#edddd6;
      }
 }  

  }

#transportationgroundcrv [F_CODE = 'AP030']   {  
  text-name: [OSM_T_ENG];
  text-face-name: 'Open Sans Regular'; 
  text-size: 9;
  text-fill: #000000;
  text-halo-fill: #ffffff;
  text-halo-radius: 2;
  text-allow-overlap:true;
  text-opacity: 1;
  text-placement: line;  
}

#transportationgroundcrv [F_CODE = 'AQ040'] [TRS = 13]   { 
  line-color:#168;
  //or vertext-first

  marker-transform: rotate(90,0,0);
  [F_CODE = 'AQ040']{
  marker-file: url(horline.svg);
  marker-placement: vertex-last;
  }
  [F_CODE = 'AQ040']{
  marker-multi-policy:each;
  marker-file: url(horlinelast.svg);
  marker-placement: vertex-first;
  }
  }
