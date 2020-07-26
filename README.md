# Heroku buildpack: PHP + APFD
fork from Official Buildpack PHP Heroku https://github.com/heroku/heroku-buildpack-php
![php](https://cloud.githubusercontent.com/assets/51578/8882982/73ea501a-3219-11e5-8f87-311e6b8a86fc.jpg)

Laravel or PHP in general cannot fully support all of Restful methods such as PUT, PATCH and DELETE. It needs additional library to parse the body from those methods. I've added PECL library named APFD to solve this problem.
## Usage

You'll need to use at least an empty `composer.json` in your application.

    $ echo '{}' > composer.json
    $ git add composer.json
    $ git commit -m "add composer.json for PHP app detection"

If you also have files from other frameworks or languages that could trigger another buildpack to detect your application as one of its own, e.g. a `package.json` which might cause your code to be detected as a Node.js application even if it is a PHP application, then you need to manually set your application to use this buildpack:
```shell
$ heroku buildpacks:set https://github.com/reyzeal/heroku-buildpack-php
```
