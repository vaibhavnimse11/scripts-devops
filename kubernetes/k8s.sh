master & node
-------------------

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install docker.io -y
sudo apt-get install -y apt-transport-https ca-certificates curl gpg


curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg


echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list


sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

-----------------sudo nano /etc/hosts    ENTER ENTRIES FOR BOTH THE MACHIENS----------------------------------------------------------

==============================================================================
Now on MASTER

sudo kubeadm init --apiserver-advertise-address=$IP --pod-network-cidr=192.168.100.0/24


mkdir -p $HOME/.kube 
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl get nodes


Copy Join in node with using sudo


kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/tigera-operator.yaml

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/custom-resources.yaml

watch kubectl get pods -n calico-system


CALICO / FLANNEL




After successful running

create the yaml files and run the below commands.

kubectl apply -f nginx-deployment.yaml
kubectl apply -f nginx-service.yaml
