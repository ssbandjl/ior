ref: https://docs.daos.io/v2.6/testing/ior/

git clone https://github.com/hpc/ior.git
cd ior/
./bootstrap
mkdir build;cd build
../configure --with-daos=/root/project/stor/daos/install --prefix=/root/project/hpc/ior/install
make -j64 V=1 2>&1 | tee m.txt
make install 2>&1 | tee mi.txt