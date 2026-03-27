---
title: Centralized Library Organization
date: 2026-03-27
tags: [organization, ca65]
type: pattern
project: DapperBanana/NES-Projects
---

Moving common routines like PPU initialization and input handling into a `lib/` directory is a good way to organize the project and promote code reuse.  The corresponding changes to the Makefile ensure that the assembler (ca65) can find these modules during the build process, keeping the main source files cleaner and easier to understand.  This pattern scales well as the project grows, preventing code duplication and making maintenance easier.
