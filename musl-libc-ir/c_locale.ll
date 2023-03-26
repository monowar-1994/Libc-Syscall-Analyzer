; ModuleID = 'src/locale/c_locale.c'
source_filename = "src/locale/c_locale.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }

@empty_mo = internal constant [5 x i32] [i32 -1794895138, i32 0, i32 -1, i32 -1, i32 -1], align 16
@__c_dot_utf8 = hidden constant %struct.__locale_map { i8* bitcast ([5 x i32]* @empty_mo to i8*), i64 20, [24 x i8] c"C.UTF-8\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", %struct.__locale_map* null }, align 8
@__c_locale = hidden local_unnamed_addr constant %struct.__locale_struct zeroinitializer, align 8
@__c_dot_utf8_locale = hidden local_unnamed_addr constant %struct.__locale_struct { [6 x %struct.__locale_map*] [%struct.__locale_map* @__c_dot_utf8, %struct.__locale_map* null, %struct.__locale_map* null, %struct.__locale_map* null, %struct.__locale_map* null, %struct.__locale_map* null] }, align 8

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
