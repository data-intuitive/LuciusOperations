#!/bin/bash

## VIASH START
par_endpoint="http://127.0.0.1:8090"
par_classpath="com.dataintuitive.luciusapi"
par_application="lucius"
par_generic_options="spark.scheduler.mode=FAIR&spark.jobserver.context-creation-timeout=60&spark.memory.fraction=0.7&spark.dynamicAllocation.enabled=false&spark.executor.instances=6&spark.executor.cores=4&spark.executor.memory=4g&spark.yarn.executor.memoryOverhead=2g&spark.yarn.am.memory=4G&spark.driver.memory=4G"
## VIASH END

par_options="context-factory=spark.jobserver.context.SessionContextFactory&${par_generic_options}"

curl -s -X DELETE "${par_endpoint}/contexts/${par_application}"
