load('ext://restart_process', 'docker_build_with_restart')

local_resource(
  'hello world compile',
  'cd hello-world/src && CGO_ENABLED=1 go build -o ../build/hello-world',
  deps=['./hello-world/src']
)

default_registry(
    'localhost:5000',
    host_from_cluster='registry:5000'
)

docker_build_with_restart(
  'hello-world',
  'hello-world/build',
  entrypoint='/go/bin/hello-world',
  dockerfile='hello-world/Dockerfile',
  live_update=[
    sync('./hello-world/build', '/go/bin')
  ]
)

k8s_yaml(helm('deployment/hello-world', name='hello-world'))
