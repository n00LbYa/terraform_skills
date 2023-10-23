#!/bin/bash

yum -y update
yum -y install httpd

myip=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)

cat <<EOF > /var/www/html/index.html
<html>
<body style="background-color: black;">
<h2><font color="gold">Build by Terraform <font color="red">v_Latest</font></h2><br><p>
<font color="green">Private IP server: <font color="aqua">$myip<br><br>

<font color="magenta">
<b>V_latest</b>
</body>
</html>
EOF

service httpd start
chkconfig httpd on
