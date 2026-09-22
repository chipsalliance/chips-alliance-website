# Project landing page content

Project pages under `/projects/<name>/` are generated automatically for every
graduated project in the TAC repository (`projects/project-data-files/*.yml`)
by `content/projects/_content.gotmpl`.

To add hand-written content to a project's landing page, create a markdown file
here named after the TAC data file, e.g. `caliptra.yml` -> `caliptra.md`. It is
rendered above the auto-generated "Project resources" block.
