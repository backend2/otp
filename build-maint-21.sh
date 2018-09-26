#!/bin/sh

export ERL_TOP=`pwd`
echo "ERL_TOP is $ERL_TOP"

./otp_build autoconf

./configure --cache-file=/dev/null \
  --prefix=$ERL_TOP/../maint-21 \
  --without-javac \
  --without-orber \
  --without-ic \
  --without-public_key \
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
  --without-asn1 \
  --without-common_test \
  --without-diameter \
  --without-edoc \
  --without-erl_docgen \
  --without-megaco \
  --without-otp_mibs \
  --without-snmp \
  --without-syntax_tools \
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
  --without-ssl \
  --without-ssh
