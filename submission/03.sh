# Created a SegWit address.
# Add funds to the address.
# Return only the Address
funds=$(bitcoin-cli getnewaddress -addresstype bech32)
bitcoin-cli generatetoaddress 25 $funds
segwit_ADDR=$(bitcoin-cli getnewaddress -addresstype bech32)
bitcoin-cli -named sendtoaddress address="$segwit_ADDR" amount=5 fee_rate=200
bitcoin-cli generatetoaddress 25 $funds
echo $segwit_ADDR