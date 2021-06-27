
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
