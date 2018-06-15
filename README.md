# terraform-landscape
Auto-trigger docker build for [terraform-landscape](https://github.com/coinbase/terraform-landscape) when new release is announced

### Repo:

https://github.com/alpine-docker/terraform-landscape

### Daily build logs:

https://travis-ci.org/alpine-docker/terraform-landscape

### Docker iamge tags:

https://hub.docker.com/r/alpine/landscape/tags/

# Usage:

    # must mount the local folder to /apps in container.
    docker run -ti --rm -v $(pwd):/apps alpine/landscape:0.1.18

    # run terraform-landscape container as command
    alias landscape="docker run -i --rm -v $(pwd):/apps alpine/landscape:0.1.18"
    landscape --help
    terraform plan |tee report
    landscape - < report
    # or
    terraform plan | landscape -

# The Processes to build this image

* Enable Travis CI cronjob on this repo to run build daily on master branch
* Check if there are new tags/releases announced via Github REST API
* Match the exist docker image tags via Hub.docker.io REST API
* If not matched, build the image with latest version as tag and push to hub.docker.com
