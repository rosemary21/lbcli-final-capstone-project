#!/bin/bash
# How many new outputs were created by block 243,825?
bitcoin-cli -signet getblockstats 243825 '["outs"]' | jq '.outs'
