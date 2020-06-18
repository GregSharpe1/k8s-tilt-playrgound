.PHONY: create-cluster

KIND_CLUSTER_NAME ?= local-kind

create-cluster:
	./scripts/start.sh $(KIND_CLUSTER_NAME)

clean:
	kind delete --name $(KIND_CLUSTER_NAME)
