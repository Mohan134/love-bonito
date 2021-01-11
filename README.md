# love-bonito
creating into the EKS Cluster and deploying the applications 
At Love, Bonito our infraestructure has 3 pillars, Terraform, Kubernetes and AWS.

We'd like to see you working with some of our tools and services. We want to understand how you automate the infrastructure using Terraform, deploying into AWS, and Orchestrate everything using Kubernetes.

The assessment is splitting into different challenges. Every challenge is mandatory to complete the test.

We have a simple application generating random but secure passwords. You can find the application here https://github.com/love-bonito/password-manager. As you can see in the repository, we already create a Dockerfile for the application.

Considerations
We only have one environment
You can create the repository in Gitlab or Github
The project need to apply all the good practices
Challenge 1
As a first point, you need to start a Git repository.

We were hoping you could create the infrastructure for our application using Terraform in AWS on the first challenge. We need to execute the changes in the environment using Github Actions or Gitlab Pipeline.

Challenge 2
Create a Kubernetes cluster using AWS EKS, and deploy the application in it. Please, DO NOT FORK the current application repository. You can copy the application code into the repository that you already created for Terraform.

It's up to you how to do it, but the main objective is after creating the infrastructure, we should be able to deploy our application in a Kubernetes cluster.

Challenge 3
Every time that the Application change, we should trigger an action to deploy it automatically.

Wrapping up
In the README file, we should find all the information necessary to run the project and the different challenges. Documentation is highly essential for the resolution. Delivery of the project Please share the URL of the repository with pablo.morales@lovebonito.com and aman.agarwal@lovebonito.com after the finalization of the projec
