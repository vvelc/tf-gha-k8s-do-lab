terraform-init-cmd: 
	cd terraform && \
	terraform init

terraform-plan-cmd:
	cd terraform && \
	terraform init && \
	terraform plan \
	-var-file="./environments/common.tfvars" \
	-var-file="./environments/prod/config.tfvars"

terraform-apply-cmd:
	cd terraform && \
	terraform init && \
	terraform apply \
	-var-file="./environments/common.tfvars" \
	-var-file="./environments/prod/config.tfvars"

terraform-destroy-cmd:
	cd terraform && \
	terraform init && \
	terraform destroy \
	-var-file="./environments/common.tfvars" \
	-var-file="./environments/prod/config.tfvars"

COMMAND?=""
infisical-inject:
	infisical run --env=prod -- $(COMMAND)

TF_ACTION?=plan
tf-action:
ifeq ($(TF_ACTION),plan)
	$(MAKE) infisical-inject COMMAND='$(MAKE) terraform-plan-cmd'
else ifeq ($(TF_ACTION),apply)
	$(MAKE) infisical-inject COMMAND='$(MAKE) terraform-apply-cmd'
else ifeq ($(TF_ACTION),destroy)
	$(MAKE) infisical-inject COMMAND='$(MAKE) terraform-destroy-cmd'
else ifeq ($(TF_ACTION),init)
	$(MAKE) infisical-inject COMMAND='$(MAKE) terraform-init-cmd'
else
	echo "$(TF_ACTION) action does not exist"
endif

plan:
	$(MAKE) tf-action TF_ACTION=plan

apply:
	$(MAKE) tf-action TF_ACTION=apply

destroy:
	$(MAKE) tf-action TF_ACTION=destroy

init:
	$(MAKE) tf-action TF_ACTION=init

helm-install-ingress:
	helm install my-ing ingress-nginx/ingress-nginx \
		--namespace ingress \
		--version 4.0.17 \
		--values nginx-values.yaml \
		--create-namespace