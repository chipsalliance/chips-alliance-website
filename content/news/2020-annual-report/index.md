---
date: 2021-01-01T00:00:00Z
title: 2020 Annual Report
categories:
  - Reports
author: 
images: ['news/2020-annual-report/share.jpg']
aliases: ['/chips-alliance-2020-annual-report/']
---

CHIPS Alliance was founded in March 2019 to design high-quality, open source hardware register transfer level (RTL) and develop open source hardware and software design tools. By creating an open and collaborative environment, companies and organizations can develop innovative, cost effective hardware designs optimized for the requirements of today’s silicon devices and FPGAs.

CHIPS Alliance was incorporated by four organizations which wanted to make open source silicon a reality. Esperanto, Google, SiFive and Western Digital were the founding members. Now that one year has passed since the organization’s founding, it is fitting to look back at our progress so far. We are pleased to present this annual report detailing the many things we have accomplished collectively in this fast growing organization.

Comments and feedback are welcome at info@chipsalliance.org.

“The growth behind CHIPS Alliance has been incredible. We are laying the foundation for open source hardware development to become accessible to a wider number of companies, universities and individuals.”  
– Zvonimir Bandic, Governing Board Chair, CHIPS Alliance, and Senior Director, Western Digital


## A Great First Year For Chips Alliance

* [Who we are](#who-we-are)
* [Current Workgroups](#current-workgroups)
* [Our Beginning & Current Membership](#growing-membership)
* [How Do I Get Involved?](#how-do-i-get-involved)
* [Events Over The Past Year](#events-over-the-past-year)
* [Technical Highlights](#technical-highlights)
* [Why Members Join CHIPS Alliance](#why-members-join-chips-alliance)
* [News and Media Coverage](#member-news)
* [A Look Ahead To 2021](#a-look-ahead-to-2021)


## Who We Are

CHIPS Alliance is a barrier free, open organization focused on developing open source hardware RTL and open source hardware and software development tools. The organization desires to lower the cost of chip development through collaboration, leveraging the diverse expertise and broad experience of its members. CHIPS Alliance encourages contributions and shared investments by providing vendor-neutral promotional events, documentation, tools and support for a variety of projects in our workgroups.

## Current Workgroups

The following workgroups are part of CHIPS Alliance:

* Interconnect
  * OmniXtend
  * AIB (Chiplets)
  * TileLink
* Cores
  * SweRV Cores
* Tools
  * Verilator
  * FuseSoC
  * Cocotb
  * riscv-dv
* Chisel 
* Rocket SoC

## Growing Membership

In March 2019, CHIPS Alliance was formed as a project under the Linux Foundation. The four founding members – Esperanto, Google, SiFive and Western Digital – set the aspirations for the group. CHIPS Alliance can be viewed as an extension of the mission started by organizations such as RISC-V International. RISC-V defines an open instruction set architecture (ISA) specification which paved the way for a plethora of open cores and CPU implementations, but does not instruct how to make the physical hardware and other building blocks needed to create practical open silicon. This is where CHIPS Alliance begins. Using open standards such as RISC-V, CHIPS Alliance is working to collaboratively build robust and industry-proven cores, peripherals and SoCs. 

Early on it became clear that lowering the barriers and cost of development would require collaboration among many parties to develop relevant open source design tools. CHIPS Alliance stepped up to the task. Today the organization focuses on both open source hardware RTL designs and open source software and hardware design tool development. CHIPS Alliance is a barrier free, open organization promoting open silicon.

CHIPS Alliance has grown to nineteen members over the past year. The organization now boasts some of the world’s leading semiconductor manufacturers including Intel, Samsung, Futurewei and Alibaba. Software tools, IP and services companies in the organization include Antmicro, Codasip, Imperas and Qamcom. Several notable universities and open source projects are also part of CHIPS Alliance, including the leading open simulator tool Verilator, UC Berkeley, IIT Madras, Yale University, OpenRoad, Munich University of Applied Sciences and UC San Diego. The complete membership list can be found at https://chipsalliance.org/.

## How Do I Get Involved?


To aid new members and those who are interested in knowing more about CHIPS Alliance, we have created a [Getting Started Guide](https://github.com/chipsalliance/foundation). We encourage everyone to join our main [mailing list](https://github.com/chipsalliance/foundation/blob/master/tutorials/GROUPS.IO.md), follow us on social media channels [Twitter](https://twitter.com/chipsalliance) and [LinkedIn](https://www.linkedin.com/company/chipsalliance/), and engage in our technical community, which is not limited to members. If you see a particular workgroup you want to get involved in, you can join that specific mailing list and attend their meetings.


## Events Over The Past Year


After the formation of CHIPS Alliance, we began holding events to share what the organization is about and to highlight progress of various work groups. Listed chronologically:

* It started with our [inaugural workshop](https://events19.linuxfoundation.org/events/chips-alliance-workshop-2019/program/schedule/) held in June 2019 at Google’s Sunnyvale campus. The list of speakers included CEOs, CTOs, engineers and other technical presenters. Over 200 attendees joined us for our initial event.
* In August 2019, CHIPS Alliance held a [meetup](https://www.meetup.com/Bay-Area-RISC-V-Meetup/events/264231095/) in the Bay Area highlighting a proposed graphics extension for RISC-V.
* In November 2019, the Munich University of Applied Sciences held an [open source design verification workshop](https://chipsalliance.org/workshops-meetings/munich-workshop-2019-venue-and-agenda/) in Munich, Germany.
* In January 2020, CHIPS Alliance hosted a [Chisel Community Conference](https://events.linuxfoundation.org/chisel-community-conference/program/schedule/) at Western Digital’s Milpitas office. The two day event featured talks from industry leaders and academia, as well as in-depth training on Chisel, FIRRTL and the associated software ecosystem.
* In April 2020, CHIPS Alliance held an online meetup on [Cache Coherent Memory Fabric](https://www.meetup.com/Bay-Area-RISC-V-Meetup/events/269617034/) with TileLink and OmniXtend. There were over 250 attendees who learned about developments from SiFive, Western Digital and Intel.

## Technical Highlights

* The CHIPS Alliance [announced](https://chipsalliance.org/blog/2020/05/14/newly-enhanced-swerv-cores/) the enhanced updates of the SweRV Core EH2 and EL2 solutions which were initially developed by Western Digital. The SweRV Core family also includes the EH1. Learn more at [GitHub](https://github.com/chipsalliance/Cores-SweRV).
* Antmicro, Google and the CHIPS Alliance have been[ working together](https://antmicro.com/blog/2020/04/systemverilog-linter-and-formatter-in-fusesoc/) with the lowRISC project to develop Verible support for some SystemVerilog features required for working with practical use cases, such as lowRISC’s ibex. Furthermore, the recent integration of Verible with FuseSoC has made linting and formatting automation even easier.
* Antmicro and Google developed an open source SystemVerilog test suite. It is available on [GitHub](https://github.com/SymbiFlow/sv-tests). The suite runs a number of open source EDA tools against a series of SystemVerilog compliance tests and presents the [results online](https://symbiflow.github.io/sv-tests/).
* The[ SweRV Support Package (SSP)](https://www.codasip.com/swerv), developed by Codasip in cooperation with Western Digital, provides a comprehensive set of tools and components for designing, implementing, testing and writing software for a SweRV Core-based SoC. The basic version of the SSP is available free of charge at[ GitHub](https://github.com/chipsalliance/Cores-SweRV).
* The [SweRV Instruction Set Simulator (ISS)](https://github.com/chipsalliance/SweRV-ISS), initially developed by Western Digital, offers full test bench support for the design of SweRV Cores.
* Antmicro together with Western Digital and FOSSi Foundation developed the initial [Verilator](https://github.com/verilator/verilator) open source simulator support in [Cocotb](https://github.com/cocotb/cocotb) – an open source Python coroutine-based co-simulation library.
* Antmicro has developed an open source test suite for USB IP cores, available on [GitHub](https://github.com/antmicro/usb-test-suite-build).
* The Advanced Interface Bus (AIB) specification and reference implementations from Intel were published on [GitHub](https://github.com/chipsalliance/aib-phy-hardware).
* Western Digital [open sourced](https://blog.westerndigital.com/omnixtend-fabric-innovation-with-risc-v/) the OmniXtend™ cache-coherent protocol to provide an efficient way to attach persistent memory processors. Learn more at [GitHub](https://github.com/chipsalliance/omnixtend).
* Google released RISCV-DV – a SystemVerilog/UVM based open-source instruction generator for RISC-V processor verification. The project is available on [GitHub](https://github.com/google/riscv-dv).
* The Cores and Tools workgroups created a portable SoC based on the SweRV CoreTM EH1 using FuseSoC; the SoC includes a debug port and Zephyr support.
* The Chisel workgroup has also achieved a significant number of technical milestones, as presented on the [2020 Chisel Community Conference](https://events.linuxfoundation.org/chisel-community-conference/program/schedule/)

## Why Members Join Chips Alliance


The members of CHIPS Alliance join for a variety of reasons. Some organizations join to grow their business. Companies that fall into this group normally offer an open source solution, along with selling support and additional services to interested companies. As an example, Codasip has an open [SweRV package](https://codasip.com/swerv/#action) that anyone can access, a Pro version with commercial EDA tools, and customization and verification services available upon request.

Many organizations join CHIPS Alliance to accelerate development of a RTL IP/SoC or software tool. For example, Verilator and Chisel are software development tools that have benefited from their organizations joining. See slide 4 of the [Verilator, Accelerated](https://www.veripool.org/papers/Verilator_Accelerated_OSDA2020.pdf) presentation to see how CHIPS Alliance has benefited the Verilator ecosystem.

Another reason companies join CHIPS Alliance is to accelerate adoption of IP or software. One such IP is AIB which was brought into CHIPS Alliance by Intel. AIB is a chiplet interconnect and is being adopted by a number of companies. Recently [DARPA presented](https://www.darpa.mil/news-events/2020-03-25) on the benefits of AIB and how chiplets can accelerate SoC development.


## Chips Alliance News

* [CHIPS Alliance’s Newly Enhanced SweRV Cores Available to All for Free](https://chipsalliance.org/announcement/2020/05/14/newly-enhanced-swerv-cores/) – May 14, 2020
* [Intel Joins CHIPS Alliance to Promote Advanced Interface Bus (AIB) as an Open Standard](https://chipsalliance.org/announcement/2020/01/22/intel-joins-chips-alliance-to-promote-advanced-interface-bus-aib-as-an-open-standard/) – Jan. 22, 2020
* [CHIPS Alliance Announces Technical Milestones, Three New Workgroups Including Chisel and the 3rd Chisel Community Conference](https://chipsalliance.org/announcement/2019/11/07/chips-alliance-announces-technical-milestones-three-new-workgroups-including-chisel-and-the-3rd-chisel-community-conference/) – Nov. 7, 2019
* [CHIPS Alliance Growth Continues with New Members and Design Workshop this November](https://chipsalliance.org/announcement/2019/10/15/chips-alliance-growth-continues-with-new-members-and-design-workshop-this-november/) – Oct. 15, 2019
* [CHIPS Alliance Builds Momentum and Community with Newest Members Imperas Software and Metrics](https://chipsalliance.org/announcement/2019/06/18/chips-alliance-builds-momentum-and-community-with-newest-members-imperas-software-and-metrics/) – June 18, 2019
* [CHIPS Alliance to Reveal Project Details, Strategy and Roadmap at Inaugural Workshop Hosted at Google](https://chipsalliance.org/announcement/2019/05/07/chips-alliance-to-reveal-project-details-strategy-and-roadmap-at-inaugural-workshop-hosted-at-google/) – May 7, 2019
* [Open Hardware Group – CHIPS Alliance – Building Momentum and Community with Newest Member Antmicro](https://www.prnewswire.com/news-releases/open-hardware-group---chips-alliance---building-momentum-and-community-with-newest-member-antmicro-300834316.html) – April 18, 2019
* [Linux Foundation to Host CHIPS Alliance Project to Propel Industry Innovation Through Open Source CPU Chip and SoC Design](https://chipsalliance.org/announcement/2019/03/11/linux-foundation-to-host-chips-alliance-project-to-propel-industry-innovation-through-open-source-cpu-chip-and-soc-design/) – March 11, 2019

## Member News

* [Codasip Releases Support Package For Western Digital’s First RISC-V Swerv Core](https://codasip.com/2020/04/23/codasip-releases-support-package-for-western-digitals-first-risc-v-swerv-core/) – Codasip, April 23, 2020
* [SystemVerilog Linting and Formatting with FuseSoC – Verible Integration](https://antmicro.com/blog/2020/04/systemverilog-linter-and-formatter-in-fusesoc/) – Antmicro, April 11, 2020
* [QuickLogic and Antmicro Announce Renode Framework Support for EOS S3 SoC](https://www.prnewswire.com/news-releases/quicklogic-and-antmicro-announce-renode-framework-support-for-eos-s3-soc-300972967.html) – QuickLogic Corporation, Dec. 11, 2019
* [Codasip Teams Up With Western Digital To Support Adoption Of Open-Source Processors](https://codasip.com/2019/12/10/codasip-teams-up-with-western-digital-to-support-adoption-of-open-source-processors/) – Codasip, Dec. 10, 2019
* [Qamcom Joins CHIPS Alliance to Accelerate the Development of Next-Generation Devices](https://www.qamcom.com/pr/qamcom-joins-chips-alliance) – Qamcom, Nov. 22, 2019
* [Antmicro Upgrades to Gold Membership and Drives CHIPS Alliance Outreach Committee](https://antmicro.com/blog/2019/11/antmicro-upgrades-to-gold-membership-chips-alliance/) – Antmicro, Nov. 15, 2019
* [Chips Alliance Growth Continues With New Members And Design Workshop This November: Codasip And Munich University Of Applied Science Become Members](https://codasip.com/2019/10/15/chips-alliance-growth-continues-with-new-members-and-design-workshop-this-november-codasip-and-munich-university-of-applied-science-become-members/) – Codasip, Oct. 15, 2019
* [Antmicro to Participate in Inaugural CHIPS Alliance Workshop](https://antmicro.com/blog/2019/06/antmicro-at-chips-alliance-workshop/) – Antmicro, June 18, 2019
* [OmniXtend™ Cache-Coherent Fabric Drives Innovation with RISC-V](https://blog.westerndigital.com/omnixtend-fabric-innovation-with-risc-v/) – Western Digital, June 18, 2019
* [CHIPS Alliance Builds Momentum and Community with Newest Members Imperas Software and Metrics](https://www.prnewswire.com/news-releases/chips-alliance-builds-momentum-and-community-with-newest-members-imperas-software-and-metrics-300870467.html) – Imperas, June 18, 2019
* [CHIPS Alliance – Building Momentum and Community with Newest Member Antmicro](https://antmicro.com/blog/2019/04/pr-antmicro-joins-chips-alliance/) – Antmicro, April 18, 2019
* [RISC-V SweRV CoreTM Available to Open Source Community](https://blog.westerndigital.com/risc-v-swerv-core-open-source/) – Western Digital, April 11, 2019

## Media Coverage

* [Open Source and Open Standards Open the Future](http://storagegaga.com/open-source-and-open-standards-open-the-future/) – Storage Gaga, Feb. 3, 2020
* [Intel Joins CHIPS Alliance to Foster Chiplet Ecosystem](https://www.tomshardware.com/news/intel-joins-chips-alliance-to-foster-chiplet-ecosystem) – Tom’s Hardware, Jan. 25, 2020
* [Intel Joins CHIPS Alliance, Contributes Advanced Interface Bus](https://www.anandtech.com/show/15434/intel-joins-chips-alliance-contributes-advanced-interface-bus) – AnandTech, Jan. 24, 2020
* [Western Digital Rolls-Out Two New SweRV RISC-V Cores For Microcontrollers](https://www.anandtech.com/show/15231/western-digital-rollsout-two-new-swerv-riscv-cores) – AnandTech, Dec. 13, 2019
* [Codasip Partners with Western Digital on Open‑Source Processors](https://www.eenewseurope.com/news/codasip-partners-western-digital-open-source-processors) – eeNews Europe, Dec. 10, 2019
* [RISC-V Day: Western Digital SweRV Core](https://www.electronicsweekly.com/news/products/micros/risc-v-day-western-digital-swerv-core-2019-10/) – Electronics Weekly, Oct. 1, 2019
* [Five Minutes With…Yunsup Lee, CTO, SiFive](https://www.embedded-computing.com/embedded-insiders/five-minutes-with-yungsup-lee-cto-sifive) – Embedded Computing Design, Sept. 4, 2019
* [CHIPS Alliance Brings Powerful Players into Open Source Hardware Collaboration](https://www.allaboutcircuits.com/news/linux-chips-alliance-open-source-hardware-collaboration/) – All About Circuits, July 8, 2019
* [Five Minutes With… Zvonimir Bandic, Chairman, Chips Alliance](https://www.embedded-computing.com/embedded-insiders/five-minutes-with-zvonimir-bandic-chairman-chips-alliance) – Embedded Computing Design, May 22, 2019
* [Google Wants an Open Source Silicon Community for Chip Design](https://9to5google.com/2019/05/16/google-open-source-silicon/) – 9To5Google, May 16, 2019
* [CHIPS Alliance to Deliver Open Source code for IC design](https://www.electronicsweekly.com/uncategorised/chips-alliance-2019-03/) – Electronics Weekly, March 12, 2019
* [Node.js and JS Foundations are Merging to Form OpenJS](https://venturebeat.com/2019/03/12/node-js-and-js-foundations-are-merging-to-form-openjs/), VentureBeat, March 12, 2019
* [Intel, RISC-V Rally Rival Groups](https://www.eetimes.com/intel-risc-v-rally-rival-groups/) – EE Times, March 11, 2019
* [Open Source Silicon Project Innovates Chips in Communications Networks](https://www.fiercewireless.com/tech/open-source-silicon-project-innovates-chips-communications-networks) – FierceWireless, March 11, 2019
* [CHIPS Alliance Aims to Ease RISC-V Design and Deployment](https://www.techrepublic.com/article/chips-alliance-aims-to-ease-risc-v-design-and-deployment/) – TechRepublic, March 11, 2019
* [Open Source Advances Deeper into Hardware: the CHIPS Alliance Project](https://www.zdnet.com/article/open-source-advances-deeper-into-hardware-the-chips-alliance-project/) – ZDNet, March 11, 2019

## A Look Ahead To 2021

While CHIPS Alliance had a number of in-person events planned for 2020, many of these events have been delayed or postponed due to COVID-19. In the meantime, the CHIPS Alliance will be hosting several online events and meetups. Sign up for our [announcements list](https://lists.chipsalliance.org/g/announce) to be kept up-to-date on our events.

The CHIPS Alliance has seen additional interest from a number of companies, organizations and nonprofits in joining our ecosystem, so we will continue to focus on growing our membership. As development accelerates and more output is generated, we anticipate this will foster even more interest in CHIPS Alliance and its open source solutions.

Lastly, we are actively recruiting a full time executive director and hope to have this individual on board by mid-2020.