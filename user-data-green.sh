#!/bin/bash
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd

TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" \
  -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")

INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $TOKEN" \
  -s http://169.254.169.254/latest/meta-data/instance-id)

HOSTNAME=$(hostname)

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Zero-Downtime Deployment</title>
<style>
body { font-family: Arial; background: #0f5132; color: white; text-align: center; padding-top: 50px; }
.box { border: 2px solid white; padding: 30px; display: inline-block; }
</style>
</head>
<body>
<div class="box">
<h1>🚀 Zero-Downtime Cloud Deployment</h1>
<p><strong>Deployment Color:</strong> GREEN</p>
<p><strong>Application Version:</strong> v2.0</p>
<p><strong>Deployment Strategy:</strong> Rolling / Blue-Green</p>
<p><strong>Instance ID:</strong> $INSTANCE_ID</p>
<p><strong>Hostname:</strong> $HOSTNAME</p>
<p><em>Updated safely using Instance Refresh with zero downtime.</em></p>
</div>
</body>
</html>
EOF
