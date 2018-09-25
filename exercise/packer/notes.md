# Packer notes

* basically this is annotated JSON ; because JSON doesn't allow comments
* takes 4-5 minutes to complete

```json
{
  "variables": {
    "aws_access_key": "",
    "aws_secret_key": ""
  },
  "builders": [
    {
      "type": "amazon-ebs",
      "access_key": "{{user `aws_access_key`}}",        // from environment variable
      "secret_key": "{{user `aws_secret_key`}}",        // from environment variable
      "region": "us-east-1",
      "source_ami_filter": {
        "filters": {
          "virtualization-type": "hvm",
          "name": "ubuntu/images/*ubuntu-bionic-18.04-amd64-server-*",
          "root-device-type": "ebs"
        },
        "owners": [
          "099720109477"                // Canonical, Ltd.
        ],
        "most_recent": true
      },
      "instance_type": "t2.micro",
      "ssh_username": "ubuntu",
      "ami_name": "Ubuntu 18.04 LTS (timestamp {{timestamp}})",
      "ami_description": "Liatrio exercise",
      "tags": {
        "Name": "Liatrio exercise"      // would like to update this (but also would not)
      }
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "inline": [
        "sleep 10",                     // <https://github.com/hashicorp/packer/issues/2143#issuecomment-106956045>
        "sudo apt-get update",
        "sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq",
        "sudo apt-get install -y python"
      ]
    }
  ]
}
```

  ```bash
  timc@Tims-MacBook-Pro ~/e/i/e/packer> time packer build ubuntu-1804.json
  ...
    ==> Builds finished. The artifacts of successful builds are:
  --> amazon-ebs: AMIs were created:
  us-east-1: ami-02880676b33ba4630

        242.70 real         0.84 user         0.71 sys
  ```

