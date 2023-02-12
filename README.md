# CHIPS Alliance Website

This site is based off of [the Sendit Hugo theme](https://github.com/CloudCannon/sendit-hugo-template) and will eventually power [chipsalliance.org](https://chipsalliance.org/).

## Develop

This theme was built with [Hugo](https://gohugo.io/) version `v0.108.0+extended`, but should support newer versions as well.

### Prerequisites
[Install Hugo](https://gohugo.io/getting-started/installing/)

### Quickstart
Start site: `hugo server`. The site will be at: [http://localhost:1313/](http://localhost:1313/)

### Update Modules
The Workgroups page is created from [files in the TSC repo](https://github.com/chipsalliance/tsc/tree/main/workgroups) and pulled in to the site via [Hugo Modules](https://gohugo.io/hugo-modules/). Once a change is made to that repo, the module will need updating using `hugo mod get -u`.