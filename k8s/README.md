# Minikube Deployment

## Structure of plain manifests

```text
k8s/
├─ base/                   # Base manifests
│  ├─ core/                # Core service
│  │  ├─ deployment.yaml   # Deployment resource
│  │  └─ service.yaml      # Service resource
│  ├─ db/                  # Database
│  │  ├─ pvc.yaml          # Persistent Volume Claim resource
│  │  ├─ service.yaml      # Service resource
│  │  └─ stateful.yaml     # StatefulSet resource
│  ├─ front/               # Frontend service
│  │  ├─ deployment.yaml   # Deployment resource
│  │  └─ service.yaml      # Service resource
│  ├─ user/                # User service
│  │  ├─ deployment.yaml   # Deployment resource
│  │  └─ service.yaml      # Service resource
│  ├─ images-config.yaml   # ConfigMap for Docker images
│  ├─ ingress.yaml         # Ingress resource
│  ├─ network-policy.yaml  # Network policy resource
│  └─ rbac.yaml            # RBAC resources (ServiceAccount, Role, RoleBinding)
├─ overlays/               # Overlays for different environments (Kustomize)
│  ├─ dev/                 # Development environment
│  │  ├─ ingress.yaml      # Path to ingress resource
│  │  └─ kustomize.yaml    # Kustomize configuration
│  └─ prod/                # Production environment
│     └─ .gitkeep          # Git keep
└─ README.md               # README for k8s manifests
```

## Kustomize Overview

Kustomize is used in this project for customizing Kubernetes manifests without template language.
It helps us manage different environments and configurations.

### Key Features Used

1. **Base Configuration** (`/base`)

   - Common resources for all environments
   - RBAC configuration
   - Network policies
   - Service definitions

2. **Development Overlay** (`/overlays/dev`)

   - Environment-specific namespace
   - Common labels and annotations
   - Secret generation from env files
   - ConfigMap generation for nginx
   - Ingress configuration

### Usage

#### Apply dev environment

```bash
kubectl apply -k k8s/overlays/dev
```

#### View generated manifests

```bash
kubectl kustomize k8s/overlays/dev
```

#### Delete all resources

```bash
kubectl delete -k k8s/overlays/dev
```

### Benefits

- ✅ No duplication of manifests
- ✅ Easy environment management
- ✅ Automated secret handling
- ✅ Consistent labeling

## Local Development with Minikube

1. Start Minikube:

   ```bash
   minikube start --driver=docker --memory=2048 --cpus=2
   ```

2. Add addons:

   ```bash
   minikube addons enable ingress
   minikube addons enable metrics-server
   minikube addons enable dashboard
   ```

3. Launching a tunnel (in a separate terminal):

   ```bash
   minikube tunnel
   ```

   After the tunnel is launched, services will be available at the following addresses:

   - Frontend: <http://localhost/>
   - Core API: <http://localhost/api/core>
   - User API: <http://localhost/api/user>
   - Dashboard: <http://localhost/dashboard-k8s>
   - Database: localhost:35432

4. Apply manifests:

   ```bash
   kubectl apply -k k8s/overlays/dev
   ```

5. Get status resources:

   ```bash
   kubectl get all -n greencity
   ```

## Troubleshooting

### Checking the status of resources

- Checking the status of pods:

  ```bash
  kubectl get pods -n greencity
  kubectl describe pod <pod-name> -n greencity
  ```

- Checking the status of services:

  ```bash
  kubectl get svc -n greencity
  kubectl describe svc <service-name> -n greencity
  ```

- Checking the status of deployments:

  ```bash
  kubectl get deployments -n greencity
  kubectl describe deployment <deployment-name> -n greencity
  ```

### Viewing logs

- Logs for specific service:

  ```bash
  kubectl logs -f deployment/<deployment-name> -n greencity
  ```

- Logs for all pods:

  ```bash
  kubectl logs -f -l app=<app-name> -n greencity
  ```

- Logs for specific pod:

  ```bash
  kubectl logs -f <pod-name> -n greencity
  ```

### Resource cleaning

- Delete all resources in a namespace

  ```bash
  kubectl delete all --all -n greencity
  ```

- Delete PVC

  ```bash
  kubectl delete pvc --all -n greencity
  ```

- Complete cleaning:

  ```bash
  kubectl delete namespace greencity
  ```

  or

  ```bash
  minikube delete
  ```

### Debugging Services

- Checking nginx configuration:

  ```bash
  kubectl exec -it $(kubectl get pod -l app=front -n greencity -o jsonpath='{.items[0].metadata.name}') -n greencity -- cat /etc/nginx/conf.d/default.conf
  ```

- Checking environment variables:

  ```bash
  kubectl exec -it $(kubectl get pod -l app=<app-name> -n greencity -o jsonpath='{.items[0].metadata.name}') -n greencity -- env
  ```

- Direct connection to PostgreSQL:

  ```bash
  kubectl exec -it $(kubectl get pod -l app=db -n greencity -o jsonpath='{.items[0].metadata.name}') -n greencity -- psql -U <user-name> -d <database-name>
  ```

## NOTES

Якщо в майбутньому буде плануватися розширення (наприклад, мобільний додаток, API-шлюзи, окремий бекенд доступ), найкращим варіантом буде мати окремий Ingress для API-сервісів (`core`, `user`) та окремий для фронтендy `front`.

Рекомендований варіант:

- Frontend (`front`) -> `example.com`
- Backend API (`core`, `user`) -> `api.example.com`

Це дає гнучкість та можливість легко керувати доступом у майбутньому.

### DNS налаштування

Для налаштування локального DNS резолвінга:

```bash
# Увімкніть необхідні аддони
minikube addons enable ingress-dns
minikube addons enable ingress

# Налаштуйте DNS резолвер
./k8s/overlays/dev/scripts/config-local-dns.sh
```

Після цього ваші сервіси будуть доступні за адресами:

- Frontend: <http://greencity.local>
- Core API: <http://api.greencity.local/core/>
- User API: <http://api.greencity.local/user/>
