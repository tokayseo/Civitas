apt-get update
apt-get -y install software-properties-common
apt-add-repository -y ppa:bitcoin/bitcoin
apt-get update
apt-get upgrade
apt-get -y install wget git unzip libevent-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev libboost-program-options-dev libboost-system-dev libboost-test-dev libboost-thread-dev libminiupnpc-dev build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libzmq3-dev nano libdb4.8-dev libdb4.8++-dev
