@echo off
@call haxe -cp extra -cp %1 -m Main -hl out.hl
@call hl out.hl
@del out.hl