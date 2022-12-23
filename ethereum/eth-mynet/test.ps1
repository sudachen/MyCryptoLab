$r = (curl -s `
--location --request POST "${env:DOCKER_DEFAULT}:3333" `
--header 'Host: localhost' `
--header 'Content-Type: application/json' `
--data-raw '{
    "jsonrpc": "2.0",
    "id": 1,
    "method": "admin_peers",
    "params": []
}' | ConvertFrom-Json)
$r.Result


$r = (curl -s `
--location --request POST "${env:DOCKER_DEFAULT}:3333" `
--header 'Host: localhost' `
--header 'Content-Type: application/json' `
--data-raw '{
    "jsonrpc": "2.0",
    "id": 1,
    "method": "eth_getBlockByNumber",
    "params":["latest", false]
}' | ConvertFrom-Json)
$r.Result

eth.sendTransaction({from: '0x1e48feaf6fd410f629bae0ef3689ad4a6a565d5a', to: '0xce8dba5e4157c2b284d8853afeeea259344c1653', value: web3.toWei(0.0000000001, 'ether') });