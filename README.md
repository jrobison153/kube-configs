# Purpose

1. Provide a series of scripts to help configure a kubernetes cluster
1. Provide Helm chart examples on how to create secured isolated teams using Istio

# Prerequisites

## Install Required Software
1. Install [minikube](https://kubernetes.io/docs/tasks/tools/install-minikube/)
1. Install [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
1. Install [Helm](https://docs.helm.sh/using_helm/#installing-helm)
1. Install [Istio](https://istio.io/docs/setup/kubernetes/download-release/) 

## Configure Env

It's recommended that you update your .bash_profile or .bashrc

### Set ISTIO_HOME

```bash
export ISTIO_HOME=<path to istio install>
```

# Layout

`istio` - Scripts to install and uninstall istio from the cluster
`alpha` - Helm charts showing how to create a secure isolated team
`user` - Scripts to create RBAC user accounts and add them to minikube as users