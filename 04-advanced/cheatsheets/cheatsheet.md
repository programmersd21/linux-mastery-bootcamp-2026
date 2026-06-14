# Phase 4: Advanced Engineering Cheatsheet

## Terraform

| Command | Description |
|---------|-------------|
| terraform init | Initialize working directory |
| terraform plan | Preview changes |
| terraform apply | Execute changes |
| terraform destroy | Remove all resources |
| terraform state list | List managed resources |
| terraform state show resource | Show resource details |
| terraform state rm resource | Remove from state |
| terraform import resource.id | Import existing resource |
| terraform taint resource | Force recreation |
| terraform workspace list | List workspaces |
| terraform workspace select name | Switch workspace |
| terraform workspace new name | Create workspace |

## Ansible

| Command | Description |
|---------|-------------|
| ansible-playbook -i hosts site.yml | Run playbook |
| ansible -m ping all | Test connectivity |
| ansible-vault create secrets.yml | Create encrypted file |
| ansible-vault edit secrets.yml | Edit encrypted file |
| ansible-vault view secrets.yml | View encrypted file |
| ansible-galaxy init role_name | Create role structure |
| ansible-doc -l | List modules |
| ansible all -a "uptime" | Run ad-hoc command |
| ansible all -m shell -a "cmd" | Run shell command |

## Docker

| Command | Description |
|---------|-------------|
| docker build -t name:tag . | Build image |
| docker run -d --name c -p 80:80 image | Run container |
| docker exec -it c /bin/sh | Enter container |
| docker system prune -a | Remove unused data |
| docker-compose up -d --build | Build and start stack |
| docker push registry/image:tag | Push to registry |
| docker network create net | Create network |
| docker volume create vol | Create volume |
| docker inspect container | Show container details |
| docker logs -f container | Follow logs |

## Kubernetes

| Command | Description |
|---------|-------------|
| kubectl get pods,svc,nodes | List resources |
| kubectl apply -f manifest.yml | Apply manifest |
| kubectl logs -f pod --previous | Previous container logs |
| kubectl describe pod | Detailed pod info |
| kubectl port-forward svc 8080:80 | Local port forwarding |
| kubectl top pod,node | Resource usage |
| helm install release chart | Install Helm chart |
| helm upgrade --install release chart | Upgrade or install |
| helm template chart | Render templates |
| helm lint chart | Validate chart |
| helm rollback release 1 | Rollback to revision |

## Prometheus

| Query | Description |
|-------|-------------|
| rate(metric[5m]) | Per-second rate over 5 minutes |
| increase(metric[1h]) | Total increase over 1 hour |
| histogram_quantile(0.99, rate()) | 99th percentile |
| up | Target health (1=up, 0=down) |
| node_cpu_seconds_total | CPU time per mode |
| alertmanager | Alert routing and grouping |
| promtool check rules file.yml | Validate rules |

## Performance

| Command | Description |
|---------|-------------|
| perf record -g ./prog | Record with call graphs |
| perf report | Interactive report |
| flamegraph.pl out.folded > out.svg | Generate flame graph |
| strace -c -p PID | Syscall statistics |
| strace -e trace=open,read ./prog | Trace specific syscalls |
| ltrace -e malloc ./prog | Trace library calls |
| iostat -x 1 | Extended I/O statistics |
| vmstat 1 | Virtual memory statistics |
| pidstat 1 | Per-process statistics |
| fio --name=test --direct=1 | I/O benchmark |
| valgrind --leak-check=full ./prog | Memory leak detection |

## Gotchas

- Terraform state conflicts: use remote backend with locking (S3+DynamoDB)
- Docker layers cache: order Dockerfile by change frequency
- Prometheus retention: default 15 days; plan storage accordingly
- Ansible facts caching: speeds up large inventories
- perf requires debug symbols for useful output
- Kubernetes: always set resource limits to prevent cluster starvation
