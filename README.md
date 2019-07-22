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

Development happens (ideally in branches) in the frontend and backend
repositories, with development instances being run from checkouts of whatever
branches are relevant; at the point that a new feature lands in the master
branch of one or both of those repositories (having been tested before merging
to master), the `update-submodules.sh` script can be used to update this
repository with the new commits from the submodules, and the production instance
can then be updated from a checkout of this repository.

In other words, development looks like this:

```console
~/deploy/backend (master)$ git checkout -b my-feature-branch
~/deploy/backend (my-feature-branch)$ # implement the feature
~/deploy/backend (my-feature-branch)$ git commit -m "Implement feature"
~/deploy/backend (my-feature-branch)$ # test the feature
~/deploy/backend (my-feature-branch)$ git checkout master
~/deploy/backend (master)$ git merge my-feature-branch
~/deploy/backend (master)$ git push
~/deploy/backend (master)$ cd ~/deploy
~/deploy (master)$ ./update-submodules.sh
Updated submodules and pushed to remote
```

then, on the production server, deployment looks like this:

```console
~/deploy (master)$ # get the new commits
~/deploy (master)$ git pull --recurse-submodules=on-demand
~/deploy (master)$ # checkout the submodules to the correct commits
~/deploy (master)$ git submodule update --recursive
```
