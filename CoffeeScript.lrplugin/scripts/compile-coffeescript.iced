fs             = require 'fs'
path           = require 'path'
CoffeeScript   = require 'coffee-script'

exists         = fs.exists or path.exists

printLine = (line) -> process.stdout.write line + '\n'
printWarn = (line) -> process.stderr.write line + '\n'


printVersion = ->
  printLine "CoffeeScript version #{CoffeeScript.VERSION}"
  process.exit 0


OPTIONS = [
  "Usage: node compile-coffee.js [options] source.coffee destination.js"

  "Files:"
  "  source.coffee      Path to the source file #required #var(source)"
  "  destination.js     Path to the destination file #required #var(destination)"

  "Compilation options:"
  "  -b, --bare         Compile without a top-level function wrapper"

  "General options:"
  "  -v, --version      Display the version number", printVersion
]


EXIT_E_CMD_LINE    = 3
EXIT_E_IO          = 2
EXIT_E_COMPILATION = 1
EXIT_SUCCESS       = 0


run = ->
  opts = require('dreamopt')(OPTIONS)

  return usage()                         if opts.help
  return version()                       if opts.version

  compilePath opts.source, opts.destination, opts


compilePath = (source, destination, opts) ->
  await fs.readFile source, defer(err, coffee)
  if err?.code is 'ENOENT'
    console.error "File not found: #{source}"
    process.exit EXIT_E_IO

  try
    js = CoffeeScript.compile coffee.toString(), compilerOptions(source, opts)
    js = ' ' if js.length <= 0

    await exists path.dirname(destination), defer(itExists)
    unless itExists
      await mkdir_p path.dirname(destination), `0777`, defer()

    await fs.writeFile destination, js, defer(err)
    if err
      console.error err.message
      process.exit EXIT_E_IO

  catch err
    printWarn err instanceof Error and err.stack or "ERROR: #{err}"
    process.exit EXIT_E_COMPILATION



compilerOptions = (filename, opts) ->
  {filename, bare: opts.bare, header: yes}


mkdir_p = (path, mode, callback, position) ->
  mode = mode or `0777`
  position = position or 0
  parts = require("path").normalize(path).split("/")
  if position >= parts.length
    if callback
      return callback()
    else
      return true
  directory = parts.slice(0, position + 1).join("/")
  fs.stat directory, (err) ->
    if err is null
      mkdir_p path, mode, callback, position + 1
    else
      fs.mkdir directory, mode, (err) ->
        if err
          if callback
            callback err
          else
            throw err
        else
          mkdir_p path, mode, callback, position + 1

run()
