#!/bin/bash
# Which tx in block 216,351 spends the coinbase output of block 216,128?
COINBASE_TXID=$(bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash 216128) | jq -r '.tx[0]')
BLOCK_HASH=$(bitcoin-cli -signet getblockhash 216351)
bitcoin-cli -signet getblock $BLOCK_HASH 2 | jq -r --arg ctxid "$COINBASE_TXID" '.tx[] | select(any(.vin[]; .txid == $ctxid)) | .txid'
