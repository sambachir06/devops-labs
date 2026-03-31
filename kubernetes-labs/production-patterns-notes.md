Production Patterns Lab (Resilience)

Goal

Understand how systems behave when a dependency becomes unavailable and why resilience patterns are required.

Scenario
	•	Created a backend Pod (slow-app)
	•	Exposed it as a Service
	•	Verified connectivity from a client Pod
	•	Deleted the backend Pod
	•	Attempted to access the Service again

Observations
	•	Service DNS still resolved
	•	Request failed with: “Connection refused”
	•	No backend Pod available behind the Service

Key Concepts
	•	Services provide stable networking even if Pods change
	•	Pod failure does not remove the Service
	•	Clients may still attempt to connect to unavailable backends

Production Risks
	•	Requests fail when dependencies are unavailable
	•	Systems may repeatedly attempt failed connections
	•	Without control, failures can cascade

Resilience Patterns
	•	Timeout → prevent waiting indefinitely
	•	Retry → attempt recovery from temporary failures
	•	Circuit Breaker → stop sending requests to failing services

Key Takeaways
	•	Service availability ≠ application availability
	•	Systems must be designed to handle failure
	•	Resilience patterns protect system stability