# Created a SegWit address.
# Add funds to the address.
# Return only the Address
# funds=$(bitcoin-cli getnewaddress "" "bech32")
# bitcoin-cli generatetoaddress 100 $funds
segwit_ADDR=$(bitcoin-cli getnewaddress -addresstype bech32)
txid=$(bitcoin-cli -named sendtoaddress address="$segwit_ADDR" amount=5 fee_rate=200)
# txid=$(bitcoin-cli sendtoaddress $segwit_ADDR 5 "" "" false true 1 "unset" false)
# bitcoin-cli generatetoaddress 25 $funds
# echo $txid
bitcoin-cli decoderawtransaction $(bitcoin-cli getrawtransaction $txid) | jq -r '.vout[0].scriptPubKey.address'
# ADD=$(bitcoin-cli decoderawtransaction $(bitcoin-cli getrawtransaction $txid) | jq -r '.vout[0].scriptPubKey.address')
# BALANCE=$(bitcoin-cli getreceivedbyaddress "$ADD" 0)
#           if (( $(echo "$BALANCE > 0" | bc -l) )); then
#             echo "✅ Success: Adding funds to SegWit address passed!"
#           else
#             echo "❌ Error: Adding funds to SegWit address failed!"
#             exit 1
#           fi