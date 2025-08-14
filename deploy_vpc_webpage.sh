#!/bin/bash

# Update system packages
sudo yum update -y

# Install Apache web server
sudo yum install httpd -y

# Start and enable Apache service
sudo systemctl start httpd
sudo systemctl enable httpd

# Define web root directory
WEB_DIR="/var/www/html"
sudo mkdir -p $WEB_DIR

# Create index.html file with VPC content and CSS graphics
cat <<EOL | sudo tee $WEB_DIR/index.html > /dev/null
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>AWS VPC Overview - Designed by Jerry</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        header {
            text-align: center;
            padding-bottom: 20px;
            border-bottom: 2px solid #ddd;
        }

        h1 {
            color: #2c3e50;
        }

        .section {
            margin-top: 40px;
        }

        .vpc-box {
            border: 3px solid #3498db;
            border-radius: 10px;
            padding: 20px;
            background-color: #ecf0f1;
            position: relative;
            min-height: 200px;
        }

        .subnet {
            width: 40%;
            height: 100px;
            background-color: #2ecc71;
            border-radius: 8px;
            margin: 10px;
            display: inline-block;
            vertical-align: top;
            color: white;
            text-align: center;
            line-height: 100px;
            font-weight: bold;
        }

        .gateway {
            width: 200px;
            height: 80px;
            background-color: #f39c12;
            border-radius: 8px;
            margin: 20px auto;
            display: block;
            color: white;
            text-align: center;
            line-height: 80px;
            font-weight: bold;
        }

        footer {
            margin-top: 60px;
            text-align: center;
            font-size: 0.9em;
            color: #777;
        }
    </style>
</head>
<body>

    <header>
        <h1>SAMPLE HELLO WORLD WEB PAGE</h1>
        <p><strong>Designed by: Pradeep Katuri</strong></p>
    </header>


    <footer>
        &copy; Designed by Pradeep Katuri
    </footer>

</body>

</html>
EOL

echo "✅ Webpage deployed successfully at http://<your-ec2-public-ip>"