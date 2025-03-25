# Created a SegWit address.
# Add funds to the address.
# Return only the Address
bitcoin-cli getnewaddress -addresstype p2sh-segwit
send_with_fee "treasurewallet" "$P2SH_ADDR" 2.0