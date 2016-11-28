#!/bin/bash

clear
rubocop -RDS && \
rails cucumber && \
COVERAGE=true bundle exec rspec
