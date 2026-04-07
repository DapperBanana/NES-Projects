---
title: Makefile Dependency Management
date: 2026-04-07
tags: [assembly, makefile, build]
type: technique
project: DapperBanana/NES-Projects
---

The Makefile update demonstrates good dependency management practice. By explicitly including the new input module in the Makefile, the build process ensures that changes to the input module trigger a rebuild of the main program (`hello.asm`). This prevents inconsistencies between the code and the compiled output, which can lead to hard-to-debug issues.
