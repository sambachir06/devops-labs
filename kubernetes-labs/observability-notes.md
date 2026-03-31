Observability Lab (Logs & Metrics)

Goal

Understand how to monitor application behavior using logs and metrics.

Key Concepts
	•	Logs = events (what happened)
	•	Metrics = performance (CPU, memory, load)

Commands Used

kubectl top pods
kubectl logs -f 

Experiment
	•	Generated traffic using a load generator
	•	Observed CPU increase using metrics
	•	Observed repeated HTTP requests in logs

Key Takeaways
	•	kubectl get pods is not enough in production
	•	Metrics show system pressure
	•	Logs show system activity
	•	Each Pod has its own logs
	•	Multiple Pods require log aggregation in real environments

Notes
	•	Logs must be checked per Pod
	•	Metrics help detect load even without errors
	•	Observability requires both logs and metrics together