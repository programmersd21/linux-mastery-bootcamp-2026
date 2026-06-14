# Track A: DevOps/Cloud

Duration: 4 weeks. Certificate: DevOps Cloud Specialist.

## Skill Map

Linux Foundation -> Containerization -> Orchestration -> Cloud Native
- systemd, networking, storage
- Docker, Kubernetes, Helm
- Terraform, Ansible
- GitOps, service mesh, SRE practices

## Weekly Breakdown

### Week 21: Kubernetes Deep Dive

Deploy a production-grade cluster with deployments, services, ingress.

Topics: Pods, Deployments, ReplicaSets, DaemonSets, Services (ClusterIP, NodePort, LoadBalancer), Ingress, ConfigMaps, Secrets, resource limits, pod disruption budgets.

Project milestone: Deploy 3-tier app (frontend, API, database) on Kubernetes.

### Week 22: Helm and Operators

Build reusable Helm charts and custom operators.

Topics: Helm chart structure, templating, values files, hooks, Operator SDK, CRDs.

Project milestone: Package 3-tier app as Helm chart with dev/staging/prod values.

### Week 23: GitOps and Service Mesh

Implement GitOps workflow with service mesh observability.

Topics: GitOps principles, ArgoCD, automatic sync, drift detection, Istio/Linkerd, mTLS, traffic splitting, canary deployments.

Project milestone: Implement canary deployments with automatic rollback.

### Week 24: Cloud Platforms and SRE

Build multi-cloud infrastructure with SRE practices.

Topics: AWS/GCP/Azure fundamentals, Terraform modules, cost optimization, SLOs, SLIs, error budgets, incident response.

Project milestone: Deploy application to cloud provider with auto-scaling.

## Final Project: Cloud-Native Platform

Requirements:
1. Terraform for multi-cloud infrastructure
2. EKS/GKE/AKS cluster with node pools
3. Microservices with Helm charts
4. ArgoCD with automatic sync
5. Istio with mTLS and traffic management
6. Prometheus, Grafana, Jaeger
7. Pod security policies, network policies
8. Architecture diagram, runbook, post-mortem template

## Tool Stack

| Category | Tools |
|----------|-------|
| Orchestration | Kubernetes, kubectl, k9s |
| Packaging | Helm, Kustomize |
| GitOps | ArgoCD, Flux |
| Service Mesh | Istio, Linkerd |
| IaC | Terraform, Pulumi |
| Cloud | AWS CLI, gcloud, az |
| Monitoring | Prometheus, Grafana, Jaeger |
| CLI | kubectx, kubens, stern |

## Resources

- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Helm Documentation](https://helm.sh/docs/)
- [ArgoCD Documentation](https://argo-cd.readthedocs.io/)
- [Istio Documentation](https://istio.io/latest/docs/)
- [Google SRE Book](https://sre.google/sre-book/table-of-contents/)

## Career Path

Junior DevOps Engineer -> DevOps Engineer -> Senior DevOps -> Platform Engineer -> SRE -> Staff Engineer
$75K -> $105K -> $135K -> $155K -> $175K -> $200K+
