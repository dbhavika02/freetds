# docker run -it registry.access.redhat.com/ubi8/ubi:8.10 /bin/bash

# Install dependencies
yum install -y perl gcc wget git

# Download Sybase
wget https://cpan.metacpan.org/authors/id/M/ME/MEWP/DBD-Sybase-1.15.tar.gz
chmod 777 DBD-Sybase-1.15.tar.gz
tar -xvzf DBD-Sybase-1.15.tar.gz
cd DBD-Sybase-1.15

# Download Freetds
# https://www.freetds.org/files/stable/freetds-1.4.26.tar.gz
git clone https://github.com/dbhavika02/freetds

# Install & configure Freetds 
cd freetds
./configure --prefix=/usr/local/freetds
make 
make install

# go back to the sybase directory to instll sybase
cd .. 
perl Makefile.PL
make
make install

# check the installation
perl -MDBD::Sybase -e 'print "DBD::Sybase is installed!\n";'

