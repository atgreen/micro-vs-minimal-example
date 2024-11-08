# Minimal vs Micro
> A comparison of UBI9 minimal- and micro-based application containers

This repository includes a Makefile to build Spring 3-based
application container images using both minimal and micro UBI base
images.

While the final applications operate identically, Aqua’s Trivy scanner
reports significantly fewer vulnerabilities in the micro variant: 72%
fewer "medium" and 55% fewer "low" CVEs (as of the latest scan).> An
anecdotal comparison between UBI9 minimal- and micro-based application
containers

```less
spring-petclinic-ubi9-minimal (redhat 9.4)
==================================
Total: 76 (UNKNOWN: 0, LOW: 51, MEDIUM: 25, HIGH: 0, CRITICAL: 0)


spring-petclinic-ubi9-micro (redhat 9.4)
========================================
Total: 30 (UNKNOWN: 0, LOW: 23, MEDIUM: 7, HIGH: 0, CRITICAL: 0)
```

Micro UBI images are built through multi-stage builds, including only
the essential packages required to run the application. They exclude
RPM and other packages that are typically unnecessary at runtime,
reducing the potential security footprint.
