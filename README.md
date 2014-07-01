Lending Bits
=============

Lending bits is a project built at Hackcoin, the first London Bitcoin hackathon. It works on top of the Counterparty API to provide companies a market to raise debt funding. The project was awarded a special prize by the Counterparty.

==========================================================================================================================

Setup Information
===================

To eventually run the server you need to simply type 'rails s' into the command line while situated in the main project directory. Before this you will have to run the command 'bundle' successfully and likely the 'rake db:create' and/or 'rake db:migrate' commands to setup a local database. These command may throw errors the first time you run them. A lot of these may relate to libraries you need to install or that you need PostgreSQL installed etc. but some of the error messages are harder to decipher.

This section details some of those issues encountered with getting this code to run on Windows 7 OS. Some of these issues may occur on other operating systems as well.

Gemfile
=======

Add lines below in main section (no indent):

gem 'tzinfo'
gem 'tzinfo-data'

Also change second line (ruby '2.1.2') to the ruby version running on your machine (Note that this version must be compatible with your rails installation and all the installed ibraries used in this project).

Also you may need to comment out the line (gem 'unicorn')

config directory
================

Here you may need to add a couple files, secrets.yml and database.yml

secrets.yml
===========

An example file:

development:
    secret_key_base: "utjtyjhfjhyrjyjyrjyrjtrjyrj12345"

production:
    secret_key_base: "utjtyjhfjhyrjyjyrjyrjtrjyrj12345"
    
Note the keys here don't relate to any other setting in the project or on your computer.

database.yml
============

An example file without the username and password filled in (these are specific to your local installation):

development:
  adapter: postgresql
  host: localhost
  encoding: unicode
  database: Projects_development
  pool: 5
  username: <your_postgresql_user_name>
  password: <your_postgresql_password>
  template: template0
  
test:
  adapter: postgresql
  host: localhost
  encoding: unicode
  database: Projects_development
  pool: 5
  username: <your_postgresql_user_name>
  password: <your_postgresql_password>
  template: template0

production:
  adapter: postgresql
  host: localhost
  encoding: unicode
  database: Projects_development
  pool: 5
  username: <your_postgresql_user_name>
  password: <your_postgresql_password>
  template: template0
  
Extra PostreSQL
===============

On my local installation of PostreSQL I also had to make changes to the pg_hba.conf file located in C:\Program Files\PostgreSQL\9.3\data

pg_hba.conf
===========

The only 2 uncommented lines you need in this file are below. Originally the 'trust' strings were 'md5' instead which cause the error.

host    all             all             127.0.0.1/32            trust
host    all             all             ::1/128                 trust
  


