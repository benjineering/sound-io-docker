#! /bin/bash

bundle install
rake compile
rake compile:examples
