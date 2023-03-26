; ModuleID = 'src/math/scalbnl.c'
source_filename = "src/math/scalbnl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree nosync nounwind optsize strictfp willreturn
define x86_fp80 @scalbnl(x86_fp80 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 16383
  br i1 %3, label %4, label %13

4:                                                ; preds = %2
  %5 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 0xK7FFE8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %6 = add nsw i32 %1, -16383
  %7 = icmp ugt i32 %1, 32766
  br i1 %7, label %8, label %24

8:                                                ; preds = %4
  %9 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %5, x86_fp80 0xK7FFE8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %10 = icmp ult i32 %1, 49149
  %11 = select i1 %10, i32 %1, i32 49149
  %12 = add nsw i32 %11, -32766
  br label %24

13:                                               ; preds = %2
  %14 = icmp slt i32 %1, -16382
  br i1 %14, label %15, label %24

15:                                               ; preds = %13
  %16 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 0xK00728000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %17 = add nuw nsw i32 %1, 16269
  %18 = icmp ult i32 %1, -32651
  br i1 %18, label %19, label %24

19:                                               ; preds = %15
  %20 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %16, x86_fp80 0xK00728000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %21 = icmp ugt i32 %1, -48920
  %22 = select i1 %21, i32 %1, i32 -48920
  %23 = add nuw nsw i32 %22, 32538
  br label %24

24:                                               ; preds = %13, %19, %15, %4, %8
  %25 = phi i32 [ %12, %8 ], [ %6, %4 ], [ %23, %19 ], [ %17, %15 ], [ %1, %13 ]
  %26 = phi x86_fp80 [ %9, %8 ], [ %5, %4 ], [ %20, %19 ], [ %16, %15 ], [ %0, %13 ]
  %27 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #2
  %28 = trunc i32 %25 to i16
  %29 = add nsw i16 %28, 16383
  %30 = bitcast x86_fp80 %27 to i80
  %31 = zext i16 %29 to i80
  %32 = shl nuw nsw i80 %31, 64
  %33 = and i80 %30, 18446744073709551615
  %34 = or i80 %33, %32
  %35 = bitcast i80 %34 to x86_fp80
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %26, x86_fp80 %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  ret x86_fp80 %36
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #1

attributes #0 = { mustprogress nofree nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
