# Analysis of tools for deploying Kubernetes clusters in a local environment

This document examines three popular single-node Kubernetes management tools: [minikube](https://minikube.sigs.k8s.io/docs/), [kind](https://kind.sigs.k8s.io/), and [k3d](https://k3d.io/v5.7.2/).

## minicube

minikube quickly sets up a local Kubernetes cluster on macOS, Linux, and Windows.

Highlights:

- Supports the latest Kubernetes release (+6 previous minor versions)
- Cross-platform (Linux, macOS, Windows)
- Deploy as a VM, a container, or on bare-metal
- Multiple container runtimes (CRI-O, containerd, docker)
- Direct API endpoint for blazing fast image load and build
- Advanced features such as LoadBalancer, filesystem mounts, FeatureGates, and network policy
- Addons for easily installed Kubernetes applications
- Supports common CI environments

The primary goal of minikube is to make it simple to run Kubernetes locally, for day-to-day development workflows and learning purposes. Here are the guiding principles for minikube, in rough priority order:

1. Inclusive and community-driven
2. User-friendly
3. Support all Kubernetes features
4. Cross-platform
5. Reliable
6. High Performance
7. Developer Focused

Here are some specific minikube features:

- Single command setup and teardown UX
- Support for local storage, networking, auto-scaling, load balancing, etc.
- Unified UX across operating systems
- Minimal dependencies on third party software
- Minimal resource overhead

## kind

kind is a tool for running local Kubernetes clusters using Docker container “nodes”.
kind was primarily designed for testing Kubernetes itself, but may be used for local development or CI.

- kind supports multi-node (including HA) clusters
- kind supports building Kubernetes release builds from source
- support for make / bash or docker, in addition to pre-published builds
- kind supports Linux, macOS and Windows
- kind is a CNCF certified conformant Kubernetes installer

kind does not require kubectl

## k3d

k3d is a lightweight wrapper to run k3s (Rancher Lab’s minimal Kubernetes distribution) in docker.

k3d makes it very easy to create single- and multi-node k3s clusters in docker, e.g. for local development on Kubernetes.

Uses k3s instead of standard Kubernetes. This means it inherits k3s’s pros and cons.

Nodes of a k3d cluster are docker containers running a k3s image.
All Nodes of a k3d cluster are part of the same docker network.

VSCode Extension

## Comparison table

|                     | minikube                                                            | kind                                                                                                               | k3d                                                                       |
| ------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------- |
| 1                   | 2                                                                   | 3                                                                                                                  | 4                                                                         |
| Current vsion       | `v1.33.1`                                                           | `v0.23.0`                                                                                                          | `v5.7.2`                                                                  |
| System requirements | 2 CPUs or more, 2GB of free memory, 20GB of free disk space, Docker | go 1.16+, Docker                                                                                                   | Docker, kubectl                                                           |
| Disadvantages       | Requires a lot of resources                                         | Container simulation lacks OS-level isolation, sharing the host’s kernel, which can complicate OS-specific testing | Stripped-down operating system (sans glibc), unique installation approach |
| Advantages          | A lot of add-ons                                                    | Quick starts and a familiar Docker environment                                                                     | incredibly fast setup times                                               |
| Image size          | 1.26 Gb                                                             | 974 MB                                                                                                             | 287 MB                                                                    |
| Start time          | 23s                                                                 | 22s                                                                                                                | 9s                                                                        |
| Memory Usage        | 611.3MiB                                                            | 672Mib                                                                                                             | 417MiB                                                                    |

## Conclusion

k3d launches clusters faster than Minikube because k3d is optimised to create clusters quickly with fewer resources.
For test isolation at the operating system level, the minikube VM Driver is simply brilliant.

If speed is important, then definitely k3d. If you need to get closer to the real work environment, then choose minikube.
