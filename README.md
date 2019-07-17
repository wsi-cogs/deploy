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

## Development

The basic idea: the master branch of this repository (and its submodules) should
always be in a fit state to deploy to production.

Development happens (usually in branches) in the frontend and backend
repositories, with development instances being run from checkouts of whatever
branches are relevant; at the point that a new feature lands in the master
branch of one or both of those repositories (having been tested before merging
to master), the `update-submodules.sh` script can be used to update this
repository with the new commits from the submodules, and the production instance
can then be updated from a checkout of this repository.
