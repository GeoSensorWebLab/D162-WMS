Map {
  background-color: @water-color;
}

@water-color: #aad3df;
@land-color: #f2efe9;

#world {
  [zoom >= 0][zoom < 10] {
    polygon-fill: @land-color;
    polygon-simplify: 0.4;
    [zoom < 8] {
      line-color: darken(@water-color,20%);
      line-simplify: 0.4;
      line-width: 0.5;
      line-offset: 0.5;
    }
  }
}
