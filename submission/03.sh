# Created a SegWit address.
# Add funds to the address.
# Return only the Address
segwit_ADDR=$(bitcoin-cli -regtest getnewaddress -addresstype bech32)
bitcoin-cli -regtest generatetoaddress 250 $segwit_ADDR
echo $segwit_ADDR

