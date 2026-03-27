# Kubernetes Lab — Deployment, Service, ConfigMap, and Secret

## Overview

This lab demonstrates how to deploy a scalable nginx application on Kubernetes using:

- Deployment (to manage Pods)
- Service (to expose the application)
- ConfigMap (to manage non-sensitive configuration)
- Secret (to manage sensitive data)

---

## Architecture

User → Service (NodePort) → Load Balancer → Pods (nginx)

---

## Concepts Covered

### Deployment
- Maintains the desired number of Pods
- Automatically recreates failed Pods
- Supports rolling updates

### Service (NodePort)
- Exposes the application externally
- Distributes traffic across Pods

### ConfigMap
- Stores non-sensitive configuration
- Can be injected as files into containers
- Can be used to customize application behavior

### Secret
- Stores sensitive data such as passwords
- Can be injected into containers as environment variables
- Helps avoid hardcoding sensitive values in YAML files

---

## Steps Performed

### 1. Create Deployment
- Created 3 nginx Pods
- Managed them with a Kubernetes Deployment

### 2. Expose Service
- Created a NodePort Service
- Made the application accessible from the browser

### 3. Create ConfigMap
- Stored custom HTML content in a ConfigMap
- Mounted it into the nginx container

### 4. Create Secret
- Stored a database password in a Secret
- Injected it into the container as an environment variable

### 5. Update Deployment
- Mounted the ConfigMap as a volume
- Injected the Secret into the container
- Verified the application still worked correctly

---

## Access Application

Run:

```bash
kubectl get services
```

Open in browser:

```text
http://localhost:<NodePort>
```

---

## Result

The web page displays:

```text
Hello from ConfigMap
```

Inside the container:

```bash
echo $DB_PASSWORD
```

Output:

```text
mysecret123
```

---

## Verification

```bash
for i in {1..10}; do curl http://localhost:<NodePort>; echo ""; done
```

---

## Cleanup

```bash
kubectl delete -f nginx-deployment.yaml
kubectl delete -f nginx-service.yaml
kubectl delete -f nginx-config.yaml
kubectl delete secret db-secret
```

---

## Key Learnings

- Pods are ephemeral and managed by Deployments
- Services provide stable access and load balancing
- ConfigMaps manage non-sensitive configuration
- Secrets handle sensitive data better than plain text in manifests
- Incorrect ConfigMap keys can break Pod startup
- Kubernetes maintains application availability during failures

---

## Real DevOps Insight

This lab demonstrates real-world practices:

- Infrastructure is defined declaratively using YAML
- Configuration and secrets are separated from application code
- Applications are scalable and fault-tolerant
- Sensitive data should not be hardcoded
- Debugging Kubernetes errors is a critical DevOps skill