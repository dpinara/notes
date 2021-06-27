https://kubernetes.io/docs/reference/kubectl/jsonpath/
------------------------------------------------------
https://github.com/json-path/JsonPath
------------------------------------------------------

kubectl get po etcd-controlplane -o jsonpath='{.spec.containers[].image}{"\n"}'
kubectl get po  -o jsonpath='{.items[*].metadata.name}{"\n"}'
kubectl get pods -o=jsonpath="{.items[*]['metadata.name', 'status.capacity']}"
kubectl get pods -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{.status.startTime}{"\n"}{end}'
kubectl get pods -o=jsonpath="{range .items[*]}{.metadata.name}{\"\t\"}{.status.startTime}{\"\n\"}{end}"

$.car.wheels[?(@.location == 'US')].model
$.prizes[?(@.year == 2014)].laureates[*].firstname

kubectl get po nginx-dev -o jsonpath='{.spec.containers[].image}{"\n"}'
kubectl get pods -o=jsonpath='{range items[*]}{.metadata.name}{"\t"}{.status.podIP}{"\n"}{end}'
kubectl get pods -o=jsonpath='{.items[*] [‘.metadata.name’ , ‘metadata.namespace’]}'
kubectl get pods --sort-by=.metadata.creationTimestamp
kubectl get pods --sort-by=.metadata.name
kubectl get pv --sort-by=.spec.capacity.storage > /opt/pv-storage.txt


kubectl get nodes -o customcolumns=NAME:.metadata.name,TAINTS:.spec.taints --no-headers
>> 32 -> kubectl get nodes -o jsonpath= "{range.items[*]}{.metadata.name}{.spec.taints[?(@.effect=='NoSchedule')].effect}{\"\n\"}{end}" | awk `NF==2{print $0}`

>> 36 -> get schedulable nodes and write to a file
kubectl get nodes -o jsonpath= "{range.items[*]}{.metadata.name}{.spec.taints[?(@.effect=='NoSchedule')].effect}{\"\n\"}{end}" | awk `NF==1{print $0}` > /opt/schedulable-nodes.txt


JSONPATH='{range .items[*]}{@.metadata.name}:{range @.status.conditions[*]}{@.type}={@.status};{end}{end}' \ && kubectl get nodes -o="$JSONPATH" | grep "Ready=True" > /opt/node-status


