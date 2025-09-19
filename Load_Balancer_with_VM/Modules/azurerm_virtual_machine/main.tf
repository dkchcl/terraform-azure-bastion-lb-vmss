resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.rg_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    data.azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

    # 🚀 Nginx Install script
custom_data = base64encode(<<EOF
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y nginx
sudo systemctl enable nginx
sudo systemctl start nginx

cat <<EOT | sudo tee /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>🚀 DevOps Mastery Course</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(to right, #f2f2f2, #e6f7ff);
      margin: 0;
      padding: 0;
      color: #333;
    }
    header {
      background-color: #007acc;
      color: white;
      padding: 20px 40px;
      text-align: center;
    }
    header h1 {
      font-size: 36px;
    }
    section {
      padding: 30px 40px;
    }
    .section-title {
      font-size: 28px;
      margin-bottom: 10px;
      color: #007acc;
    }
    .course-details, .syllabus, .instructor, .contact {
      background-color: #ffffff;
      padding: 20px;
      border-radius: 10px;
      margin-bottom: 30px;
      box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
    }
    ul {
      padding-left: 20px;
    }
    .contact form {
      display: flex;
      flex-direction: column;
    }
    .contact input, .contact textarea {
      margin-bottom: 15px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 6px;
    }
    .contact button {
      background-color: #007acc;
      color: white;
      padding: 10px;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      font-size: 16px;
    }
    .contact button:hover {
      background-color: #005f99;
    }
    footer {
      text-align: center;
      padding: 15px;
      background-color: #007acc;
      color: white;
    }
  </style>
</head>
<body>
  <header>
    <h1>🚀 DevOps Mastery Course</h1>
    <p>📚 Learn DevOps from Scratch & Become a Pro!</p>
  </header>
  <section>
    <div class="course-details">
      <h2 class="section-title">📋 Course Overview</h2>
      <p>Welcome to the <strong>DevOps Mastery Course</strong> 🌟 — your gateway to mastering automation, CI/CD, Docker, Kubernetes, Jenkins, and more! Perfect for developers, sysadmins, and IT enthusiasts who want to streamline development and operations. 👨‍💻👩‍💻</p>
    </div>
    <div class="syllabus">
      <h2 class="section-title">📚 Syllabus</h2>
      <ul>
        <li>🔧 Introduction to DevOps</li>
        <li>🐧 Linux Basics for DevOps</li>
        <li>🛠️ CI/CD Pipelines</li>
        <li>🐳 Docker & Containers</li>
        <li>☸️ Kubernetes Basics</li>
        <li>🔐 Security & Monitoring</li>
        <li>🧪 Testing and Automation</li>
        <li>☁️ Cloud Integration (AWS, Azure)</li>
      </ul>
    </div>
    <div class="instructor">
      <h2 class="section-title">👨‍🏫 Instructor</h2>
      <p><strong>Mr. Ashish Kumar</strong> – Senior DevOps Engineer with 17+ years of experience in cloud, automation & infrastructure management. 🧠✨</p>
      <p><strong>Mr. Aman Gupta</strong> – Senior DevOps Engineer with 15+ years of experience in cloud, automation & infrastructure management. 🧠✨</p>
    </div>   
    <div class="course-details">
      <h2 class="section-title">⏳ Duration & Mode</h2>
      <ul>
        <li>🕒 Duration: 8 Weeks</li>
        <li>🌐 Mode: Online (Live + Recordings)</li>
        <li>📅 Next Batch: 1st October 2025</li>
      </ul>
    </div>
    <div class="contact">
      <h2 class="section-title">📞 Contact Us</h2>
      <form action="#" method="POST">
        <input type="text" name="name" placeholder="👤 Your Name" required />
        <input type="email" name="email" placeholder="📧 Your Email" required />
        <input type="tel" name="phone" placeholder="📱 Phone Number" />
        <textarea name="message" rows="4" placeholder="💬 Your Message"></textarea>
        <button type="submit">📨 Submit</button>
      </form>
    </div>
  </section>
  <footer>
    <p>© 2025 DevOps Academy 🚀 | Built with ❤️ by ChatGPT</p>
  </footer>
</body>
</html>
EOT
EOF
)

}


