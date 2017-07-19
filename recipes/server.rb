package 'httpd' do
  action :'install'
end

# notifies :action, 'resource[name]', :timer
# subscribe :action, 'resource[name]', :esesource
# :before, :delayed, :immediately
#


#
#cookbook_file '/var/www/html/index.html' do
#  source 'index.html'
#end

remote_file 'var/www/html/shaw.jpg' do
  source 'https://s3-ap-southeast-2.amazonaws.com/shaw912/shaw1.jpg'
end


template '/var/www/html/index.html' do
  source 'index.html.erb'
 # notifies :restart, 'service[httpd]', :immediately
  action :create 
end

#bash "inline.script" do
#  user "root"
#  code "mkdir -p /var/www/mysites/ && chown -R /var/www/mysites/"
#  not_if '[-d /var/www/mysites/ ]'
#  not_if do 
#    File.directory?('/var/www/mysites/')
#  end
#end
  
#execute "run a script" do
#  user "root"
#  command <<-EOH
#  mkdir -p /var/www/mysite/ /
#  chown -R apache /var/www/mysites/
#  EOH
#  not_if
#end

#execute "run a script" do
#  user "root"
#  command './myscript.sh'
#  not_if
#end

directory "/var/www/mysites" do
  owner 'apache'
  recursive true
end

service 'httpd' do
  action [:'enable',:'start']
  subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end
