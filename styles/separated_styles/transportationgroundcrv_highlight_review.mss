#bridges { 
  [zoom >= 14] [zoom < 16]{
    ::background {
       line-offset: 8;
       line-color:#000000;
	   line-width: 0.5;
       marker-file: url('horline_half.svg');
	   marker-placement: vertex-first;
	   marker-transform: 'rotate(-45,0,0) translate(-2.5,0)';
       marker-offset: 8;
       marker-allow-overlap: true;
       ::foreground {
	     line-offset: 4;
         line-color:#ffffff;
		 line-width: 4;
         marker-file: url('horline_half.svg');
	     marker-placement: vertex-last;
         marker-transform: 'rotate(45,0,0) translate(2.5,0)';
         marker-offset: 8;
		 marker-allow-overlap: true;
       } 	
    }
	::foreground {
      line-offset: -8; 
      line-color:#000000;
	  line-width: 0.5;
      marker-file: url('horline_half.svg');
	  marker-placement: vertex-last;
	  marker-transform: 'rotate(-45,0,0) translate(2.5,0)';
	  marker-offset: -8;
      marker-allow-overlap: true;
	  ::background {
	     line-offset: -4;
         line-color:#ffffff;
		 line-width: 4;
         marker-file: url('horline_half.svg');
	     marker-placement: vertex-first;
         marker-transform: 'rotate(45,0,0) translate(-2.5,0)';
         marker-offset: -8;
		 marker-allow-overlap: true;
      } 	
    }	
  }
  [zoom >= 16] [zoom < 17]{
    ::background {
       line-offset: 9;
       line-color:#000000;
	   line-width: 1;
       marker-file: url('horline_one.svg');
	   marker-placement: vertex-first;
	   marker-transform: 'rotate(-45,0,0) translate(-5,0)';
       marker-offset: 9;
       marker-allow-overlap: true;
       ::foreground {
	     line-offset: 5;
         line-color:#ffffff;
		 line-width: 4;
         marker-file: url('horline_one.svg');
	     marker-placement: vertex-last;
         marker-transform: 'rotate(45,0,0) translate(5,0)';
         marker-offset: 9;
		 marker-allow-overlap: true;
       } 	
    }
	::foreground {
      line-offset: -9; 
      line-color:#000000;
	  line-width: 1;
      marker-file: url('horline_one.svg');
	  marker-placement: vertex-last;
	  marker-transform: 'rotate(-45,0,0) translate(5,0)';
	  marker-offset: -9;
      marker-allow-overlap: true;
	  ::background {
	     line-offset: -5;
         line-color:#ffffff;
		 line-width: 4;
         marker-file: url('horline_one.svg');
	     marker-placement: vertex-first;
         marker-transform: 'rotate(45,0,0) translate(-5,0)';
         marker-offset: -9;
		 marker-allow-overlap: true;
      } 	
    }	
  }
  [zoom >= 17] [zoom < 18]{
    ::background {
       line-offset: 12;
       line-color:#000000;
	   line-width: 1;
       marker-file: url('horline_one.svg');
	   marker-placement: vertex-first;
	   marker-transform: 'rotate(-45,0,0) translate(-5,0)';
       marker-offset: 12;
       marker-allow-overlap: true;
       ::foreground {
	     line-offset: 10;
         line-color:#ffffff;
		 line-width: 2;
         marker-file: url('horline_one.svg');
	     marker-placement: vertex-last;
         marker-transform: 'rotate(45,0,0) translate(5,0)';
         marker-offset: 12;
		 marker-allow-overlap: true;
       } 	
    }
	::foreground {
      line-offset: -12; 
      line-color:#000000;
	  line-width: 1;
      marker-file: url('horline_one.svg');
	  marker-placement: vertex-last;
	  marker-transform: 'rotate(-45,0,0) translate(5,0)';
	  marker-offset: -12;
      marker-allow-overlap: true;
	  ::background {
	     line-offset: -10;
         line-color:#ffffff;
		 line-width: 2;
         marker-file: url('horline_one.svg');
	     marker-placement: vertex-first;
         marker-transform: 'rotate(45,0,0) translate(-5,0)';
         marker-offset: -12;
		 marker-allow-overlap: true;
      } 	
    }	
  }

  [zoom >= 18][zoom <= 20]{
    ::background {
      line-offset: 18;
      line-color:#000000;
	  line-width: 2;
      marker-file: url('horline_two.svg');
	  marker-placement: vertex-first;
	  marker-transform: 'rotate(-45,0,0) translate(-5,0)';
      marker-offset: 18;
      marker-allow-overlap: true;
      ::foreground {
	    line-offset: 14;
        line-color:#ffffff;
		line-width: 6;
        marker-file: url('horline_two.svg');
	    marker-placement: vertex-last;
		marker-transform: 'rotate(45,0,0) translate(5,0)';
	    marker-offset: 18;
        marker-allow-overlap: true;
      } 	
    }
    ::foreground {
      line-offset: -18; 
      line-color:#000000;
	  line-width: 2;
      marker-file: url('horline_two.svg');
	  marker-placement: vertex-last;
	  marker-transform: 'rotate(-45,0,0) translate(5,0)';
	  marker-offset: -18;
      marker-allow-overlap: true;
	  ::background {
	    line-offset: -14;
        line-color:#ffffff;
		line-width: 6;
        marker-file: url('horline_two.svg');   
	    marker-placement: vertex-first;
		marker-transform: 'rotate(45,0,0) translate(-5,0)';
	    marker-offset: -18;
        marker-allow-overlap: true;
      } 	
    }
  }  
 }

 
// Cart Track
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

//Trail
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