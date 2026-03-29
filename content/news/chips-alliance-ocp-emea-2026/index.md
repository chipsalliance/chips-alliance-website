---
date: 2026-03-28T00:00:00Z
title: CHIPS Alliance at 2026 OCP EMEA Summit
categories:
  - Blog
tags: [announcement, ocp, caliptra, guineveer, risc-v]
author:
images: ['news/chips-alliance-ocp-emea-2026/ocp-emea-2026-booth.png']
aliases: ['/blog/2026/03/28/chips-alliance-ocp-emea-2026/']
---

CHIPS Alliance, an organization operating under the auspices of the Linux Foundation, will participate in the [OCP EMEA 2026 Summit](https://www.opencompute.org/summit/emea-summit) from April 29 to 30 in Barcelona, Spain. We'll be located at Booth B54 alongside other Linux Foundation projects (SONiC Foundation & Open Programmable Infrastructure Project (OPI)), where representatives from Platinum members Google and Antmicro will engage with participants and discuss open source silicon development.

At the CHIPS Alliance booth, member Antmicro will be showcasing [Guineveer](https://github.com/chipsalliance/guineveer), a simple and extensible RISC-V reference design they contributed to CHIPS Alliance, meant to serve as a baseline for creating custom SoCs. Based on the [VeeR EL2 core](https://github.com/chipsalliance/Cores-VeeR-EL2), a tiny, 32-bit variant of the CHIPS Alliance-hosted VeeR family of open source, production-grade RISC-V cores that is used across CHIPS Alliance projects such as [Caliptra](https://github.com/chipsalliance/caliptra), Guineveer can be easily modified with Antmicro's open source [Topwrap](https://github.com/antmicro/topwrap) digital design aggregation framework, which lets you assemble designs from readily available building blocks.

Read more in the [Designing Modular and Reusable RISC-V SoCs with Topwrap and Guineveer](https://www.chipsalliance.org/news/designing-modular-and-reusable-risc-v-socs-with-topwrap-and-guineveer/) blog.

Several technical sessions featuring contributors from CHIPS Alliance ecosystem include:

- **Composable Security Architecture Episode 4: Bringing Together Platform Ingredients: Wed, April 29, 15:55 - 16:15**
  - **Speakers**: Louis Ferraro (AMD — Platinum Member) and Miguel Osorio (Google — Platinum Member).
  - **Technical Focus**: Development of the OpenPRoT portable, open source Platform Root of Trust firmware stack. The talk introduces a standardized PRoT module connector for DC-SCM boards and demonstrates dual-configuration approaches for Endpoint RoT and Orchestrator RoT.
- **Scaling Trusted AI Infrastructure: Wed, April 29, 10:18 - 10:29**
  - **Speaker**: Bryan Kelly (Microsoft — Platinum Member).
  - **Technical Focus**: Sovereign cloud architecture utilizing open source hardware security foundations including Caliptra, OCP SAFE, and Confidential Computing. The session previews OCP contributions for hardware partitioning and isolation for AI platforms.
- **Caliptra Update: Wed, April 29, 13:00 - 13:15**
  - **Speaker**: John Traver (AMD — Platinum Member).
  - **Technical Focus**: Current integration efforts, status of RTL, ROM, and firmware for 2.1 enablement, and the roadmap for Caliptra 2.2 features including USB 2.0 and size reduction.
- **Caliptra as Server Security Hub: Wed, April 29, 14:20 - 14:40**
  - **Speakers**: Phanikumar Kancharla (Marvell — Gold Member) and Craig Barner (Marvell — Gold Member).
  - **Technical Focus**: Hardware managed Key distribution Protocol (KDP) with KMTx/KMRx endpoints. This work defines the provisioning of Bus Encryption Keys and Data Encryption Keys across SoC or UCIe die-to-die connections anchored to Caliptra.
- **Caliptra Trademark Audit: A Practitioner's Guide: Wed, April 29, 15:35 - 15:50**
  - **Speaker**: Jasper van Woudenberg (Keysight Technologies).
  - **Technical Focus**: Practical insights into the Caliptra Trademark Audit process, including preparation of RTL, ROM, and firmware documentation for laboratory review and navigating OCP SAFE requirements.
- **Secure RPMC and Flash Key Provisioning Using Caliptra-SS: Wed, April 29, 16:45 - 17:00**
  - **Speakers**: Emre Karabulut (Microsoft — Platinum Member) and Vishal Soni (Microsoft — Platinum Member).
  - **Technical Focus**: Hardware anchored method for provisioning RPMC and flash encryption keys through the OCP LOCK mechanism. The design leverages the Caliptra secure subsystem to prevent key exposure to firmware or host software.
- **Towards a European Open Infrastructure: Insights from HIGHER, CAPE, and CHORYS: Thu, April 30, 13:35 - 13:50**
  - **Speakers**: Jens Hagemeyer (University of Bielefeld), Manolis Marazakis (FORTH), and Philippe Bonnet (University of Copenhagen — Associate Member).
  - **Technical Focus**: European Horizon projects leveraging RISC-V and ARM for modular infrastructure. Specific implementations include a DC-SCM based on Caliptra RTM and RISC-V Near-Data Processing in SSDs and NICs.

See you there!

*Keep up to date with CHIPS Alliance by connecting with the community on [LinkedIn](https://www.linkedin.com/company/chipsalliance/?viewAsMember=true) or subscribe to our quarterly newsletter [here](https://www.linkedin.com/newsletters/7341146987217502211/).*
