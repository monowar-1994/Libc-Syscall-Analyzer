; ModuleID = 'src/math/nextafterl.c'
source_filename = "src/math/nextafterl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @nextafterl(x86_fp80 noundef %0, x86_fp80 noundef %1) local_unnamed_addr #0 {
  %3 = alloca x86_fp80, align 16
  %4 = tail call i32 @__fpclassifyl(x86_fp80 noundef %0) #4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %9, label %6

6:                                                ; preds = %2
  %7 = tail call i32 @__fpclassifyl(x86_fp80 noundef %1) #4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

9:                                                ; preds = %6, %2
  %10 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %0, x86_fp80 %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %73

11:                                               ; preds = %6
  %12 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %0, x86_fp80 %1, metadata !"oeq", metadata !"fpexcept.ignore") #5
  br i1 %12, label %73, label %13

13:                                               ; preds = %11
  %14 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %15 = tail call i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80 %0, x86_fp80 %14, metadata !"oeq", metadata !"fpexcept.ignore") #5
  br i1 %15, label %16, label %20

16:                                               ; preds = %13
  %17 = bitcast x86_fp80 %1 to i80
  %18 = and i80 %17, -604462909807314587353088
  %19 = or i80 %18, 1
  br label %61

20:                                               ; preds = %13
  %21 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %0, x86_fp80 %1, metadata !"olt", metadata !"fpexcept.ignore") #5
  %22 = zext i1 %21 to i32
  %23 = bitcast x86_fp80 %0 to i80
  %24 = lshr i80 %23, 64
  %25 = trunc i80 %24 to i16
  %26 = lshr i80 %23, 79
  %27 = trunc i80 %26 to i32
  %28 = xor i32 %27, 1
  %29 = icmp eq i32 %28, %22
  br i1 %29, label %30, label %43

30:                                               ; preds = %20
  %31 = trunc i80 %23 to i64
  %32 = add i64 %31, 1
  %33 = zext i64 %32 to i80
  %34 = and i80 %23, -18446744073709551616
  %35 = or i80 %34, %33
  %36 = and i64 %32, 9223372036854775807
  %37 = icmp eq i64 %36, 0
  br i1 %37, label %38, label %61

38:                                               ; preds = %30
  %39 = add i16 %25, 1
  %40 = zext i16 %39 to i80
  %41 = shl nuw i80 %40, 64
  %42 = or i80 %41, 9223372036854775808
  br label %61

43:                                               ; preds = %20
  %44 = and i80 %23, 9223372036854775807
  %45 = icmp eq i80 %44, 0
  br i1 %45, label %46, label %54

46:                                               ; preds = %43
  %47 = add i16 %25, -1
  %48 = zext i16 %47 to i80
  %49 = shl nuw i80 %48, 64
  %50 = and i80 %23, 18446744073709551615
  %51 = icmp eq i16 %47, 0
  %52 = select i1 %51, i80 %50, i80 0
  %53 = or i80 %49, %52
  br label %54

54:                                               ; preds = %46, %43
  %55 = phi i80 [ %53, %46 ], [ %23, %43 ]
  %56 = trunc i80 %55 to i64
  %57 = add i64 %56, -1
  %58 = zext i64 %57 to i80
  %59 = and i80 %55, -18446744073709551616
  %60 = or i80 %59, %58
  br label %61

61:                                               ; preds = %54, %38, %30, %16
  %62 = phi i80 [ %19, %16 ], [ %42, %38 ], [ %35, %30 ], [ %60, %54 ]
  %63 = bitcast i80 %62 to x86_fp80
  %64 = lshr i80 %62, 64
  %65 = trunc i80 %64 to i32
  %66 = and i32 %65, 32767
  switch i32 %66, label %73 [
    i32 32767, label %67
    i32 0, label %69
  ]

67:                                               ; preds = %61
  %68 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %73

69:                                               ; preds = %61
  %70 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %63, x86_fp80 %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %71 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %0, x86_fp80 %0, x86_fp80 %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %72 = bitcast x86_fp80* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 10, i8* nonnull %72)
  store volatile x86_fp80 %71, x86_fp80* %3, align 16, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 10, i8* nonnull %72)
  br label %73

73:                                               ; preds = %69, %61, %11, %67, %9
  %74 = phi x86_fp80 [ %10, %9 ], [ %68, %67 ], [ %1, %11 ], [ %63, %61 ], [ %63, %69 ]
  ret x86_fp80 %74
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @__fpclassifyl(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
