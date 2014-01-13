#Cloudstat repo for installing cloudstack rpms
class cloudstack::repo {
    yumrepo{'cloudstack':
        baseurl  => 'http://cloudstack.apt-get.eu/rhel/4.2/',
        descr    => 'cloudstack_4.2_repo',
        enabled  => 1,
        gpgcheck => 0,
    }
