# Amazon Custom Resources

Amazon Custom Resources contains a number of CloudFormation Custom Resources
backed by Lambda functions. They simplify the usage of CloudFormation by, among
other things, allowing us to use names instead of IDs in our templates. This
simplifies the re-use of templates across Amazon accounts.

## Available Resources

[lambda-with-config-and-vpc-support](lambda-with-config/README.md) A Lambda function
which implements a Custom Resource for CloudFormation thatdeploys lambdas together with
config files and supports deploying your lambda in a VPC.

### Elasticache Dependency

When CloudFormation creates a Redis-backed Elasticache Cluster it does not
provide the endpoints to the stack. This forces us to write logic in the client
to look up the endpoints or to look them up manually and provide them as
configuration. [elasticache-dependency](elasticache-dependency/README.md) gets
information about elasticache clusters including endpoints.

### Image Dependency

[image-dependency](image-dependency/README.md) looks up information about an
AMI by name. It is much easier to read an image name instead of an AMI ID.

### Route53 Dependency

[route53-dependency](route53-dependency/README.md) looks up information about
hosted zone by domin name.  Again, nicer to have that a cryptic zone id.

### VPC Dependency

[vpc-dependency](vpc-dependency/README.md)looks up information about a
VPC by name including ID and subnet information.

### Certificate Dependency

[certificate-dependency](certificate-dependency/README.md) looks up a
certificate by name.

### Stack Dependency

[stack-dependency](stack-dependency/README.md) looks up the outputs from
another stack by name. It provides the outputs as variables to the resources
and also includes an extra property called `Environment`.

The `Environment` property contains all the ouputs from the stack formatted as
a Unix `env-file`, `(Property1=Value\nProperty2=Value\n)`. This can be used to
provide the parameters to the instance by saving them to an environment file
and, if you use Docker, to provide them to the container with `docker run
--env-file`

### Echo Dependency

[echo-dependency](echo-dependency/README.md) returns its inputs as outputs. Can
be used to force an update of a stack.

### KMS Dependency

[kms-dependency](kms-dependency/README.md) is used to decrypt a secret before it is
used in cloudformation, i.e when creating a RDS db with cloudformation.

### VPC NAT Gateway Dependency

[vpc-nat-gateway-dependency](vpc-nat-gateway-dependency/README.md) enables Internet access for a Lambda inside a VPC by creating necessary VPC resources such as NAT Gateway, Route Tables, Routes etc.

### SNS Subscription

[sns-subscription](sns-subscription/README.md) is used to create a SNS subscription to an already
existing SNS topic.

## Installation

```
# git clone the repo
# Select any region, for example eu-central-1
export REGION=eu-central-1
./init.sh
./deploy-all.sh
```
