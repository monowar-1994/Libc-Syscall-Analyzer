; ModuleID = 'src/math/x86_64/remquol.c'
source_filename = "src/math/x86_64/remquol.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @remquol(x86_fp80 noundef %0, x86_fp80 noundef %1, i32* nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca x86_fp80, align 16
  store x86_fp80 %0, x86_fp80* %4, align 16, !tbaa !3
  store x86_fp80 %1, x86_fp80* %5, align 16, !tbaa !3
  %6 = bitcast x86_fp80* %4 to i8*
  %7 = bitcast x86_fp80* %5 to i8*
  call void asm sideeffect "", "X,X,~{dirflag},~{fpsr},~{flags}"(i8* nonnull %6, i8* nonnull %7) #1, !srcloc !7
  %8 = load x86_fp80, x86_fp80* %4, align 16, !tbaa !3
  %9 = load x86_fp80, x86_fp80* %5, align 16, !tbaa !3
  br label %10

10:                                               ; preds = %10, %3
  %11 = phi x86_fp80 [ %8, %3 ], [ %13, %10 ]
  %12 = call { x86_fp80, i32 } asm "fprem1; fnstsw %ax", "={st},={ax},{st(1)},0,~{dirflag},~{fpsr},~{flags}"(x86_fp80 %9, x86_fp80 %11) #2, !srcloc !8
  %13 = extractvalue { x86_fp80, i32 } %12, 0
  %14 = extractvalue { x86_fp80, i32 } %12, 1
  %15 = and i32 %14, 1024
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %10

17:                                               ; preds = %10
  %18 = extractvalue { x86_fp80, i32 } %12, 0
  %19 = extractvalue { x86_fp80, i32 } %12, 1
  %20 = bitcast x86_fp80 %9 to i80
  %21 = bitcast x86_fp80 %8 to i80
  %22 = lshr i32 %19, 12
  %23 = and i32 %22, 12
  %24 = lshr i32 %19, 4
  %25 = and i32 %24, 48
  %26 = or i32 %23, %25
  %27 = zext i32 %26 to i64
  %28 = lshr i64 8463725162920157216, %27
  %29 = trunc i64 %28 to i32
  %30 = and i32 %29, 7
  %31 = xor i80 %20, %21
  %32 = icmp slt i80 %31, 0
  %33 = sub nsw i32 0, %30
  %34 = select i1 %32, i32 %33, i32 %30
  store i32 %34, i32* %2, align 4, !tbaa !9
  ret x86_fp80 %18
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind strictfp }
attributes #2 = { nounwind readnone strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 584}
!8 = !{i64 659}
!9 = !{!10, !10, i64 0}
!10 = !{!"int", !5, i64 0}
