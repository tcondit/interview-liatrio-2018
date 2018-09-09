% Technical Exercise Journal
% Tim Condit
% September 8, 2018

A clean slate on which to drop everything I think, imagine, ask about, do or whatever. If I do it right, by Friday 9/14 I'll have a record of my rapid evolution that will feed into a presentation.

## 20180908 Sat

* Tina's birthday! <3

* **CURRENTLY** at my desk in Kirkland at 2:20pm. I've read the Word doc a few times, and have decided to start by creating some AMIs as many times as it takes to feel comfortable with the process. Do at least four times, then assess. Expect to write and throw away some code.
* **CONSIDERING** adding IAM role and users for the hiring team: Robert, Alex, Christine, Chris

* Looks like I'm also creating a mini-vocabulary
  * **CURRENTLY** what I'm doing, thinking, etc. right now
  * **CONSIDERING** what I'm *thinking* about doing, etc.
  * **TOOLS** things I may want to mention

* [ ] **TODO** packer AMI #1
* [ ] **TODO** packer AMI #2
* [ ] **TODO** packer AMI #3
* [ ] **TODO** packer AMI #4

* **CONSIDERING** 
* **CURRENTLY**
* **TOOLS**
* **TODO** (shell alias _ + todo)
* **SHORTCUT**
* **I-DONE-THAT** (shell alias _ + idone)
* **QUESTION** - for the interview team at Liatrio

* [ ] **TODO** store configuration code (Packer, TF, Ansible) together or separate? Name conventions?

* **TOOLS** direnv
  * I just love this thing, but haven't done enough with it yet ; in particular, I want direnv to come to me, not the other way around
  * [direnv](https://direnv.net/)
* **TOOLS** awless
  * [awless](https://github.com/wallix/awless)
* **TOOLS** jsonlint
  * kind of forgot about this one, TBH
* **TOOLS** tmux
  * noob: still feels awkward ; need to unlock the power

* **TERMS** <builder> a component of Packer that is responsible for creating a machine and turning that machine into an image.
  * [Build an Image](https://www.packer.io/intro/getting-started/build-image.html)

* <font color="blue">this would not pass an MD linter, but it's fine for what I need right now</font>

* **TOOLS** ag
* **TOOLS** pandoc
  * you may be reading its output right now
  * see `README.md`

    ```bash
    pandoc -s journal.md -o journal.html --standalone
    ```

* gotta stop screwing around and get to work
  * nice to get this started though
  * also makes me wish `Quiver` had a terminal (maybe ncurses) mode

### 1a. Infrastructure Setup: Create a base Linux AMI using Packer

* oh man, the `Packer` docs include an `IAM permissions policy` for creating images!
  * [IAM Task or Instance Role](https://www.packer.io/docs/builders/amazon.html#iam-task-or-instance-role)

* hmmm ...

    ```bash
    ~/P/c/D/j/2/technical-exercise ☕️  packer build example.json
    amazon-ebs output will be in this color.

    ==> amazon-ebs: Prevalidating AMI Name: packer-example 1536446645
        amazon-ebs: Found Image ID: ami-04169656fea786776
    ==> amazon-ebs: Creating temporary keypair: packer_5b9450b5-c47d-01f2-057e-ea26b23a3abe
    ==> amazon-ebs: Creating temporary security group for this instance: packer_5b9450b8-a777-891f-4c08-acbb84856fe3
    ==> amazon-ebs: Authorizing access to port 22 from 0.0.0.0/0 in the temporary security group...
    ==> amazon-ebs: Launching a source AWS instance...
    ==> amazon-ebs: Adding tags to source instance
        amazon-ebs: Adding tag: "Name": "Packer Builder"
    ==> amazon-ebs: Error launching source instance: Blocked: This account is currently blocked and not recognized as a valid account. Please contact aws-verification@amazon.com if you have questions.
    ==> amazon-ebs:     status code: 400, request id: 52d84bdd-b048-49f1-b3e0-b6b7cf53385a
    ==> amazon-ebs: No volumes to clean up, skipping
    ==> amazon-ebs: Deleting temporary security group...
    ==> amazon-ebs: Deleting temporary keypair...
    Build 'amazon-ebs' errored: Error launching source instance: Blocked: This account is currently blocked and not recognized as a valid account. Please contact aws-verification@amazon.com if you have questions.
        status code: 400, request id: 52d84bdd-b048-49f1-b3e0-b6b7cf53385a

    ==> Some builds didn\'t complete successfully and had errors:
    --> amazon-ebs: Error launching source instance: Blocked: This account is currently blocked and not recognized as a valid account. Please contact aws-verification@amazon.com if you have questions.
        status code: 400, request id: 52d84bdd-b048-49f1-b3e0-b6b7cf53385a

    ==> Builds finished but no artifacts were created.
    ```

* and yet:

    ```bash
    ~/P/c/D/j/2/technical-exercise ☕️  aws s3 ls
    2007-10-21 22:19:49 7a539b26dafcc37a4b376ce712198e7-default
    2015-04-08 19:26:58 cf-templates-1ksa07uibso6e-us-east-1
    2015-04-08 19:47:56 cf-templates-1ksa07uibso6e-us-west-2
    2017-01-06 08:01:40 export-from-cof-macbookpro
    2017-10-02 20:06:11 manual-uploads-00
    2018-06-06 22:12:01 nsc-export-20180606
    2015-07-11 20:47:19 tc-awscodepipeline-demobucket-20150711
    2017-05-07 13:53:36 tc-personal-vault
    2011-04-12 04:59:37 timc-home-C-Source
    ```

* I don't believe this is an issue with my credentials. My credit card was replaced recently, but it wasn't up to date. However, (and I've never seen this before), I wasn't able to enter new card details. Whatever, I'll use my "temporary" Nortek account.
  * account ID `499932752752` ; IAM user `timcondit`; region `us-west-2`
  * new PEM file `liatrio-tech-exercise.pem`

* [x] **TODO** update `./.envrc`
  * specifically, swap out `tcondit@gmail.com` creds for `tim.condit@nortek.com`

* [x] **TODO** command for querying `AMIs` owned by me

    ```bash
    ~/P/c/D/j/2/technical-exercise ☕️  aws ec2 describe-images --region=us-east-1 --executable-users=self
    ```

* [ ] **TODO** `jq` command to filter the output! (Someday I'll "get" `jq`. Today isn't that day.)

    ```bash
    ~/P/c/D/j/2/technical-exercise ☕️  packer build example.json
    amazon-ebs output will be in this color.

    ==> amazon-ebs: Prevalidating AMI Name: packer-example 1536448495
        amazon-ebs: Found Image ID: ami-04169656fea786776
    ==> amazon-ebs: Creating temporary keypair: packer_5b9457ef-dcf1-5147-78fe-59883a889e14
    ==> amazon-ebs: Creating temporary security group for this instance: packer_5b9457f1-f6a3-dd33-1be9-1a82d71ca150
    ==> amazon-ebs: Authorizing access to port 22 from 0.0.0.0/0 in the temporary security group...
    ==> amazon-ebs: Launching a source AWS instance...
    ==> amazon-ebs: Adding tags to source instance
        amazon-ebs: Adding tag: "Name": "Packer Builder"
        amazon-ebs: Instance ID: i-05529e68f720f28d6
    ==> amazon-ebs: Waiting for instance (i-05529e68f720f28d6) to become ready...
    ==> amazon-ebs: Waiting for SSH to become available...
    ==> amazon-ebs: Connected to SSH!
    ==> amazon-ebs: Stopping the source instance...
        amazon-ebs: Stopping instance, attempt 1
    ==> amazon-ebs: Waiting for the instance to stop...
    ==> amazon-ebs: Creating the AMI: packer-example 1536448495
        amazon-ebs: AMI: ami-0bc879ad121ec0902
    ==> amazon-ebs: Waiting for AMI to become ready...
    ==> amazon-ebs: Terminating the source AWS instance...
    ==> amazon-ebs: Cleaning up any extra volumes...
    ==> amazon-ebs: No volumes to clean up, skipping
    ==> amazon-ebs: Deleting temporary security group...
    ==> amazon-ebs: Deleting temporary keypair...
    Build 'amazon-ebs' finished.

    ==> Builds finished. The artifacts of successful builds are:
    --> amazon-ebs: AMIs were created:
    us-east-1: ami-0bc879ad121ec0902
    ```

* dependencies:
  * AWS secret key & access key
  * packer
  * AWS account
  * able to run a simple command in the terminal

* [ ] **TODO** need to protect the secret key & access key ; others are fine ; moving on
* There's no need for a Git repo
* I'm calling this step done for now

### Infrastructure Setup: Create Ansible scripts to spin up the server created in step 1a.

* **SHORTCUT** manually create an EC2 instance from the packer-example AMI
  * focus on Ansible/CM ; come back to TF after

* key I created earlier (`liatrio-tech-exercise.pem`) has two flaws
  * the name is too generic and it's in the "wrong" region
  * I created it in `us-west-2`, but am now working in `us-east-1` per `example.json` (oops)
  * [ ] **TODO** delete the key in `us-west-2`, recreate in `us-east-1` with a proper name
    * call it `liatrio-us-east-1.pem`

* **I-DONE-THAT** added `./config` with per-host configuration
  * not worth going any further making it more general

    ```bash
    # platform: /etc/etc/lsb-release -> Ubuntu 16.04.5 LTS
    Host Jenkins-Nexus
      Hostname 34.227.32.75
      User ubuntu
      IdentityFile /Users/tim.condit/PhilipJFry/cloud-storage/Dropbox/jobs/20180819-Liatrio/technical-exercise/liatrio-us-east-1.pem
    ```

* **CONSIDER** where/when to add the Jenkins and Nexus packages?
  * if it were just "yum install jenkins nexus" I'd do it via Packer ; and maybe it is that simple ; but I've seen with Mongo, for example, where it's anything but simple
    * that's a nearly pathological case though, and maybe not something I want to condone, let alone enable
    * trapped on an old version ; data corruption ; gross
  * a more positively focused reason to use Ansible for the package installs
    * use Packer to include general purpose stuff that should always be present, like package updates, monitoring software, maybe an admin account, etc. (stem cells)
    * use Ansible to configure packages that are needed for specific purposes (differentiated cells)

#### Aside AKA Waste of Time (1/start)

* [ ] **TODO** make a `CentOS` packer template
  * stick with `us-east-1` though

* playing with the instructions (from Gruntwork!) on how to find the product ID and image info via the AWS Marketplace
  * [Locating AWS Marketplace AMI Owner Id and Image Name for Packer Builds](https://blog.gruntwork.io/locating-aws-ami-owner-id-and-image-name-for-packer-builds-7616fe46b49a)

* It's led to this `RHEL` image so far (getting warmer)
  * <https://aws.amazon.com/marketplace/server/procurement?productId=1dbbb9c1-b882-4575-947e-23660fc5991b>
  * productId=`1dbbb9c1-b882-4575-947e-23660fc5991b`

* the instructions in the Gruntwork blog didn't work (at least as written), but this `AWS cli` query from RedHat works great
  * [How to list the latest available RHEL images on Amazon Web Services (AWS)](https://access.redhat.com/solutions/15356)

    ```bash
    ~/P/c/D/j/2/technical-exercise ☕️  aws ec2 describe-images --owners 309956199498 --query 'Images[*].[CreationDate,Name,ImageId]' --filters "Name=name,Values=RHEL-7.?*GA*" --region us-east-1 --output table | sort -r
    |  2018-03-23T20:42:08.000Z |  RHEL-7.5_HVM_GA-20180322-x86_64-1-Hourly2-GP2  |  ami-6871a115 |
    |  2017-08-08T15:37:31.000Z |  RHEL-7.4_HVM_GA-20170808-x86_64-2-Hourly2-GP2  |  ami-c998b6b2 |
    |  2017-07-24T15:44:39.000Z |  RHEL-7.4_HVM_GA-20170724-x86_64-1-Hourly2-GP2  |  ami-cdc999b6 |
    |  2016-10-26T22:32:29.000Z |  RHEL-7.3_HVM_GA-20161026-x86_64-1-Hourly2-GP2  |  ami-b63769a1 |
    |  2015-11-12T21:06:58.000Z |  RHEL-7.2_HVM_GA-20151112-x86_64-1-Hourly2-GP2  |  ami-2051294a |
    |  2015-02-25T20:24:23.000Z |  RHEL-7.1_HVM_GA-20150225-x86_64-1-Hourly2-GP2  |  ami-12663b7a |
    |  2015-02-09T22:54:40.000Z |  RHEL-7.0_HVM_GA-20150209-x86_64-1-Hourly2-GP2  |  ami-60a1e808 |
    |  2014-10-17T20:29:24.000Z |  RHEL-7.0_HVM_GA-20141017-x86_64-1-Hourly2-GP2  |  ami-a8d369c0 |
    |  2014-05-28T19:17:11.000Z |  RHEL-7.0_GA_HVM-x86_64-3-Hourly2               |  ami-785bae10 |
    ```

* this also works for `CentOS`, but the output is lengthy (not shown)
  * takes _forever_ to run ; not worth it

    ```bash
    ~/P/c/D/j/2/technical-exercise ☕️ aws ec2 describe-images \
                                      --owners 'aws-marketplace' \
                                      --filters 'Name=product-code,Values=aw0evgkw8e5c1q413zgy5pjce' \
                                      --output 'text'
    ```

* I've wasted too much time on this, with no results to show for it ; sticking with Ubuntu and moving on
  * recent familiarity was the reason for trying to make a CentOS or RedHat AMI ; I hope I don't get bit in the ass using Ubuntu

#### Aside AKA Waste of Time (1/end)

* installed `ansible` on the temp EC2 (`Jenkins-Nexus`) for the sole purpose of copying the `ansible.cfg` and `hosts` files from `/etc/ansible` ; I'll edit them here

This was momentarily confusing

    ```bash
    ~/P/c/D/j/2/t/ansible (*) ☕️  ansible -m ping all
     [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'
    ```

Verbose?

    ```bash
    ~/P/c/D/j/2/t/ansible (*) ☕️  ansible -v -m ping all
    Using /Users/tim.condit/.config/ansible/ansible.cfg as config file
     [WARNING]: provided hosts list is empty, only localhost is available. Note that the implicit localhost does not match 'all'
    ```

What do [the docs](https://docs.ansible.com/ansible/latest/installation_guide/intro_configuration.html) say?

Also, where'd this come from? I must have added it long ago (dirty machine). Might be time to spin up a control machine at AWS too.

    ```bash
    ~/P/c/D/j/2/t/ansible (*) ☕️  echo $ANSIBLE_CONFIG
    /Users/tim.condit/.config/ansible/ansible.cfg
    ```

Taken together, these three are too much. I'm gonna spin up a control machine on AWS.

1.

    ```bash
    ~/P/c/D/j/2/t/ansible (*) ☕️  ansible -v -m ping all
    Using /Users/tim.condit/PhilipJFry/cloud-storage/Dropbox/jobs/20180819-Liatrio/technical-exercise/ansible/ansible.cfg as config file
    34.227.32.75 | UNREACHABLE! => {
        "changed": false,
        "msg": "Failed to connect to the host via ssh: tcondit@34.227.32.75: Permission denied (publickey).\r\n",
        "unreachable": true
    }
    ```

2.

    ```bash
    ~/P/c/D/j/2/t/ansible (*) ☕️  ssh Jenkins-Nexus
    ssh: Could not resolve hostname jenkins-nexus: nodename nor servname provided, or not known
    ```

3.

    ```bash
    ~/P/c/D/j/2/t/ansible (*) ☕️  ssh -F ../config Jenkins-Nexus
    Welcome to Ubuntu 16.04.5 LTS (GNU/Linux 4.4.0-1065-aws x86_64)
    ```

* [ ] **TODO** get updates into `Packer` image (how?)
  * prioritize this for later

* updated `example.json` to `Bionic Beaver 18.04.1 LTS` ; let's see how/if it works

    ```bash
    ~/P/c/D/j/2/technical-exercise ☕️  packer build example.json
    amazon-ebs output will be in this color.

    ==> amazon-ebs: Prevalidating AMI Name: packer-example 1536464481
        amazon-ebs: Found Image ID: ami-07917569e2c4a2b6a
    ==> amazon-ebs: Creating temporary keypair: packer_5b949661-7f5e-4eb9-17de-4a2cb5bab5cb
    ==> amazon-ebs: Creating temporary security group for this instance: packer_5b949664-b361-e162-8fbe-70700f92a9be
    ==> amazon-ebs: Authorizing access to port 22 from 0.0.0.0/0 in the temporary security group...
    ==> amazon-ebs: Launching a source AWS instance...
    ==> amazon-ebs: Adding tags to source instance
        amazon-ebs: Adding tag: "Name": "Packer Builder"
        amazon-ebs: Instance ID: i-0de16739ed057d4bb
    ==> amazon-ebs: Waiting for instance (i-0de16739ed057d4bb) to become ready...
    ==> amazon-ebs: Waiting for SSH to become available...
    ==> amazon-ebs: Connected to SSH!
    ==> amazon-ebs: Stopping the source instance...
        amazon-ebs: Stopping instance, attempt 1
    ==> amazon-ebs: Waiting for the instance to stop...
    ==> amazon-ebs: Creating the AMI: packer-example 1536464481
        amazon-ebs: AMI: ami-027a933122e083b25
    ==> amazon-ebs: Waiting for AMI to become ready...
    ==> amazon-ebs: Terminating the source AWS instance...
    ==> amazon-ebs: Cleaning up any extra volumes...
    ==> amazon-ebs: No volumes to clean up, skipping
    ==> amazon-ebs: Deleting temporary security group...
    ==> amazon-ebs: Deleting temporary keypair...
    Build 'amazon-ebs' finished.

    ==> Builds finished. The artifacts of successful builds are:
    --> amazon-ebs: AMIs were created:
    us-east-1: ami-027a933122e083b25
    ```

* **I-DONE-THAT** created new AMI (18.04) ; created new 18.04 instances `jenkins-nexus` and `admin`
* **I-DONE-THAT** terminated 16.04 instances `jenkins-nexus` and `admin` ; deleted 16.04 AMIs (two) ; deleted 16.04 snapshots (two)
* **I-DONE-THAT** updated `config` and verified SSH access

    ```bash
    ubuntu@ip-172-31-29-171:~$ sudo apt-get install git ansible
    ```

* [ ] **TODO** amend user name for these commits
  * commit 69141d997f80829ee0d5589160450259c9cacf14
  * commit b581237a7289210bb752cad2e68409d3ef39142c
  * commit 7a9f6939842c3ebf08f84bd941a217bce689e10f
  * commit 06e2cfbcceec5840b382081d1b3ec2488c9903c5
  * or don't bother

* (from Ubuntu/admin)

* created branch `develop`
* installed on both machines
  * ansible
  * awscli
  * direnv
  * git
  * neovim

* [ ] **TODO** I really should just suck it up and create a playbook for this
* [ ] **TODO** get my nvim config on the `admin` instance

* thinking more about `Packer` and `Ansible`, I may want to "bake in" `Ansible` and dependencies into the images

* [ ] **TODO** need to think about bootstrapping `ansible-galaxy` roles onto `admin`
  * what are the configuration steps? It's been a long time
  * can I "bootstrap" the install via a playbook? Never tried it, but maybe.

* this was new to me ; I like it
  * [Automatically install Ansible Galaxy roles with requirements.yml](https://zaiste.net/automatically_install_ansible_galaxy_roles_with_requirements_yml/)

* trouble

    ```bash
    ubuntu@ip-172-31-29-171:~/interview-liatrio-2018/technical-exercise/ansible$ ansible-playbook playbook.yml --limit=admin
172.31.18.219 | SUCCESS => {
    "ansible_facts": {
        "ansible_all_ipv4_addresses": [
            "172.31.18.219"
        ],
    ...
    172.31.18.219 | FAILED! => {
    "cache_update_time": 1536476283,
    "cache_updated": false,
    "changed": false,
    "msg": "'/usr/bin/apt-get -y -o \"Dpkg::Options::=--force-confdef\" -o \"Dpkg::Options::=--force-confold\"     install 'jenkins'' failed: E: Sub-process /usr/bin/dpkg returned an error code (1)\n",
    "rc": 100,
    "stderr": "E: Sub-process /usr/bin/dpkg returned an error code (1)\n",
    "stderr_lines": [
        "E: Sub-process /usr/bin/dpkg returned an error code (1)"
    ],
    "stdout": "Reading package lists...\nBuilding dependency tree...\nReading state information...\njenkins is already the newest version (2.141).\n0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.\n1 not fully installed or removed.\nAfter this operation, 0 B of additional disk space will be used.\nSetting up jenkins (2.141) ...\r\nJob for jenkins.service failed because the control process exited with error code.\r\nSee \"systemctl status jenkins.service\" and \"journalctl -xe\" for details.\r\ninvoke-rc.d: initscript jenkins, action \"start\" failed.\r\n\u001b[0;1;31m*\u001b[0m jenkins.service - LSB: Start Jenkins at boot time\r\n   Loaded: loaded (/etc/init.d/jenkins; generated)\r\n   Active: \u001b[0;1;31mfailed\u001b[0m (Result: exit-code) since Sun 2018-09-09 07:02:35 UTC; 6ms ago\r\n     Docs: man:systemd-sysv-generator(8)\r\n  Process: 27630 ExecStart=/etc/init.d/jenkins start \u001b[0;1;31m(code=exited, status=1/FAILURE)\u001b[0m\r\n\r\nSep 09 07:02:35 ip-172-31-18-219 systemd[1]: Starting LSB: Start Jenkins at boot time...\r\nSep 09 07:02:35 ip-172-31-18-219 jenkins[27630]: Found an incorrect Java version\r\nSep 09 07:02:35 ip-172-31-18-219 jenkins[27630]: Java version found:\r\nSep 09 07:02:35 ip-172-31-18-219 jenkins[27630]: openjdk version \"10.0.2\" 2018-07-17\r\nSep 09 07:02:35 ip-172-31-18-219 jenkins[27630]: OpenJDK Runtime Environment (build 10.0.2+13-Ubuntu-1ubuntu0.18.04.1)\r\nSep 09 07:02:35 ip-172-31-18-219 jenkins[27630]: OpenJDK 64-Bit Server VM (build 10.0.2+13-Ubuntu-1ubuntu0.18.04.1, mixed mode)\r\nSep 09 07:02:35 ip-172-31-18-219 jenkins[27630]: Aborting\r\nSep 09 07:02:35 ip-172-31-18-219 systemd[1]: \u001b[0;1;39m\u001b[0;1;31m\u001b[0;1;39mjenkins.service: Control process exited, code=exited status=1\u001b[0m\r\nSep 09 07:02:35 ip-172-31-18-219 systemd[1]: \u001b[0;1;39m\u001b[0;1;31m\u001b[0;1;39mjenkins.service: Failed with result 'exit-code'.\u001b[0m\r\nSep 09 07:02:35 ip-172-31-18-219 systemd[1]: \u001b[0;1;31m\u001b[0;1;39m\u001b[0;1;31mFailed to start LSB: Start Jenkins at boot time.\u001b[0m\r\ndpkg: error processing package jenkins (--configure):\r\n installed jenkins package post-installation script subprocess returned error exit status 1\r\nErrors were encountered while processing:\r\n jenkins\r\n",
    "stdout_lines": [
        "Reading package lists...",
        "Building dependency tree...",
        "Reading state information...",
        "jenkins is already the newest version (2.141).",
        "0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.",
        "1 not fully installed or removed.",
        "After this operation, 0 B of additional disk space will be used.",
        "Setting up jenkins (2.141) ...",
        "Job for jenkins.service failed because the control process exited with error code.",
        "See \"systemctl status jenkins.service\" and \"journalctl -xe\" for details.",
        "invoke-rc.d: initscript jenkins, action \"start\" failed.",
        "\u001b[0;1;31m*\u001b[0m jenkins.service - LSB: Start Jenkins at boot time",
        "   Loaded: loaded (/etc/init.d/jenkins; generated)",
        "   Active: \u001b[0;1;31mfailed\u001b[0m (Result: exit-code) since Sun 2018-09-09 07:02:35 UTC; 6ms ago",
        "     Docs: man:systemd-sysv-generator(8)",
        "  Process: 27630 ExecStart=/etc/init.d/jenkins start \u001b[0;1;31m(code=exited, status=1/FAILURE)\u001b[0m",
        "",
        "Sep 09 07:02:35 ip-172-31-18-219 systemd[1]: Starting LSB: Start Jenkins at boot time...",
        "Sep 09 07:02:35 ip-172-31-18-219 jenkins[27630]: Found an incorrect Java version",
        "Sep 09 07:02:35 ip-172-31-18-219 jenkins[27630]: Java version found:",
        "Sep 09 07:02:35 ip-172-31-18-219 jenkins[27630]: openjdk version \"10.0.2\" 2018-07-17",
        "Sep 09 07:02:35 ip-172-31-18-219 jenkins[27630]: OpenJDK Runtime Environment (build 10.0.2+13-Ubuntu-1ubuntu0.18.04.1)",
        "Sep 09 07:02:35 ip-172-31-18-219 jenkins[27630]: OpenJDK 64-Bit Server VM (build 10.0.2+13-Ubuntu-1ubuntu0.18.04.1, mixed mode)",
        "Sep 09 07:02:35 ip-172-31-18-219 jenkins[27630]: Aborting",
        "Sep 09 07:02:35 ip-172-31-18-219 systemd[1]: \u001b[0;1;39m\u001b[0;1;31m\u001b[0;1;39mjenkins.service: Control process exited, code=exited status=1\u001b[0m",
        "Sep 09 07:02:35 ip-172-31-18-219 systemd[1]: \u001b[0;1;39m\u001b[0;1;31m\u001b[0;1;39mjenkins.service: Failed with result 'exit-code'.\u001b[0m",
        "Sep 09 07:02:35 ip-172-31-18-219 systemd[1]: \u001b[0;1;31m\u001b[0;1;39m\u001b[0;1;31mFailed to start LSB: Start Jenkins at boot time.\u001b[0m",
        "dpkg: error processing package jenkins (--configure):",
        " installed jenkins package post-installation script subprocess returned error exit status 1",
        "Errors were encountered while processing:",
        " jenkins"
    ]
}
	to retry, use: --limit @/home/ubuntu/interview-liatrio-2018/technical-exercise/ansible/playbook.retry
    ```

The output is more readable because I added "stdout_callback = minimal" to `ansible.cfg`. But essentially `geerlingguy.jenkins` depends on `geerlingguy.java`, which is installing openjdk v10. I *think* this version of `Jenkins` will only work with v8.

I'll need to figure out how to write this into a playbook, but for now here's the manual approach.

* [ ] **TODO** go back to 16.04?

    ```bash
    ubuntu@ip-172-31-29-171:~/interview-liatrio-2018/technical-exercise/ansible$ sudo update-alternatives --config java
    There are 2 choices for the alternative java (providing /usr/bin/java).

      Selection    Path                                            Priority   Status
    ------------------------------------------------------------
    * 0            /usr/lib/jvm/java-11-openjdk-amd64/bin/java      1101      auto mode
      1            /usr/lib/jvm/java-11-openjdk-amd64/bin/java      1101      manual mode
      2            /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java   1081      manual mode

    Press <enter> to keep the current choice[*], or type selection number: 2
    update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java to provide /usr/bin/java (java) in manual mode
    ```

* check version

    ```bash
    ubuntu@ip-172-31-29-171:~/interview-liatrio-2018/technical-exercise/ansible$ java -version
    openjdk version "1.8.0_181"
    OpenJDK Runtime Environment (build 1.8.0_181-8u181-b13-0ubuntu0.18.04.1-b13)
    OpenJDK 64-Bit Server VM (build 25.181-b13, mixed mode)
    ```

* finish jenkins install via apt

    ```bash
    ubuntu@ip-172-31-29-171:~/interview-liatrio-2018/technical-exercise/ansible$ sudo apt install jenkins
    Reading package lists... Done
    Building dependency tree
    Reading state information... Done
    jenkins is already the newest version (2.141).
    0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.
    ```

* check systemctl

    ```bash
    ubuntu@ip-172-31-29-171:~/interview-liatrio-2018/technical-exercise/ansible$ sudo systemctl status jenkins
    ● jenkins.service - LSB: Start Jenkins at boot time
       Loaded: loaded (/etc/init.d/jenkins; generated)
       Active: active (exited) since Sun 2018-09-09 07:24:23 UTC; 1min 11s ago
         Docs: man:systemd-sysv-generator(8)
      Process: 32429 ExecStart=/etc/init.d/jenkins start (code=exited, status=0/SUCCESS)

    Sep 09 07:24:22 ip-172-31-29-171 systemd[1]: Starting LSB: Start Jenkins at boot time...
    Sep 09 07:24:22 ip-172-31-29-171 jenkins[32429]: Correct java version found
    Sep 09 07:24:22 ip-172-31-29-171 jenkins[32429]:  * Starting Jenkins Automation Server jenkins
    Sep 09 07:24:22 ip-172-31-29-171 su[32477]: Successful su for jenkins by root
    Sep 09 07:24:22 ip-172-31-29-171 su[32477]: + ??? root:jenkins
    Sep 09 07:24:22 ip-172-31-29-171 su[32477]: pam_unix(su:session): session opened for user jenkins by (uid=0)
    Sep 09 07:24:22 ip-172-31-29-171 su[32477]: pam_unix(su:session): session closed for user jenkins
    Sep 09 07:24:23 ip-172-31-29-171 jenkins[32429]:    ...done.
    Sep 09 07:24:23 ip-172-31-29-171 systemd[1]: Started LSB: Start Jenkins at boot time.
    ```

## 20180909 Sun

* [ ] **TODO** GitHub SSH key to `admin`
* skip using the Java and Jenkins roles? Seems like a terrible idea.
  * unless I write my own roles

* [ ] **TODO** rename subdirectory `ansible` to ... something

* Today is more work, less navel gazing. ;)

* It's time to spin up a few new instances to smoke test the Ansible configs in their current state. I've got roles for base packages and Jenkins. With the Jenkins role, I'm caling `systemd` to restart the service, and am not convinced that's the right way to go. Also, there are no plugins installed yet. I may add one, something like `git` (need to check the name, probably `git-plugin` or similar) just to work thru the syntax. Then it's repeatable (to a point).

* having a total flashback ; I'm currently working on adding Jenkins plugins via Ansible, and it's failing with 

    ```bash
    TASK [jenkins : Install plugin git] ********************************************************************************************************************************************
    fatal: [172.31.18.219]: FAILED! => {"changed": false, "details": "HTTP Error 503: Service Unavailable", "msg": "Cannot get CSRF"}
    	to retry, use: --limit @/home/ubuntu/interview-liatrio-2018/technical-exercise/ansible/playbook.retry
    ```

* The flashback part is that I've done this exact same thing a long time ago (maybe at COF) ; and the issue may be that there's no delay between restarting the service and when I try to do something with it ; chances are good it's not fully ready to go
* There's a second issue: Jenkins since sometime early in v2.x has had that lock screen where you have to pass in the `initialAdminPassword` to do anything ; I seem to recall working thru some stuff from Viktor Farcic to get this working
* A couple links, where one refers to the other
  * [Avoid 2.0 setup wizard but provide secure-by-default configuration #50](https://github.com/geerlingguy/ansible-role-jenkins/issues/50)
  * [Jenkins 2.0: Turn off Setup wizard](https://groups.google.com/forum/#!msg/jenkinsci-users/Pb4QZVc2-f0/ywKqZVf9MgAJ)

* Well hmm. Here's the top of `/etc/default/jenkins` ; seems like I've got some other issue

    ```bash
    # Allow graphs etc. to work even when an X server is present
    JAVA_ARGS="-Djava.awt.headless=true"
    JAVA_ARGS="$JAVA_ARGS -Djenkins.install.runSetupWizard=false"
    ```

* **QUESTION** What's the usual practice you guys follow for asking questions? Just put it out there and someone will respond?
* **QUESTION** I'm stuck trying to figure out why even though `/etc/default/jenkins` (on a Ubuntu instance) has the following lines, I'm still seeing the "unlock Jenkins" screen on login

* nice touch ; I've done similar things in the past, but can't find it right now :|
  * [How to set host_key_checking=false in ansible inventory file?](https://stackoverflow.com/questions/23074412/how-to-set-host-key-checking-false-in-ansible-inventory-file)
  * found it over in `/Users/tim.condit/PhilipJFry/src/Numera_Engineering/numera-jenkins/docker/share/src/scripts`

	```bash
    # don't ask "are you sure?"
    sudo docker exec numera-nexus /bin/bash -c 'echo -e "Host bitbucket.org\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config'
    ```

* [ ] **TODO** figure out how to use `StrictHostKeyChecking no` in Ansible

