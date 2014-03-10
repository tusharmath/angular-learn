fs = require 'fs'
cheerio = require 'cheerio'

class Scraper
	constructor: (@fs, @cheerio) ->
	load : (path) -> cheerio.load @fs.readFileSync path


module.exports = new Scraper fs