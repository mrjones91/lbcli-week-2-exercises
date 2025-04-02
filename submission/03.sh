# Created a SegWit address.
# Add funds to the address.
# Return only the Address
segwit_ADDR=$(bitcoin-cli -regtest getnewaddress -addresstype p2sh-segwit)
bitcoin-cli -regtest sendtoaddress $segwit_ADDR .0021
echo $segwit_ADDR