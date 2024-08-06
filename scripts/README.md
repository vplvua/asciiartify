# kubeplugin

`kubeplugin` is a kubectl plugin that provides a quick and easy way to retrieve and display resource usage statistics for Kubernetes objects.

## Features

- Retrieve CPU and memory usage for pods, nodes, or other supported resources
- Output data in a easy-to-read CSV-like format
- Simple command-line interface

## Installation

1. Ensure you have `kubectl` installed and configured to interact with your Kubernetes cluster.

2. Download the `kubeplugin` script:

   ```
   curl -LO https://raw.githubusercontent.com/vplvua/asciiartify/main/scripts/kubeplugin
   ```

3. Make the script executable:

   ```
   chmod +x kubeplugin
   ```

4. Move the script to a directory in your PATH:

   ```
   sudo mv kubeplugin /usr/local/bin/
   ```

## Usage

The basic syntax for using the plugin is:

```
kubeplugin <namespace> <resource_type>
```

Where:

- `<namespace>` is the Kubernetes namespace you want to query
- `<resource_type>` is the type of resource (e.g., pods, nodes)

### Examples

1. Get resource usage for pods in the default namespace:

   ```
   kubeplugin default pods
   ```

2. Get resource usage for nodes in all namespaces:

   ```
   kubeplugin all nodes
   ```

3. Get resource usage for pods in a specific namespace:

   ```
   kubeplugin kube-system pods
   ```

## Output

The plugin outputs data in the following format:

```
Resource_Type, Namespace, Name, CPU, Memory
```

For example:

```
pods, kube-system, coredns-6799fbcd5-gpwjl, 5m, 22Mi
pods, kube-system, local-path-provisioner-6f5d79df6-2r844, 1m, 8Mi
pods, kube-system, metrics-server-54fd9b65b-j4lbv, 12m, 24Mi
pods, kube-system, svclb-traefik-62cad403-r24rp, 0m, 2Mi
pods, kube-system, traefik-7d5f6474df-7zs9v, 1m, 37Mi
```

## Troubleshooting

If you encounter any issues:

1. Ensure that `kubectl` is properly configured and can connect to your cluster.
2. Check that you have the necessary permissions to view resource usage in the specified namespace.
3. Verify that the `kubectl top` command is available in your version of kubectl.
