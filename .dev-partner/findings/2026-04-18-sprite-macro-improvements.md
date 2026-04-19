---
title: Improved Sprite Macro Usability via Parameter Flexibility
date: 2026-04-18
tags: [macros, sprites, usability]
type: technique
project: DapperBanana/NES-Projects
---

The recent changes focused on making the sprite macro more flexible. By allowing parameters to be specified in different orders and supporting immediate values directly, the macro is now easier to use. This reduces the mental overhead when defining sprites, which is important given that NES development involves frequent sprite manipulation. Specifically, this avoids the need to load values into registers before using the macro, cleaning up the calling code.
