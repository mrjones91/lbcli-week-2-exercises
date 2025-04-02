# Created a SegWit address.
# Add funds to the address.
# Return only the Address
segwit_ADDR=$(bitcoin-cli -regtest getnewaddress -addresstype bech32)
bitcoin-cli -regtest sendtoaddress $segwit_ADDR .0021
echo $segwit_ADDR