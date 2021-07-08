# Civitas
Building Your Civitas Master Node

## Here is a Full Video Walk-through
Coming Soon

## Preperation

1. Get a VPS from a provider like DigitalOcean, Vultr, Linode, etc. 
   - Recommended VPS size at least 1gb RAM 
   - **It must be Ubuntu 16.04 (Xenial)**
2. Make sure you have a transaction of exactly 10000 CIV in your desktop cold wallet.

## Cold Wallet Setup Part 1

1. Open your wallet on your desktop.

   Click Settings -> Options -> Wallet
   
   Check "Enable coin control features"
   
   Check "Show Masternodes Tab"
   
   Press Ok (you will need to restart the wallet)
   
   ![Alt text](https://github.com/tokayseo/Civitas/blob/master/civitas.PNG "Wallet Settings")

   
   
   
2. Go to the "Tools" -> "Debug console"
3. Run the following command: `masternode genkey`
4. You should see a long key that looks like:
```
3HaYBVUCYjEMeeH1Y4sBGLALQZE1Yc1K64xiqgX37tGBDQL8Xg
```
5. This is your `private key`, keep it safe, do not share with anyone.




## VPS Setup

1. Log into your VPS
   - Windows users [follow this guide](https://www.digitalocean.com/community/tutorials/how-to-log-into-your-droplet-with-putty-for-windows-users) to log into your VPS.
2. Copy/paste these commands into the VPS and hit enter: (One Box At A Time)
```
sudo su
```
```
sudo apt-get update
```
```
sudo apt-get upgrade
```
```
cd /var
touch swap.img
chmod 600 swap.img
dd if=/dev/zero of=/var/swap.img bs=1024k count=2000
mkswap /var/swap.img
swapon /var/swap.img
echo "/var/swap.img none swap sw 0 0" >> /etc/fstab
```
```
cd
```
```
apt-get -y install software-properties-common
```
```
apt-add-repository -y ppa:bitcoin/bitcoin
```
```
apt-get update
```
```
apt-get -y install wget git unzip libevent-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev libboost-program-options-dev libboost-system-dev libboost-test-dev libboost-thread-dev libminiupnpc-dev build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils libzmq3-dev nano libdb4.8-dev libdb4.8++-dev
```
```
wget https://github.com/eastcoastcrypto/Civitas/releases/download/v1.2.2/civitas-1.2.2.tar.gz
```
```
tar -xzf civitas-1.2.2.tar.gz
```
```
rm civitas-1.2.2.tar.gz
```
```
cd civitas-1.2.2
```
```
find . -name "*.sh" -exec sudo chmod 755 {} \;
```
```
./autogen.sh
```
```
./configure --without-gui
```
```
make
```
```
make install
```
```
cd src
```
```
strip civitasd
strip civitas-cli
strip civitas-tx
```
```
cp civitasd /usr/bin
cp civitas-cli /usr/bin
cp civitas-tx /usr/bin
```
```
cd
```
```
mkdir -p .civitas
```
```
nano .civitas/civitas.conf
```
Replace:
externalip=VPS_IP_ADDRESS
masternodeprivkey=WALLET_GENKEY
With your info!
```
rpcuser=randuser43897ty8943
rpcpassword=passhf95uiygr5308h08r3h0249fbgh7389h973
rpcallowip=127.0.0.1
listen=1
server=1
#Set deamon to 1 if you wanna run it in background
daemon=0
logtimestamps=1
maxconnections=256
daemon=1
bind=VPS_IP_ADDRESS
externalip=VPS_IP_ADDRESS
masternodeaddr=VPS_IP_ADDRESS:18843
masternodeprivkey=WALLET_GENKEY
masternode=1
```
CTRL X to save it. Y for yes, then ENTER.
```
civitasd &
#if you set deamon=1 in civitas.conf you can do 'civitasd' without &
```

3.Use `watch civitas-cli getinfo` to check and wait til it's synced 



## Cold Wallet Setup Part 2 

1. On your local machine open your `masternode.conf` file.
   Depending on your operating system you will find it in:
   * Windows: `%APPDATA%\Civitas\`
   * Mac OS: `~/Library/Application Support/Civitas/`
   * Unix/Linux: `~/.civitas/`
   
   Leave the file open
2. Go to "Tools" -> "Debug console"
3. Run the following command: `masternode outputs`
4. You should see output like the following if you have a transaction with exactly 1000 POLIS:
```
{
    "12345678xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx": "0"
}
```
5. The value on the left is your `txid` and the right is the `vout`
6. Add a line to the bottom of the already opened `masternode.conf` file using the IP of your
VPS (with port 24126), `private key`, `txid` and `vout`:
```
mn1 1.2.3.4:24126 3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 12345678xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx 0 
```
7. Save the file, exit your wallet and reopen your wallet.
8. Go to the "Masternodes" tab
9. Click "Start All"

Cheers !!
