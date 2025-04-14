Tools Docker Image

Introduction
This image is a containerization of common sools used during build such as semantic-release, helm, kubectl, kubectx & kubens - this can also be used by the developer team to mount and execute any command contained in the container.

Tools included


semantic-release -  Inspects commits messages and automatically creates/pushes tags in SemVer format back to the repo.


sematic-rlease plugins - a set of plugins used to release e.g

 @semantic-release/gitlab 
 @semantic-release/release-notes-generator 
 @semantic-release/docker @semantic-release/helm




yq - yml query & editing comman line tool


jq - json query & editing comman line tool


...



semantic releae overview


Developer commits code with commit messages following Angular's conventional commits spec.


Tool inspects commit messages as code gets merged and does the following:

Generates a git tag following the Semver spec, while inferring from the commit message.
Pushes generated tag back to repo.
Generates Gitlab release notes






Commit message
Release type




fix(pencil): stop graphite breaking when too much pressure applied
Patch Release


feat(pencil): add 'graphiteWidth' option

Minor Feature Release



perf(pencil): remove graphiteWidth optionBREAKING CHANGE: The graphiteWidth option has been removed.The default graphite width of 10mm is always used for performance reasons.


Major Breaking Release




Included plugins (additional):

@semantic-release/gitlab: Connector to gitlab
@semantic-release/release-notes-generator: Generates release notes


How to use

Ensure you have .releasesrc.json in the root of your project. 
See here for more details on configuration Semantic Release Configuration 
The basic configuration below watches for merges to "master" branch


{
  "branches": [ "master" ],
  "plugins": [
    ["@semantic-release/gitlab", {
      "gitlabUrl": "https://gitlab.com"
    }],
    ["@semantic-release/release-notes-generator", {}]
  ]
}



Configure your gitlab ci pipeline to use Semantic Release 
Example .gitlab-ci.yml


stages:
  - release

release:
  - image: registry.gitlab.com/iclchan/semantic-release-docker:latest
  - script:
      - semantic-release



Set environment variable GL_TOKEN to be the access token with push permissions to your repo.

