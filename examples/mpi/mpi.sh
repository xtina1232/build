#!/bin/bash
echo "In Bash File"
pwd

#Unzip and build SMB
tar -xvzf smb.tgz
cd smb_1.0-1/
cd src
cd msgrate/
make
cd ..
cd mpi_overhead
make


#Unzip and build OSU
cd /
tar -xvzf osu-micro-benchmarks-5.3.2.tar.gz
cd osu-micro-benchmarks-5.3.2
mkdir build.openmpi && cd build.openmpi
../configure CC=mpicc --prefix=`pwd`/install
make && make install
cd /


#Run a sample mpi hello world program
mpirun -np 16 mpi_hello
