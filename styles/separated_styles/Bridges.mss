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
  [zoom >= 17][zoom <= 18]{
    ::background {
       line-offset: 8;
       line-color:#000000;
	   line-width: 2;
    }
    ::foreground {
       line-offset: -8; 
       line-color:#000000;
	   line-width: 2; 	
    }
  }
  ////////////////////////
  [zoom >= 18][zoom <19]{
    ::background {
    line-offset: 10;
    line-color:#000000;
	line-width: 2; 	
  }
  ::foreground {
    line-offset: -10; 
    line-color:#000000;
	line-width: 2; 	
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
	line-width: 2;
 	
  }
  ::foreground {
    line-offset: -8; 
    line-color:#000000;
	line-width: 2;
 	
  }
  }
  ////////////////////////
  [zoom >= 18][zoom <19]{
    ::background {
    line-offset: 10;
    line-color:#000000;
	line-width: 2;
 	
  }
  ::foreground {
    line-offset: -10; 
    line-color:#000000;
	line-width: 2;
 	
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