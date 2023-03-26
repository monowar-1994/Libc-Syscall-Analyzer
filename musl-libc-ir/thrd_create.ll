; ModuleID = 'src/thread/thrd_create.c'
source_filename = "src/thread/thrd_create.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.pthread_attr_t = type { %union.anon }
%union.anon = type { [7 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @thrd_create(%struct.__pthread** noundef %0, i32 (i8*)* noundef %1, i8* noundef %2) local_unnamed_addr #0 {
  %4 = bitcast i32 (i8*)* %1 to i8* (i8*)*
  %5 = tail call i32 @__pthread_create(%struct.__pthread** noundef %0, %struct.pthread_attr_t* noundef nonnull inttoptr (i64 -1 to %struct.pthread_attr_t*), i8* (i8*)* noundef %4, i8* noundef %2) #2
  %6 = icmp eq i32 %5, 11
  %7 = select i1 %6, i32 3, i32 2
  %8 = icmp eq i32 %5, 0
  %9 = select i1 %8, i32 0, i32 %7
  ret i32 %9
}

; Function Attrs: optsize
declare hidden i32 @__pthread_create(%struct.__pthread** noundef, %struct.pthread_attr_t* noundef, i8* (i8*)* noundef, i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
