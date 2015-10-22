#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Aragment is required one"
  exit 1
fi

if ! expr "$1" : '.*\.feature$' > /dev/null ; then
  echo "Please specify the feature file to the argument"
  exit 1
fi

echo "===== Scenario ====="
grep -n "Scenario" $1 | cut -d":" -f1,3
echo "===================="
echo "Please select line number of the scenario(Exit: q, All: a)"

read no

if [ $no = "q" ]; then
  exit 1
fi

if [ $no = "a" ]; then
  bundle exec rspec "$1"
  exit 0
fi

if expr "$no" : '[0-9]*' > /dev/null ; then
  bundle exec rspec "$1:$no"
else
  echo "Line number is numric"
fi
