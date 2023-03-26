; ModuleID = 'src/math/exp10.c'
source_filename = "src/math/exp10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@exp10.p10 = internal unnamed_addr constant [31 x double] [double 1.000000e-15, double 0x3D06849B86A12B9B, double 1.000000e-13, double 0x3D719799812DEA11, double 0x3DA5FD7FE1796495, double 1.000000e-10, double 1.000000e-09, double 1.000000e-08, double 0x3E7AD7F29ABCAF48, double 0x3EB0C6F7A0B5ED8D, double 1.000000e-05, double 1.000000e-04, double 1.000000e-03, double 1.000000e-02, double 1.000000e-01, double 1.000000e+00, double 1.000000e+01, double 1.000000e+02, double 1.000000e+03, double 1.000000e+04, double 1.000000e+05, double 1.000000e+06, double 1.000000e+07, double 1.000000e+08, double 1.000000e+09, double 1.000000e+10, double 1.000000e+11, double 1.000000e+12, double 1.000000e+13, double 1.000000e+14, double 1.000000e+15], align 16

@pow10 = weak alias double (double), double (double)* @exp10

; Function Attrs: nounwind optsize strictfp
define double @exp10(double noundef %0) #0 {
  %2 = alloca double, align 8
  %3 = bitcast double* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %3) #4
  %4 = call double @modf(double noundef %0, double* noundef nonnull %2) #5
  %5 = load double, double* %2, align 8, !tbaa !3
  %6 = bitcast double %5 to i64
  %7 = and i64 %6, 9218868437227405312
  %8 = icmp ult i64 %7, 4625196817309499392
  br i1 %8, label %9, label %27

9:                                                ; preds = %1
  %10 = call i1 @llvm.experimental.constrained.fcmp.f64(double %4, double 0.000000e+00, metadata !"une", metadata !"fpexcept.ignore") #6
  br i1 %10, label %17, label %11

11:                                               ; preds = %9
  %12 = call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %5, metadata !"fpexcept.ignore") #6
  %13 = add nsw i32 %12, 15
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [31 x double], [31 x double]* @exp10.p10, i64 0, i64 %14
  %16 = load double, double* %15, align 8, !tbaa !3
  br label %29

17:                                               ; preds = %9
  %18 = call double @llvm.experimental.constrained.fmul.f64(double 0x400A934F0979A371, double %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %19 = call double @exp2(double noundef %18) #5
  %20 = load double, double* %2, align 8, !tbaa !3
  %21 = call i32 @llvm.experimental.constrained.fptosi.i32.f64(double %20, metadata !"fpexcept.ignore") #6
  %22 = add nsw i32 %21, 15
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [31 x double], [31 x double]* @exp10.p10, i64 0, i64 %23
  %25 = load double, double* %24, align 8, !tbaa !3
  %26 = call double @llvm.experimental.constrained.fmul.f64(double %19, double %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %29

27:                                               ; preds = %1
  %28 = call double @pow(double noundef 1.000000e+01, double noundef %0) #5
  br label %29

29:                                               ; preds = %27, %17, %11
  %30 = phi double [ %26, %17 ], [ %16, %11 ], [ %28, %27 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %3) #4
  ret double %30
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare double @modf(double noundef, double* noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f64(double, metadata) #3

; Function Attrs: optsize
declare double @exp2(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #3

; Function Attrs: optsize
declare double @pow(double noundef, double noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
