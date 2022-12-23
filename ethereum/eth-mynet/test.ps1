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

$r = (curl -s `
--location --request POST "${env:DOCKER_DEFAULT}:3333" `
--header 'Host: localhost' `
--header 'Content-Type: application/json' `
--data-raw '{
  "jsonrpc": "2.0",
  "method": "eth_getBalance",
  "params": ["0x91eb338d999ef9ae151f8831c576c130856e4b9e", "latest"],
  "id": 1
}' | ConvertFrom-Json)
$r.Result
