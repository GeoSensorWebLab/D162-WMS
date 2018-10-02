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
