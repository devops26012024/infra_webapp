**Two repositories have been created seperately**
1. Infrastructure Repository(infra_webapp)
https://github.com/devops26012024/infra_webapp (Infrastructure repository)

2. App Repository(Serverless_webapp)
https://github.com/devops26012024/Serverless_webapp (app repository)


# infra_webapp

# Cloud Infra for Secure Web App (SSO + API Gateway + Lambda)*  

## Overview*  
This repository contains the *Terraform-based infrastructure* for deploying a *serverless web application* on AWS. The setup uses:  

- AWS Lambda: For backend execution
- Amazon API Gateway: Internet-facing API
- Amazon Cognito: SSO authentication
- GitHub Actions: CI/CD with OIDC authentication
- Terraform Workspaces: dev and prod environments  

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

##  Infrastructure Details*  

###  AWS Resources Used*
| Service        | Purpose  |
|---------------|---------|
| *Lambda*    | Runs the serverless backend |
| *API Gateway* | Exposes the Lambda function as an API |
| *Cognito*   | Provides SSO authentication |
| *S3*        | Stores logs & Terraform state |
| *IAM*       | Secure role-based access control |

###  Environment-Based Deployments
- Terraform Workspaces* dynamically configure dev & prod environments.  
- GitHub Actions* auto-deploys based on branch (main → prod, dev → dev).  

---

##  Deployment Pipeline (CI/CD)  

###  GitHub Actions Workflow*
| *Step* | *Description* |
|----------|----------------|
| *Checkout Code* | Clones the repository |
| *Configure OIDC* | Sets up AWS IAM OIDC authentication |
| *Install Terraform* | Installs Terraform for IaC deployment |
| *Terraform Init* | Initializes Terraform backend |
| *Select Workspace* | Switches between dev and prod |
| *Terraform Apply* | Deploys infrastructure |

---

## Architecture Diagram*  
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

##  How to Test*
###  Get API Gateway URL*
After deployment, run:

aws apigatewayv2 get-apis --region ap-south-1 --query "Items[*].ApiEndpoint"

It will return:
For Example:

"https://ha7xpaby65.execute-api.ap-south-1.amazonaws.com"


###  Call the API
Test with curl:
Example command:

curl -X GET https://ha7xpaby65.execute-api.ap-south-1.amazonaws.com/

Response:
json
{"message": "Hello, World!"}


### Verify SSO Authentication*
- Open Cognito Console  
- Go to *User Pool → Clients*  
- Ensure authentication works  

---

## Security Best Practices Implemented
✔ *No AWS Access Keys Used* – GitHub Actions authenticate via OIDC   
✔ *S3 Encryption* – Terraform state stored securely   
✔ *API Gateway Authorization* – Protects API  

---

##  Contributor
👤 Pradeep Kumar D – Devops Team
👤 SubbuHCL - Reviewer

---

## *Contact*
 Email: *pradee030@gmail.com*  
 GitHub: https://github.com/devops26012024/Serverless_webapp (app repository)
           https://github.com/devops26012024/infra_webapp (Infrastructure repository)


