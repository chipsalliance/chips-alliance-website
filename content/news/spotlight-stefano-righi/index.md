---
date: 2026-06-29T00:00:00Z
title: 'CHIPS Alliance Developer Spotlight: Stefano Righi, Chief Security Architect, AMI'
categories:
  - Blog
tags: [Developer Spotlight]
author: 
images: ['news/spotlight-stefano-righi/stefano-righi.png']
aliases: ['/blog/2026/06/29/spotlight-stefano-righi/']
---

*TL;DR: In this Developer Spotlight, Stefano Righi, Chief Security Architect at AMI, shares how a career built at the intersection of hardware and software led him to platform security, what makes Caliptra a landmark open collaboration, and why he believes security must become a default component of every design.*

For Stefano Righi, one of the questions that first sparked his interest in technology was how the same software source code can run on different hardware architectures using all resources in an efficient way and how the operating system is managing the entire platform..

During his electronic engineering studies, he discovered the answer in firmware - the critical layer that bridges hardware and software. Fascinated by how software harnesses hardware resources to deliver results, Stefano found a field that perfectly matched his curiosity. Years later, that curiosity continues to drive his work and passion for technology.

Stefano began as a firmware developer in 1985, working on one of the first laser printers. He later worked on two home computers and an industrial computer, the latter providing a firsthand example of hardware-software codesign. The project involved integrating a standard PC architecture as the user interface for a numeric control system, which required designing a hardware interface capable of efficiently transferring data between the two environments. It was a practical demonstration of how tightly coupled hardware and software must be to deliver reliable performance. He later managed diagnostics, firmware UI and manageability development before dedicating the last decade to platform security solutions.

**Caliptra and the Case for Open Collaboration**

Stefano's motivation to join CHIPS Alliance grew from his interest in platform security and what he describes as the innovation that Composable Security Architecture is bringing to the table. AMI, a CHIPS Alliance member since 2023, has been actively involved in the ecosystem, with Stefano serving as the silver member representative on the Board of Directors.

Among the projects he contributes to, [Caliptra](https://github.com/chipsalliance/Caliptra/blob/main/README.md) is the one Stefano is most proud of. A graduated CHIPS Alliance project, Caliptra provides the specification, silicon logic, ROM, and firmware to implement a Root of Trust for Measurement (RTM) block within a system-on-chip. Designed for datacenter-class SoCs such as CPUs, GPUs, DPUs, and TPUs, Caliptra enables capabilities including device identity, measured boot, and attestation. [Learn more in the Caliptra repository](https://github.com/chipsalliance/caliptra) and [project documentation.](https://github.com/chipsalliance/Caliptra/blob/main/README.md)

"Caliptra is really bringing to fruition the OCP vision of the Composable Security Architecture. It brings platform security to a completely different level, ensuring that problems like time of check and time of use are completely settled."

He considers Caliptra a strong example of hardware and software co-design within CHIPS Alliance.

**Production Readiness and the Role of Security**

For Stefano, production readiness means silicon validated alongside the firmware that will run on it, developed concurrently rather than sequentially, with tools such as emulators and FPGAs enabling earlier testing. The benefits he points to include better performance, faster prototyping, early validation, shift left of the entire cycle, and more efficient hardware utilization by firmware.

Security is inseparable from that definition.

"Security is not achieved by obscurity but by transparency and openness."

**The Opportunity Ahead**

Stefano sees participation as the biggest challenge facing open silicon today. He believes open source hardware will never replace proprietary design, but can help it stay focused on higher-level innovation and value-add differentiation. He adds that many silicon and hardware components are effectively commodities at this point, and that open source implementations would provide better security and interoperability while allowing designers to focus on genuine innovation rather than spending time on well-known technologies.

He is also drawn to the potential for collaboration between industry and universities, and to what open silicon makes possible for startups and students encountering real-world engineering challenges for the first time. Silicon provides the foundation for the entire stack from chip to cloud, and open silicon makes understanding the full stack accessible to a much wider group of people, a privilege he says was once limited to a small group of vertically integrated companies.

His message to anyone considering getting involved is simple: "All are welcome."

**A Final Word**

"Security is a very important vector, way too often ignored in favor of functionality. In the modern interconnected world, it is no longer possible to ignore it. I hope that CHIPS Alliance will raise the bar and make security a must-have included by default in every design."

To learn more about how AMI firmware is contributing to platform security for open silicon with Caliptra and other initiatives, visit AMI in Booth A54 during 2026 OCP Global Summit from October 12-15, 2026 in San Jose, California.
