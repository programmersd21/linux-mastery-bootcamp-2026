# Phase 4: Advanced Engineering

Duration: 5 weeks. Goal: architecture-level system design and automation.

## Learning Goals

1. Design and implement infrastructure as code
2. Master containerization and orchestration fundamentals
3. Build CI/CD pipelines
4. Implement configuration management at scale
5. Design monitoring and observability systems
6. Optimize system performance and troubleshoot complex issues

## Exit Criteria

- Write Terraform configuration for multi-server deployment
- Build and optimize Docker images for production
- Design CI/CD pipeline with automated testing
- Configure Prometheus/Grafana monitoring stack
- Diagnose performance bottleneck using kernel tools

## Weekly Breakdown

### Week 16: Infrastructure as Code

**Core topics:**
- Terraform: providers, resources, state, modules
- Ansible: playbooks, roles, inventory, vault
- Cloud-init for initial provisioning
- Git workflows for infrastructure

**Mental model:** Terraform is a blueprint. The state file is a photograph of what was built. Modules are reusable components. Ansible is the robot that assembles the pieces. Git is version control for the blueprints.

**Labs:**
- Lab 16.1: Terraform Basics
- Lab 16.2: Ansible Playbooks
- Lab 16.3: Multi-Environment

**Real-world scenario:** New datacenter region. Design network topology, automate deployment, configure VPN, establish monitoring, document runbooks.

**Checkpoint:**
- Explain Terraform state file importance and locking mechanism
- Write Ansible role handling both Debian and RHEL families
- Debug "resource already exists" Terraform error

---

### Week 17: Containerization

**Core topics:**
- Docker architecture: images, layers, storage drivers, networking
- Dockerfile best practices: multi-stage, minimal base, non-root
- Container security: seccomp, capabilities, AppArmor profiles
- Docker Compose for local development

**Mental model:** Namespaces provide isolation, cgroups provide resource limits, union filesystem provides layers. Layer bloat, running as root, secrets in layers, and image vulnerabilities are common failure modes.

**Labs:**
- Lab 17.1: Dockerfile Mastery
- Lab 17.2: Container Security
- Lab 17.3: Compose Stacks

**Real-world scenario:** Migrate legacy application to containers. Analyze dependencies, create Dockerfile, optimize build time, establish base image update process.

**Checkpoint:**
- Explain difference between CMD and ENTRYPOINT with examples
- Debug container that exits immediately with no logs
- Configure container networking for cross-host communication

---

### Week 18: CI/CD Pipelines

**Core topics:**
- GitLab CI/GitHub Actions/Jenkins architecture
- Pipeline stages: build, test, security scan, deploy
- Artifact management and promotion
- GitOps deployment patterns

**Labs:**
- Lab 18.1: GitHub Actions
- Lab 18.2: GitOps Workflow
- Lab 18.3: Blue-Green Deploy

**Real-world scenario:** Establish deployment pipeline for microservices. Blue-green deployment, automated rollback on health check failure, notification to team.

**Checkpoint:**
- Design pipeline handling secrets without exposing them in logs
- Implement canary deployment with automated traffic shifting
- Debug pipeline that succeeds but deploys wrong artifact

---

### Week 19: Monitoring and Observability

**Core topics:**
- Metrics: Prometheus, exporters, PromQL
- Logging: ELK/Loki stack, structured logging
- Tracing: Jaeger/Tempo basics
- Alerting: Alertmanager, routing

**Labs:**
- Lab 19.1: Prometheus Stack
- Lab 19.2: Log Aggregation
- Lab 19.3: Alert Design

**Real-world scenario:** Production incident at 2 AM. On-call engineer receives alert, opens dashboard, correlates metrics and logs, identifies root cause, implements fix.

**Checkpoint:**
- Write PromQL query to detect memory leak trend
- Configure log-based alert triggering only on sustained errors
- Design dashboard telling system health story at a glance

---

### Week 20: Performance Engineering

**Core topics:**
- CPU profiling: perf, flame graphs
- Memory analysis: valgrind, pmap, smem
- I/O optimization: iostat, blktrace, fio
- Network tuning: ethtool, ss, tcpdump analysis

**Labs:**
- Lab 20.1: CPU Profiling
- Lab 20.2: Memory Analysis
- Lab 20.3: System Tuning

**Real-world scenario:** Black Friday preparation. Load test current infrastructure, identify bottlenecks, implement optimizations, validate with production-like load, establish monitoring.

**Checkpoint:**
- Generate and interpret CPU flame graph for hot path identification
- Explain difference between CPU-bound and I/O-bound optimization strategies
- Tune TCP stack for high-connection-count service

## Phase 4 Project: Cloud-Native Application

Deploy a complete microservices application with IaC, CI/CD, and monitoring:

1. Infrastructure: Terraform for AWS/GCP/Azure
2. Containers: Docker images for each service
3. CI/CD: GitHub Actions pipeline with tests and security scans
4. Deployment: Kubernetes or Docker Swarm
5. Monitoring: Prometheus + Grafana with custom dashboards
6. Logging: Centralized log aggregation
7. Alerting: Meaningful alerts with routing
8. Documentation: Architecture diagram and runbook

**Deliverables:** Live application URL, GitHub repo with all code, architecture diagram, performance benchmark report.

## Assessment

Before advancing to Phase 5, demonstrate:

- [ ] Write Terraform for multi-environment deployment with remote state
- [ ] Build Docker image under 50MB with multi-stage build
- [ ] Design CI/CD pipeline with automated testing
- [ ] Deploy Prometheus/Grafana with custom dashboards
- [ ] Generate and interpret CPU flame graph
- [ ] Implement GitOps with automatic sync
- [ ] Tune Linux kernel parameters for specific workload
- [ ] Document architecture decisions

## Resources

- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [Prometheus Documentation](https://prometheus.io/docs/)
- [Brendan Gregg's Blog](https://www.brendangregg.com/)
