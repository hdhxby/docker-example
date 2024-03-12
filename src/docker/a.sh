#!/bin/sh

echo $PATH

function test() {
  echo 'test:' $*
  for arg in $*
}

echo '$0:' $0
echo '$1:' $1
echo '$*:' $*
echo '$@:' $@
echo '$#:' $#
echo '$$:' $$

test $*

if [ "$1" = "a" ]; then
  echo 'hello'
else
  echo  'world'
fi