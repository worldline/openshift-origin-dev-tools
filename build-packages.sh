#!/bin/bash

# http://openshift.github.io/documentation/oo_notes_building_rpms_from_source.html

yum install -y rubygem-thor git tito yum-plugin-priorities wget vim-enhanced ruby-devel rubygems-devel rubygem-aws-sdk rubygem-parseconfig rubygem-yard rubygem-redcarpet
export SKIP_SETUP=1
# From origin-dev-tools's checkout
./build/devenv clone_addtl_repos worldline-openshift-origin-release-3
if [ $? -ne 0 ]
then
  echo "./build/devenv clone_addtl_repos worldline-openshift-origin-release-3 failed"
  exit -1
fi
# From origin-dev-tools's checkout
# This step will install a lot of RPMs and will take a while
./build/devenv install_required_packages
if [ $? -ne 0 ]
then
  echo "./build/devenv install_required_package failed"
  exit -1
fi
# From origin-dev-tools's checkout
./build/devenv local-build --skip-install
