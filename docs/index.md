# Trusted Application Pipeline Software Template

This application, **python-rcbpsgfr**, was created from a Trusted Application Pipeline Software Template.

The software templates create a new source and gitops deployment repositories with a sample source application. 

## Repositories

The source code for your application can be found in [https://github.com/rhtap-test-organization-jk/python-rcbpsgfr ](https://github.com/rhtap-test-organization-jk/python-rcbpsgfr ).
 
The gitops repository, which contains the kubernetes manifests for the application can be found in 
[https://github.com/rhtap-test-organization-jk/python-rcbpsgfr-gitops ](https://github.com/rhtap-test-organization-jk/python-rcbpsgfr-gitops ) 

## Application namespaces 

The default application will be found in the following namespaces. Applications can be deployed into unique namespaces or multiple software templates can also bet generated into the same group namespaces.  

|  Namespace   |  Description   |  
| -------- | -------- |
| **tssc-app-ci** | The namespace used for CI workloads |
| **tssc-app-development** | The default application during development. Every build will be deployed to this namespace for testing. |
| **tssc-app-stage** | The staging namespace for this application. Promotion from development to stage is manual via an update to the [gitops repository](https://github.com/rhtap-test-organization-jk/python-rcbpsgfr-gitops ) in the components/python-rcbpsgfr/overlays/stage directory |
| **tssc-app-prod** | The production namespace for this application. Promotion from stage to production is manual via an update to the [gitops repository](https://github.com/rhtap-test-organization-jk/python-rcbpsgfr-gitops ) in the components/python-rcbpsgfr/overlays/prod directory |