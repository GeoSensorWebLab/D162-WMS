# Example WMS for Testbed 14

A WMS that implements the conceptual model from D160. This demonstrates that the conceptual model is portable to different mapping services and different encodings. In this case, the encoding is [CartoCSS][] that is translated into [Mapnik][] XML.

[CartoCSS]: https://github.com/mapbox/carto
[Mapnik]: https://mapnik.org

## Previewing the WMS

For testbed participants and observers, a production WMS is online at [http://testbed.gswlab.ca:3000/service](http://testbed.gswlab.ca:3000/service). This service is WMS 1.1.1 in Node.js and renders map images on-the-fly using Mapnik (no caching). It has been tested with QGIS 2/3.

Stylesheets were developed in CartoCSS and a live tile preview server ([Kosmtik][]) can be viewed at [http://testbed.gswlab.ca:7000](http://testbed.gswlab.ca:7000). This service is an OpenStreetMap-like tile service that is not a standard.

**Note**: It is no longer necessary to use "Ignore GetMap/GetTile URI reported in capabilities" in QGIS with this WMS.

[Kosmtik]: https://github.com/kosmtik/kosmtik

## Deployment to Production Server

See the production deployment instructions in [documentation/deployment.markdown](documentation/deployment.markdown).

## Development Setup with Docker

Instructions for developing the CartoCSS stylesheets using Docker are detailed in the [documentation/docker.markdown](documentation/docker.markdown) document. This is probably the easiest way to get started on Windows, where setting up dependencies can be difficult.

The instructions below on running the WMS, compiling stylesheets, and using kosmtik are explained in the Docker document.

## Development Setup (No Docker)

See the development instructions in [documentation/development.markdown](documentation/development.markdown).

## License

This project is licensed under [Apache 2.0](https://opensource.org/licenses/Apache-2.0).

## Authors

James Badger, University of Calgary (<jpbadger@ucalgary.ca>)  
Soroush Ojagh, University of Calgary

