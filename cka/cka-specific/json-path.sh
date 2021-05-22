kubect1 get po nginx-dev -o jsonpath='{.spec.containers[].image}{"\n"}'
kubect1 get pods -o=jsonpath='{range items[*]}{.metadata.name}{"\t"}{.status.podIP}{"\n"}{end}'
kubect1 get pods -o=jsonpath=”{.items[*] [‘.metadata.name’ , ‘metadata.namespace’]}”
kubect1 get pods --sort-by=.metadata.creationTimestamp
kubect1 get pods --sort-by=.metadata.name
kubect1 get pv --sort-by=.spec.capacity.storage > /opt/pv-storage.txt


kubectl get nodes -o customcolumns=NAME:.metadata.name,TAINTS:.spec.taints --no-headers
>> 32 -> kubectl get nodes -o jsonpath= "{range.items[*]}{.metadata.name}{.spec.taints[?(@.effect=='NoSchedule')].effect}{\"\n\"}{end}" | awk `NF==2{print $0}`

>> 36 -> get schedulable nodes and write to a file
kubectl get nodes -o jsonpath= "{range.items[*]}{.metadata.name}{.spec.taints[?(@.effect=='NoSchedule')].effect}{\"\n\"}{end}" | awk `NF==1{print $0}` > /opt/schedulable-nodes.txt


JSONPATH='{range .items[*]}{@.metadata.name}:{range @.status.conditions[*]}{@.type}={@.status};{end}{end}' \ && kubectl get nodes -o="$JSONPATH" | grep "Ready=True" > /opt/node-status


