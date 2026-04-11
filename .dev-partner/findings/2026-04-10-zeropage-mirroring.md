---
title: Zeropage mirroring for performance
date: 2026-04-10
tags: [performance, zeropage]
type: pattern
project: DapperBanana/NES-Projects
---

Accessing zeropage memory is faster on the 6502. When multiple routines need to access the same zeropage variable frequently, mirroring that variable to another zeropage location can avoid contention. This is what happened with `joy_status` -- its original zeropage location was heavily used, so creating `joy_status_mirror` allows other parts of the program to read the joystick status without blocking the input reading routine. This pattern is particularly effective in interrupt routines or other time-sensitive code.
