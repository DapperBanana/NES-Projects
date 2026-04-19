---
title: Introduction of OAM Initialization Function
date: 2026-04-18
tags: [oam, optimization, initialization]
type: performance
project: DapperBanana/NES-Projects
---

Adding an OAM (Object Attribute Memory) initialization function `oam_init` represents an optimization by centralizing sprite memory clearing. Initializing OAM is a common operation, so having a dedicated function avoids code duplication and ensures a consistent initialization process. This can also be a central point for future optimizations to the initialization process, such as unrolling loops, or using DMA if available.
