## The AWS Developer Challenge for Data Engineers
### Instructions

In general feel free to expand/change the challenge in any way you like, just explain your solution and decision making, any concerns around it or limitations etc.

Some information/content is left out intentionally to validate your working experience, please fill in the missing parts.

> Fork this repo with your solution. Ideally, we'd like to see your progression through commits, and don't forget to update the README.md to explain your thought process.

**Please do not reference any websites or published articles. We are looking for original content!**

Please let us know how long the challenge took you. We're not looking for how fast or detailed you are. It's just to give us a clearer idea of what you've produced in the time you decided to take. Feel free to go as big or as small as you want.

### AWS Data Engineer | Challenge Information

This company is ingesting data into a 'data lake' running AWS. Below find a picture of the AWS components used for this company's architecture. 

![AWS-COMPONENTS](/media/awscp.png)

## Section A
### Design an Architecture Diagram - We want to see a picture.
Use the components shown above and create an architecture with your tool of choice (powerpoint / draw.io / etc) showing how to ingest data from an on-premise site into AWS. 

Upload the diagram/picture into the Git repository and indicate where it's saved. Use the given components as far as possible to illustrate your solution.

##### Hints
* Focus on *low cost & high* performance.
* All the data are stored in S3 buckets.
* Athena is used to query the data.
* Show how you will use Step Functions to orchestrate the *ingest* process.
* AWS DynamoDB / CloudWatch must be used.
* Glue Jobs should be used to do the ingest.
* CloudFormation output is a CodeBuild Project
* Git is used to save the terraforms and python / pyspark code.
* You do not have to design/depict the CI/CD, assume that it's already in place.
* Look at the available .tf files to get an understanding of the architecture.
___

## Section B
### Describe the Section A - Architecture Diagram 

Within this Readme.md describe the architecture above, giving detail when and how you would use the selected components.

**Please do not reference any websites or published articles.** 
**We are looking for original content!** 
**We do not want to see definitions of the AWS components.**


##### Hints
* Consider aspects like security (iam / firewalls / vpc / security groups / roles)
* To each component used, give a detailed description on how it fits into the solution, please do not reference existing AWS documentation, use your own words! Feel free to document your thought process. We are interested to find out how you think.
___

## Section C
**Try your best do not keep the section open, we want to see how you apply yourself**

Within the Git Repository Structure:
* Modify the CloudFormation Template [CFN/seed.yaml] in order to create a CodeBuild Project.
* Update the _glue_jobs.tf_, _main.tf_ and _output.tf_ terraform files. 
* Provide the python script that will be used within the glue job, using either python shell or spark, think here about using DynamoDB to keep certain job settings and table structures for S3.
___

## Submit it

Please use a private repo just email us when you are done. 

## Your Solution Starts HERE!!!
1.	In the data lake, start off by creating datasets (these datasets are the target of where the data will reside). Creating the necessary AWS Glue output dbs for our source and prepared layer.
2.	For us to use to any services within AWS. We need a role with policy document attached to it, providing access and permissions
3.	We will use parameter store to store our usernames.
4.	We run CloudFormation by creating new stack by uploading a template (yaml file) where we update the template with the correct VPC info, repo link, ITSM API Key etc.
5.	Proceed to running a CodeBuild which will create the AWS resources we have configured in our in our repo under Assets & Infrastructure (Main.tf, Ingest.json, glue jobs).
6.	After a successful CodeBuild we check if the tables were created in DynamoDB and to see the structure created.
7.	All the passwords for the dbs are stored in system manager,We can then run glue job to load the data into the raw layer in parallel we check AWS CloudWatch group logs to see the progress of the job.
8.	After a successful load, we can go back to check to our data lake to check if the data is in the S3 bucket. Congratulations you’ve come a long way.
9.	In order for us to move the data from the raw layer to the source layer, we can run AWS Step functions which sequences our Lambda functions, by including a run next statement in your configs you trigger the next job which is to load data onto prepared layer.
10.	To also check progress of the step function, we use the AWS CloudWatch to monitor the progress.
11.	Once the step function has succeeded, we can navigate back to the data lake and in he prepared dataset to check if the data has moved from source to prepared.
12.	Once the data is in the prepared layer, we can query the data in the  AWS glue data catalog  using Athena



## Additional Comments / Information / Concerns
Add info here.
