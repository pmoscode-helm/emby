# emby Helm Chart
![Version: 1.3.1](https://img.shields.io/badge/Version-1.3.1-informational?style=flat-square)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/emby)](https://artifacthub.io/packages/search?repo=emby)

From https://emby.media:
> Emby Server is a home media server built on top of other popular open source technologies such as Service Stack, jQuery, jQuery mobile, and .NET Core. It features a REST-based API with built-in documention to facilitate client development. We also have client libraries for our API to enable rapid development.

## Get Repo Info

    helm repo add my-emby https://pmoscode-helm.github.io/emby/
    helm repo update

## Install chart

    helm install [RELEASE_NAME] my-emby/emby

The command deploys emby on the Kubernetes cluster in the default configuration.

See configuration below.

See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation.

## Uninstall Chart

    helm uninstall [RELEASE_NAME]

This removes all the Kubernetes components associated with the chart and deletes the release.

See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation.

## Upgrading Chart

    helm upgrade [RELEASE_NAME] [CHART] --install

See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| additionalVolumeMounts | list | `[]` | mountpoint(s) of the additional volumes inside the container |
| additionalVolumes | list | `[]` | additional volume(s) to mount into the container |
| gid | int | `100` | the GID to run emby as |
| gidlist | int | `100` | a comma-separated list of additional GIDs to run emby as |
| image.pullPolicy | string | `"Always"` | pull policy |
| image.repository | string | `"emby/embyserver"` | repository with Emby image |
| image.tag | string | `""` | current version of the image. Default: Charts appVersion. |
| imagePullSecrets | list | `[]` | imagePullSecrets (not needed, if default image is used) |
| ingress | object | `{"annotations":{},"className":"","enabled":false,"hosts":[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}],"tls":[]}` | Configure ingress. |
| livenessProbe | object | `{"httpGet":{"path":"/","port":"http"}}` | liveness probe configuration |
| nfsMounts.enabled | bool | `false` | enable mounting of nfs exports |
| nfsMounts.mounts[0] | object | `{"capacity":"20Gi","exportPath":"/movies","mountPath":"/movies","name":"content","nfsServer":"xxx.xxx.xxx.xxx","readOnly":false}` | name of mount |
| nfsMounts.mounts[0].capacity | string | `"20Gi"` | desired capacity (usually not needed for nfs) |
| nfsMounts.mounts[0].exportPath | string | `"/movies"` | export path on nfs server |
| nfsMounts.mounts[0].mountPath | string | `"/movies"` | mount path on container |
| nfsMounts.mounts[0].nfsServer | string | `"xxx.xxx.xxx.xxx"` | ip or dns of nfs server |
| nfsMounts.mounts[0].readOnly | bool | `false` | mark mount as readonly |
| persistence.accessMode | string | `"ReadWriteOnce"` | storage access mode |
| persistence.enabled | bool | `false` | enable persistence? |
| persistence.existingClaim | string | `nil` | existing claim |
| persistence.size | string | `"20Gi"` | storage size |
| persistence.storageClass | string | `nil` | desired storageClass |
| podSecurityContext | object | `{}` | podSecurityContext configuration |
| readinessProbe | object | `{"httpGet":{"path":"/","port":"http"}}` | readiness probe configuration |
| securityContext | object | `{"allowPrivilegeEscalation":false}` | securityContext configuration |
| service.port | int | `8096` | service port |
| service.type | string | `"ClusterIP"` | service type |
| serviceAccount.annotations | object | `{}` | add annotations to serviceAccount |
| serviceAccount.automount | bool | `true` | automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | enable serviceAccount |
| serviceAccount.name | string | `""` | name of the serviceAccount (will be generated if empty) |
| uid | int | `1000` | the UID to run emby as |

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| pmoscode | <info@pmoscode.de> | <https://pmoscode.de> |

## Contributing

If you want to add features or bugfixes, please open an issue (either feature or bug) and provide also an unittest (https://github.com/helm-unittest/helm-unittest).
To make things easier, you can use Taskfile (https://taskfile.dev/) to get a small shortcut for some useful commands.

You also need to copy the ".env-template" file as ".env" and configure it for your needs.

The Taskfile itself needs this tools to run the tasks:
- https://helm.sh/docs/intro/quickstart/
- https://github.com/norwoodj/helm-docs
- https://github.com/helm-unittest/helm-unittest/
- https://github.com/pawamoy/git-changelog
