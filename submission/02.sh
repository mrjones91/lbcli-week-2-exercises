# Create a new Bitcoin address, for receiving change.
change_ADDR=$(bitcoin-cli -regtest -rpcwallet=btrustwallet getrawchangeaddress)
echo $change_ADDR