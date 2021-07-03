########################################################
#   Exam
########################################################
sudo -i
alias k=kubectl
alias c=clear
alias kgns="kubectl config  view| grep namespace"
function ksns() { kubectl config set-context $(kubectl config current-context) --namespace=$1; }
export force="--force --grace-period=0"
export dd="--dry-run=client -o yaml"
kubectl explain Pod.spec.serviceAccount --recursive | grep "containers\|serviceAccount"


set list
set listchars=tab:>-

########################################################
#   Foundational and useful command
########################################################
2  echo "source <(kubectl completion bash)" >> ~/.bashrc
3  source ~/.bashrc
7  scp -o "ForwardAgent yes" $master_ip:.kube/config .kube/config  # secure copy (scp) the kubeconfig file
8  cat ~/.kube/config
45  kubectl get daemonset kube-proxy -n kube-system -o yaml | more +/"^spec:"
46  proxy_pod_1=$(kubectl get pods -n kube-system | grep proxy | cut -d" " -f1 | head -1)

########################################################
#   config & clusterinfo
########################################################
10  kubectl config --help
11  kubectl config current-context
12  kubectl config get-clusters
13  kubectl config get-contexts

29  kubectl cluster-info
30  kubectl cluster-info dump


########################################################
#   Validation
########################################################

root@controlplane:~# cat /root/curl-test.sh
for i in {1..35}; do
   kubectl exec --namespace=kube-public curl -- sh -c 'test=`wget -qO- -T 2  http://webapp-service.default.svc.cluster.local:8080/info 2>&1` && echo "$test OK" || echo "Failed"';
   echo ""
done

root@controlplane:~# k exec -it  curl -- sh
/ # wget -qO- -T 2  http://webapp-service.default.svc.cluster.local:8080/info
Hello, Application Version: v1 ; Color: blue/ #
/ # wget --help
BusyBox v1.30.1 (2021-03-31 04:59:34 UTC) multi-call binary.

Usage: wget [-c|--continue] [--spider] [-q|--quiet] [-O|--output-document FILE]
        [--header 'header: value'] [-Y|--proxy on/off] [-P DIR]
        [-S|--server-response] [-U|--user-agent AGENT] [-T SEC] URL...

Retrieve files via HTTP or FTP

        --spider        Only check URL existence: $? is 0 if exists
        -c              Continue retrieval of aborted transfer
        -q              Quiet
        -P DIR          Save to DIR (default .)
        -S              Show server response
        -T SEC          Network read timeout is SEC seconds
        -O FILE         Save to FILE ('-' for stdout)
        -U STR          Use STR for User-Agent header
        -Y on/off       Use proxy




    command:
      - "sleep"
      - "5000"


    command: [ "/bin/sh", "-c", "sleep" , "5000" ]
