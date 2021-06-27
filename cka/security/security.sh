
openssl x509 -in certificate.crt -noout -text -- verify public key/ certificate file
openssl rsa -in "private-key" -check --verify private key
openssl req -text -noout verify -- verify CSR

15  kubectl auth can-i list nodes
17  kubectl auth can-i list nodes
18  kubectl auth can-i --help

