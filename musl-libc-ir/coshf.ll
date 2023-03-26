; ModuleID = 'src/math/coshf.c'
source_filename = "src/math/coshf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @coshf(float noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast float %0 to i32
  %4 = and i32 %3, 2147483647
  %5 = bitcast i32 %4 to float
  %6 = icmp ult i32 %4, 1060205079
  br i1 %6, label %7, label %23

7:                                                ; preds = %1
  %8 = icmp ult i32 %4, 964689920
  br i1 %8, label %9, label %13

9:                                                ; preds = %7
  %10 = tail call float @llvm.experimental.constrained.fadd.f32(float %5, float 0x4770000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %11 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %11)
  store volatile float %10, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %11)
  %12 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %33

13:                                               ; preds = %7
  %14 = tail call float @expm1f(float noundef %5) #5
  %15 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %16 = tail call float @llvm.experimental.constrained.fmul.f32(float %14, float %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %17 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %18 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %19 = tail call float @llvm.experimental.constrained.fadd.f32(float %18, float %14, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %20 = tail call float @llvm.experimental.constrained.fmul.f32(float %17, float %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %21 = tail call float @llvm.experimental.constrained.fdiv.f32(float %16, float %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %22 = tail call float @llvm.experimental.constrained.fadd.f32(float %15, float %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %33

23:                                               ; preds = %1
  %24 = icmp ult i32 %4, 1118925335
  br i1 %24, label %25, label %31

25:                                               ; preds = %23
  %26 = tail call float @expf(float noundef %5) #5
  %27 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %28 = tail call float @llvm.experimental.constrained.fdiv.f32(float %27, float %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %29 = tail call float @llvm.experimental.constrained.fadd.f32(float %26, float %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %30 = tail call float @llvm.experimental.constrained.fmul.f32(float 5.000000e-01, float %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %33

31:                                               ; preds = %23
  %32 = tail call float @__expo2f(float noundef %5, float noundef 1.000000e+00) #5
  br label %33

33:                                               ; preds = %31, %25, %13, %9
  %34 = phi float [ %12, %9 ], [ %22, %13 ], [ %30, %25 ], [ %32, %31 ]
  ret float %34
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #2

; Function Attrs: optsize
declare float @expm1f(float noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare float @expf(float noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden float @__expo2f(float noundef, float noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
