#! /bin/bash

# TODO: this in rake
cd /sound-io/examples/c
make

cd ../..
bin/setup

bundle exec rspec
