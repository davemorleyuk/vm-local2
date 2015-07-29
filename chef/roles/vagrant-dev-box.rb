# Name of the role should match the name of the file
name "vagrant-dev-box"

run_list(
	"recipe[aspin-apache::vhosts]"
)
