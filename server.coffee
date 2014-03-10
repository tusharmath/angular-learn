express = require 'express'
liveload = require 'liveload'
lessMiddleware = require 'less-middleware'
app = express();

app.configure ->
	app.set 'views', __dirname + '/views'
	app.set 'view engine', 'jade'
	app.use express.bodyParser()
	app.use express.methodOverride()

	app.use app.router
	app.use liveload
		root:process.cwd()
		files:/.(css|jade)$/
		excludes:/^node_modules$/

	app.use lessMiddleware __dirname + '/app'

	
	app.use(express.static(__dirname + '/app'));

app.get '/', (req, res) -> res.render('index', debug: true)
app.listen 9000
console.log('listening on port 9000');