# Created a SegWit address.
# Add funds to the address.
# Return only the Address
segwit_ADDR=$(bitcoin-cli -regtest getnewaddress -addresstype bech32)
funded_ADDR=$(bitcoin-cli -regtest getnewaddress -addresstype legacy)
bitcoin-cli -regtest generatetoaddress $funded_ADDR
# bitcoin-cli -regtest -named sendtoaddress address="$segwit_ADDR" amount=21 fee_rate=2
echo $segwit_ADDR