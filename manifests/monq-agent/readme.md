# Monq Agent Kubernetes manifest
* Installs the Monq agent [Monq.ru](https://monq.ru)

## Installing by manifest
Install the Monq-agent as a Deployment to your Kubernetes cluster by applying the manifest:
```bash
export MONQ_URI="https://monq.mydomain.com"
export MONQ_KEY="<my coordinator key>"

curl https://raw.githubusercontent.com/Acure-io/acure-agent/main/manifests/acure-agent/acure-agent.yaml -o monq-agent.yaml 

envsubst < monq-agent.yaml | kubectl apply -f -
```
It also creates ClusterRole, ClusterRoleBinding, ServiceAccount and Secret for token.