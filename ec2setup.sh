#/bin/sh

yum -y install python-devel zlib-devel openssl-devel libpcap-devel.x86_64 subversion screen glibc-devel
yum -y install automake autoconf gcc-c++ 
mkdir /opt/src   
cd /opt/src
wget http://python.org/ftp/python/2.5.4/Python-2.5.4.tgz 
tar xzvf Python-2.5.4.tgz
cd Python-2.5.4
sudo ./configure --prefix=/opt/python2.5
make && make install 
ln -s /opt/python2.5/bin/python2.5 /usr/bin/python2.5
su  
echo /opt/python2.5/lib >> /etc/ld.so.conf.d/opt-python2.5.conf  
echo /sbin/ldconfig     >> /etc/ld.so.conf.d/opt-python2.5.conf  
exit
ln -s /opt/python2.5/lib/libpython2.5.so /opt/python2.5/lib/python2.5/config
cd
wget http://www.secdev.org/projects/scapy/files/scapy-latest.tar.gz  
tar -xzf scapy-latest.tar.gz
cd scapy-2.1.0   
python2.5 setup.py build  
python2.5 setup.py install 
cd
wget http://pyrit.googlecode.com/files/pyrit-0.4.0.tar.gz
tar xvzf pyrit-0.4.0.tar.gz
svn checkout http://pyrit.googlecode.com/svn/trunk/ pyrit_svn   
cd pyrit-0.4.0  
python2.5 setup.py build  
python2.5 setup.py install
ln -s /opt/python2.5/bin/pyrit /usr/bin/pyrit
cd
wget http://pyrit.googlecode.com/files/cpyrit-cuda-0.4.0.tar.gz  
tar xvzf cpyrit-cuda-0.4.0.tar.gz 
cd cpyrit-cuda-0.4.0 
python2.5 setup.py build 
python2.5 setup.py install  
#pyrit benchmark
cd
wget http://sourceforge.net/projects/crunch-wordlist/files/crunch-wordlist/crunch-3.0.1.tgz
tar -xvf crunch-3.0.1.tgz
cd crunch3.0/
make && make install
ln –s /root/crunch3.0/./crunch  /usr/bin/crunch


cd
mkdir -p /tools/wifi
cd /tools/wifi
wget http://wirelessdefence.org/Contents/Files/cowpatty-4.6.tgz  
tar zxvf cowpatty-4.6.tgz   
cd cowpatty-4.6
make  
ln -s /tools/wifi/cowpatty-4.6/cowpatty /usr/bin/cowpatty

