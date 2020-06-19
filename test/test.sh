#!/bin/bash

# Strict mode
set -e

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
done
TEST_DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

echo -e "\n################# Testing C ##################"
$TEST_DIR/c/test.sh

echo "################# Testing Go ##################"
cd $TEST_DIR/.. && go test -timeout 9999s
