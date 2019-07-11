Docker Compose deployment for the CoGS web service

## Modifying the database

The following command will open a Python REPL in the context of the backend:

```console
$ docker exec -ti ${env}_backend_1 python3
```

(where `${env}` is either `development` or `testing`, depending on which
environment you are attempting to interact with)

This can then be used as described in the backend README to interact with the
database via the Python ORM.
