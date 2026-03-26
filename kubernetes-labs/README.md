# Kubernetes Lab — Deployment, Service, and ConfigMap

## Overview

This lab demonstrates how to deploy a scalable nginx application on Kubernetes using:

* Deployment (to manage Pods)
* Service (to expose the application)
* ConfigMap (to manage configuration)

---

## Concepts Covered

### 1. Deployment

Manages application Pods and ensures:

* Desired number of replicas are running
* Automatic recovery if a Pod fails
* Rolling updates

### 2. Service (NodePort)

Provides network access to the application:

* Exposes Pods externally
* Load balances traffic across Pods

### 3. ConfigMap

Stores configuration outside the container:

* Injected into Pods
* Used to dynamically update application behavior

---

## Architecture

User → Service (NodePort) → Load Balancer → Pods (nginx)

---

## Steps Performed

### 1. Create Deployment

* 3 replicas of nginx Pods
* Managed by Kubernetes Deployment

### 2. Expose Service

* NodePort service created
* Accessible via browser

### 3. Create ConfigMap

* Stores custom HTML content

### 4. Mount ConfigMap

* ConfigMap mounted as a file inside Pods
* Replaces default nginx index.html

---

## Access Application

Run:

```
kubectl get services
```

Open in browser:

```
http://localhost:<NodePort>
```

---

## Result

All Pods serve:

```
Hello from ConfigMap
```

---

## Verification

Test load balancing:

```
for i in {1..10}; do curl http://localhost:<NodePort>; echo ""; done
```

---

## Cleanup

```
kubectl delete -f nginx-deployment.yaml
kubectl delete -f nginx-service.yaml
kubectl delete -f nginx-config.yaml
```

---

## Key Learnings

* Pods are ephemeral and independent
* Services provide stable access and load balancing
* ConfigMaps decouple configuration from application
* Manual changes inside Pods are not persistent
* Kubernetes ensures desired state automatically

---

## Real DevOps Insight

This lab demonstrates a production pattern:

* Infrastructure is declarative (YAML)
* Configuration is externalized (ConfigMap)
* Applications are scalable and fault-tolerant
* Changes are version-controlled via GitHub
