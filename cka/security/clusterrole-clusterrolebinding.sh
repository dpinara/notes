########################################
clusterrole cluster-admin [Refer - 007.lab.Troubleshooting in Kubernetes]
########################################
ubuntu@ip-10-0-128-5:~$ kubectl get clusterrole cluster-admin -o yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  annotations:
    rbac.authorization.kubernetes.io/autoupdate: "true"
  creationTimestamp: "2021-05-30T05:59:32Z"
  labels:
    kubernetes.io/bootstrapping: rbac-defaults
  managedFields:
  - apiVersion: rbac.authorization.k8s.io/v1
    fieldsType: FieldsV1
    fieldsV1:
      f:metadata:
        f:annotations:
          .: {}
          f:rbac.authorization.kubernetes.io/autoupdate: {}
        f:labels:
          .: {}
          f:kubernetes.io/bootstrapping: {}
      f:rules: {}
    manager: kube-apiserver
    operation: Update
    time: "2021-05-30T05:59:32Z"
  name: cluster-admin
  resourceVersion: "43"
  selfLink: /apis/rbac.authorization.k8s.io/v1/clusterroles/cluster-admin
  uid: 1b5f95ae-1fd9-4197-a0f6-4324da3dfa73
rules:
- apiGroups:
  - '*'
  resources:
  - '*'
  verbs:
  - '*'
- nonResourceURLs:
  - '*'
  verbs:
  - '*'

########################################
clusterrolebinding cluster-admin
########################################
ubuntu@ip-10-0-128-5:~$ kubectl get clusterrolebinding cluster-admin -o yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  annotations:
    rbac.authorization.kubernetes.io/autoupdate: "true"
  creationTimestamp: "2021-05-30T05:59:32Z"
  labels:
    kubernetes.io/bootstrapping: rbac-defaults
  managedFields:
  - apiVersion: rbac.authorization.k8s.io/v1
    fieldsType: FieldsV1
    fieldsV1:
      f:metadata:
        f:annotations:
          .: {}
          f:rbac.authorization.kubernetes.io/autoupdate: {}
        f:labels:
          .: {}
          f:kubernetes.io/bootstrapping: {}
      f:roleRef:
        f:apiGroup: {}
        f:kind: {}
        f:name: {}
      f:subjects: {}
    manager: kube-apiserver
    operation: Update
    time: "2021-05-30T05:59:32Z"
  name: cluster-admin
  resourceVersion: "100"
  selfLink: /apis/rbac.authorization.k8s.io/v1/clusterrolebindings/cluster-admin
  uid: d1bc2cb4-df25-4454-a0d2-51766b6915a6
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: Group
  name: system:masters


########################################
Subject: O = system:masters, CN = kubernetes-admin
The Role map specifies the Name of the role that is being bound, and the Subjects map lists all the subjects (users, groups, or service accounts)
A Group named system:masters. Because identities are managed outside of Kubernetes, you cannot use kubectl to show that the kubernetes-admin user is a member of the system:masters group
########################################
ubuntu@ip-10-0-128-5:~$ grep "client-cert" ~/.kube/config |   sed 's/\(.*client-certificate-data: \)\(.*\)/\2/' |   base64 --decode   > cert.pem
ubuntu@ip-10-0-128-5:~$ openssl x509 -in cert.pem -text -noout
Certificate:
    Data:
        Version: 3 (0x2)
        Serial Number: 1835312516996223979 (0x19785702a36353eb)
        Signature Algorithm: sha256WithRSAEncryption
        Issuer: CN = kubernetes
        Validity
            Not Before: May 30 05:59:19 2021 GMT
            Not After : May 30 05:59:21 2022 GMT
        Subject: O = system:masters, CN = kubernetes-admin
        Subject Public Key Info:
            Public Key Algorithm: rsaEncryption
                RSA Public-Key: (2048 bit)
                Modulus:
                    00:d5:e1:4d:4f:aa:ca:0e:a5:79:c1:46:35:53:e2:
                    2b:cd:c3:28:8b:3c:a9:7f:71:4e:70:c8:23:a6:b3:
                    fd:e4:1a:c0:6f:9e:38:5c:f3:1a:cc:bb:c9:45:1b:
                    73:1a:a7:7e:6a:b7:2a:ea:0b:fb:a6:4b:b6:51:05:
                    92:d4:af:14:b4:ff:ab:87:1b:0d:31:80:94:10:50:
                    b5:7d:9e:1e:12:67:6c:52:22:fe:03:a9:58:fa:23:
                    64:59:65:72:1e:45:fa:0b:cf:9b:50:7a:ae:b6:ff:
                    db:07:7a:bc:c1:dc:c3:74:06:b3:47:6e:1a:62:1b:
                    63:00:3d:47:b1:cb:55:10:45:63:8e:bc:56:6e:37:
                    4f:0e:5b:3e:25:bb:b1:76:a4:f0:aa:ac:4a:75:bb:
                    d0:8c:30:eb:f0:14:11:d7:58:29:b2:ee:13:d2:cf:
                    77:39:2a:9f:35:fc:ed:3e:58:11:06:49:19:ff:91:
                    51:75:68:a6:8e:bd:d6:6e:69:ff:2c:f7:a2:9d:49:
                    da:35:c8:15:66:39:bf:ae:92:99:a7:84:a9:cb:01:
                    e8:77:a3:7a:a3:73:8c:ba:ea:bd:ac:98:ee:26:7a:
                    52:cd:fc:75:d4:f1:51:1e:7a:92:70:21:34:12:78:
                    7b:5a:e6:02:14:87:41:dd:e3:5e:1a:09:e3:1c:0e:
                    37:9d
                Exponent: 65537 (0x10001)
        X509v3 extensions:
            X509v3 Key Usage: critical
                Digital Signature, Key Encipherment
            X509v3 Extended Key Usage:
                TLS Web Client Authentication
            X509v3 Authority Key Identifier:
                keyid:57:00:6F:20:11:03:3B:87:AB:1B:A8:44:12:D4:8D:F3:6F:91:0E:37

    Signature Algorithm: sha256WithRSAEncryption
         1b:d4:b5:95:31:dd:72:22:ca:7e:33:91:f8:c9:2d:09:58:9f:
         47:4c:e8:08:c5:17:23:8d:8b:a8:86:c0:f5:0f:9b:1d:b0:3e:
         55:55:24:b2:40:c1:10:ab:0a:bd:98:e5:45:ae:00:09:4b:11:
         5f:61:96:1f:4f:31:f2:cb:f1:73:14:a7:61:0e:64:74:8e:6c:
         35:61:6f:85:0e:61:e6:8c:df:31:46:a7:d7:68:b1:c0:48:32:
         b0:35:87:b6:66:d9:a2:c7:6b:3d:fa:92:af:96:65:c4:d7:26:
         29:f4:74:c1:33:40:25:3c:4a:60:ac:9e:3f:29:42:df:aa:3b:
         d7:88:0c:e3:4a:47:26:05:57:05:89:12:79:27:db:fc:6d:95:
         1d:ee:e5:21:dc:5e:7e:f7:f7:d7:1d:03:35:3c:84:c1:49:97:
         00:96:fe:d5:d4:73:99:67:78:a1:44:3b:eb:b8:5f:97:05:a6:
         10:36:53:64:6f:a7:d3:7a:81:b3:82:74:d2:01:1d:ac:60:00:
         57:eb:a9:6b:92:9d:a1:bf:85:26:57:1a:f5:54:a3:4d:0a:87:
         8d:bf:44:14:8e:34:d0:3b:b7:2f:02:7b:9e:0a:4f:47:58:5b:
         d9:0b:4e:7b:6c:ef:78:34:b1:5f:3f:50:51:e4:3d:e6:3f:a7:
         cf:f6:49:4f
ubuntu@ip-10-0-128-5:~$


