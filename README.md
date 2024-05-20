# CHIPS Alliance Website

This site is based off of [the Sendit Hugo theme](https://github.com/CloudCannon/sendit-hugo-template) and powers [chipsalliance.org](https://chipsalliance.org/).

## Develop

This theme was built with [Hugo](https://gohugo.io/) version `v0.108.0+extended`, but should support newer versions as well.

### Prerequisites
[Install Hugo](https://gohugo.io/getting-started/installing/)

### Quickstart
Start site: `hugo server`. The site will be at: [http://localhost:1313/](http://localhost:1313/)

### Update Modules
The Workgroups and Projects pages are created from [files in the TAC repo](https://github.com/chipsalliance/tac/) and pulled in to the site via [Hugo Modules](https://gohugo.io/hugo-modules/). The build system assumes that the TAC repository is used as a local module.
Prior building the website, the TAC repository has to be cloned into the `themes/tac` directory. To do so, run the following command:

```bash
git clone https://github.com/chipsalliance/tac themes/tac
```

In the top level directory of this project.
To update the module simply pull the latest code of the TAC repository.
