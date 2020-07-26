#!/bin/bash
# Build Path: /app/.heroku/php/
dep_url=git://github.com/m6w6/ext-apfd.git
apfd_dir=ext-apfd
echo "-----> Building APFD..."

### Phalcon
echo "[LOG] Downloading APFD"
git clone $dep_url -q
if [ ! -d "$apfd_dir" ]; then
  echo "[ERROR] Failed to find apfd_dir directory $apfd_dir"
  exit
fi
cd $apfd_dir

/app/.heroku/php/bin/phpize 
./configure --with-php-config=/app/.heroku/php/bin/php-config
make
make install
BUILD_DIR=$1
ln -s $BUILD_DIR/.heroku /app/.heroku
export PATH=/app/.heroku/php/bin:$PATH
cd
echo "important extension apfd into php.ini"
echo "extension=apfd.so" >> /app/.heroku/php/etc/php/php.ini
