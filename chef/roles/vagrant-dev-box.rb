# Name of the role should match the name of the file
name "vagrant-dev-box"

override_attributes(
	"apache" => {
		"user" => "vagrant",
		"group" => "vagrant"
	},
    "zendserver" => {
    	"version" => '7.0',
    	"phpversion" => '5.4',
    	"ordernumber" => '',
    	"licensekey" => '',
    	"production" => 'false',
    	"apikeyname" => 'admin2',
    	"apikeysecret" => '98167463cc69d2915360609b94404ee2749f33f19d8b39d8671ab4c29321a535',
    	"adminpassword" => 'advantage',
    	"dbhost" => '127.0.0.1',
    	"dbusername" => 'root',
    	"dbpassword" => 'root'
    }
)

run_list(
	"recipe[vim]",
	"recipe[zendserver::single]",
	"recipe[aspin-apache::vhosts]",
)
