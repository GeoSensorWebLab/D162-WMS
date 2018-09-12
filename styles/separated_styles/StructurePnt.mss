#structurepnt[F_CODE = 'AL013'] {
    [zoom > 12] {
      marker-file: url('building1.svg');
      marker-width:10;
      marker-height:10;
    }
    [zoom > 10][zoom <= 12]  {
      marker-file:url('building1.svg');
      marker-width:5;
      marker-height:5;
    }
}
#structurepnt[F_CODE = 'AL013'][OSM_T_REL = 'muslim'][OSM_T_AME = 'place_of_worship']  {
  [zoom > 12]{
      marker-file: url(AR_Black_Mosque.svg);
      marker-width:20;
      marker-height:20; }
  [zoom >= 10][zoom <= 12]{
      marker-file: url(PT_Black_Mosque.svg);
      marker-width:5;
      marker-height:5; }
}

#structurepnt[F_CODE = 'AL013'][OSM_T_AME = 'college']  {
  [zoom > 12]{
      marker-file: url(PT_Black_School.svg);
      marker-width:20;
      marker-height:20; }
  [zoom >= 10][zoom <= 12]{
      marker-file: url(PT_Black_School.svg);
      marker-width:5;
      marker-height:5; }
}

#structurepnt[F_CODE = 'AL013'][OSM_T_AME = 'public_building'] [zoom > 11] {
   marker-file: url(building1.svg);
   marker-width:15;
   marker-height:15;
}