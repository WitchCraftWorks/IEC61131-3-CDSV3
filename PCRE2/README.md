## PCRE2

This is a library using a C native extension to use PCRE2 from CODESYS.
As such, to use this library your runtime needs the appropriate C module license (this is the case for "Runtime for ARM SL", "Runtime for ARM64 SL" and "Runtime for PFC200 SL" (and maybe many more).

This library does not include export files, as they are not that useful with a C native module. However the library file and all C source codes are provided.
Though, I'm not very good with C, so I'm glad it just works without breaking anything so far.

The relevant compiled shared objects are compiled for ARM64 (on Raspberry Pi 5 with Raspberry Pi OS 64bit) and ARMv7 (on WAGO PFC200 750-8212).
I've tested most functionality on ARM64 (with Runtime for ARM64 SL), some have been tested on ARMv7 (with Runtime for ARM SL).
