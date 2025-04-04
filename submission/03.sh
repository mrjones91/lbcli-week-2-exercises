# Created a SegWit address.
# Add funds to the address.
# Return only the Address
# funds=$(bitcoin-cli -regtest getnewaddress "" "bech32")
# bitcoin-cli -regtest generatetoaddress 100 $funds
segwit_ADDR=$(bitcoin-cli -regtest getnewaddress -addresstype bech32)
txid=$(bitcoin-cli -regtest -named sendtoaddress address="$segwit_ADDR" amount=5 fee_rate=200)
# bitcoin-cli -regtest generatetoaddress 25 $funds
bitcoin-cli -regtest decoderawtransaction $(bitcoin-cli -regtest gettransaction $txid) | jq -r '.vout[1].scriptPubKey.address'