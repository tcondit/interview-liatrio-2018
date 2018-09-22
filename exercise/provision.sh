#!/usr/bin/env bash

echo
echo "### This script will destroy and replace your current EC2 instance!"
echo "### Continue?"
echo

# https://stackoverflow.com/a/226724
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) exit;;
    esac
done

OLDCWD=`pwd`
echo OLDCWD $OLDCWD
cd terraform/base
echo CWD `pwd`
echo terraform apply -auto-approve
cd $OLDCWD/ansible
echo CWD `pwd`
echo ansible-playbook playbook.yml --limit=exercise-EC2
