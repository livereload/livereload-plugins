var config = {
  globals: {},
  environments: ['node', 'browser', 'devel', 'mocha'],
  errorsToConsole: true
};

var cmdlineOptions = require('dreamopt')([
  "Usage: es6-transpiler-wrapper [options] <source> <destination>",

  "Arguments:",
  "  <transpiler>            Transpiler NPM module #required",
  "  <source>                Source JavaScript file",
  "  <destination>           Destination JavaScript file",

  "Compilation options:",
  "  --global <global>       Add global variables, comma-separated, append ! for writability #list #var(globals)",
  "  --env <env>             Add environments, comma-separated, prepend - to remove #list #var(envs)",
  "  --polyfills <mode>      When to include ES5 polyfills, one of: never, required, all (defaults to never)",
  "  --allow-unknown         Allow references to unknown global variables #var(allowUnknown)",

  "Information and usage:",
  "  -v, --verbose           Display the transpiler configuration",
  "  --print-envs            Print the list of environments #var(printEnvs)"
]);
// console.log(JSON.stringify(cmdlineOptions, null, 2));

var transpiler = require(cmdlineOptions.transpiler);
var vars = require(cmdlineOptions.transpiler + '/jshint_globals/vars.js');

var privateEnvs = {
  mocha: { describe: false, it: false, before: false, beforeEach: false, after: false, afterEach: false, suite: false, test: false, setup: false, teardown: false }
};

if (cmdlineOptions.printEnvs) {
  delete vars.reservedVars;
  delete vars.ecmaIdentifiers;
  console.log("Environments: ", Object.keys(vars).join(", "));
  process.exit(0);
}

forEachListItem(cmdlineOptions.globals, function(value) {
  var name = value, writability = false;
  if (name.match(/!$/)) {
    name = name.substr(0, name.length-1);
    writability = true;
  }
  if (name.match(/^-/)) {
    delete config.globals[name.substr(1)];
  } else {
    config.globals[name] = writability;
  }
});

forEachListItem(cmdlineOptions.envs, function(value) {
  if (value.match(/^-/)) {
    var pos = config.environments.indexOf(value.substr(1));
    if (pos >= 0) {
      config.environments.splice(pos, 1);
    }
  } else {
    config.environments.push(value);
  }
});

if (cmdlineOptions.polyfills === 'never') {
  config.includePolyfills = false;
} else if (cmdlineOptions.polyfills === 'required') {
  config.includePolyfills = true;
} else if (cmdlineOptions.polyfills === 'all') {
  config.includePolyfills = 'full';
} else {
  throw new Error('cmdlineOptions.polyfills');
}

if (cmdlineOptions.allowUnknown) {
  config.disallowUnknownReferences = !cmdlineOptions.allowUnknown;
} else {
  config.disallowUnknownReferences = true;
}

config.filename = cmdlineOptions.source;
config.outputFilename = cmdlineOptions.destination;

if (cmdlineOptions.verbose) {
  console.log("Running ES6 transpiler with configuration: %s", JSON.stringify(config, null, 2));
}

config.environments = config.environments.filter(function(env) {
  var vars = privateEnvs[env];
  if (vars) {
    for (var k in vars) {
      config.globals[k] = vars[k];
    }
    return false;
  } else {
    return true;
  }
});

transpiler.run(config);

function forEachListItem(list, func) {
  list.forEach(function(values) {
    values.split(/[,\s]+/).forEach(function(value) {
      if (value.trim()) {
        func(value.trim());
      }
    });
  });
}
