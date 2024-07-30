# ASCIIArtify

ASCIIArtify is a React-based web application that transforms images into ASCII art.

## Prerequisites

Before you begin, ensure you have met the following requirements:

1. You have installed Node.js (version 22.5.1 or later)
2. You have installed Docker and Make

## Installation

To install ASCIIArtify, follow these steps:

### Clone the repository:

```
git clone https://github.com/vplvua/asciiartify.git
```

### Navigate to the project directory:

```
cd asciiartify
```

### Install the dependencies:

```
npm ci
```

## Using ASCIIArtify

To use ASCIIArtify, follow these steps:

### To run the app in development mode:

```
npm start
```

Open http://localhost:3000 to view it in the browser.

### To build the app for production:

```
npm run build
```

### To run tests:

```
npm test
```

## Docker

To build and run the Docker image:

### Build the image:

```
make image
```

### Run the container:

```
make run
```

The app will be available at http://localhost:8080.

## Deployment

This project is set up for deployment to Kubernetes. The `deployment.yaml` and `service.yaml` files in the root directory define the Kubernetes resources.

To deploy:

### Ensure you have kubectl configured to communicate with your Kubernetes cluster.

### Apply the Kubernetes configurations:

```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml`
```
