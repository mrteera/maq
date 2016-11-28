#!/bin/bash

clear
rails cucumber && \
COVERAGE=true bundle exec rspec
