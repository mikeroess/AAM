Website of Anne Arden McDonald
==============================

Install
-------

* `bundle install`

Static Site
-----------

This site is deployed as a compiled set of HTML files. Because of this, you can't use a lot of the more dynamic Rails functionality, like a database, mailers, forms, etc. Keep that in mind as you develop.

The `static` namespace of rake tasks contains some tasks for working with the
static site:

* `RAILS_ENV=production bundle exec rake static:build`: Builds the static site
    to a `_static` directory.
* `RAILS_ENV=production bundle exec rake static:serve`: Builds the static site,
    then starts up a webrick server so you can browse it in your browser. This
    is a good way to see how the site will look/behave in production.
* `RAILS_ENV=production bundle exec rake static:deploy`: Builds the static site
    then deploys it to the production server.

