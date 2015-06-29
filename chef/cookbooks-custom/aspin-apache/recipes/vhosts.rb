#include_recipe "apache2"
#
#web_app "is3" do
#	template "is3.conf.erb"
#  server_name "is3.dev"
#  server_aliases ["example.vm"]
#  allow_override "all"
#  docroot "/home/vagrant/app/www/"
#end

if platform_family?("debian")

	# IS2
	cookbook_file "/etc/apache2/sites-available/vhost_is2.conf" do
		source "vhost_is2.conf"
		group "root"
		owner "root"
	end

	# IS3
	cookbook_file "/etc/apache2/sites-available/vhost_is3.conf" do
		source "vhost_is3.conf"
		group "root"
		owner "root"
	end

	# ONPOS
	cookbook_file "/etc/apache2/sites-available/vhost_onpos.conf" do
		source "vhost_onpos.conf"
		group "root"
		owner "root"
	end

	# TRENDNET
	cookbook_file "/etc/apache2/sites-available/vhost_trendnet.conf" do
		source "vhost_trendnet.conf"
		group "root"
		owner "root"
	end
	
	# TREND
	cookbook_file "/etc/apache2/sites-available/vhost_trend.conf" do
		source "vhost_trend.conf"
		group "root"
		owner "root"
	end	

	# ASPIN
	cookbook_file "/etc/apache2/sites-available/vhost_aspin.conf" do
		source "vhost_aspin.conf"
		group "root"
		owner "root"
	end	

	# WANIGAN
	cookbook_file "/etc/apache2/sites-available/vhost_wanigan.conf" do
		source "vhost_wanigan.conf"
		group "root"
		owner "root"
	end
	
	# FREEDOM
	cookbook_file "/etc/apache2/sites-available/vhost_freedom.conf" do
		source "vhost_freedom.conf"
		group "root"
		owner "root"
	end	

	# AMALGAM
	cookbook_file "/etc/apache2/sites-available/vhost_amalgam.conf" do
		source "vhost_amalgam.conf"
		group "root"
		owner "root"
	end	

	# VELOCE
	cookbook_file "/etc/apache2/sites-available/vhost_veloce.conf" do
		source "vhost_veloce.conf"
		group "root"
		owner "root"
	end		
	
	# FERIDAX
	cookbook_file "/etc/apache2/sites-available/vhost_feridax.conf" do
		source "vhost_feridax.conf"
		group "root"
		owner "root"
	end		

	# SINCLAIR
	cookbook_file "/etc/apache2/sites-available/vhost_sinclair.conf" do
		source "vhost_sinclair.conf"
		group "root"
		owner "root"
	end	

	execute "enable ssl" do
		command "a2enmod ssl"
	end

	execute "disable default site" do
		command "a2dissite default"
	end

	execute "enable app site" do
		command "a2ensite vhost_is3.conf"
	end

	service "apache2" do
		action :restart
	end

end

if platform_family?("rhel")

	# IS2
	cookbook_file "/etc/httpd/conf.d/vhost_is2.conf" do
		source "vhost_is2.conf"
		group "root"
		owner "root"
	end
	ruby_block "insert_line_is2" do
	  block do
		file = Chef::Util::FileEdit.new("/etc/hosts")
		file.insert_line_if_no_match(/is2.d/, "127.0.0.1 is2.d")
		file.write_file
	  end
	end	

	# IS3
	cookbook_file "/etc/httpd/conf.d/vhost_is3.conf" do
		source "vhost_is3.conf"
		group "root"
		owner "root"
	end
	ruby_block "insert_line_is3" do
	  block do
		file = Chef::Util::FileEdit.new("/etc/hosts")
		file.insert_line_if_no_match(/is3.d/, "127.0.0.1 is3.d")
		file.write_file
	  end
	end		
	
	# ONPOS
	cookbook_file "/etc/httpd/conf.d/vhost_onpos.conf" do
		source "vhost_onpos.conf"
		group "root"
		owner "root"
	end	
	ruby_block "insert_line_onpos" do
	  block do
		file = Chef::Util::FileEdit.new("/etc/hosts")
		file.insert_line_if_no_match(/onpos.d/, "127.0.0.1 onpos.d")
		file.write_file
	  end
	end		
	
	#TRENDNET
	cookbook_file "/etc/httpd/conf.d/vhost_trendnet.conf" do
		source "vhost_trendnet.conf"
		group "root"
		owner "root"
	end		
	ruby_block "insert_line_trendnet" do
	  block do
		file = Chef::Util::FileEdit.new("/etc/hosts")
		file.insert_line_if_no_match(/trendnet.d/, "127.0.0.1 trendnet.d")
		file.write_file
	  end
	end		
	
	# TREND
	cookbook_file "/etc/httpd/conf.d/vhost_trend.conf" do
		source "vhost_trend.conf"
		group "root"
		owner "root"
	end	
	ruby_block "insert_line_trend" do
	  block do
		file = Chef::Util::FileEdit.new("/etc/hosts")
		file.insert_line_if_no_match(/trend.d/, "127.0.0.1 trend.d")
		file.write_file
	  end
	end	
	
	# ASPIN
	cookbook_file "/etc/httpd/conf.d/vhost_aspin.conf" do
		source "vhost_aspin.conf"
		group "root"
		owner "root"
	end
	ruby_block "insert_line_aspin" do
	  block do
		file = Chef::Util::FileEdit.new("/etc/hosts")
		file.insert_line_if_no_match(/aspin.d/, "127.0.0.1 aspin.d")
		file.write_file
	  end
	end		
	
	# WANIGAN
	cookbook_file "/etc/httpd/conf.d/vhost_wanigan.conf" do
		source "vhost_wanigan.conf"
		group "root"
		owner "root"
	end		
	ruby_block "insert_line_wanigan" do
	  block do
		file = Chef::Util::FileEdit.new("/etc/hosts")
		file.insert_line_if_no_match(/wanigan.d/, "127.0.0.1 wanigan.d")
		file.write_file
		file.insert_line_if_no_match(/wanigan-admin.d/, "127.0.0.1 wanigan-admin.d")		
		file.write_file
	  end
	end		
	
	# FREEDOM
	cookbook_file "/etc/httpd/conf.d/vhost_freedom.conf" do
		source "vhost_freedom.conf"
		group "root"
		owner "root"
	end
	ruby_block "insert_line_freedom" do
	  block do
		file = Chef::Util::FileEdit.new("/etc/hosts")
		file.insert_line_if_no_match(/freedom.d/, "127.0.0.1 freedom.d")
		file.write_file
	  end
	end			
	
	# AMALGAM
	cookbook_file "/etc/httpd/conf.d/vhost_amalgam.conf" do
		source "vhost_amalgam.conf"
		group "root"
		owner "root"
	end		
	ruby_block "insert_line_amalgam" do
	  block do
		file = Chef::Util::FileEdit.new("/etc/hosts")
		file.insert_line_if_no_match(/amalgam.d/, "127.0.0.1 amalgam.d")
		file.write_file
	  end
	end			

	# VELOCE
	cookbook_file "/etc/httpd/conf.d/vhost_veloce.conf" do
		source "vhost_veloce.conf"
		group "root"
		owner "root"
	end
	ruby_block "insert_line_veloce" do
	  block do
		file = Chef::Util::FileEdit.new("/etc/hosts")
		file.insert_line_if_no_match(/veloce.d/, "127.0.0.1 veloce.d")
		file.write_file
	  end
	end	

	# FERIDAX
	cookbook_file "/etc/httpd/conf.d/vhost_feridax.conf" do
		source "vhost_feridax.conf"
		group "root"
		owner "root"
	end	
	ruby_block "insert_line_feridax" do
	  block do
		file = Chef::Util::FileEdit.new("/etc/hosts")
		file.insert_line_if_no_match(/feridax.d/, "127.0.0.1 feridax.d")
		file.write_file
		file.insert_line_if_no_match(/offroad.feridax.d/, "127.0.0.1 offroad.feridax.d")
		file.write_file
		file.insert_line_if_no_match(/catalogue.feridax.d/, "127.0.0.1 catalogue.feridax.d")
		file.write_file
		file.insert_line_if_no_match(/dealer.feridax.d/, "127.0.0.1 dealer.feridax.d")
		file.write_file
	  end
	end		

	# SINCLAIR	
	cookbook_file "/etc/httpd/conf.d/vhost_sinclair.conf" do
		source "vhost_sinclair.conf"
		group "root"
		owner "root"
	end		
	ruby_block "insert_line_sinclair" do
	  block do
		file = Chef::Util::FileEdit.new("/etc/hosts")
		file.insert_line_if_no_match(/sinclair.d/, "127.0.0.1 sinclair.d")
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

	ruby_block "Changing charset to ISO-8859-1 httpd config" do
		block do
			rc2 = Chef::Util::FileEdit.new("/etc/httpd/conf/httpd.conf")
			rc2.search_file_replace(/AddDefaultCharset UTF-8/, 'AddDefaultCharset ISO-8859-1')
			rc2.write_file
		end
	end	

	execute "update apache2 log folder permissions" do
		command "sudo chmod +x /var/log/httpd"
	end

	execute "update apache2 log file permissions" do
		command "sudo chmod 644 /var/log/httpd/error_log /var/log/httpd/access_log"
	end
	
	execute "update zend server log file permissions" do
		command "sudo chmod -R 777 /usr/local/zend/tmp"
	end	

	service "httpd" do
		action :restart
	end	

	execute "add symbolic link for legacy IS3 local-dev config file paths" do
		command "ln -sfn /home/projects/is3/app /home/vagrant/app"
	end

end
