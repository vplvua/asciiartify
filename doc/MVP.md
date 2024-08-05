# Demo AsciiArtify Application

This file describes the process of creating a cluster using k3d, installing Argo CD, and deploying a demo AsciiArtify application.

![Run AsciiArtify in cluster](./asciiartify.gif)

![AutoSync in ArgoCD](./sync.gif)

## Creating the Cluster

Create a cluster using k3d:

```
k3d cluster create argo
```

Verify the cluster status:

```
kubectl cluster-info
kubectl version
kubectl get all -A
```

## Installing Argo CD

Create a namespace and install Argo CD:

```
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
```

Check the deployment status:

```
kubectl get all -n argocd
kubectl get pod -n argocd -w
```

## Configuring Argo CD UI

Retrieve the initial admin password:

```
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

Set up port forwarding:

```
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

## Creating an Application in Argo CD

Create a new application in the Argo CD UI with the following parameters:

- Application Name: demo
- Project Name: default
- Sync Options: AUTO-CREATE NAMESPACE
- Repository URL: https://github.com/den-vasyliev/go-demo-app
- Path: helm
- Cluster URL: select local cluster
- Namespace: demo

After creation, synchronize the application.

## Verifying the AsciiArtify Application

1. Set up port forwarding:

   ```
   kubectl port-forward -n demo svc/ambassador 8081:80
   ```

2. Check the application:

   ```
   curl localhost:8081
   ```

   This will return the application version.

3. Upload an image to convert to ASCII art:
   ```
   curl -F 'image=@/path/to/image.png' localhost:8081/img/
   ```
   The result will be displayed in the console.

This demo application converts graphical images to ASCII art.
