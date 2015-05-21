#!/bin/bash

template="./vpc-dependency-role.template"
stack_name='vpc-dependency-support'

current_dir=`readlink -f ${BASH_SOURCE[0]%/*.sh}`
$current_dir/../create-role.sh $stack_name $template