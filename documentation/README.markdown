# Documentation

No comprehensive documentation is currently available. Perhaps either a link or excerpt from the Testbed 14 Engineering Report can be included at a later date.

## Screenshots

![main kosmtik](main%20kosmtik.png)

**Above**: A preview of the stylesheets in the *kosmtik* Node.js application. [Kosmtik][] will load a [CartoCSS][carto] project file (.mml) and any associated stylesheets (.mss) and use Carto and [Mapnik][] to render OpenStreetMap style tiles in a browser, using [Leaflet.js][] as the client interface. In the above screenshot, a partially complete implementation of the Conceptual Model can be seen.

![kosmtik zoom](kosmtik%20zoom.png)

**Above**: A closer look at the same map as above. With CartoCSS, we can show/hide layers based on the zoom level. The zoom level is based on the [OpenStreetMap resolution set][OSM Resolutions] and may have slightly different behaviour for rendering in-between resolutions; we will have more information on this in the Engineering Report.

![kosmtik inspector](kosmtik%20inspector.png)

**Above**: Kosmtik includes a non-standard GetFeatureInfo style function where selecting any point on the map surface will return an information window with attributes for every layer that has a feature overlapping the selected point. This is useful for developing a stylesheet where you may want to find a unique attribute to differentiate similar features.

[carto]: https://github.com/mapbox/carto
[Kosmtik]: https://github.com/kosmtik/kosmtik
[Leaflet.js]: https://leafletjs.com
[Mapnik]: https://mapnik.org
[OSM Resolutions]: https://wiki.openstreetmap.org/wiki/Zoom_levels
