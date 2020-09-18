
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update
sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu kubelet=1.14.5-00 kubeadm=1.14.5-00 kubectl=1.14.5-00
sudo apt-mark hold docker-ce kubelet kubeadm kubectl
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo modprobe br_netfilter
sudo sysctl -p
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl get nodes
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/bc79dd1505b0c8681ece4de4c0d86c5cd2643275/Documentation/kube-flannel.yml
kubectl get nodes
kubectl api-resources -o name 
kubectl get nodes 
kubectl get pods
nano mypod.yml
cat mypod.yml 
kubectl create -f mypod.yml 
kubectl get pods
nano mypod.yml 
kubectl apply -f mypod.yml 
kubectl edit pod mypod
kubectl edit pod mypod.yml
kubectl edit pod mypod
kubectl edit pod my-pod
kubectl delete pod my-pod
kubectl get namesapces
kubectl get namespaces
kubectl create ns my-ns
nano my-ns-pod.yml
kubectl create my-ns-pod.yml 
kubectl create pod my-ns-pod.yml 
kubectl create -f my-ns-pod.yml 
kubectl get pods
kubectl describe pod my-ns-pod
kubectl get pods -n my-ns-pod
kubectl get pods -n my-ns
kubectl describe pod my-ns-pod
kubectl describe pod my-ns-pod -n my-ns
nano my-command-pod.yml
kubectl get pods
kubectl create -f my-command-pod.yml 
kubectl get pods
kubectl create -f my-command-pod.yml 
kubectl get pods
nano my-command-pod.yml
nano my-containerposrt-pod.yml
kubectl create -f my-containerposrt-pod.yml 
kubectl get pods
nano my-config-map.yml
kubectl apply -f my-config-map.yml 
nano my-config-map-pod.yml
nano my-config-map.yml 
kubectl apply -f my-config-map-pod.yml 
kubectl get pods
kubectl  logs my-configmap-pod
nano my-config-map-volume-pod.yml
kubectl apply -f my-config-map-volume-pod.yml 
kubectl get pods
kubectl logs my-config-map-volume-pod
kubectl logs my-config-map-volume-pod.yml
kubectl logs my-configmap-volume-pod.yml
kubectl logs my-configmap-volume-pod
nano my-config-map-volume-pod.yml
kubectl exec my-configmap-volume-pod
kubectl exec my-configmap-volume-pod -- ls /etc/config
kubectl exec my-configmap-volume-pod -- ls  /etc/config
kubectl exec my-configmap-volume-pod -- cat  /etc/config/myKey
kubectl exec my-configmap-volume-pod -- cat  /etc/config/anotherKey
nano my-securitycontext-pod.yml
kubectl apply -f my-securitycontext-pod.yml 
kubectl  get pods
kubectl logs my-securitycontext-pod
cat my-securitycontext-pod.yml 
kubectl exec my-securitycontext-pod
kubectl exec my-securitycontext-pod --ps
kubectl exec my-securitycontext-pod -- ps
kubectl delete pod my-securitycontext-pod --now
nano my-securitycontext-pod.yml
kubectl apply -f my-securitycontext-pod.yml 
kubectl get pods
kubectl logs my-securitycontext-pod
kubectl delete pod my-securitycontext-pod --now
nano my-securitycontext-pod.yml
kubectl apply -f my-securitycontext-pod.yml
kubectl get pods
kubectl logs my-securitycontext-pod
nano my-resource-pod.yml
kubectl apply -f my-resource-pod.yml 
kubectl get pods
kubectl describe pod my-resource-pod
nano my-secret.yml
kubectl apply -f my-secret.yml 
cat my-secret.yml 
rm my-secret.yml 
kubectl get pods
nano my-secret-pod.yml
kubectl apply -f my-secret-pod.yml 
kubectl get pods
kubectl create serviceaccount my-serviceaccount
nano my-serviceaccount-pod.yml
kubectl apply -f my-serviceaccount-pod.yml 
kubectl get pods
ls
nano mypod.yml 
nano multi-container-pod.yml
kubectl apply -f multi-container-pod.yml 
kubectl get pods
ls
nano my-liveness-pod.yml
kubectl apply -f my-liveness-pod.yml 
nano my-liveness-pod.yml
kubectl get pods
nano my-readiness-pod.yml
kubectl apply -f my-readiness-pod.yml 
nano my-readiness-pod.yml 
kubectl apply -f my-readiness-pod.yml 
kubectl get pods
nano counter.yml
kubectl apply -f counter.yml 
kubectl get pods
kubectl logs counter -c counter
kubectl logs counter
kubectl logs counter > counter.log
ls
cat counter.log 
cd ~/
git clone https://github.com/linuxacademy/metrics-server
kubectl apply -f ~/metrics-server/deploy/1.8+/
kubectl get pods
kubectl get --raw /apis/metrics.k8s.io/
nano resource-consumer-big.yml
kubectl apply -f resource-consumer-big.yml 
nano resource-consumer-small.yml
nano resource-consumer-small.yml 
kubectl apply -f resource-consumer-small.yml 
kubectl get pods
kubectl top pods
kubectl top pod resource-consumer-big
kubectl top pod -n kube-system
kubectl create namespace nginx-ns
nano nginx.yml
kubectl get pods
kubectl get pods -all-namespaces
kubectl get pods -all-namespace
kubectl get pods --all-namespaces
kubectl get pods
kubectl get --all-namespaces
kubectl get namespace --all-namespaces
kubectl get namespace
kubectl get pods --all-namespaces
kubectl apply -f nginx.yml 
kubectl get pods --all-namespaces
kubectl describe pod nginx -n ngix-ns
kubectl describe pod nginx -n nginx-ns
kubectl edit pod nginx -n nginx-ns
kubectl get pods -n nginx-ns
kubectl edit pod nginx -n nginx-ns
kubectl get pod nginx -n nginx-ns -o yaml --export
kubectl get pod nginx -n nginx-ns -o yaml --export > nginx-pod.yml
nano  nginx-pod.yml 
kubectl delete pod nginx -n nginx-ns
kubectl apply -f nginx-pod.yml
nano  nginx-pod.yml 
kubectl apply -f nginx-pod.yml -n nginx-ns
nano  nginx-pod.yml 
kubectl apply -f nginx-pod.yml -n nginx-ns
kubectl get pods
kubectl get pods -n nginx-ns
kubectl describe
kubectl describe pod nginx -n nginx-ns
kubectl get pods --all-namespaces
kubectl top pod -n nginx-ns
nano my-production-label-pod.yml
kubectl apply -f my-production-label-pod.yml 
kubectl get pods
kubectl get pods --show-labels
kubectl describe pod my-production-label-pod.yml 
kubectl describe pod my-production-label-pod
nano my-development-label-pod.yml
kubectl apply -f my-development-label-pod.yml 
kubectl get pods 
kubectl get pods -l app=my-app
kubectl get pods -l environement=production
kubectl get pods -l environment=production
kubectl get pods -l environment=development
kubectl get pods -l environment!=development
kubectl get pods -l environment!=production
kubectml getpods -l 'environment in (production,development)'
kubectl getpods -l 'environment in (production,development)'
kubectl get pods -l 'environment in (production,development)'
nano my-annotation-pod.yml
kubectl apply -f my-annotation-pod.yml 
kubectl describe pod my-annotation-pod.yml 
kubectl describe pod my-annotation-pod
nano nginx-deployment.yml
kubectl get pods
kubectl apply -f nginx-deployment.yml 
kubectl get pods
kubectl get deployments
nano nginx-deployment.yml 
kubectl edit nginx-deployment
kubectl edit deploymeny nginx-deployment
kubectl edit deployment nginx-deployment
kubectl get pods
kubectl edit deployment nginx-deployment
kubectl get pods
nano rolling-deployment.yml
kubectl apply -f rolling-deployment.yml 
kubectl get pods
kubectl set image deployment/rolling-deployment nginx=nginx:1.7.9 --record
kubectl get pods
kubectl get pods -w
kubectl rollout history deployment/rolling-deployment
kubectl rollout history deployment/rolling-deployment --revision=2
kubectl rollout undo deployment/rolling-deployment
kubectl get pods
kubectl edit deployment rolling-deployment
nano pi.yml
kubectl apply -f pi.yml
nano pi.yml
kubectl apply -f pi.yml
kubectl get job
kubectl get job -w
kubectl get pods
kubectl logs pi-8ccgd
nano hello.yml
kubectl apply -f hello.yml 
kubectl get cronjob
kubectl get pods
kubect get cronjob
kubectl get cronjob
kubectl logs hello-1600169520-dbmpl 
kubectl get object
kubectl get objects
kubectl get all
kubectl api-resources
nano sample-deployment.yml
kubectl apply -f sample-deployment.yml 
nano my-service.yml
kubectl apply -f my-service
kubectl apply -f my-service.yml
nano my-service.yml
kubectl apply -f my-service.yml
nano my-service.yml
kubectl apply -f my-service.yml
kubectl get svc
kubectl get endpoints
kubectl get endpoints my-service
wget -O canal.yaml https://docs.projectcalico.org/v3.5/getting-started/kubernetes/installation/hosted/canal/canal.yaml
kubectl apply -f canal.yaml
nano network-policy-securte-pod.yml
kubectl apply- f network-policy-securte-pod.yml 
kubectl apply -f network-policy-securte-pod.yml 
nano network-policy-client-pod.yml
kubectl apply -f netowk-policy-client-pod.yml
kubectl apply -f network-policy-client-pod.yml
kubectl get pods
kubectl get pod network-policy-securte-pod -o wide
kubectl get pod network-policy-secure-pod -o wide
kubectl exec network-policy-client-pod -- curl 10.244.1.4
nano my network-polciy.yml
kubectl apply -f my 
kubectl apply -f my
nano my network-polciy.yml
mv my my.yml
nano my.yml
kubectl apply -f my.yml
nano my.yml
kubectl apply -f my.yml
kubectl get networkpolicies
kubectl describe networkpolicy my-network-policy 
kubectl get pod network-policy-secure-pod -o wide
kubectl exec network-policy-client-pod -- curl 10.244.1.4
kubectl edit pod network-policy-client-pod
kubectl exec network-policy-client-pod -- curl 10.244.1.4
nano my.yml
nano network-policy-securte-pod.yml 
nano my.yml
nano volume-pod.yml
kubectl apply -f volume-pod.yml 
kubectl get pods
nano my-pv.yml
kubectl apply -f my-pv.yml
nano my-pv.yml 
kubectl apply -f my-pv.yml
kubectl get pv
nano my-pvc.yml
kubectl apply -f my-pvc.yml 
nano my-pvc.yml
kubectl apply -f my-pvc.yml 
kubectl get pvc
kubectl get pv
nano my-pvc.yml
nano my-pvc-pod.yml
kubectl apply -f my-pvc-pod.yml 
kubectl get pods
ls
cd Desktop/
ls
cd
cd Downloads/
cd
cd Public/
ls
cd
git init
