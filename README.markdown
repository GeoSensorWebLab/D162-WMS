# Example WMS for Testbed 14

A WMS that implements the conceptual model from D160. This demonstrates that the conceptual model is portable to different mapping services.

## Usage

TODO: How to use this server, and a link to a production server

Note: When adding the server to QGIS, make sure "Ignore GetMap/GetTile URI reported in capabilities" is checked.

## Deployment to Production Server

TODO: Explain how to deploy this service to an internet-facing server

## Development Setup

This app is built on Node.js and Mapnik. You *may* need to install Mapnik development libraries for your OS separately.

You can set up the development environment using Docker, if you prefer; please see `DOCKER.markdown` for instructions. If you are running under Windows, that method may be preferred as it will manage your Node/NPM/GDAL versions for you.

Start by downloading and installing the latest stable version of [Node.js][]. Then use Git to clone this repository from GitHub, or download an archive of this repository.

```sh
$ git clone https://github.com/openfirmware/D162-WMS
```

Use NPM to install the dependencies:

```sh
$ cd D162-WMS
$ npm install
```

**If** you are using MacOS >= 10.10, or Ubuntu "Trusty" or newer, then the install should work automatically.

[Node.js]: https://nodejs.org/

### If a Binary Install Doesn't Work

Other Mac/Linux users will likely have to install a C++11 compiler before node-mapnik installs.

**Windows Users** need to [download a Visual C++ redist package][vcredist].

All these users will have to install Mapnik on their system, at least version 3.0.20, and have the `mapnik-config` tool in their shell PATH.

[vcredist]: https://github.com/mapnik/node-mapnik#windows-specific

### NPM Install Works

Once the dependencies install successfully, you can start compiling stylesheets and previewing them.

To download the data sources for shapefiles:

```sh
$ node get-data.js
```

To compile all the `.mml` files in the `styles` directory into `.xml` files for mapnik:

```sh
$ node compile.js
```

To test that Mapnik will render a map to an image:

```sh
$ node test-mapnik.js
```

To start the WMS on port 3000, localhost:

```sh
$ node index.js
```

## License

Copyright University of Calgary, James Badger, 2018. All rights reserved.

(To be re-licensed for OGC Testbed in the future.)

## Authors

James Badger, University of Calgary (<jpbadger@ucalgary.ca>)
