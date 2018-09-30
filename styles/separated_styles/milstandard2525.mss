#military [zoom > 11]{
  [StndID_1 = 0][StndID_2 != 999] {
    marker-width:30;
    
    [StndID_2 = 2] {
      marker-file: url('0310_Friend.svg');
    }
     [StndID_2 = 3] {
      marker-file: url('0410_Neutral.svg');
    }

    [StndID_2 = 4] {
      marker-file: url('0510_Suspect_Joker.svg');
    }

      [StndID_2 = 5] {
     marker-file: url('0600_Hostile_Faker.svg');
    }

  }
  
/*symbol*/
::symbol{
      [Entity = 28]{
        marker-file: url('25280201_Antipersonnel_Mine_with_Directional_Effects.svg');
        marker-transform: rotate([Angle]-90);
    	marker-width:20;
    	marker-allow-overlap:true;
    }

      [Entity = 19] {
      	marker-file: url('10190000_Emergency_Operation.svg');
    	marker-width:15;
    	marker-allow-overlap:true;
    }
      [Entity = 11] {
      	marker-file: url('11110400_Organization_or_Group.svg');
    	marker-width:20;
    	marker-allow-overlap:true;
    }    
  }
}