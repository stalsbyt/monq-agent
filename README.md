# Monq-agent

Repo contains:
- Dockerfile to build the Monq-agent image
- Helm chart to install Monq-agent (see the [chart Readme](charts/monq-agent/README.md) for more info about installation)
- Manifest for manual setup Monq-agent on Kubernetes  (see the [Readme](manifests/monq-agent/readme.md) for more details)

You can install the Monq-agent using Helm:
```bash
kubectl create namespace monq

helm install monq-agent -n monq oci://acureio.azurecr.io/charts/monq-agent \
--set config.baseUri="https://monq.mydomain.com" --set config.apiKey="<my coordinator key>"
```

or by applying the manifest manually:
```bash
export MONQ_URI="https://monq.mydomain.com"
export MONQ_KEY="<my coordinator key>"

curl https://raw.githubusercontent.com/Acure-io/acure-agent/main/manifests/acure-agent/acure-agent.yaml -o monq-agent.yaml 

envsubst < monq-agent.yaml | kubectl apply -f -
```