Website of Anne Arden McDonald
==============================

Install
-------

Requires ruby 1.9.3.

* `bundle install`

Deploy
------

`bundle exec rake static:deploy`

Note that this site is deployed as a compiled set of HTML files to Amazon S3.
Because of this, you can't use a lot of the more dynamic Rails functionality,
like a database, mailers, forms, etc. Keep that in mind as you develop.
