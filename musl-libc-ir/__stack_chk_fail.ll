; ModuleID = 'src/env/__stack_chk_fail.c'
source_filename = "src/env/__stack_chk_fail.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@__stack_chk_guard = global i64 0, align 8

@__stack_chk_fail_local = weak hidden alias void (), void ()* @__stack_chk_fail

; Function Attrs: nounwind optsize strictfp
define hidden void @__init_ssp(i8* noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %5, label %3

3:                                                ; preds = %1
  %4 = tail call i8* @memcpy(i8* noundef bitcast (i64* @__stack_chk_guard to i8*), i8* noundef nonnull %0, i64 noundef 8) #2
  br label %6

5:                                                ; preds = %1
  store i64 mul (i64 ptrtoint (i64* @__stack_chk_guard to i64), i64 1103515245), i64* @__stack_chk_guard, align 8, !tbaa !3
  br label %6

6:                                                ; preds = %5, %3
  store i8 0, i8* getelementptr inbounds (i8, i8* bitcast (i64* @__stack_chk_guard to i8*), i64 1), align 1, !tbaa !7
  %7 = load i64, i64* @__stack_chk_guard, align 8, !tbaa !3
  %8 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !8
  %9 = inttoptr i64 %8 to %struct.__pthread*
  %10 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %9, i64 0, i32 5
  store i64 %7, i64* %10, align 8, !tbaa !9
  ret void
}

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define void @__stack_chk_fail() #0 {
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !14
  ret void
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nounwind readnone strictfp }
attributes #4 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
!8 = !{i64 249935}
!9 = !{!10, !4, i64 40}
!10 = !{!"__pthread", !11, i64 0, !11, i64 8, !11, i64 16, !11, i64 24, !4, i64 32, !4, i64 40, !12, i64 48, !12, i64 52, !12, i64 56, !12, i64 60, !5, i64 64, !5, i64 65, !5, i64 66, !5, i64 66, !11, i64 72, !4, i64 80, !11, i64 88, !4, i64 96, !4, i64 104, !11, i64 112, !11, i64 120, !11, i64 128, !13, i64 136, !12, i64 160, !12, i64 164, !11, i64 168, !5, i64 176, !11, i64 184, !11, i64 192}
!11 = !{!"any pointer", !5, i64 0}
!12 = !{!"int", !5, i64 0}
!13 = !{!"", !11, i64 0, !4, i64 8, !11, i64 16}
!14 = !{i64 248987}
