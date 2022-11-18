#!/bin/bash

## VIASH START
par_endpoint="http://127.0.0.1:8090"
par_classpath="com.dataintuitive.luciusapi"
par_application="lucius"
par_conf="etc/initialize.conf"
## VIASH END

curl -s --data-binary "@${par_conf}" \
  "${par_endpoint}/jobs?context=${par_application}&appName=${par_application}&classPath=${par_classpath}.initialize"
