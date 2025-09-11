rm -rf build

npx nodemon --watch src -d 2 -e lua,luau --exec "node ./scripts/genRojoTreeDefault && rojo sourcemap default.project.json --output sourcemap.json" &
npx nodemon --watch src -e lua,luau --exec "lune run scripts/darkluaconfig" &
npx nodemon --watch src -e lua,luau --exec "darklua process src/ build/ && node ./scripts/genRojoTree" &