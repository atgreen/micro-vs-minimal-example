# Minimal vs Micro
> An anecdotal comparison between UBI9 minimal- and micro-based application containers

This repo contains a `Makefile` to build spring3-based application
container images using both minimal- and micro-based UBI base images.

The final applications function identically, however Aqua's trivy scanner
flags 72% fewer "medium" CVEs and 55% fewer "low" CVEs in the micro
variant (as of the day of scanning).

```
spring-petclinic-ubi9-minimal (redhat 9.4)
==================================
Total: 76 (UNKNOWN: 0, LOW: 51, MEDIUM: 25, HIGH: 0, CRITICAL: 0)


spring-petclinic-ubi9-micro (redhat 9.4)
========================================
Total: 30 (UNKNOWN: 0, LOW: 23, MEDIUM: 7, HIGH: 0, CRITICAL: 0)
```

Micro UBI images are built in multiple stages, and only contain the
packages that are absolutely required to run your program.  They exen
exclude RPM and related packages that are not normally required at
runtime.
