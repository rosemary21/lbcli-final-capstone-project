#!/bin/bash
# Only one tx in block 243,821 signals opt-in RBF. What is its txid?
bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash 243821) 2 | jq -r '.tx[] | select(any(.vin[]; .txid != null and .sequence <= 4294967293)) | .txid'
