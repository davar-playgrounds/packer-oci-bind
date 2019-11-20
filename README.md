# Bind Custom Image

This Packer configuration generate a custom image on the defined OCI region, with Bind preinstalled and configured to act as a DNS forwarder in an Hybrid DNS scenario.

## How to use it

1. Edit variables.json to setup the OCI interaction (API credentials and build VM information),
2. Edit named.conf to reflect on-prem your DNS configuration,
3. Run packer :	`packer build -var-file=variables.json essilor-bind.json`

## The detailed process

Packer will execute the following actions :

- Execute the *builders* section of *bind.json*,
  - it creates a build VM using the informations you provided in *variables.json*,
- Execute the *provisioners* section of *bind.json*,
  - it executes the *install-bind.sh* script
- Export the built VM to an OCI Custom Image,
- Delete the Build VM.

## Requirements

The Packer host executing the command needs to be able to access the build VM. defaults uses build instance's public IP.
Tweak accordingly to deploy through a private IP.

## More information

The OCI builder for packer documentation is accessible at this url : https://www.packer.io/docs/builders/oracle-oci.html
