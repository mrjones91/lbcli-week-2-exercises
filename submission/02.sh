# Create a new Bitcoin address, for receiving change.
change_ADDR=$(bitcoin-cli -regtest -rpcwallet=btrustwallet getrawchangeaddress legacy)
echo $change_ADDR