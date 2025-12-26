#!/bin/bash
yum update -y
yum install -y httpd

DEPLOYMENT_COLOR="BLUE"
APP_VERSION="v1.0"
DEPLOYMENT_STRATEGY="Rolling / Blue-Green"

INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
HOSTNAME=$(hostname)

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
  <title>Zero Downtime Deployment</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #0f172a;
      color: #e5e7eb;
      text-align: center;
      padding-top: 60px;
    }
    .card {
      background: #020617;
      width: 60%;
      margin: auto;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 25px rgba(0,0,0,0.4);
    }
    .blue { color: #38bdf8; }
    .green { color: #22c55e; }
    .footer {
      margin-top: 30px;
      font-size: 14px;
      color: #9ca3af;
    }
  </style>
</head>
<body>

<div class="card">
  <h1>🚀 Zero-Downtime Cloud Deployment</h1>

  <h2 class="blue">Deployment Color: ${DEPLOYMENT_COLOR}</h2>
  <p><strong>Application Version:</strong> ${APP_VERSION}</p>
  <p><strong>Deployment Strategy:</strong> ${DEPLOYMENT_STRATEGY}</p>

  <hr>

  <p><strong>Instance ID:</strong> ${INSTANCE_ID}</p>
  <p><strong>Hostname:</strong> ${HOSTNAME}</p>

  <div class="footer">
    <p>
      Built to demonstrate real-world AWS deployment practices
      with zero downtime, safe rollouts, and instant rollback.
    </p>
  </div>
</div>

</body>
</html>
EOF

systemctl start httpd
systemctl enable httpd
