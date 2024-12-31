# Steps
1. Created the Dockerfile.
2. Build the CI pipeline to build the Docker Image and to push that on Docker Hub and to update the Image tag in Helm folder.
3. Created secrets to store Docker-Hub username, password and Github Token to use the repository by the runner.
4. Created the Helm chart for the manifest files.
5. Configured ArgoCD for continues delivery of the application by created this ArgoCD application yaml file.
```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: argocd-app
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/Helion55/Accuknox_Assessment.git
    targetRevision: HEAD
    path: Wisecow-App/helm/wisecow-chart/templates
  destination: 
    server: https://kubernetes.default.svc
    namespace: wisecow
  syncPolicy:
    syncOptions:
    - CreateNamespace=true
    automated:
      selfHeal: true
      prune: true
```
6. Implemented SSL using Cert Manager and Lets Encrypt on my Minikube cluster.
7. Appended on my /etc/hosts file, application ip and a local domain named wisecow.com
