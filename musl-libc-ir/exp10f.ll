; ModuleID = 'src/math/exp10f.c'
source_filename = "src/math/exp10f.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@exp10f.p10 = internal unnamed_addr constant [15 x float] [float 0x3E7AD7F2A0000000, float 0x3EB0C6F7A0000000, float 0x3EE4F8B580000000, float 0x3F1A36E2E0000000, float 0x3F50624DE0000000, float 0x3F847AE140000000, float 0x3FB99999A0000000, float 1.000000e+00, float 1.000000e+01, float 1.000000e+02, float 1.000000e+03, float 1.000000e+04, float 1.000000e+05, float 1.000000e+06, float 1.000000e+07], align 16

@pow10f = weak alias float (float), float (float)* @exp10f

; Function Attrs: nounwind optsize strictfp
define float @exp10f(float noundef %0) #0 {
  %2 = alloca float, align 4
  %3 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #4
  %4 = call float @modff(float noundef %0, float* noundef nonnull %2) #5
  %5 = load float, float* %2, align 4, !tbaa !3
  %6 = bitcast float %5 to i32
  %7 = and i32 %6, 2130706432
  %8 = icmp ult i32 %7, 1090519040
  br i1 %8, label %9, label %27

9:                                                ; preds = %1
  %10 = call i1 @llvm.experimental.constrained.fcmp.f32(float %4, float 0.000000e+00, metadata !"une", metadata !"fpexcept.ignore") #6
  br i1 %10, label %17, label %11

11:                                               ; preds = %9
  %12 = call i32 @llvm.experimental.constrained.fptosi.i32.f32(float %5, metadata !"fpexcept.ignore") #6
  %13 = add nsw i32 %12, 7
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [15 x float], [15 x float]* @exp10f.p10, i64 0, i64 %14
  %16 = load float, float* %15, align 4, !tbaa !3
  br label %32

17:                                               ; preds = %9
  %18 = call float @llvm.experimental.constrained.fmul.f32(float 0x400A934F00000000, float %4, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %19 = call float @exp2f(float noundef %18) #5
  %20 = load float, float* %2, align 4, !tbaa !3
  %21 = call i32 @llvm.experimental.constrained.fptosi.i32.f32(float %20, metadata !"fpexcept.ignore") #6
  %22 = add nsw i32 %21, 7
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [15 x float], [15 x float]* @exp10f.p10, i64 0, i64 %23
  %25 = load float, float* %24, align 4, !tbaa !3
  %26 = call float @llvm.experimental.constrained.fmul.f32(float %19, float %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %32

27:                                               ; preds = %1
  %28 = call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #6
  %29 = call double @llvm.experimental.constrained.fmul.f64(double 0x400A934F0979A371, double %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %30 = call double @exp2(double noundef %29) #5
  %31 = call float @llvm.experimental.constrained.fptrunc.f32.f64(double %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  br label %32

32:                                               ; preds = %27, %17, %11
  %33 = phi float [ %26, %17 ], [ %16, %11 ], [ %31, %27 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #4
  ret float %33
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare float @modff(float noundef, float* noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f32(float, float, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i32 @llvm.experimental.constrained.fptosi.i32.f32(float, metadata) #3

; Function Attrs: optsize
declare float @exp2f(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #3

; Function Attrs: optsize
declare double @exp2(double noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #3

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
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
