#!/bin/bash
yum -y update
yum -y install httpd
MYIP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
cat <<EOF > /var/www/html/index.html
<h2>WebServer with PrivateIP: $MYIP</h2><br>
<p>Apache Web Server(Amazon Linux 2) which is built by Terraform</p>
<img src='https://images.unsplash.com/photo-1519114056088-b877fe073a5e?q=80&w=1933&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'>
EOF
service httpd start
chkconfig httpd on
