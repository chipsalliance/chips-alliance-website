---
date: 2021-09-08T00:00:00Z
title: Automatic SystemVerilog Linting in GitHub Actions with Verible
categories:
  - Blog
author: 
images: ['images/blog-share.jpg']
aliases: ['/blog/2021/09/08/automatic-systemverilog-linting-in-github-actions-with-verible/']
tags:
  - [tutorial, verible, risc-v]
---

*This post was originally published at [Antmicro](https://antmicro.com/blog/2021/08/verible-integration-with-github-actions/).*

With the recent advances in open source [ASIC development tools](https://antmicro.com/blog/2021/07/open-source-systemverilog-tools-in-asic-design/) such as Verible, it has become easier to automate tasks and boost developer productivity. The Verible linter is a static code analysis tool that has been helping us and our collaborators to spot and fix stylistic errors and bugs in SystemVerilog code.

## CI/CD for smaller backlog and better test reliability

As part of our work within the newly established CHIPS Alliance SystemVerilog subgroup, Antmicro has made further steps to facilitate SystemVerilog workflows with Verible, by providing an easy to use [Verible Linter GitHub Action](https://github.com/chipsalliance/verible-linter-action). Combined with another open source tool called [Reviewdog](https://github.com/reviewdog/reviewdog), the action allows you to easily perform automatic code style checks and code review.

![Diagram depicting Verible integration with Github Actions](veriable_integration.svg)

Using it is as easy as adding a few lines to a workflow in the `.github/workflows` directory. For basic usage, just add the action with a `github_token` parameter to your current workflow:

```
- uses: chipsalliance/verible-linter-action@main
with:
github_token: ${{ secrets.GITHUB_TOKEN }}
```

For a more tailor-made setup, it is easy to configure the action by:

- excluding selected files from the linting process,
- providing a configuration file that will be used with `--conf-file` option of the linter,
- choosing the form of the output,
- specifying any extra arguments for the linter.

With this straightforward solution, any GitHub-hosted open-source or private project can inform commiters about the issues detected in their code, as you can see in the picture below. Of course, creating similar setups in private installations and other repository systems is also possible, and Antmicro offers the services to develop the necessary tooling, integrations and provide support and guidance.

![Screenshot of Verible Github Actions](verible-github-actions-screenshot1.png)

The action uses a GitHub Token assigned to every workflow run individually. There’s no need to create personal access tokens, and you can use it in any repository, no matter if it uses a public, private, or enterprise plan.

Developers can discuss each problem separately, by creating responses to the comments made by the GitHub Actions bot. Marking a conversation as resolved will let others know that the issue has already been taken care of.

If, instead of automatic code review, you wish to have a log with all the issues, you can omit the github_token parameter. You can see the setup in action on the [Ibex RISC-V Core](https://github.com/lowRISC/ibex) used by the [OpenTitan project](https://opentitan.org/) below:

![Verible CI setup used by OpenTitatn project](verible-github-actions-screenshot2.png)

Software developers have been using such automated solutions to facilitate cross-team and cross-company collaboration, taking away the daily pains of coordinating between large teams while improving the ability to detect faults early. Instant, targeted feedback helps both the committers and the reviewers.

Working together with Google and other CHIPS Alliance members we are making the benefits of automated, software-driven development in distributed environments and the cloud available to hardware developers. A wide range of applications for the Verible linter action can be devised, from faster pull requests reviews, to isolating erroneous portions of code.

## Coming next

We’re working on [adding this action to the Ibex repository](https://github.com/lowRISC/ibex/pull/1427). The next step will be preparing a GitHub Action with the Verible formatter, which will allow to not only find problems but automatically suggest changes.
