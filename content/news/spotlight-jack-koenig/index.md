---
date: 2025-12-04T00:00:00Z
title:  Inside the Evolution of Chisel- Jack Koenig on Open Source Silicon Design at SiFive
categories:
  - Blog
tags: [Developer Spotlight]
author: 
images: ['news/spotlight-jack-koenig/jack.png']
aliases: ['/blog/2025/12/04/spotlight-jack-koenig/']
---

**From reluctant programmer to compiler maintainer, a decade-long journey shaping open source digital design tools.**   

Jack Koenig is a Senior Staff Engineer at SiFive and one of the longest-standing maintainers of the Chisel and FIRRTL projects.  

Over the past decade, his contributions have helped shape the foundation of open source hardware description in Scala, bridging the worlds of compiler theory, HDL design, and functional programming.   

In this developer spotlight, we explore Jack's journey into open source silicon, his technical contributions, and what lies ahead for Chisel and its ecosystem.   

**From Grad School Frustration to Language Design**   

Jack's path into open source hardware wasn’t driven by an early passion for the programming languages themselves. In fact, as an undergraduate, he was skeptical about the value of new language features. “Why should I care about C++11? C++ already works fine,” he recalled. But that changed when he arrived at UC Berkeley for graduate school and began working on hardware simulation and design in earnest.   

Introduced to Chisel through coursework and lab proximity, he initially found it frustrating compared to traditional HDLs. “I tried to go back to Verilog and realized I hated it even more,” he said. This tradeoff revealed a key insight: the hardware industry standard tools were not just imperfect—they were systematically limiting.   

**Becoming a Maintainer by Necessity**   

Jack began using an early version of Chisel 3 in class projects. At the time, the compiler stack was barely usable. Instead of abandoning it, he started fixing it. “I think that's how a lot of people get into open source,” he noted. “You start using a project, it breaks, and you end up contributing.”   

He soon became a core contributor to FIRRTL (Flexible Intermediate Representation for RTL), collaborating with Adam Izraelevitz and others to move it from prototype to production. Later, he joined SiFive as a part-time contractor focused on compiler infrastructure, before transitioning to full-time in 2018.   

Today, Jack's role spans compiler engineering, language design, and mentoring contributors within the open source ecosystem.   

**Joining the Chips Alliance community**   

Jack’s entry into the CHIPS Alliance came through his work on Chisel and FIRRTL. As the community grew beyond UC Berkeley and SiFive, a neutral home was needed to support the ecosystem’s governance, visibility, and infrastructure. CHIPS Alliance offered that umbrella.   

“As we started seeing adoption outside the original contributors, it was clear we needed a broader structure. CHIPS Alliance gave us a place to build that community.”   

Through weekly calls, GitHub infrastructure, and shared roadmapping, Jack has helped anchor Chisel as a first-class project, while maintaining its technical rigor and openness to contributors.   

**Contributions to Chisel and FIRRTL**   

Jack helped reimplement FIRRTL in Scala to better align with Chisel's generator-based model. He was an early maintainer of the original FIRRTL compiler and has contributed to the ongoing MLIR-based rewrite (CircuitIR).   

One often-overlooked area of his work is signal naming. Jack helped develop Chisel's signal naming strategy, which preserves context, scope, and human readability in the generated Verilog. This matters: engineers debug the output, and readability directly affects trust and adoption.   

“The Verilog is the product. You don’t ship Chisel, you ship Verilog. So we put a lot of effort into making sure that output is readable and stable.”  

**Verification as a Language Concern**   

While Chisel has improved design productivity, Koenig acknowledges that verification remains a major bottleneck.   

“The industry believes verification is 3x to 10x harder than design. Improving the language helps reduce bugs, but it doesn’t eliminate the need for verification.”   

The Chisel team is now focusing on making hierarchical formal verification and test reuse easier. This includes:   
- Adding support for Linear Temporal Logic (LTL) assertions
- Encouraging design-for-verification methodologies
- Making verification artifacts (e.g., assumptions, assertions) portable and modular

Jack emphasizes that most simulation-based testing today uses Verilator. Chisel-generated Verilog stresses edge cases, helping surface bugs and performance issues in downstream tools.   

**Cross-Project Collaboration**   

Chisel does not operate in isolation. It integrates with Verilator, Yosys, LLVM/MLIR, and Rocket Chip. Jack noted that project boundaries often blur: Chisel feeds FIRRTL, which in turn generates Verilog that is verified using tools from other open source communities.


He highlighted that the [Chisel GitHub](https://github.com/chipsalliance/chisel) and developer meetings (every Monday, 9AM PT) are valuable entry points for contributors, especially those unsure of where to begin. Instructions for joining the developer meetings can be found on the [Github README](https://github.com/chipsalliance/chisel?tab=readme-ov-file#chisel-dev-meeting).   

**Style, Community, and Code Culture**   

Jack views Chisel as a platform for reuse and software engineering best practices in hardware design. Unlike Verilog, which often results in copy-pasted derivations, Chisel encourages modularity and abstraction.   

“In Chisel, you don’t want a hundred queues. You want five parameterizable ones. That’s the kind of reuse that prevents bloat.”   

He acknowledges that Scala’s flexibility can create inconsistent code styles. He advocates for future community efforts to establish shared patterns, especially around naming, composition, and debugging idioms.   

**Docs, Onboarding, and Contributions**   

Jack is candid about the challenges of documentation. While Chisel's docs are compiled and tested, many tutorials are outdated. He encourages new users to:   
- Join the developer call or Element chat
- Ask questions via GitHub Discussions
- Start by reading code and small issues, not whole systems   

He believes newcomers are often best positioned to improve documentation precisely because they feel the pain points firsthand.   

**Hardware is Hard: Scaling the Open Source Stack**   

Jack is optimistic but realistic about open silicon adoption. He sees ongoing efforts like OpenROAD and TinyTapeout as critical, though still early.   

“Open source software lets you start a company with just your laptop. Open hardware doesn’t do that yet. We need to bring tapeout costs way down to make the full stack accessible.”   

He believes CHIPS Alliance can help by providing governance and visibility for ecosystem tools, reducing the friction for adoption.  

**Closing Thoughts**   

Asked what contribution he is most proud of, Jack returns to naming. Not because it's glamorous, but because it's durable.   

“Readable, stable signal names don’t just make debugging easier. They make trust possible. When you diff the output and it makes sense, you believe in it.”   

That ethos, making tools trustworthy, inspectable, and user-owned, defines both Koenig's career and the culture of Chisel.   

**Want to Contribute?**   

- Visit: https://github.com/chipsalliance/chisel
- Join the Chisel Dev Call: Mondays, 9AM PT
- Ask questions: GitHub Discussions or Element Chat   

For updates on formal verification, roadmap discussions, and new contributor guides, stay tuned to the [CHIPS Alliance blog](https://www.chipsalliance.org/categories/blog/). You can also keep up to date with CHIPS Alliance by connecting with the community on [LinkedIn](https://www.linkedin.com/company/chipsalliance/?viewAsMember=true) or subscribe to our quarterly newsletter [here](https://www.linkedin.com/newsletters/7341146987217502211/).



