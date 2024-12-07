# T2S E-Commerce Infrastructure with Terraform

This repository contains Terraform configurations for deploying the infrastructure for T2S E-Commerce. 

---
The setup includes:

- Hosting a static website on S3 with CloudFront.
- A user form to collect data and process submissions using API Gateway, Lambda, and DynamoDB.
- The backend store uses RDS for structured data.
- Multi-environment support for dev, stage, and prod.

---
## Features
Frontend: The static website is hosted on S3 and delivered via CloudFront.

Form Processing:
- User form submission through API Gateway.
- Data processing with AWS Lambda.
- Storing form submissions in DynamoDB.

Backend Store:
- Amazon RDS for structured data storage.

Multi-environment Support: Modularized configuration for dev, stage, and prod.

----
## Project Structure

```jpeg
t2s-ecommerce/
├── modules/
│   ├── s3/               # S3 and static website hosting
│   ├── cloudfront/       # CloudFront distribution
│   ├── api_gateway/      # API Gateway configuration
│   ├── lambda/           # Lambda function for processing form submissions
│   ├── dynamodb/         # DynamoDB table for form submissions
│   ├── rds/              # RDS for structured data
├── environments/
│   ├── dev/              # Configuration for the dev environment
│   ├── stage/            # Configuration for the stage environment
│   ├── prod/             # Configuration for the prod environment
```

---
## Prerequisites
- Terraform: Install Terraform v1.5 or newer.
- AWS CLI: Configure AWS credentials with sufficient permissions.
- ZIP Utility: To package Lambda function code.

---
## Deployment Steps

### 1. Clone the Repository

```bash
git clone https://github.com/Here2ServeU/t2s-ecommerce.git
cd t2s-ecommerce
```

### 2. Initialize Terraform

Navigate to the desired environment (e.g., dev):

```bash
cd environments/dev
terraform init
```

### 3. Review Changes

Preview the resources that will be created:
```bash
terraform plan
``` 

### 4. Apply Changes

Deploy the infrastructure:
```bash
terraform apply
```

### 5. Access Outputs

After deployment, note the outputs for:
	•	CloudFront URL: Access the frontend.
	•	API Gateway URL: Integrated into the form’s action URL.
	•	RDS Endpoint: Use for database connections.

---
Components

1. Frontend
	•	S3: Static website hosting.
	•	CloudFront: Global content delivery.

2. Form Processing
	•	API Gateway: Accepts form submissions.
	•	Lambda: Processes form data.
	•	DynamoDB: Stores form submissions.

3. Backend Store
	•	RDS: Relational database for structured data.

---
## Cleanup

To delete all resources and avoid ongoing costs:

### 1. Destroy Resources

Navigate to the environment directory and run:
```bash
terraform destroy
```

### 2. Verify Deletion

Check the AWS Console to ensure all resources are deleted.

---
### Additional Notes
	1.	Environment Variables: Sensitive information (e.g., RDS credentials) is securely stored in the Terraform configuration and Lambda environment.
	2.	Extensibility: Additional environments can be added by duplicating and modifying the dev folder.

***Let me know if you’d like to adjust any details!***
