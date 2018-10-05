# Setting up a Development Environment

These instructions will cover installing and setting up a development environment for this WMS and stylesheets for MacOS and Linux/Unix. Windows users should try the [Docker][docker.markdown] instructions instead, unless they are comfortable with managing their own Node installations.

This app is built on Node.js and Mapnik. You *may* need to install Mapnik development libraries for your OS separately.

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
$ cd scripts
$ node test-mapnik.js
```

To start the WMS on port 3000, localhost:

```sh
$ node index.js
```
