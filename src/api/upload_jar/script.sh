#!/bin/bash

## VIASH START
# API related
par_endpoint="http://127.0.0.1:8090"
par_classpath="com.dataintuitive.luciusapi"
par_application="lucius"
par_generic_options="spark.scheduler.mode=FAIR&spark.jobserver.context-creation-timeout=60&spark.memory.fraction=0.7&spark.dynamicAllocation.enabled=false&spark.executor.instances=6&spark.executor.cores=4&spark.executor.memory=4g&spark.yarn.executor.memoryOverhead=2g&spark.yarn.am.memory=4G&spark.driver.memory=4G"
par_tag=5.1.0
par_jar_prefix=LuciusAPI-assembly
par_target=jars
## VIASH END

JAR="${par_jar_prefix}-${par_tag}.jar"
URI="${par_base}/v${par_tag}/${JAR}"

par_options="context-factory=spark.jobserver.context.SessionContextFactory&${par_generic_options}"

TARGET="@${par_target}/${JAR}"

curl -s -H 'Content-Type: application/java-archive' --data-binary "$TARGET" "${par_endpoint}/binaries/${par_application}"
