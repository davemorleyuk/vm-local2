if platform_family?("rhel")

	# php
	package "php" do
		action :install
	end

	# php
	package "mysql" do
		action :install
	end

	# local2
	cookbook_file "/etc/httpd/conf.d/vhost_local2.conf" do
		source "vhost_local2.conf"
		group "root"
		owner "root"
	end
	ruby_block "insert_line_local2" do
	  block do
		file = Chef::Util::FileEdit.new("/etc/hosts")
		file.insert_line_if_no_match(/local2.d/, "127.0.0.1 local3.d")
		file.write_file
	  end
	end		
		
	# mpm_itk_module
	package "httpd-itk" do
		action :install
	end
	
	# Install gettext
	package "gettext" do
		action :install
	end	
	
	ruby_block "Appending to httpd config file" do
		block do
			rc = Chef::Util::FileEdit.new("/etc/sysconfig/httpd")
			rc.insert_line_if_no_match("/HTTPD=\/usr\/sbin\/httpd\.itk/", "HTTPD=/usr/sbin/httpd.itk")
			rc.write_file
		end
	end	
	
	ruby_block "Disabling status module in httpd config" do
		block do
			rc2 = Chef::Util::FileEdit.new("/etc/httpd/conf/httpd.conf")
			rc2.search_file_replace(/LoadModule status_module/, '#LoadModule status_module')
			rc2.write_file
		end
	end		
	
	# Disable SendFile option in apache which causes truncation of css/js files
	# when editing files.
	
	ruby_block "Disabling EnableSendfile httpd config" do
		block do
			rc2 = Chef::Util::FileEdit.new("/etc/httpd/conf/httpd.conf")
			rc2.search_file_replace(/#EnableSendfile off/, 'EnableSendfile off')
			rc2.write_file
		end
	end			

#	ruby_block "Changing charset to ISO-8859-1 httpd config" do
#		block do
#			rc2 = Chef::Util::FileEdit.new("/etc/httpd/conf/httpd.conf")
#			rc2.search_file_replace(/AddDefaultCharset UTF-8/, 'AddDefaultCharset ISO-8859-1')
#			rc2.write_file
#		end
#	end	

#	execute "update apache2 log folder permissions" do
#		command "sudo chmod +x /var/log/httpd"
#	end
#
#	execute "update apache2 log file permissions" do
#		command "sudo chmod 644 /var/log/httpd/error_log /var/log/httpd/access_log"
#	end
#	
#	execute "update zend server log file permissions" do
#		command "sudo chmod -R 777 /usr/local/zend/tmp"
#	end	

	service "httpd" do
		action :restart
	end	

	execute "add symbolic link for legacy IS3 local-dev config file paths" do
		command "ln -sfn /home/projects/is3/app /home/vagrant/app"
	end

end
