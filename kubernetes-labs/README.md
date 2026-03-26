## Kubernetes Lab — Deployment, Service, and ConfigMap

## Overview

This lab demonstrates how to deploy a scalable nginx application on Kubernetes using:

* Deployment (to manage Pods)
* Service (to expose the application)
* ConfigMap (to manage configuration)

---

## Architecture

User → Service (NodePort) → Load Balancer → Pods (nginx)

---

## Concepts Covered

### Deployment

* Maintains desired number of Pods
* Automatically recreates failed Pods
* Supports rolling updates

### Service (NodePort)

* Exposes application externally
* Distributes traffic across Pods

### ConfigMap

* Stores configuration outside containers
* Injects data into Pods
* Enables dynamic updates without rebuilding images

---

## Steps Performed

### 1. Create Deployment

* 3 nginx Pods
* Managed by Kubernetes

### 2. Expose Service

* NodePort created
* Accessible via browser

### 3. Create ConfigMap

* Stores custom HTML response

### 4. Mount ConfigMap

* Overrides default nginx page
* Ensures all Pods serve the same content

---

## Access Application

```bash
kubectl get services
```

Open in browser:

```text
http://localhost:<NodePort>
```

---

## Result

All Pods return:

```text
Hello from ConfigMap
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
```

---

## Key Learnings

* Pods are ephemeral and independent
* Services provide stable access and load balancing
* ConfigMaps separate configuration from application
* Manual changes inside Pods are not persistent
* Kubernetes enforces desired state automatically

---

## Real DevOps Insight

This lab reflects a real-world pattern:

* Infrastructure defined as code (YAML)
* Configuration externalized (ConfigMap)
* Applications are scalable and resilient
* Everything is version-controlled in GitHub

