# 🚀 Zero-Downtime Deployments on AWS using Blue-Green & Rolling Strategies

![Architecture Diagram](Architecture%20Diagram.png)

🎥 **Project Walkthrough Video**  
Watch the full deployment demo here:  
👉 https://www.youtube.com/watch?v=https://youtu.be/IVHwfbiP4Js?si=7M674ISVnDTX4kxR

---

## 📌 Project Overview

This project demonstrates how **production-grade zero-downtime deployments** are implemented on AWS using **Blue-Green** and **Rolling Deployment strategies**.

Instead of taking applications offline during updates, traffic is safely shifted between isolated environments — ensuring **high availability, safe releases, and instant rollback**.

This setup mirrors how real-world systems are deployed in professional cloud environments.

---

## 🧠 What This Project Teaches

- How **Blue-Green deployments** work in practice
- How to achieve **zero downtime** during application updates
- How **Application Load Balancer (ALB)** routes traffic safely
- Canary releases using weighted traffic (90/10, 50/50, 0/100)
- Instant rollback without redeploying infrastructure

---

## 🏗️ Architecture Summary

- **Application Load Balancer (ALB)**
- **Two Target Groups**
  - Blue (Stable Version)
  - Green (New Version)
- **Auto Scaling Group**
- **Launch Templates**
- **User Data scripts for version control**

Traffic is gradually shifted between Blue and Green using ALB listener rules.

---

## 🔁 Deployment Flow

1. **Blue (v1)** serves 100% traffic
2. **Green (v2)** is deployed and tested in isolation
3. Traffic is shifted gradually:
   - 90% Blue / 10% Green
   - 50% Blue / 50% Green
4. Final cutover:
   - 0% Blue / 100% Green
5. Rollback is instant by switching traffic back


---

## 🧪 Proof of Zero Downtime

During traffic switching:
- No errors
- No service interruption
- Both versions run independently
- Traffic distribution is visible live

Screenshots and video evidence are included.

---

## 🧰 Tools & Services Used

- Application Load Balancer (ALB)
- Auto Scaling Groups
- Target Groups
- Launch Templates
- Bash (User Data)

---

## 🎯 Why This Matters

Zero-downtime deployments are critical for:
- SaaS platforms
- Financial systems
- Production APIs
- High-traffic applications

This project reflects **real DevOps and Cloud Engineering practices**, not just theory.

---

## 🙌 Final Note

Built to understand **how professionals deploy safely on AWS**, with clarity, control, and confidence.

Feedback and suggestions are welcome!


