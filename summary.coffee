Path = require 'path'
fs   = require 'fs'

ROOT = __dirname

for dirName in fs.readdirSync(ROOT) when (m = dirName.match /^(.*)\.lrplugin$/)
  name = m[1]

  versionsFile = Path.join(ROOT, dirName, 'versions.json')
  if fs.existsSync(versionsFile)
    versions = JSON.parse(fs.readFileSync(versionsFile))

    masterVersion = versions['.']
    delete versions['.']

    unless masterVersion.match /,/
      masterVersion = "#{name} #{masterVersion}"

    # otherVersions = ("#{gem} #{gemVer}" for own gem, gemVer of versions).join(", ")
    # if otherVersions
    #   otherVersions = " (#{otherVersions})"

    console.log "#{masterVersion}"
