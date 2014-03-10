#Starting Development

1. Clone the repository and checkout the branch.

	```bash
	git clone git@github.com:tusharmath/web-offline-seed.git
	git checkout thoughtworks-ui-test
	```

2. Install dependencies.

	```bash
	npm install
	```
3. Start development server on port 3000.

	```bash
	coffee server.coffee
	```
4. Visit the application on [http://localhost:3000]().

5. Run tests via grunt.

	```bash
	grunt test
	```
	
6. Package the app to uglify css.

	```bash
	grunt package
	```
7. Open `.bin` folder to view the packaged contents.
	
