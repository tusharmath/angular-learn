scraper = require '../lib/scraper'
describe 'Home Page', ->

	$ = scraper.load '.bin/index.html'
	
	it 'should always have less than 5 top menu items', ->
		$('.nav-bar > ul > li').length.should.be.below 5

	it 'first customer should always be "National Geographic", in the Clients section', ->
		$('.client-information img').first().attr('src').should.containEql 'natgeo'