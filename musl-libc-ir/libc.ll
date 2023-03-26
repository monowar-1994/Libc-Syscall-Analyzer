; ModuleID = 'src/internal/libc.c'
source_filename = "src/internal/libc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@__progname = global i8* null, align 8
@__progname_full = global i8* null, align 8
@__libc = hidden local_unnamed_addr global %struct.__libc zeroinitializer, align 8
@__hwcap = hidden local_unnamed_addr global i64 0, align 8

@program_invocation_short_name = weak alias i8*, i8** @__progname
@program_invocation_name = weak alias i8*, i8** @__progname_full

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
