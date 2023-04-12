---
date: 2023-04-12T00:00:00Z
title: Integrating the Language Server Protocol in Verible
categories:
  - Blog
author: 
images: ['news/Integrating-Language-Server-Protocol-in-Verible/lsp-illustration_chips.png']
---

A more collaborative, open and software driven ASIC design methodology pioneered by the [CHIPS Alliance](https://chipsalliance.org) requires an open source tooling stack to enable sharing of workflows, artifacts and fostering a free exchange of insights and improvements.

While internally often using new design methodologies and languages such as Migen, Chisel or XLS, Antmicro is conscious of the fact that a lot of the world’s ASIC development involves SystemVerilog and UVM, and so we are working on bridging traditional and new ASIC development methodologies as described in a [recent blog note](https://antmicro.com/blog/2023/01/open-source-systemverilog-uvm-support-in-verilator/). 

Another notable example of an effort to provide open source tools for a key part of the ASIC flow, the RTL creation itself, is [Verible](https://github.com/chipsalliance/verible), an open source SystemVerilog toolkit developed by Google in collaboration with Antmicro within the CHIPS Alliance.

The Verible project offers a variety of SystemVerilog development tools, including a parser, a linter and a formatter, that together make finding and fixing syntactic and stylistic errors and bugs in SystemVerilog code simpler and faster. Being completely open source, it enables implementation of open CI and massively scalable infrastructure, and since some time it also features a [Language Server](https://github.com/chipsalliance/verible#language-server), which is currently under active development. The capabilities and new features will be described in this note.

### Language servers overview

Modern code editors (both GUI- and command line-driven) offer many useful features: syntax highlighting, autocompletion, inline errors and warnings reporting, quick fixes, code refactoring and formatting, and more. In the past enabling these features required a separate implementation for each editor, usually resulting in multiple plugins with varying levels of coverage. As a result, support for language-related operations in different editors varied greatly, and making it consistently good was a tedious task.

The [Language Server Protocol (LSP)](https://microsoft.github.io/language-server-protocol/) brought some much-needed standardization to the space, enabling a unified communication method between code editors (or IDEs) and language servers that provide the necessary language features. Since 2016 when the LSP became public and open, many language servers targeting a variety of languages have been created or adapted to follow the standard. Most of the popular editors support LSP, including VS Code (via specific extensions), Vim (via `vim-lsp`), Emacs (via `lsp-mode`), Neovim (built-in), Kakoune (via `kak-lsp`) and Helix (built-in). There are even LSP plugins for IDEs like IntelliJ.

We can distinguish three main parts in an LSP setup:
 
* a workspace, which is the directory containing the files you work with,
* an editor, which is able to read and write the files within the workspace,
* a language server, usually with only read access to the data.

![Diagram depicting communication between an editor and a language server via LSP](lsp-diagram.png)

The editor and the language server are connected via the Language Server Protocol - with a language client on the editor side and a transport & router block on the language server side. Any changes in a file are stored in the text buffer. The editor can ask for diagnostics, symbols, location of definitions, the language server receives updates in the buffer delivered by the editor and analyzes the edited code, as well as the code present in the workspace, and then creates an indexer. This indexer holds all data about the code: available symbols, references, origin of variables etc. but also provides information about other kinds of relationships, e.g. inheritance between classes. This indexer, along with syntax trees coming from parsing the files, provide various services in the language server, such as completion, diagnostics or code action that help with code refactoring.

### Implementing the LSP in Verible

The Verible project offers an impressive list of features, is regularly tested against an ever-growing suite of [language compliance tests](https://chipsalliance.github.io/sv-tests-results/) provided by the [SystemVerilog Tester](https://github.com/chipsalliance/sv-tests) and is in active use by a variety of projects, including the security-oriented [OpenTitan](https://opentitan.org/) initiative. Antmicro has been involved in Verible’s development since its initial open source release and we are now leading the efforts focused on extending the LSP implementation, which has already yielded promising results.

Although several SystemVerilog language server implementations existed before, they weren’t as comprehensive as Verible’s. `verible-verilog-ls` provides the functionalities that come with the Verible command line tools directly in the code editor. These include:

* checking the code against a number of [lint rules](https://chipsalliance.github.io/verible/lint.html),
* format selection according to the Verible formatting style,
* showing high-level structure of modules and functions in the outline tree,
* highlighting related symbols on hover,
* jumping to definition of the indicated symbol,
* AUTO-expansion capabilities.

For more details about Verible’s tools and their capabilities, refer to the project’s [documentation](https://chipsalliance.github.io/verible/).

### Integration with various code editors

`verible-verilog-ls` implements the standardized Language Server Protocol, which as mentioned before, enables support for editors and IDEs such as VS Code, Vim, Neovim, Emacs, Sublime, Kakoune and Kate. It helps highlight syntax errors or lint violations and, if available, suggests fixes. The specific way of hooking up the language server depends on the editor; as VS Code is one of the most popular code editors and also the original target for the LSP, the example shown below focuses on this editor.

VS Code typically adds new features and tools via extensions, in this case the [Verible Language Server Extension](https://github.com/chipsalliance/verible/tree/master/verilog/tools/ls/vscode).

A demo of the AUTO-expansion feature in VS Code is shown below:

<video class="postimgcenter" width="1024" height="502" controls="">
    <source src="autoarg.mp4" type="video/mp4">
</video>

You can get the extension by downloading the `verible.vsix` archive from the [release files](https://github.com/chipsalliance/verible/releases). Then, run VS Code with the following flag to install the extension:

```
code --install-extension verible.vsix
```

For examples how to hook Verible’s LSP into other applications please refer to the [`verible-verilog-ls` README](https://github.com/chipsalliance/verible/blob/master/verilog/tools/ls/README.md).

### Supporting ASIC development with open source tools

The Verible language server, as well as the VS Code extension, are being actively developed by Antmicro, Google and the CHIPS Alliance community. Future updates will include, among others, expanding the information available on hover and finding symbol definitions across different files.

Verible’s open and comprehensive nature, combined with Antmicro’s [automation and CI expertise](https://antmicro.com/blog/2021/08/verible-integration-with-github-actions/), provides a software-driven, scalable solution for SystemVerilog projects. If you’re interested in benefiting from this approach or would like to adapt other open source tools to speed up your ASIC development process, don’t hesitate to contact us at [contact@antmicro.com](mailto:contact@antmicro.com).
