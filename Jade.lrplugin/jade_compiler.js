#!/usr/bin/env node

var fs = require('fs')
  , path = require('path')
  , resolve = path.resolve
  , basename = path.basename
  , dirname = path.dirname
  , jade;

jade = require('jade');

/**
 * Arguments.
 */

var args = process.argv.slice(2);

/**
 * Options javascript.
 */

var options = {};

/**
 * Usage information.
 */

var usage = ''
  + '\n'
  + '  Usage: jade [options]\n'
  + '              in.jade out.html'
  + '  \n'
  + '  Options:\n'
  + '    -o, --options <str>  JavaScript options object passed\n'
  + '    -h, --help           Output help information\n'
  + '    -v, --version        Output jade version\n'
  + '\n';

// Parse arguments

var arg
  , infile
  , outfile;
while (args.length) {
  arg = args.shift();
  switch (arg) {
    case '-h':
    case '--help':
      console.log(usage);
      process.exit(1);
    case '-v':
    case '--version':
      console.log(jade.version);
      process.exit(1);
    case '-o':
    case '--options':
      var str = args.shift();
      if (str) {
        extend(options, eval('(' + str + ')'));
      } else {
        console.error('-o, --options requires a string.');
        process.exit(1);
      }
      break;
    case '--options-file':
      var str = args.shift();
      if (str) {
        str = str.trim();
        if (!fs.existsSync(str)) {
          console.error('--options-file requires an existing JSON file.');
          process.exit(1);
        }
        var data = fs.readFileSync(str, 'utf8');
        // eval instead of JSON.parse to support unquoted keys, comments and other JS stuff
        extend(options, eval('(' + data + ')'));
      } else {
        console.error('--options-file requires a string.');
        process.exit(1);
      }
      break;
    default:
      args.unshift(arg);
      break;
  }
  if (args.length != 2) {
    console.error('exactly 2 file names must be specified');
    process.exit(1);
  }
  infile = args.shift();
  outfile = args.shift();
}

renderJade(infile, outfile);


function renderJade(inFile, outFile) {
  jade.renderFile(inFile, options, function(err, html) {
    if (err) throw err;
    fs.writeFile(outFile, html, function(err) {
      if (err) throw err;
      console.log('  \033[90mcompiled\033[0m %s', inFile);
    });
  });
}


function extend(dst, src) {
  for (var k in src) if (src.hasOwnProperty(k)) {
    dst[k] = src[k];
  }
}
