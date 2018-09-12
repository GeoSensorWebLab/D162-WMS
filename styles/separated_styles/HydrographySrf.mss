//Lake
#hydrographysrf [F_CODE='BH082'][zoom > 11]::z1 {
  line-color:#00A0C6;
  line-width:4;
  polygon-opacity:1;
  polygon-fill:#B0E1ED;
}
//Dam
#hydrographysrf[F_CODE='BI020'][zoom > 11] ::z2{
  line-color:#000000;
  line-width:4;
  marker-file: url('PT_Black_Dam_2.svg');   
  marker-placement: interior; 
  marker-width: 10;

}