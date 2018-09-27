// Primary Road
#transportationgroundcrv [F_CODE = 'AP030'] [RIN_ROI = 3] {
  [zoom >= 19][zoom <= 20] {   
    ::case {
      line-width:27;
      line-color:#000000;      
    }
    ::fill {
      line-width:22.5;
      line-color:#cb171a;
      }
 }
    [zoom >= 18][zoom < 19] {   
    ::case {
      line-width:21;
      line-color:#000000;      
    }
    ::fill {
      line-width:17.1;
      line-color:#cb171a;
      }
 }
    [zoom >= 17][zoom < 18] {   
    ::case {
      line-width:18;
      line-color:#000000;      
    }
    ::fill {
      line-width:14.4;
      line-color:#cb171a;
      }
 }
    [zoom >= 15][zoom < 17] {   
    ::case {
      line-width:10;
      line-color:#000000;      
    }
    ::fill {
      line-width:7.74;
      line-color:#cb171a;
      }
 }
    [zoom >= 12][zoom < 15] {   
    ::case {
      line-width:8;
      line-color:#000000;      
    }
    ::fill {
      line-width:6.12;
      line-color:#cb171a;
      }
 }
   [zoom >= 11][zoom < 12] {   
    ::case {
      line-width:6;
      line-color:#000000;      
    }
    ::fill {
      line-width:4.5;
      line-color:#cb171a;
      }
 }
   [zoom >= 10][zoom < 11] {
    line-width:2;
    line-color:#cb171a;
 }
   [zoom >= 9][zoom < 10] {
    line-width:1.9;
    line-color:#cb171a;
 }
   [zoom >= 8][zoom < 9] {
    line-width:1.4;
    line-color:#cb171a;
 }
   [zoom >= 7][zoom < 8] {
    line-width:1;
    line-color:#cb171a;
 }
   [zoom >= 5][zoom < 7] {
    line-width:0.8;
    line-color:#cb171a;
 }
  [zoom < 5] {
    line-width:0.5;
    line-color:#cb171a;
 }
}
// Secondary Road
#transportationgroundcrv [F_CODE = 'AP030'] [RIN_ROI = 4] {
    [zoom >= 19][zoom <= 20] {   
    ::case {
      line-opacity:0.4;
      line-width:27;
      line-color:#000000;      
    }
    ::fill {
      line-opacity:1;
      line-width:25;
      line-color:#cb171a;
      }
 }
  [zoom >= 18][zoom < 19] {   
    ::case {
      line-opacity:0.4;
      line-width:21;
      line-color:#000000;      
    }
    ::fill {
      line-opacity:1;
      line-width:19;
      line-color:#cb171a;
      }
 }
  [zoom >= 17][zoom < 18] {   
    ::case {
      line-opacity:0.4;
      line-width:18;
      line-color:#000000;      
    }
    ::fill {
      line-opacity:1;
      line-width:16;
      line-color:#cb171a;
      }
 }
     [zoom >= 16][zoom < 17] {   
    ::case {
      line-opacity:0.4;
      line-width:10;
      line-color:#000000;      
    }
    ::fill {
      line-opacity:1;
      line-width:8.5;
      line-color:#cb171a;
      }
 }
  [zoom >= 15][zoom < 16] {   
    ::case {
      line-opacity:0.4;
      line-width:9;
      line-color:#000000;      
    }
    ::fill {
      line-opacity:1;
      line-width:7.5;
      line-color:#cb171a;
      }
 }
  [zoom >= 12][zoom < 15] {   
    ::case {
      line-opacity:0.4;
      line-width:5;
      line-color:#000000;      
    }
    ::fill {
      line-opacity:1;
      line-width:4;
      line-color:#cb171a;
      }
 }
  [zoom >= 11][zoom < 12] {   
    ::case {
      line-opacity:0.4;
      line-width:0.8;
      line-color:#9eae23;      
    }
    ::fill {
      line-opacity:1;
      line-width:0.8;
      line-color:#cb171a;
      }
 }
[zoom >= 5] [zoom < 11]{
    line-width:0.8;
    line-color:#cb171a;
 }
 }
//Street
#transportationgroundcrv [F_CODE = 'AP030'] [RIN_ROI = 5] {
    [zoom >= 19][zoom <= 20] {   
    ::case {
      line-width:27;
      line-color:#000000;      
    }
    ::fill {
      line-width:25;
      line-color:#ffffff;
      }
 }
    [zoom >= 18][zoom < 19] {   
    ::case {
      line-width:21;
      line-color:#000000;      
    }
    ::fill {
      line-width:19;
      line-color:#ffffff;
      }
 }
    [zoom >= 17][zoom < 18] {   
    ::case {
      line-width:18;
      line-color:#000000;      
    }
    ::fill {
      line-width:16;
      line-color:#ffffff;
      }
 }
  [zoom >= 16][zoom < 17] {   
    ::case {
      line-width:10;
      line-color:#000000;      
    }
    ::fill {
      line-width:8.5;
      line-color:#ffffff;
      }
 }
    [zoom >= 15][zoom < 16] {   
    ::case {
      line-width:9;
      line-color:#000000;      
    }
    ::fill {
      line-width:7.5;
      line-color:#ffffff;
      }
 }
    [zoom >= 13][zoom < 15] {   
    ::case {
      line-width:4;
      line-color:#000000;      
    }
    ::fill {
      line-width:3;
      line-color:#ffffff;
      }
 }
  [zoom >= 12][zoom < 13] {   
    ::case {
      line-width:2;
      line-color:#000000;      
    }
    ::fill {
      line-width:1.2;
      line-color:#ffffff;
      }
 }
  [zoom >= 11] [zoom < 12]{
    ::case {
      line-width:1;
      line-color:#000000;      
    }
    ::fill {
      line-width:0.8;
      line-color:#ffffff;
      }
 }  

  }

