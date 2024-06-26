include .env
.PHONY: run-terraform destroy-terraform

run-terraform:
	@terraform -chdir=./0-terraform/ plan -var "do_token=${DO_PAT}" -var "project_name=sample"; \
	terraform -chdir=./0-terraform/ apply -auto-approve -var "do_token=${DO_PAT}" -var "project_name=sample";

destroy-terraform:
	@terraform -chdir=./0-terraform/ destroy -auto-approve -var "do_token=${DO_PAT}" -var "project_name=sample"

run-ansible:
	@ansible-playbook -i ./3-ansible/hosts.ini ./3-ansible/install-docker.yml; \
	ansible-playbook -i ./3-ansible/hosts.ini ./3-ansible/run-project.yml -vvv
