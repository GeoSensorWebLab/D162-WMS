#utilityinfrastructurepnt [F_CODE = 'AT042'][OSM_T_POW = 'tower']   {
    [zoom >= 13] [zoom < 15]{
	    marker-file: url(pylon_wilson.svg);
        marker-width:15;
        marker-allow-overlap: true;
	}
	[zoom >= 15] [zoom < 20]{
	    marker-file: url(pylon_wilson.svg);
        marker-width:20;
		text-name: 'Pylon';
        text-face-name: 'Open Sans Regular'; 
        text-size: 12;
        text-fill: #000000;
        text-halo-fill: #ffffff;
        text-halo-radius: 1;
        text-allow-overlap:true;
        text-opacity: 1;
        text-dx: 0;
		text-dy: 18;	
	}
}