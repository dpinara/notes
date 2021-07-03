https://kubernetes.io/docs/reference/kubectl/jsonpath/
------------------------------------------------------
https://github.com/json-path/JsonPath
------------------------------------------------------

#################
#jsonpath
#################
kubectl get pods                    -o=jsonpath='{range .items[*]}{@}{"\n"}{end}' # {@} show all the json records for each pod in json format
kubectl get pods etcd-controlplane  -o jsonpath='{.spec.containers[].image}{"\n"}'
kubectl get pods                    -o=jsonpath='{range .items[*]}{.spec.containers[*].image}{"\n"}{end}'
kubectl get pods                    -o=jsonpath='{range .items[*]}{.spec.containers[].image}{"\n"}{end}' # both will work
kubectl get pods                    -o jsonpath='{.items[*].metadata.name}{"\n"}'
kubectl get pods                    -o=jsonpath="{.items[*]['metadata.name', 'status.capacity']}"
kubectl get pods                    -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.startTime}{"\n"}{end}'
kubectl get pods                    -o=jsonpath="{range .items[*]}{.metadata.name}{\"\t\"}{.status.startTime}{\"\n\"}{end}"
kubectl get pods nginx-dev          -o jsonpath='{.spec.containers[].image}{"\n"}'
kubectl get pods nginx-dev          -o jsonpath='{range .items[*]} {.spec.containers[].image}{"\n"}{"end"}'
kubectl get pods                    -o=jsonpath='{range items[*]}{.metadata.name}{"\t"}{.status.podIP}{"\n"}{end}'
kubectl get pods                    -o=jsonpath='{.items[*] [‘.metadata.name’ , ‘metadata.namespace’]}'
kubectl get nodes                   -o jsonpath= "{range.items[*]}{.metadata.name}{.spec.taints[?(@.effect=='NoSchedule')].effect}{\"\n\"}{end}" | awk `NF==1{print $0}` > /opt/schedulable-nodes.txt
#get schedulable nodes and write to a file
JSONPATH='{range .items[*]}{@.metadata.name}:{range @.status.conditions[*]}{@.type}={@.status};{end}{end}' \ && kubectl get nodes -o="$JSONPATH" | grep "Ready=True" > /opt/node-status


$.car.wheels[?(@.location == 'US')].model
$.prizes[?(@.year == 2014)].laureates[*].firstname

#################
#sort-by
#################

kubectl get pods                    --sort-by=.metadata.creationTimestamp
kubectl get pods                    --sort-by=.metadata.name
kubectl get pv                      --sort-by=.spec.capacity.storage > /opt/pv-storage.txt


#################
#customcolumns
#################
kubectl get nodes -o customcolumns=NAME:.metadata.name,TAINTS:.spec.taints --no-headers
kubectl get pods  -o=custom-columns="POD_NAME:.metadata.name,  POD_STATUS:.status.containerStatuses[].state"



