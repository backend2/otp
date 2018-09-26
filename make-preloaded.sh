#!/bin/sh
if [ -z "$ERL_TOP" ]; then
  echo "set ERL_TOP env variable"
  exit 1
fi
echo "ERL_TOP=$ERL_TOP"

cd $ERL_TOP/erts/preloaded
make
cp -v src/*.beam ebin
cd $ERL_TOP

