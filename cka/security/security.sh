openssl x509 -in certificate.crt -noout -text -- verify public key/ certificate file
openssl rsa -in "private-key" -check --verify private key
openssl req -text -noout verify -- verify CSR

kubectl auth can-i list nodes
kubectl auth can-i list nodes
kubectl auth can-i --help

openssl x509 -in ca.crt -noout -text | grep -i validity -A 4
