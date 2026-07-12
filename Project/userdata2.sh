#!/bin/bash

# Update package list
apt update -y

# Install Apache
apt install apache2 -y

# Enable Apache service
systemctl enable apache2

# Start Apache service
systemctl start apache2

# Create HTML page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Terraform Ubuntu Demo</title>
    <style>
        body {
            background: #eef7ff;
            font-family: Arial, sans-serif;
            text-align: center;
            padding-top: 80px;
        }

        .container {
            width: 600px;
            margin: auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px gray;
        }

        h1 {
            color: #E95420;
        }

        p {
            font-size: 18px;
            color: #444;
        }

        footer {
            margin-top: 20px;
            color: gray;
            font-size: 14px;
        }
    </style>
</head>

<body>

<div class="container">
    <h1>Welcome to Ubuntu EC2 Instance 2! </h1>

    <p>This server was provisioned using <strong>Terraform</strong>.</p>

    <p>Apache2 is installed automatically using <strong>User Data</strong>.</p>

    <p>Infrastructure as Code is awesome! 🚀</p>

    <footer>
        Created automatically during EC2 launch.
    </footer>
</div>

</body>
</html>
EOF