# genRojoProject

fork of `genRojoTree` made to suit my needs.

## Installation

1.  Clone this repository to a directory of your choice
2.  Run "npm i" and "rokit install" to install the required packages
3.  To start development, run "lune run scripts/start-dev", this starts everything you need.
4.  Connect to rojo in studio

## Differences:

- Darklua paths, (ex. require("@services/ExampleService/Server"))
- start-dev script, automatically listens to file changes and executes the genRojoTree script.
- vide package (and other utilities) included.

## Tips

- Use the Charmed Icons icon theme for some cool icons for all of the folders

## All aliases

@ui = src/ui,
@services = src/services,
@packages = Packages,
@server_packages = ServerPackages,
@classes = src/classes,
@modules = src/modules,
@server_modules = src/server_modules
