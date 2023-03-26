; ModuleID = 'src/math/asinhf.c'
source_filename = "src/math/asinhf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @asinhf(float noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast float %0 to i32
  %4 = and i32 %3, 2147483647
  %5 = bitcast i32 %4 to float
  %6 = icmp ugt i32 %4, 1166016511
  br i1 %6, label %7, label %10

7:                                                ; preds = %1
  %8 = tail call float @logf(float noundef %5) #4
  %9 = tail call float @llvm.experimental.constrained.fadd.f32(float %8, float 0x3FE62E4300000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %37

10:                                               ; preds = %1
  %11 = icmp ugt i32 %4, 1073741823
  br i1 %11, label %12, label %22

12:                                               ; preds = %10
  %13 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %14 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %15 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %16 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %5, float %5, float %15, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %17 = tail call float @sqrtf(float noundef %16) #4
  %18 = tail call float @llvm.experimental.constrained.fadd.f32(float %17, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %19 = tail call float @llvm.experimental.constrained.fdiv.f32(float %14, float %18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %20 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %13, float %5, float %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %21 = tail call float @logf(float noundef %20) #4
  br label %37

22:                                               ; preds = %10
  %23 = icmp ugt i32 %4, 964689919
  br i1 %23, label %24, label %34

24:                                               ; preds = %22
  %25 = tail call float @llvm.experimental.constrained.fmul.f32(float %5, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %26 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %27 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %5, float %5, float %26, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %28 = tail call float @sqrtf(float noundef %27) #4
  %29 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %30 = tail call float @llvm.experimental.constrained.fadd.f32(float %28, float %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %31 = tail call float @llvm.experimental.constrained.fdiv.f32(float %25, float %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %32 = tail call float @llvm.experimental.constrained.fadd.f32(float %5, float %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %33 = tail call float @log1pf(float noundef %32) #4
  br label %37

34:                                               ; preds = %22
  %35 = tail call float @llvm.experimental.constrained.fadd.f32(float %5, float 0x4770000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %36 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %36)
  store volatile float %35, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %36)
  br label %37

37:                                               ; preds = %12, %34, %24, %7
  %38 = phi float [ %9, %7 ], [ %21, %12 ], [ %33, %24 ], [ %5, %34 ]
  %39 = fneg float %38
  %40 = icmp slt i32 %3, 0
  %41 = select i1 %40, float %39, float %38
  ret float %41
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare float @logf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #3

; Function Attrs: optsize
declare float @sqrtf(float noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #3

; Function Attrs: optsize
declare float @log1pf(float noundef) local_unnamed_addr #2

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
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
