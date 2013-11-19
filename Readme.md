This is a seed project that I have created to build static websites.

#Current Features - 

1. Unit Testing using, Karma, Mocha, Should.js.
2. CoffeeScript Code.
3. Live reload for development purposes.
4. AngularJS based Architecture.
5. Using Karma as the test runner.
6. Using LessCSS for dynamic stylesheets.
7. Chai is used as the assertion library.
8. Publish to GH-pages.
9. Package, minify, JS and CSS.
10. CSS, Javascript updated with each version.

#Upcoming Features - 

1. Auto generate a manifest file of offline applications.
2. Integrated with Travis.


#Starting Development

1. Clone the repository.
2. Install dependencies.

	```bash
	npm install
	```
3. Start development server

	```bash
	coffee server.coffee
	```
4. Visit the application on localhost:3000

#Publish to GH-Pages

Once your code has been finalised and committed to the repository, run the `grunt publish` task.