# Created a SegWit address.
# Add funds to the address.
# Return only the Address
funded_ADDR=$(bitcoin-cli -regtest getnewaddress -addresstype legacy)
bitcoin-cli -regtest generatetoaddress 100 $funded_ADDR
segwit_ADDR=$(bitcoin-cli -regtest getnewaddress -addresstype bech32)
bitcoin-cli -regtest -named sendtoaddress address="$segwit_ADDR" amount=5 fee_rate=2
bitcoin-cli -regtest generatetoaddress 100 $funded_ADDR
echo $segwit_ADDR