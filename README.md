# LuciusOperations

This repo is a toolbox for the maintenance of the Lucius stack.

At the moment, the defaults are for a development environment running locally.

If spark-jobserver is running, this is the (current) sequence of working components:

```
target/native/api/fetch_jar/fetch_jar
target/native/api/create_context/create_context
target/native/api/upload_jar/upload_jar
```

To wrap up, the following can be used:

```
target/native/api/remove_context/remove_context
```
