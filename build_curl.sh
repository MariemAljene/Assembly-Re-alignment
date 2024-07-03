#!/bin/bash

# Clone the Repository
git clone https://github.com/curl/curl.git
cd curl

# Install Necessary Tools
sudo apt-get update
sudo apt-get install -y build-essential autoconf libtool gcc-multilib g++-multilib libssl-dev

# Prepare the Build Environment
autoreconf -fi

# Create Directories for Executables
mkdir -p /mnt/c/Users/marie/OneDrive/Desktop/Eurecom/Forensics/Project/curl/executables/32bit
mkdir -p /mnt/c/Users/marie/OneDrive/Desktop/Eurecom/Forensics/Project/curl/executables/64bit

# Compile for 64-bit
./configure --with-openssl=/usr CC="gcc -m64" CXX="g++ -m64" LDFLAGS="-L/usr/lib/x86_64-linux-gnu" CPPFLAGS="-I/usr/include/openssl"
make clean
make
cp src/.libs/curl /mnt/c/Users/marie/OneDrive/Desktop/Eurecom/Forensics/Project/curl/executables/64bit/curl_64bit

# Set the LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu

# Verify 64-bit Executable
/mnt/c/Users/marie/OneDrive/Desktop/Eurecom/Forensics/Project/curl/executables/64bit/curl_64bit --version

# Compile for 32-bit (Optional)
make clean
./configure --with-openssl=/usr CC="gcc -m32" CXX="g++ -m32" LDFLAGS="-L/usr/lib/i386-linux-gnu" CPPFLAGS="-I/usr/include/openssl"
make
cp src/.libs/curl /mnt/c/Users/marie/OneDrive/Desktop/Eurecom/Forensics/Project/curl/executables/32bit/curl_32bit

# Set the LD_LIBRARY_PATH for 32-bit
export LD_LIBRARY_PATH=/usr/lib/i386-linux-gnu

# Verify 32-bit Executable (Optional)
/mnt/c/Users/marie/OneDrive/Desktop/Eurecom/Forensics/Project/curl/executables/32bit/curl_32bit --version

echo "Executables have been copied to ../executables."
