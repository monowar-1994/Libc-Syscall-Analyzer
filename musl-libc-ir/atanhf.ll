; ModuleID = 'src/math/atanhf.c'
source_filename = "src/math/atanhf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @atanhf(float noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast float %0 to i32
  %4 = and i32 %3, 2147483647
  %5 = bitcast i32 %4 to float
  %6 = icmp ult i32 %4, 1056964608
  br i1 %6, label %7, label %25

7:                                                ; preds = %1
  %8 = icmp ult i32 %4, 796917760
  br i1 %8, label %9, label %14

9:                                                ; preds = %7
  %10 = icmp ult i32 %4, 8388608
  br i1 %10, label %11, label %33

11:                                               ; preds = %9
  %12 = tail call float @llvm.experimental.constrained.fmul.f32(float %5, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %13 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %13)
  store volatile float %12, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %13)
  br label %33

14:                                               ; preds = %7
  %15 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %16 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %17 = tail call float @llvm.experimental.constrained.fmul.f32(float %16, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %18 = tail call float @llvm.experimental.constrained.fmul.f32(float %17, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %19 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %20 = tail call float @llvm.experimental.constrained.fsub.f32(float %19, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %21 = tail call float @llvm.experimental.constrained.fdiv.f32(float %18, float %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %22 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %15, float %5, float %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %23 = tail call float @log1pf(float noundef %22) #5
  %24 = tail call float @llvm.experimental.constrained.fmul.f32(float 5.000000e-01, float %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %33

25:                                               ; preds = %1
  %26 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %27 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %28 = tail call float @llvm.experimental.constrained.fsub.f32(float %27, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %29 = tail call float @llvm.experimental.constrained.fdiv.f32(float %5, float %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %30 = tail call float @llvm.experimental.constrained.fmul.f32(float %26, float %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %31 = tail call float @log1pf(float noundef %30) #5
  %32 = tail call float @llvm.experimental.constrained.fmul.f32(float 5.000000e-01, float %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %33

33:                                               ; preds = %14, %11, %9, %25
  %34 = phi float [ %5, %11 ], [ %5, %9 ], [ %24, %14 ], [ %32, %25 ]
  %35 = fneg float %34
  %36 = icmp slt i32 %3, 0
  %37 = select i1 %36, float %35, float %34
  ret float %37
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare float @log1pf(float noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #2

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
