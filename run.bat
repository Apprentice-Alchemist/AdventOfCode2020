@echo off
@call haxe -cp src -cp days -m Main -hl out.hl
@call hl out.hl %*
@del out.hl