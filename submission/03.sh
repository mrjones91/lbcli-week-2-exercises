# Created a SegWit address.
# Add funds to the address.
# Return only the Address
funds=$(bitcoin-cli -regtest getnewaddress)
funding=$(bitcoin-cli -regtest generatetoaddress 200 "$funds")
bitcoin-cli -regtest gettransaction $(bitcoin-cli -regtest -named sendtoaddress address="$(bitcoin-cli -regtest getnewaddress "" "bech32")" amount=0.00005 fee_rate=20) true | jq -r '.details.[0].address'
exit 0

# THE TRENCHES
# funds=$(bitcoin-cli -regtest getnewaddress "" "bech32")
# bitcoin-cli -regtest generatetoaddress 100 $funds

segwit_ADDR=$(bitcoin-cli getnewaddress -addresstype bech32)

fundBlock=$(bitcoin-cli generatetoaddress 100 $segwit_ADDR | jq -r '.[0]')
utxo=$(bitcoin-cli listunspent | jq -r '.[0].txid')
echo $utxo
bitcoin-cli gettransaction $utxo
exit 1
# utxo=$(bitcoin-cli gettransaction $(bitcoin-cli getblock $fundBlock | jq -r '.tx.[]') | jq -r '.txid')

# echo $utxo  bitcoin-cli gettransaction $utxo | jq '.amount'
# '.details.[].amount'
# txid=d26b8c4ab517c9d26c0ad2d729fbd11865c6a55bba48117e74e37870d5a19225
vout=1
rawtxhex=$(bitcoin-cli createrawtransaction '''[ {"txid": "'$utxo'","vout": '$vout' } ]''' '''{ "'$segwit_ADDR'": 0.00005 }''')
# echo $rawtxhex
# bitcoin-cli decoderawtransaction $rawtxhex

# exit 1
signedtx=$(bitcoin-cli signrawtransactionwithwallet $rawtxhex | jq -r '.hex')

bitcoin-cli sendrawtransaction $signedtx

echo $segwit_ADDR

# txid=$(bitcoin-cli -regtest -named sendtoaddress address="$segwit_ADDR" amount=5 fee_rate=200)
# txid=$(bitcoin-cli -regtest sendtoaddress $segwit_ADDR 5 "" "" false true 1 "unset" false)
# bitcoin-cli -regtest generatetoaddress 25 $funds
# echo $txid
# bitcoin-cli -regtest decoderawtransaction $(bitcoin-cli -regtest getrawtransaction $txid) | jq -r '.vout[0].scriptPubKey.address'
# ADD=$(bitcoin-cli -regtest decoderawtransaction $(bitcoin-cli -regtest getrawtransaction $txid) | jq -r '.vout[0].scriptPubKey.address')
# BALANCE=$(bitcoin-cli -regtest getreceivedbyaddress "$ADD" 0)
#           if (( $(echo "$BALANCE > 0" | bc -l) )); then
#             echo "✅ Success: Adding funds to SegWit address passed!"
#           else
#             echo "❌ Error: Adding funds to SegWit address failed!"
#             exit 1
#           fi