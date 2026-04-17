---
title: Inline Assembly for Input Reading
date: 2026-04-16
tags: [assembly, performance, macros, inline]
type: performance
project: DapperBanana/NES-Projects
---

The project refactored `input_read` to use inline assembly instead of macros. While macros can provide abstraction, they often lead to code duplication. Inline assembly allows for more direct control over the generated code and can improve performance by reducing overhead and allowing for better register allocation. This is especially relevant in a resource-constrained environment like the NES, where every clock cycle counts. Switching to inline assembly can also make debugging easier, as the generated code is more predictable and easier to trace.
