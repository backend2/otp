#!/bin/sh

export ERL_TOP=`pwd`
echo "ERL_TOP is $ERL_TOP"

./otp_build autoconf

./configure --cache-file=/dev/null \
  --prefix=$ERL_TOP/../be2 \
  --without-javac \
  --without-orber \
  --without-ic \
  --without-cosTransactions \
  --without-cosEvent \
  --without-cosTime \
  --without-cosNotification \
  --without-cosProperty \
  --without-cosFileTransfer \
  --without-cosEventDomain \
  --without-et \
  --without-hipe \
  --without-dialyzer \
  --without-eldap \
  --without-eunit \
  --without-common_test \
  --without-diameter \
  --without-edoc \
  --without-erl_docgen \
  --without-megaco \
  --without-otp_mibs \
  --without-snmp \
  --without-xmerl \
  --without-wx \
  --without-observer \
  --without-debugger \
  --without-jinterface \
  --without-mnesia \
  --without-odbc \
  --without-os_mon \
  --without-tftp \
  --without-ftp \
  --without-ssh \
  --with-ssl=$ERL_TOP/../openssl \
  --enable-static-nifs=$ERL_TOP/esqlite/priv/esqlite3_nif.a

