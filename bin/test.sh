#!/usr/bin/env bash

curl -H "Content-Type: application/json; charset=utf8" -X PUT -d '
{
    "symbol":"APPL",
    "cusip":"cusip",
    "description":"description",
    "exchange":"exchange",
    "type":"asset_type"
}' localhost:8080/asset
