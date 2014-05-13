#Devicelab

Devicelab static website

## Getting started

1. `$ bower install`
2. `$ bundle install`
3. `$ bundle exec middleman`

Now you can start hacking on `source` directory and watch live changes on [localhost:4567](http://localhost:4567).

## Deployment

1. Install the Heroku toolbelt.

        $ brew install heroku-toolbelt

2. Override the Heroku default buildpacks by specifying a custom buildpack in the `BUILDPACK_URL` config var.

        $ heroku config:set BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi.git

3. Deploy to production.

        $ git push production master
