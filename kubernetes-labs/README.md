Kubernetes Lab — Deployment, Service, ConfigMap, and Secret

Overview

This lab demonstrates how to deploy a scalable nginx application on Kubernetes using:
	•	Deployment (to manage Pods)
	•	Service (to expose the application)
	•	ConfigMap (to manage non-sensitive configuration)
	•	Secret (to manage sensitive data)

⸻

Architecture

User → Service (NodePort) → Load Balancer → Pods (nginx)

⸻

Concepts Covered

Deployment
	•	Maintains desired number of Pods
	•	Automatically recreates failed Pods
	•	Supports rolling updates

Service (NodePort)
	•	Exposes application externally
	•	Distributes traffic across Pods

ConfigMap
	•	Stores non-sensitive configuration
	•	Injected as files into containers
	•	Used to customize application behavior

Secret
	•	Stores sensitive data (e.g., passwords)
	•	Injected into containers as environment variables
	•	Avoids hardcoding secrets in YAML files

⸻

Steps Performed

1. Create Deployment
	•	3 nginx Pods
	•	Managed by Kubernetes

2. Expose Service
	•	NodePort created
	•	Accessible via browser

3. Create ConfigMap
	•	Stores custom HTML (index.html)
	•	Mounted into nginx container

4. Create Secret
	•	Stores database password (DB_PASSWORD)
	•	Injected as environment variable

5. Update Deployment
	•	Mount ConfigMap as volume
	•	Inject Secret into container

⸻

Access Application
        kubectl get services
        
Open in browser:
        http://localhost:<NodePort>

Result
	•	Web page displays:
        Hello from ConfigMap

    •   Inside container:
        echo $DB_PASSWORD

    •	Output:  
        mysecret123

Verification
        for i in {1..10}; do curl http://localhost:<NodePort>; echo ""; done

Cleanup
        kubectl delete -f nginx-deployment.yaml
        kubectl delete -f nginx-service.yaml
        kubectl delete -f nginx-config.yaml
        kubectl delete secret db-secret

Key Learnings
	•	Pods are ephemeral and managed by Deployments
	•	Services provide stable access and load balancing
	•	ConfigMaps manage non-sensitive configuration
	•	Secrets handle sensitive data securely (better than plain text)
	•	Incorrect ConfigMap keys can break Pod startup
	•	Kubernetes maintains application availability during failures

Real DevOps Insight

This lab demonstrates real-world practices:
	•	Infrastructure is defined declaratively using YAML
	•	Configuration and secrets are separated from application code
	•	Applications are scalable and fault-tolerant
	•	Sensitive data should never be hardcoded
	•	Debugging Kubernetes errors is a critical DevOps skill
