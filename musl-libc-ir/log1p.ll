; ModuleID = 'src/math/log1p.c'
source_filename = "src/math/log1p.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define double @log1p(double noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast double %0 to i64
  %4 = lshr i64 %3, 32
  %5 = trunc i64 %4 to i32
  %6 = icmp ugt i32 %5, 1071284857
  %7 = icmp sgt i64 %3, -1
  %8 = and i1 %7, %6
  br i1 %8, label %30, label %9

9:                                                ; preds = %1
  %10 = icmp ugt i32 %5, -1074790401
  br i1 %10, label %11, label %19

11:                                               ; preds = %9
  %12 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 -1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %13 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %0, double %12, metadata !"oeq", metadata !"fpexcept.ignore") #3
  br i1 %13, label %14, label %16

14:                                               ; preds = %11
  %15 = tail call double @llvm.experimental.constrained.fdiv.f64(double %0, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %90

16:                                               ; preds = %11
  %17 = tail call double @llvm.experimental.constrained.fsub.f64(double %0, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %18 = tail call double @llvm.experimental.constrained.fdiv.f64(double %17, double 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %90

19:                                               ; preds = %9
  %20 = shl i32 %5, 1
  %21 = icmp ult i32 %20, 2034237440
  br i1 %21, label %22, label %28

22:                                               ; preds = %19
  %23 = and i32 %5, 2146435072
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %90

25:                                               ; preds = %22
  %26 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %27 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %27)
  store volatile float %26, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %27)
  br label %90

28:                                               ; preds = %19
  %29 = icmp ult i32 %5, -1076707643
  br i1 %29, label %32, label %34

30:                                               ; preds = %1
  %31 = icmp ugt i32 %5, 2146435071
  br i1 %31, label %90, label %34

32:                                               ; preds = %28
  %33 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %65

34:                                               ; preds = %28, %30
  %35 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %36 = tail call double @llvm.experimental.constrained.fadd.f64(double %35, double %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %37 = bitcast double %36 to i64
  %38 = lshr i64 %37, 32
  %39 = trunc i64 %38 to i32
  %40 = add i32 %39, 614242
  %41 = lshr i32 %40, 20
  %42 = add nsw i32 %41, -1023
  %43 = icmp ult i32 %40, 1129316352
  br i1 %43, label %44, label %52

44:                                               ; preds = %34
  %45 = icmp ugt i32 %40, 1074790399
  %46 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %47 = select i1 %45, double %0, double %46
  %48 = select i1 %45, double %46, double %0
  %49 = tail call double @llvm.experimental.constrained.fsub.f64(double %36, double %47, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %50 = tail call double @llvm.experimental.constrained.fsub.f64(double %48, double %49, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %51 = tail call double @llvm.experimental.constrained.fdiv.f64(double %50, double %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %54

52:                                               ; preds = %34
  %53 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %54

54:                                               ; preds = %52, %44
  %55 = phi double [ %51, %44 ], [ %53, %52 ]
  %56 = and i32 %40, 1048575
  %57 = add nuw nsw i32 %56, 1072079006
  %58 = zext i32 %57 to i64
  %59 = shl nuw nsw i64 %58, 32
  %60 = and i64 %37, 4294967295
  %61 = or i64 %59, %60
  %62 = bitcast i64 %61 to double
  %63 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %64 = tail call double @llvm.experimental.constrained.fsub.f64(double %62, double %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %65

65:                                               ; preds = %32, %54
  %66 = phi double [ %55, %54 ], [ %33, %32 ]
  %67 = phi double [ %64, %54 ], [ %0, %32 ]
  %68 = phi i32 [ %42, %54 ], [ 0, %32 ]
  %69 = tail call double @llvm.experimental.constrained.fmul.f64(double 5.000000e-01, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %70 = tail call double @llvm.experimental.constrained.fmul.f64(double %69, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %71 = tail call double @llvm.experimental.constrained.fadd.f64(double 2.000000e+00, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %72 = tail call double @llvm.experimental.constrained.fdiv.f64(double %67, double %71, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %73 = tail call double @llvm.experimental.constrained.fmul.f64(double %72, double %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %74 = tail call double @llvm.experimental.constrained.fmul.f64(double %73, double %73, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %75 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %74, double 0x3FC39A09D078C69F, double 0x3FCC71C51D8E78AF, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %76 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %74, double %75, double 0x3FD999999997FA04, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %77 = tail call double @llvm.experimental.constrained.fmul.f64(double %74, double %76, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %78 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %74, double 0x3FC2F112DF3E5244, double 0x3FC7466496CB03DE, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %79 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %74, double %78, double 0x3FD2492494229359, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %80 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %74, double %79, double 0x3FE5555555555593, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %81 = tail call double @llvm.experimental.constrained.fmul.f64(double %73, double %80, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %82 = tail call double @llvm.experimental.constrained.fadd.f64(double %81, double %77, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %83 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 %68, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %84 = tail call double @llvm.experimental.constrained.fadd.f64(double %70, double %82, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %85 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %83, double 0x3DEA39EF35793C76, double %66, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %86 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %72, double %84, double %85, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %87 = tail call double @llvm.experimental.constrained.fsub.f64(double %86, double %70, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %88 = tail call double @llvm.experimental.constrained.fadd.f64(double %87, double %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %89 = tail call double @llvm.experimental.constrained.fmuladd.f64(double %83, double 0x3FE62E42FEE00000, double %88, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %90

90:                                               ; preds = %30, %22, %25, %65, %16, %14
  %91 = phi double [ %15, %14 ], [ %18, %16 ], [ %89, %65 ], [ %0, %25 ], [ %0, %22 ], [ %0, %30 ]
  ret double %91
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmuladd.f64(double, double, double, metadata, metadata) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nofree nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
