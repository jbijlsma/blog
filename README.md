# Getting Started

The setup assumes k8s-certs, setup.sh was run already. This created a KinD cluster with istio (including the istio gateway) and a valid wildcard certificates for *.dotnet-works.com.  

Run ./build_and_push_images_local.sh. This builds images for all the blog app components, tags them and finally pushes them to the local KinD registry (locahost:5001/).  

Next deploy the app to the local KinD cluster.  

First create a blog namespace if it doesn't exist yet:

```
kubectl create namespace blog
```

Then run the helm upgrade command:

```
cd infra/k8s
helm upgrade blog-release . --install --namespace blog
```

To install the blog app in a different namespace update the Namespace in infra/k8s/helm/values.yaml and run the helm upgrade command with that namespace.   

Finally, update your /etc/hosts file. Add an entry for:  

blog-local.dotnet-works.com pointing to 127.0.0.1  

# Cleanup

To delete the blog app run:

```
cd infra/k8s
helm delete blog-release --namespace blog
```