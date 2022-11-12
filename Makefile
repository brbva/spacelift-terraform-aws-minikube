bootstrap:
	cd /mnt/d/Learn/chef-repo
	@read -p "Node IP: " nodeip; \
	@read -p "Hostname: " hostname; \
	knife bootstrap $$nodeip -N $$hostname --ssh-user ubuntu --sudo --identity-file /home/bjay/.ssh/mtckey 