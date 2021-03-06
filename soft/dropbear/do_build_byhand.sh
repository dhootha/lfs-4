cd $LFS_THIS_SOFT_SRC

make clean distclean

CC=$LFS_CROSS_COMPILE\gcc \
./configure \
--host=$LFS_TARGET_ARCH \
--prefix=$LFS_TARGET_INSTALL_DIR \
--with-zlib=$LFS_TARGET_INSTALL_DIR/lib

# add CFLAGS to fix zlib issue
CFLAGS="-I$LFS_TARGET_INSTALL_DIR/include" \
make PROGRAMS="dropbear dropbearkey dbclient scp" MULTI=1

# install by hand

mkdir -p $LFS_TARGET_INSTALL_DIR/usr/bin/
cp dropbearmulti $LFS_TARGET_INSTALL_DIR/usr/bin/
ln -s dropbearmulti $LFS_TARGET_INSTALL_DIR/usr/bin/dbclient
ln -s dropbearmulti $LFS_TARGET_INSTALL_DIR/usr/bin/scp
ln -s dropbearmulti $LFS_TARGET_INSTALL_DIR/usr/bin/dropbear
ln -s dropbearmulti $LFS_TARGET_INSTALL_DIR/usr/bin/dropbearkey
