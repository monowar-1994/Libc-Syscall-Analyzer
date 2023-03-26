; ModuleID = 'src/thread/pthread_detach.c'
source_filename = "src/thread/pthread_detach.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@pthread_detach = weak alias i32 (%struct.__pthread*), i32 (%struct.__pthread*)* @__pthread_detach
@thrd_detach = weak alias i32 (%struct.__pthread*), i32 (%struct.__pthread*)* @__pthread_detach

; Function Attrs: nounwind optsize strictfp
define internal i32 @__pthread_detach(%struct.__pthread* noundef %0) #0 {
  %2 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 8
  %3 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %2, i32 2, i32 3) #2, !srcloc !3
  %4 = icmp eq i32 %3, 2
  br i1 %4, label %7, label %5

5:                                                ; preds = %1
  %6 = tail call i32 @__pthread_join(%struct.__pthread* noundef %0, i8** noundef null) #3
  br label %7

7:                                                ; preds = %1, %5
  %8 = phi i32 [ %6, %5 ], [ 0, %1 ]
  ret i32 %8
}

; Function Attrs: optsize
declare hidden i32 @__pthread_join(%struct.__pthread* noundef, i8** noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind strictfp }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 231352}
