# DevOps-Integrated-Assignment-
Developed by Matan Elbaz, with assistance from ChatGPT.


This project deploys a static website on a Linux server using NGINX with HTTP and HTTPS.

Deployment, backup, health check, and rollback are fully automated using POSIX-compliant shell scripts,
executed by a non-root user (`webdeploy`).
HTTP traffic is redirected to HTTPS.

Project Structure

devops-web-task/
├── site/
│   ├── index.html
│   └── health.html
├── nginx/
│   ├── site.conf
│   └── site-ssl.conf
├── scripts/
│   ├── deploy.sh
│   ├── backup.sh
│   ├── health_check.sh
│   ├── roll-back.sh
│   └── ssl_selfsign.sh
├── .gitignore
└── README.md

