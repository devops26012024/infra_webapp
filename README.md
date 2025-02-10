# infra_webapp

# *🚀 Cloud Infra for Secure Web App (SSO + API Gateway + Lambda)*  

## *📌 Overview*  
This repository contains the *Terraform-based infrastructure* for deploying a *serverless web application* on AWS. The setup ensures a *secure, scalable, and automated deployment pipeline* using:  

- *AWS Lambda* (backend execution)  
- *Amazon API Gateway* (internet-facing API)  
- *Amazon Cognito* (SSO authentication)  
- *GitHub Actions* (CI/CD with OIDC authentication)  
- *Terraform Workspaces* (dev and prod environments)  

---

## *📁 Project Structure*  


📂 infra-repo
 ├── 📂 terraform
 │    ├── 📄 provider.tf         # AWS Provider
 │    ├── 📄 workspace.tf        # Terraform Workspaces (dev/prod)
 │    ├── 📄 oidc.tf             # OIDC IAM Role for GitHub Actions
 │    ├── 📄 lambda.tf           # AWS Lambda Function
 │    ├── 📄 api_gateway.tf      # API Gateway Integration
 │    ├── 📄 cognito.tf          # Cognito User Pool (SSO)
 │    ├── 📄 security.tf         # S3 Logging, CloudWatch Logs
 │    ├── 📄 outputs.tf          # Terraform Outputs
 │    ├── 📄 variables.tf        # Variable Definitions
 │    ├── 📄 backend.tf          # S3 Backend for Terraform State
 ├── 📂 .github/workflows
 │    ├── 📄 infra-deploy.yml    # GitHub Actions Workflow (Terraform Deployment)
 ├── 📄 README.md                # Project Documentation


---

## *🛠 Infrastructure Details*  

### *✅ AWS Resources Used*
| Service        | Purpose  |
|---------------|---------|
| *Lambda*    | Runs the serverless backend |
| *API Gateway* | Exposes the Lambda function as an API |
| *Cognito*   | Provides SSO authentication |
| *S3*        | Stores logs & Terraform state |
| *IAM*       | Secure role-based access control |
| *CloudWatch* | Monitors logs & errors |

### *🔄 Environment-Based Deployments*
- *Terraform Workspaces* dynamically configure dev & prod environments.  
- *GitHub Actions* auto-deploys based on branch (main → prod, dev → dev).  

---

## *⚙ Deployment Pipeline (CI/CD)*  

### *🛠 GitHub Actions Workflow*
| *Step* | *Description* |
|----------|----------------|
| *Checkout Code* | Clones the repository |
| *Configure OIDC* | Sets up AWS IAM OIDC authentication |
| *Install Terraform* | Installs Terraform for IaC deployment |
| *Terraform Init* | Initializes Terraform backend |
| *Select Workspace* | Switches between dev and prod |
| *Terraform Apply* | Deploys infrastructure |

---

## *🖼 Architecture Diagram*  
Here’s an overview of the infrastructure setup:  


                    +------------------------+
                    |        GitHub Actions  |
                    |   (Terraform Deploys)  |
                    +------------+-----------+
                                 |
                 ----------------------------
                 |                          |
           +----v----+                 +----v----+
           |  Dev     |                 |  Prod    |
           | Workspace|                 | Workspace|
           +----+----+                 +----+----+
                |                            |
+--------------v--------------+   +---------v-----------+
|        AWS Lambda          |   |      AWS Lambda     |
|  (Serverless Compute)       |   |  (Production App)  |
+--------------+--------------+   +---------+-----------+
               |                            |
    +---------v---------+          +-------v---------+
    |  API Gateway      |          | API Gateway     |
    | (Public Endpoint) |          | (Prod API)      |
    +---------+---------+          +-------+---------+
              |
       +------v------+  
       | Cognito SSO |  
       +------------+  


---

## *🚀 Deployment Guide*  

### *1️⃣ Set Up AWS OIDC for GitHub Actions*
- Manually create an IAM role with AssumeRoleWithWebIdentity  
- Use this *OIDC Provider:*  
  
  token.actions.githubusercontent.com
  
- Attach necessary *IAM policies* (AdminAccess, LambdaFullAccess, IAMReadOnlyAccess)  

---

### *2️⃣ Deploy Infrastructure Using GitHub Actions*
**👉 Deploy to dev (Testing Environment)**
sh
git push origin dev


**👉 Deploy to prod (Production Environment)**
sh
git push origin main


> **Terraform Workspaces will automatically select dev or prod** based on branch.

---

## *📢 How to Test*
### *1️⃣ Get API Gateway URL*
After deployment, run:
sh
terraform output api_gateway_url

It will return:

https://xxxxxx.execute-api.ap-south-1.amazonaws.com/


### *2️⃣ Call the API*
Test with curl:
sh
curl -X GET https://xxxxxx.execute-api.ap-south-1.amazonaws.com/

Response:
json
{"message": "Hello, World!"}


### *3️⃣ Verify SSO Authentication*
- Open Cognito Console  
- Go to *User Pool → Clients*  
- Ensure authentication works  

---

## *🔒 Security Best Practices Implemented*
✔ *No AWS Access Keys Used* – GitHub Actions authenticate via OIDC  
✔ *IAM Least Privilege* – GitHub role has minimal permissions  
✔ *S3 Encryption* – Terraform state stored securely  
✔ *CloudWatch Monitoring* – Logs Lambda execution  
✔ *API Gateway Authorization* – Protects API  

---

## *💡 Future Enhancements*
- ✅ Implement *Custom Domain* for API Gateway  
- ✅ Add *CloudFront CDN* for better performance  
- ✅ Enable *AWS WAF* for API protection  

---

## *📌 Contributors*
👤 *Your Name* – Infrastructure Engineer  
👤 *SubbuHCL* (Reviewer)  

---

## *📬 Contact*
📧 Email: *your-email@example.com*  
🔗 GitHub: *[YourGitHubProfile](https://github.com/Devendraappa)*  

---

This README is *detailed, production-ready, and explains everything step by step.* 🚀 Let me know if you need modifications!
