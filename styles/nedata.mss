Map {
  background-color: @water-color;
}

@water-color: #aad3df;
@land-color: #f2efe9;

#world {
  polygon-fill: @land-color;
}
#culturesrf [F_CODE = "AL030"][OSM_T_LAN = 'cemetery'][zoom < 20]{
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
  line-width:1;
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

/////////////TransportationCrv
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
  [zoom >= 11] [zoom < 12]{
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


#bridges [RIN_ROI = 3] { 
  [zoom < 5]{
    ::case {
      line-cap:square;
      line-width:0.7;
      line-color:#000000;      
    }
    ::fill {
      line-width:0.5;
      line-color:#ffffff;
      }    
  }
  [zoom >= 5][zoom < 7]{
    ::case {
      line-cap:square;
      line-width:1;
      line-color:#000000;      
    }
    ::fill {
      line-width:0.8;
      line-color:#ffffff;
      }    
  }
  [zoom >= 7][zoom < 8]{
    ::case {
      line-cap:square;
      line-width:1.2;
      line-color:#000000;      
    }
    ::fill {
      line-width:1;
      line-color:#ffffff;
      }    
  }
  [zoom >= 8][zoom <9]{
    ::case {
      line-cap:square;
      line-width:1.6;
      line-color:#000000;      
    }
    ::fill {
      line-width:1.4;
      line-color:#ffffff;
      }    
  }
  [zoom >= 9][zoom <10]{
    ::case {
      line-cap:square;
      line-width:2.1;
      line-color:#000000;      
    }
    ::fill {
      line-width:1.9;
      line-color:#ffffff;
      }    
  } 
  [zoom >= 10][zoom <11]{
    ::case {
      line-cap:square;
      line-width:2.2;
      line-color:#000000;      
    }
    ::fill {
      line-width:2;
      line-color:#ffffff;
      }    
  }
  [zoom >= 11][zoom < 12]{
    ::case {
      line-cap:square;
      line-width:4.8;
      line-color:#000000;      
    }
    ::fill {
      line-width:4.5;
      line-color:#ffffff;
      }    
  }
  [zoom >= 12][zoom <15]{
    ::case {
      line-cap:square;
      line-width:6.5;
      line-color:#000000;      
    }
    ::fill {
      line-width:6.12;
      line-color:#ffffff;
      }    
  }
  [zoom >= 15][zoom <17]{
    ::case {
      line-cap:square;
      line-width:8;
      line-color:#000000;      
    }
    ::fill {
      line-width:7.74;
      line-color:#ffffff;
      }    
  }
  ////////////////////////
  [zoom >= 17][zoom <18]{
    ::background {
    line-offset: 8;
    line-color:#000000;
	line-width: 1;
    marker-file: url('horline_width1.svg');
	marker-transform: rotate(-45,0,0);
	marker-placement: vertex-first;
    marker-offset: 10.5;
    marker-allow-overlap: true;
    ::foreground {
       marker-file: url('horline_width1.svg');
	   marker-transform: rotate(45,0,0);
	   marker-placement: vertex-last;
	   marker-offset: 10.5;
       marker-allow-overlap: true;
    } 	
  }
  ::foreground {
    line-offset: -8; 
    line-color:#000000;
	line-width: 1;
    marker-file: url('horline_width1.svg');
	marker-transform: rotate(-45,0,0);
	marker-placement: vertex-last;
	marker-offset: -10.5;
    marker-allow-overlap: true;
	::background {
       marker-file: url('horline_width1.svg');   
	   marker-transform: rotate(45,0,0);
	   marker-placement: vertex-first;
	   marker-offset: -10.5;
       marker-allow-overlap: true;
    } 	
  }
  }
  ////////////////////////
  [zoom >= 18][zoom <19]{
    ::background {
    line-offset: 10;
    line-color:#000000;
	line-width: 2;
    marker-file: url('horline.svg');
	marker-transform: rotate(-45,0,0);
	marker-placement: vertex-first;
    marker-offset: 12.5;
    marker-allow-overlap: true;
    ::foreground {
       marker-file: url('horline.svg');
	   marker-transform: rotate(45,0,0);
	   marker-placement: vertex-last;
	   marker-offset: 12.5;
       marker-allow-overlap: true;
    } 	
  }
  ::foreground {
    line-offset: -10; 
    line-color:#000000;
	line-width: 2;
    marker-file: url('horline.svg');
	marker-transform: rotate(-45,0,0);
	marker-placement: vertex-last;
	marker-offset: -12.5;
    marker-allow-overlap: true;
	::background {
       marker-file: url('horline.svg');   
	   marker-transform: rotate(45,0,0);
	   marker-placement: vertex-first;
	   marker-offset: -12.5;
       marker-allow-overlap: true;
    } 	
  }
  }
  //////////////////////////////////////
  [zoom >= 19][zoom <= 20]{
    ::background {
    line-offset: 13.5;
    line-color:#000000;
	line-width: 3;
    marker-file: url('horline_width3.svg');
	marker-transform: rotate(-45,0,0);
	marker-placement: vertex-first;
    marker-offset: 17;
    marker-allow-overlap: true;
    ::foreground {
       marker-file: url('horline_width3.svg');
	   marker-transform: rotate(45,0,0);
	   marker-placement: vertex-last;
	   marker-offset: 17;
       marker-allow-overlap: true;
    } 	
  }
  ::foreground {
    line-offset: -13.5; 
    line-color:#000000;
	line-width: 3;
	line-join: miter;
	//line-cap: butt;
    marker-file: url('horline_width3.svg');
	marker-transform: rotate(-45,0,0);
	marker-placement: vertex-last;
	marker-offset: -17;
    marker-allow-overlap: true;
	::background {
       marker-file: url('horline_width3.svg');   
	   marker-transform: rotate(45,0,0);
	   marker-placement: vertex-first;
	   marker-offset: -17;
       marker-allow-overlap: true;
    } 	
  }
  }
 }
 
 //Bridges for secondary roads and streets
 #bridges [RIN_ROI = 4],
 #bridges[RIN_ROI = 5] { 
  [zoom < 12]{
    ::case {
      line-cap:square;
      line-width:1;
      line-color:#000000;      
    }
    ::fill {
      line-width:0.8;
      line-color:#ffffff;
      }    
  }
  [zoom >= 12][zoom <15]{
    ::case {
      line-cap:square;
      line-width:3.2;
      line-color:#000000;      
    }
    ::fill {
      line-width:3;
      line-color:#ffffff;
      }    
  }
  [zoom >= 15][zoom <17]{
    ::case {
      line-cap:square;
      line-width:8.2;
      line-color:#000000;      
    }
    ::fill {
      line-width:8;
      line-color:#ffffff;
      }    
  }
  ////////////////////////
  [zoom >= 17][zoom <18]{
    ::background {
    line-offset: 8;
    line-color:#000000;
	line-width: 1;
    marker-file: url('horline_width1.svg');
	marker-transform: rotate(-45,0,0);
	marker-placement: vertex-first;
    marker-offset: 10.5;
    marker-allow-overlap: true;
    ::foreground {
       marker-file: url('horline_width1.svg');
	   marker-transform: rotate(45,0,0);
	   marker-placement: vertex-last;
	   marker-offset: 10.5;
       marker-allow-overlap: true;
    } 	
  }
  ::foreground {
    line-offset: -8; 
    line-color:#000000;
	line-width: 1;
    marker-file: url('horline_width1.svg');
	marker-transform: rotate(-45,0,0);
	marker-placement: vertex-last;
	marker-offset: -10.5;
    marker-allow-overlap: true;
	::background {
       marker-file: url('horline_width1.svg');   
	   marker-transform: rotate(45,0,0);
	   marker-placement: vertex-first;
	   marker-offset: -10.5;
       marker-allow-overlap: true;
    } 	
  }
  }
  ////////////////////////
  [zoom >= 18][zoom <19]{
    ::background {
    line-offset: 10;
    line-color:#000000;
	line-width: 2;
    marker-file: url('horline.svg');
	marker-transform: rotate(-45,0,0);
	marker-placement: vertex-first;
    marker-offset: 12.5;
    marker-allow-overlap: true;
    ::foreground {
       marker-file: url('horline.svg');
	   marker-transform: rotate(45,0,0);
	   marker-placement: vertex-last;
	   marker-offset: 12.5;
       marker-allow-overlap: true;
    } 	
  }
  ::foreground {
    line-offset: -10; 
    line-color:#000000;
	line-width: 2;
    marker-file: url('horline.svg');
	marker-transform: rotate(-45,0,0);
	marker-placement: vertex-last;
	marker-offset: -12.5;
    marker-allow-overlap: true;
	::background {
       marker-file: url('horline.svg');   
	   marker-transform: rotate(45,0,0);
	   marker-placement: vertex-first;
	   marker-offset: -12.5;
       marker-allow-overlap: true;
    } 	
  }
  }
  //////////////////////////////////////
  [zoom >= 19][zoom <= 20]{
    ::background {
    line-offset: 13.5;
    line-color:#000000;
	line-width: 3;
    marker-file: url('horline_width3.svg');
	marker-transform: rotate(-45,0,0);
	marker-placement: vertex-first;
    marker-offset: 17;
    marker-allow-overlap: true;
    ::foreground {
       marker-file: url('horline_width3.svg');
	   marker-transform: rotate(45,0,0);
	   marker-placement: vertex-last;
	   marker-offset: 17;
       marker-allow-overlap: true;
    } 	
  }
  ::foreground {
    line-offset: -13.5; 
    line-color:#000000;
	line-width: 3;
	line-join: miter;
	//line-cap: butt;
    marker-file: url('horline_width3.svg');
	marker-transform: rotate(-45,0,0);
	marker-placement: vertex-last;
	marker-offset: -17;
    marker-allow-overlap: true;
	::background {
       marker-file: url('horline_width3.svg');   
	   marker-transform: rotate(45,0,0);
	   marker-placement: vertex-first;
	   marker-offset: -17;
       marker-allow-overlap: true;
    } 	
  }
  }
 }
 
 ////// Cart Track
 #transportationgroundcrv [F_CODE = 'AP010']   {
  [zoom >=17][zoom <=20]{
    ::case {
      line-dasharray: 1.0, 0.0; 
      line-width:12;
      line-color:#333333;           
    }
    ::fill {
      ::foreground{
        line-dasharray: 1.0, 0.0; 
        line-width:8;
        line-color:#f7ab32;
      }
      ::backgroung{
        line-dasharray: 18.100, 39.820, 6.033, 13.273; 
        line-width:8;
        line-color:#ffffff;
      }
    }
  }
  [zoom >=12][zoom < 17]{
    ::case {
      line-dasharray: 1.0, 0.0; 
      line-width:6.3;
      line-color:#333333;           
    }
    ::fill {
      ::foreground{
        line-dasharray: 1.0, 0.0; 
        line-width: 4.655;
        line-color:#f7ab32;
      }
      ::backgroung{
        line-dasharray: 10, 22, 3.333, 7.333; 
        line-width:4.655;
        line-color:#ffffff;
      }
    }
  }
  [zoom >=10][zoom < 12]{
    ::case {
      line-dasharray: 1.0, 0.0; 
      line-width: 3;
      line-color:#333333;           
    }
    ::fill {
      ::foreground{
        line-dasharray: 1.0, 0.0; 
        line-width:2.25;
        line-color:#f7ab32;
      }
      ::backgroung{
        line-dasharray: 4.797, 10.577, 1.603, 3.526; 
        line-width: 2.25;
        line-color:#ffffff;
      }
    }
  }
  [zoom >= 7][zoom < 10]{
    ::case {
      line-dasharray: 1.0, 0.0; 
      line-width: 1.5;
      line-color:#333333;           
    }
    ::fill {
      ::foreground{
        line-dasharray: 1.0, 0.0; 
        line-width: 1.14;
        line-color:#f7ab32;
      }
      ::backgroung{
        line-dasharray: 2.415, 5.323, 0.807, 1.774; 
        line-width: 1.14;
        line-color:#ffffff;
      }
    }
  }
  [zoom >= 4][zoom < 7]{
    ::case {
      line-dasharray: 1.0, 0.0; 
      line-width:1.14;
      line-color:#333333;           
    }
    ::fill {
      ::foreground{
        line-dasharray: 1.0, 0.0; 
        line-width: 0.9;
        line-color:#f7ab32;
      }
      ::backgroung{
        line-dasharray: 1.870, 4.124, 0.625, 1.375; 
        line-width: 0.9;
        line-color:#ffffff;
      }
    }
  }
}

///Trail
#transportationgroundcrv [F_CODE = 'AP050']   {
  [zoom >=17][zoom <=20]{
    ::fill {
      ::foreground{
        line-dasharray: 1.0, 0.0; 
        line-width:4.5;
        line-color:#333333;
      }
      ::backgroung{
        line-dasharray: 10, 18, 3, 5; 
        line-width:4.5;
        line-color:#ffffff;
      }
    }
  }
    [zoom >= 12][zoom < 17]{
    ::fill {
      ::foreground{
        line-dasharray: 1.0, 0.0; 
        line-width:2.363;
        line-color:#333333;
      }
      ::backgroung{
        line-dasharray: 5, 9, 1.5, 2.5; 
        line-width: 2.363;
        line-color:#ffffff;
      }
    }
  }
}

///utility power line

#utilityinfrastructurecrv [F_CODE = 'AT005'][OSM_T_POW = 'line']   {
    [zoom >= 11]{
	    line-width:2;
        line-color:#333333;
	}
}

//UtilityIfrastructurePnt
#utilityinfrastructurepnt [F_CODE = 'AT042'][OSM_T_POW = 'tower']   {
    [zoom >= 11] [zoom < 15]{
	    marker-file: url(pylon_wilson.svg);
        marker-width:13;
        marker-height:13;
	}
	[zoom >= 15] [zoom < 20]{
	    marker-file: url(pylon_wilson.svg);
        marker-width:15;
        marker-height:15;
		text-name: 'Pylon';
        text-face-name: 'Open Sans Regular'; 
        text-size: 12;
        text-fill: #000000;
        text-halo-fill: #ffffff;
        text-halo-radius: 1;
        text-allow-overlap:true;
        text-opacity: 1;
        text-dx: 0;
		text-dy: 12;
	}
}

// Vegetation
#vegetationsrf [F_CODE = 'EC015'][OSM_T_LAN = 'forest'] {
  polygon-fill:#C2E4B9;
}

//emergency
#emergency {
  [type = 'reunification']{
    	marker-file: url(civilian-staging-transit.svg);
        marker-width:25;
        marker-height:25;
  }
  [type = 'info_point']{
    	marker-file: url(public-information.svg);
        marker-width:25;
        marker-height:25;
  }
}


#military  {
  [Id = 1] {
    ::background {
      marker-width: 30;
      marker-file: url('0310_Friend.svg');
      marker-allow-overlap: true;
    }
    ::foreground {
      marker-width: 15;
      marker-file: url('10190000_Emergency_Operation.svg');
      marker-allow-overlap: true;
    }
  }
  [Id = 6] {
    ::background {
      marker-width: 30;
      marker-file: url('0510_Suspect_Joker.svg');
      marker-allow-overlap: true;
    }
    ::foreground {
      marker-width: 15;
      marker-file: url('11110400_Organization_or_Group.svg');
      marker-allow-overlap: true;
    }
  }
  [Id = 7] {
    ::background {
      marker-width: 20;
      marker-file: url('0410_Neutral.svg');
      marker-allow-overlap: true;
    }
    ::foreground {
      marker-width: 10;
      marker-file: url('10190000_Emergency_Operation.svg');
      marker-allow-overlap: true;
    }
  }
  [Id = 8] {
    ::background {
      marker-width: 30;
      marker-file: url('0600_Hostile_Faker.svg');
      marker-allow-overlap: true;
    }
    ::foreground {
      marker-width: 15;
      marker-file: url('11110400_Organization_or_Group.svg');
      marker-allow-overlap: true;
    }
  }
  [Id = 2] {
    marker-width: 20;
    marker-file: url('25280201_Antipersonnel_Mine_with_Directional_Effects.svg');
	marker-transform: rotate([Angle]-45,0,0);
    marker-allow-overlap: true;
  }
  [Id = 3] {
    marker-width: 20;
    marker-file: url('25280201_Antipersonnel_Mine_with_Directional_Effects.svg');
	marker-transform: rotate([Angle]-45,0,0);
    marker-allow-overlap: true;
  }
  [Id = 4] {
    marker-width: 20;
    marker-file: url('25280201_Antipersonnel_Mine_with_Directional_Effects.svg');
	marker-transform: rotate([Angle]-45,0,0);
    marker-allow-overlap: true;
  }
}