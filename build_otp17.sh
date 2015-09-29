#!/bin/bash
mkdir ~/OTP17
PREFIX=~/OTP17
PREFIXERL=$PREFIX/erl
PREFIXEX=$PREFIX/elixir
export PATH=$PREFIXERL/bin:$PREFIXEX/bin:$PATH
echo Will build to $PREFIXERL and $PREFIXEX
cd $PREFIX
wget http://www.erlang.org/download/otp_src_17.5.tar.gz
tar zxpvf otp_src_17.5.tar.gz
cd ./otp_src_17.5/
ERL_TOP=`pwd` ./otp_build configure --enable-smp-support --enable-hipe --enable-threads --with-ssl --enable-m64-build --prefix=$PREFIXERL
./otp_build release -a $PREFIXERL
cd ~/OTP17/erl
./Install -minimal ~/OTP17/erl
cd ../
git clone https://github.com/elixir-lang/elixir.git
cd elixir
git fetch
git checkout v1.0.5
make PREFIX=$PREFIXEX install
echo $PATH