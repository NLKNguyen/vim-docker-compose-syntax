/**
 * Generate syntax/docker-compose.vim syntax file based on the config file syntax_mapping.yml
 *
 * @author Niykle Nguyen <NLKNguyen@MSN.com>
 * @origin https://github.com/NLKNguyen/docker-compose.vim
 * @license MIT
 */
const YAML = require('yamljs')
const _ = require('lodash')
const fs = require('fs')


const syntaxMapping = YAML.load('syntax_mapping.yml')

const syntaxMatches = []
const highlightLinks = []

_.forOwn(syntaxMapping, (group, name) => {
  const keywords = group['keywords'].split(/[\s\n]+/).filter(Boolean)
  const highlight_link = group['highlight_link']

  _.forEach(keywords, (keyword) => {
    syntaxMatches.push(String.raw`syn keyword ${name} ${ _.trim(keyword) }`)
  })

  highlightLinks.push(`hi link ${name} ${highlight_link}`)
})


// Write to file
const file = fs.createWriteStream('syntax/docker-compose.vim', {flags: 'w'})

file.on('error', (err) => {
  console.log(err)
})

file.write(`
" This is an automatically generated syntax file created on ${(new Date()).toUTCString()}
" Origin: https://github.com/NLKNguyen/docker-compose.vim
`)

_.forEach(syntaxMatches, (line) => {
  file.write(line + '\n')
})

_.forEach(highlightLinks, (line) => {
  file.write(line + '\n')
})

file.end()
