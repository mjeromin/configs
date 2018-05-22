#!/bin/sh

ansible-playbook -i "localhost," -c local deploy-home.yml
