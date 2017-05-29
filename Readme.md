This is a seed project that I have created to build static websites.

**Demo:** [tusharm.com/web-offline-seed](http://tusharm.com/web-offline-seed)

#Current Features

[![Greenkeeper badge](https://badges.greenkeeper.io/tusharmath/web-offline-seed.svg)](https://greenkeeper.io/)

1. Unit Testing using, Karma, Mocha, Chai.
2. CoffeeScript Code.
3. Live reload for development purposes.
4. AngularJS based Architecture.
5. Using Karma as the test runner.
6. Using LessCSS for dynamic stylesheets.
7. Chai is used as the assertion library.
8. Publish to GH-pages.
9. Package, minify, JS and CSS.
10. CSS, Javascript updated with each version.
11. Tag every release.
12. Auto generates a manifest file for developing offline html5 applications.
13. Now installs bower components automatically after the  `npm install` command.


#Upcoming Features


1. Integrate with Travis.

*Request one!*



#Starting Development

1. Clone the repository.
2. Install dependencies.

	```bash
	npm install
	bower install
	```
3. Start development server

	```bash
	coffee server.coffee
	```
4. Visit the application on localhost:3000

#Publish to gh-pages

To create a tag and release a version, use the `grunt release` command.

Once your code has been finalised and released to the repository, run the `grunt publish` task.

*NOTE: Make sure you release first and then publish.*

#Test the application

1. Install Karma globally.
2. Run `karma tests/karma.config.coffee`.
