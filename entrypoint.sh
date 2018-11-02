#! /bin/bash

cd /sound-io
bundle install

rake compile
rake compile:examples

bundle exec rspec
bundle exec guard # TODO: only watch if ARG is true
