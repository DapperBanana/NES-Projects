## NES-Projects Development Plan

## Goal
Build working NES ROMs using 6502 assembly, targeting ca65/ld65 toolchain (cc65 suite).

## Current State
- iNES header, linker config, PPU init, and input modules created
- Minimal "hello" ROM sets background to blue
- Makefile builds hello.nes via ca65/ld65
- Scrolling test demonstrates horizontal PPU scroll via $2005
- ppu.in now includes nametable_clear_impl and ppu_set_addr/ppu_set_scroll macros
- Basic joystick input reading. Uses inline for input_read now instead of macros.
- Fixes to joystick input reading logic, mirroring joy_status for safe access.
- Added oam_set_sprite macro for simplified sprite register setting
- OAM init function clears OAM
- Added OAM DMA function for fast sprite updates
- Added .res macro for reserving memory.

## Completed
1. [x] Add proper iNES header module that can be included by projects
2. [x] Set