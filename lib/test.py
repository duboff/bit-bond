import json
import requests
from requests.auth import HTTPBasicAuth

url = "http://localhost:14000/"
headers = {'content-type': 'application/json'}
auth = HTTPBasicAuth('rpc', 'xcppw1234')


payload = {
  "method": "create_burn",
  "params": {"source" : "mhqVJuPaq2G6Nv2mFoNvv2h5d5yMPiHFeN",
             "quantity" : 10000,
             "encoding" : "multisig"},
  "jsonrpc": "2.0",
  "id": 0,
}
response = requests.post(
  url, data=json.dumps(payload), headers=headers, auth=auth).json()
print("\nCREATE_BURN RESULT: ", response)

tx_hex = response["result"]

payload = {
  "method": "sign_tx",
  "params": {"unsigned_tx_hex" : tx_hex,
             "privkey" : None},
  "jsonrpc": "2.0",
  "id": 0,
}
response = requests.post(
  url, data=json.dumps(payload), headers=headers, auth=auth).json()
print("\nSIGN_TX: ", response)

payload = {
  "method": "broadcast_tx",
  "params": {"signed_tx_hex" : tx_hex},
  "jsonrpc": "2.0",
  "id": 0,
}
response = requests.post(
  url, data=json.dumps(payload), headers=headers, auth=auth).json()
print("\nBROADCAST_TX: ", response)