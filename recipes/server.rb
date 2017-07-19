package 'httpd' do
  action :'install'
end

#node['hostname']
#node['ipaddress']
#file '/var/www/html/index.html' do
#  content "<h1>Hello,World!</h1>
#  HOSTNAME:#{node['hostname']}
#  IPADDRESS:#{node['ipaddress']} 
#"
#end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  action :create 
end
  
service 'httpd' do
  action [:'enable',:'start']
end
