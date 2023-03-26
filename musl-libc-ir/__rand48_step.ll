; ModuleID = 'src/prng/__rand48_step.c'
source_filename = "src/prng/__rand48_step.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define hidden i64 @__rand48_step(i16* nocapture noundef %0, i16* nocapture noundef readonly %1) local_unnamed_addr #0 {
  %3 = load i16, i16* %0, align 2, !tbaa !3
  %4 = zext i16 %3 to i64
  %5 = getelementptr inbounds i16, i16* %0, i64 1
  %6 = load i16, i16* %5, align 2, !tbaa !3
  %7 = zext i16 %6 to i64
  %8 = shl nuw nsw i64 %7, 16
  %9 = or i64 %8, %4
  %10 = getelementptr inbounds i16, i16* %0, i64 2
  %11 = load i16, i16* %10, align 2, !tbaa !3
  %12 = zext i16 %11 to i64
  %13 = shl nuw nsw i64 %12, 32
  %14 = or i64 %9, %13
  %15 = load i16, i16* %1, align 2, !tbaa !3
  %16 = zext i16 %15 to i64
  %17 = getelementptr inbounds i16, i16* %1, i64 1
  %18 = load i16, i16* %17, align 2, !tbaa !3
  %19 = zext i16 %18 to i64
  %20 = shl nuw nsw i64 %19, 16
  %21 = or i64 %20, %16
  %22 = getelementptr inbounds i16, i16* %1, i64 2
  %23 = load i16, i16* %22, align 2, !tbaa !3
  %24 = zext i16 %23 to i64
  %25 = shl nuw nsw i64 %24, 32
  %26 = or i64 %21, %25
  %27 = mul i64 %26, %14
  %28 = getelementptr inbounds i16, i16* %1, i64 3
  %29 = load i16, i16* %28, align 2, !tbaa !3
  %30 = zext i16 %29 to i64
  %31 = add i64 %27, %30
  %32 = trunc i64 %31 to i16
  store i16 %32, i16* %0, align 2, !tbaa !3
  %33 = lshr i64 %31, 16
  %34 = trunc i64 %33 to i16
  store i16 %34, i16* %5, align 2, !tbaa !3
  %35 = lshr i64 %31, 32
  %36 = trunc i64 %35 to i16
  store i16 %36, i16* %10, align 2, !tbaa !3
  %37 = and i64 %31, 281474976710655
  ret i64 %37
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"short", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
