; ModuleID = 'src/math/frexpl.c'
source_filename = "src/math/frexpl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nosync nounwind optsize strictfp
define x86_fp80 @frexpl(x86_fp80 noundef %0, i32* nocapture noundef %1) local_unnamed_addr #0 {
  %3 = bitcast x86_fp80 %0 to i80
  %4 = lshr i80 %3, 64
  %5 = trunc i80 %4 to i32
  %6 = and i32 %5, 32767
  switch i32 %6, label %18 [
    i32 0, label %7
    i32 32767, label %28
  ]

7:                                                ; preds = %2
  %8 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %0, x86_fp80 0xK00000000000000000000, metadata !"une", metadata !"fpexcept.ignore") #2
  br i1 %8, label %9, label %15

9:                                                ; preds = %7
  %10 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x4770000000000000, metadata !"fpexcept.ignore") #2
  %11 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %12 = tail call x86_fp80 @frexpl(x86_fp80 noundef %11, i32* noundef %1) #3
  %13 = load i32, i32* %1, align 4, !tbaa !3
  %14 = add nsw i32 %13, -120
  br label %15

15:                                               ; preds = %7, %9
  %16 = phi i32 [ %14, %9 ], [ 0, %7 ]
  %17 = phi x86_fp80 [ %12, %9 ], [ %0, %7 ]
  store i32 %16, i32* %1, align 4, !tbaa !3
  br label %28

18:                                               ; preds = %2
  %19 = add nsw i32 %6, -16382
  store i32 %19, i32* %1, align 4, !tbaa !3
  %20 = trunc i80 %4 to i16
  %21 = and i16 %20, -32768
  %22 = or i16 %21, 16382
  %23 = zext i16 %22 to i80
  %24 = shl nuw i80 %23, 64
  %25 = and i80 %3, 18446744073709551615
  %26 = or i80 %24, %25
  %27 = bitcast i80 %26 to x86_fp80
  br label %28

28:                                               ; preds = %2, %18, %15
  %29 = phi x86_fp80 [ %27, %18 ], [ %17, %15 ], [ %0, %2 ]
  ret x86_fp80 %29
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #1

attributes #0 = { nofree nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }
attributes #3 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
