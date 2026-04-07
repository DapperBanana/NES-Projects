---
title: Modular Assembly Organization
date: 2026-04-07
tags: [assembly, 6502, modularity]
type: pattern
project: DapperBanana/NES-Projects
---

Structuring the assembly project into modules (like the new input module) improves maintainability and readability. By separating concerns into distinct files and using includes, it prevents `hello.asm` from becoming a monolithic, unmanageable source file. This approach promotes code reuse and easier debugging. The Makefile update reinforces this pattern by handling the compilation and linking of these modules correctly.
