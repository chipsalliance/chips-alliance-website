---
date: 2026-08-27T00:00:00Z
title: CHIPS Alliance at 2026 OCP Global Summit
categories:
  - Blog
author: 
images: ['news/ocp-global-2026/ocp-2026-blog.png']
aliases: ['/blog/2026/08/27/ocp-global-2026/']
tags: [ocp, events]
---

[2026 OCP Global Summit](https://www.opencompute.org/summit/global-summit), themed “Scaling Innovation for the AI Era,” will be held October 12-15 in San Jose, California. The event brings together industry leaders, researchers, and members of the open compute community to share technical progress, address emerging challenges, and advance efficient, scalable, and sustainable open hardware and software.   

Several sessions relate to the CHIPS Alliance Caliptra and VeeR projects, covering silicon roots of trust, device identity, secure key distribution, design verification, streaming boot, package-aware integrity and package-granular attestation, manageability, and certificate refresh. Speakers represent CHIPS Alliance member organizations including AMD, Google, Intel, lowRISC, Marvell, Microsoft, NVIDIA, and Research Institutes of Sweden.    

[View the full schedule here](https://www.opencompute.org/summit/global-summit/schedule-at-a-glance) and explore the CHIPS Alliance-related sessions below.    

**Bridging the AI Continuum: Trust, Orchestration, and Open Standards:**     
*Tue, October 13, 4:35 PM–5:00 PM | SJCC, Concourse Level, 211*     
**Speakers:** Dirk Blevins (Intel — Silver Member); Çağatay Yilmaz, moderator (Research Institutes of Sweden); Johan Kristiansson (Luleå University of Technology); Steven Yates (Federant); Raúl Álvarez (Open Compute Project Foundation); and Vincent Nguyen (Hewlett Packard Enterprise)       
**Project(s):** Caliptra    
**Session Abstract:** AI inference is moving out of the hyperscale data center toward regional, colocation, telco, enterprise, and far-edge sites, forming an AI compute continuum that spans independently managed administrative and trust domains. This panel discusses where AI workloads will reside in the near term and how open infrastructures can contribute to trustworthiness across the continuum. We address three critical challenges: heterogeneous multi-provider orchestration without shared control planes, the hard problem of moving data and models into untrusted environments, and how hardware-anchored trust through Trusted Execution Environments, the Caliptra silicon root of trust, and OpenBMC can provide end-to-end attestation of AI workloads. Panel discusses open meta-operating systems for cross-domain orchestration and how the continuum can be rigorously validated on open standards-aligned platforms.    

**OCP Device Identity Provisioning over SPDM:**    
*Thu, October 15, 9:10 AM–9:30 AM | SJCC, Concourse Level, 212*   
**Speakers:** Jeff Andersen (Google — Platinum Member) and Fabrizio Damato (AMD — Platinum Member)    
**Project(s):** Caliptra
**Session Abstract:** Data-center operators and their tenants need to provision their own identity certificates to fleet hardware, independent of vendor-issued birth identities. Until now, SPDM lacked first-class primitives to discover device keypairs, request cryptographically-bound CSRs, and install operator or tenant PKI chains — forcing proprietary, per-vendor integrations.    

The Device Identity Provisioning specification defines an Attested CSR that cryptographically binds a newly generated keypair to the device's attested identity and measured state, together with a companion keypair-discovery flow so enrollment authorities can enumerate the identity keys a device exposes. Today these flows ride on SPDM vendor-defined messages, giving early adopters a path to deploy.    

In parallel, OCP is driving this capability toward DMTF SPDM, where it is anticipated for addition in SPDM 1.5. Open-source RoTs such as Caliptra are expected to adopt the specification, enabling consistent operator and tenant enrollment.    

**USB to Rule Them All: One Manageability Interface for AI Platforms:**    
*Thu, October 15, 9:45 AM–10:10 AM | SJCC, Concourse Level, 220B*    
**Speakers:** Mariusz Oriol (NVIDIA — Silver Member); Bharat Pillili (Microsoft — Platinum Member); Supreeth Venkatesh (AMD — Platinum Member); Kasper Wszolek, moderator (NVIDIA — Silver Member); Samer El-Haj-Mahmoud (Arm); and Mohan Kumar (Oracle Cloud Infrastructure)        
**Project(s):** Caliptra    
**Session Abstract:** As AI racks become denser and more complex, manageability is becoming a critical factor in scalability challenge. In this panel, NVIDIA will be joined by AMD, Arm, Microsoft and OCI to discuss how the industry can align on open, interoperable management models for next-generation AI infrastructure. Panelists will explore reducing proprietary sideband fragmentation, accelerating OCP specification adoption, and converging around approaches such as USB-based manageability, OCP Recovery over USB, Caliptra workflows, OBMF, MCTP over USB, and emerging NC-SI use cases. The discussion will focus on what vendors must do together to make AI racks more reliable, manageable, and scalable.    

**OCP L.O.C.K. and FIPS:**    
*Thu, October 15, 10:05 AM–10:25 AM | SJCC, Concourse Level, 212*    
**Speakers:** Gwangbae Choi (Samsung) and Minhyup Park (Samsung Electronics)       
**Project(s):** Caliptra    
**Session Abstract:** As regulatory expectations tighten across hyperscale and enterprise environments, FIPS compliance is becoming a critical requirement for deploying trusted infrastructure. This session explores how OCP L.O.C.K.—a key management architecture within Caliptra with its own stringent security requirements for media encryption keys—can be aligned with FIPS cryptographic module expectations.    

We focus on key differences from a FIPS validation perspective between Caliptra and OCP L.O.C.K. We discuss how these gaps are, and should be, addressed to meet certification requirements and share insights from ongoing compliance efforts.    

This talk highlights the importance of bridging open security architectures with formal validation frameworks, enabling certifiable, scalable, and trustworthy deployment of secure storage solutions.    

**Advancing Caliptra Security Through Open-Source DV Infrastructure:**     
*Thu, October 15, 11:10 AM–11:30 AM | SJCC, Concourse Level, 212*    
**Speakers:** Miguel Osorio (Google — Platinum Member) and Andreas Kurth (lowRISC) 
**Project(s):** Caliptra and VeeR    
**Session Abstract:** Caliptra is an open-source Root of Trust (RoT) IP block providing hardware security for cloud and edge silicon. To meet rising security demands, robust design verification (DV) infrastructure is vital. This presentation details the DV enhancements for Caliptra 2.2, developed by lowRISC, Google, Microsoft, and the OCP community.    

We discuss expanded block-level DV coverage for components like AES, KMAC, CSRNG, SPI, I3C, and the VeeR RISC-V core. By leveraging open-source tooling, constrained-random testing, and functional coverage models, we enable scalable verification and strengthen Caliptra's security properties.    

Finally, we share lessons learned and present a reusable framework for verifying security-critical IP, fostering a robust, community-accessible DV ecosystem for open-source silicon.    

**Secure Key Distribution Protocol for SoC Hardware Blocks:**    
*Thu, October 15, 1:15 PM–1:30 PM | SJCC, Concourse Level, 212*    
**Speakers:** Craig Barner (Marvell — Gold Member) and Phanikumar Kancharla (Altera)    
**Project(s):** Caliptra    
Session Abstract: This session provides the latest update to the Caliptra secure key distribution workstream, continuing from the update delivered at OCP 2026 EMEA. As SoCs scale to support many accelerators and multi-tenant workloads, ad-hoc key management across hardware blocks (MACSec, PCIe IDE, DRAM, crypto accelerators) creates serious security and compliance risks.    

We present a hardware-only architecture extending Caliptra HRoT as the sole FIPS-certified DEK source for all SoC hardware blocks. Lightweight KMTx and KMRx blocks encrypt keys in transit using a per-instance Bus Encryption Key (BEK) derived from a boot-time random secret (MSS1) and an RTL-synthesized secret (MSS2), bound to each block's AXI ID and MMIO address — providing forward secrecy, minimal blast radius, and CNSA 2.0 compliance.    

We will cover specification status, key lifecycle management, and the v1.0 release at the summit, and invite the community to collaborate within the Caliptra as Security Hub Sub Working Group.    

**Package-Aware Integrity: From Source-Agnostic Publication to Full-System Attestation:**    
*Thu, October 15, 1:55 PM–2:10 PM | SJCC, Concourse Level, 212*    
**Speakers:** Dhananjay Phadke (Microsoft — Platinum Member) and Felipe Zimmerle da Nobrega Costa (KonaSense)    
**Project(s):** Caliptra    
**Session Abstract:** BMC firmware ships as a monolithic signed image: bootloaders verify the whole blob, but no package can be updated or measured independently without re-signing everything. Build-time provenance and runtime attestation (Caliptra RIM, SPDM) are linked only at whole-image granularity. The gap is the package: the smallest buildable, auditable, updatable unit of a firmware image.    

We make the package the unit of trust. On the publishing side, each package becomes a content-addressed entry in a public, append-only transparency log, extending OCP S.A.F.E. SFR manifests and RIM work. On the verification side, per-package measurements compose into a Merkle root bound to the boot signature and extended into a TPM PCR; inclusion proofs against this root enable per-package attestation and rollback protection.    

We elaborate on Yocto build to demonstrate package-granular attestation from build through boot, and integrate with OCP Security Project artifacts and firmware update ecosystem.    

**Caliptra Subsystem 2.2: USB 2.0 and OCP Streaming Boot:**     
*Thu, October 15, 3:05 PM–3:20 PM | SJCC, Concourse Level, 212*    
**Speakers:** Caleb Whitehead (Microsoft — Platinum Member) and Cristiano Castello (NXP Semiconductors)    
**Project(s):** Caliptra    
**Session Abstract:** Caliptra 2.0/2.1 Subsystem enables secure boot of server components through I3C (streaming boot) as well as vendor specific interfaces through AXI streaming boot.    

Caliptra 2.2 Subsystem provides a USB 2.0 device as an OCP Streaming Boot interface option implemented in hardware.    

Caliptra 2.2 Subsystem also adds a capability to transfer the control of USB from Caliptra Subsystem to an SoC specific microcontroller for implementing SoC-specific runtime protocols, including OBMF and MCTP, as well as any other SoC-specific use models.    

In this talk, we present the architectural overview of USB 2.0 enhancements and discuss the anticipated firmware development model for SoC integrators. We also highlight the updated interfaces between SoC microcontroller and Caliptra Subsystem MCU through submission/completion queues for faster processing.

**Beyond Static Identity: Enabling Secure Certificate Refresh in Silicon Roots of Trust:**    
*Thu, October 15, 3:45 PM–4:00 PM | SJCC, Concourse Level, 212*    
**Speakers:** Emre Karabulut (Microsoft — Platinum Member) and Vishal Mhatre (Microsoft — Platinum Member)    
**Project(s):** Caliptra    
**Session Abstract:** Caliptra’s DICE-based certificate chain provides a strong hardware-rooted identity, but is typically treated as immutable after provisioning. In practice, devices benefit from the ability to refresh their identity over time without compromising security or exposing secrets.    

This talk introduces a hardware-based identity refresh mechanism that enables secure regeneration of certificate chains from chip-internal roots. By deriving identity from secrets and binding it with a wrapper key, the approach allows identity updates without having a large persistent fuse storage.   

The design ensures that sensitive key material is never exposed outside the device and that each refresh produces a cryptographically isolated identity. This work demonstrates how silicon roots of trust like Caliptra can support dynamic identity lifecycles while preserving strong DICE security guarantees.   









