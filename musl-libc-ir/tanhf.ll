; ModuleID = 'src/math/tanhf.c'
source_filename = "src/math/tanhf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @tanhf(float noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast float %0 to i32
  %4 = and i32 %3, 2147483647
  %5 = bitcast i32 %4 to float
  %6 = icmp ugt i32 %4, 1057791828
  br i1 %6, label %7, label %24

7:                                                ; preds = %1
  %8 = icmp ugt i32 %4, 1092616192
  br i1 %8, label %9, label %14

9:                                                ; preds = %7
  %10 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %11 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %12 = tail call float @llvm.experimental.constrained.fdiv.f32(float %11, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %13 = tail call float @llvm.experimental.constrained.fadd.f32(float %10, float %12, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %46

14:                                               ; preds = %7
  %15 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %16 = tail call float @llvm.experimental.constrained.fmul.f32(float %15, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %17 = tail call float @expm1f(float noundef %16) #5
  %18 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %19 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %20 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %21 = tail call float @llvm.experimental.constrained.fadd.f32(float %17, float %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %22 = tail call float @llvm.experimental.constrained.fdiv.f32(float %19, float %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %23 = tail call float @llvm.experimental.constrained.fsub.f32(float %18, float %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %46

24:                                               ; preds = %1
  %25 = icmp ugt i32 %4, 1048757624
  br i1 %25, label %26, label %33

26:                                               ; preds = %24
  %27 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %28 = tail call float @llvm.experimental.constrained.fmul.f32(float %27, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %29 = tail call float @expm1f(float noundef %28) #5
  %30 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %31 = tail call float @llvm.experimental.constrained.fadd.f32(float %29, float %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %32 = tail call float @llvm.experimental.constrained.fdiv.f32(float %29, float %31, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %46

33:                                               ; preds = %24
  %34 = icmp ugt i32 %4, 8388607
  br i1 %34, label %35, label %43

35:                                               ; preds = %33
  %36 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 -2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %37 = tail call float @llvm.experimental.constrained.fmul.f32(float %36, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %38 = tail call float @expm1f(float noundef %37) #5
  %39 = fneg float %38
  %40 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %41 = tail call float @llvm.experimental.constrained.fadd.f32(float %38, float %40, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %42 = tail call float @llvm.experimental.constrained.fdiv.f32(float %39, float %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %46

43:                                               ; preds = %33
  %44 = tail call float @llvm.experimental.constrained.fmul.f32(float %5, float %5, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %45 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %45)
  store volatile float %44, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %45)
  br label %46

46:                                               ; preds = %26, %43, %35, %9, %14
  %47 = phi float [ %13, %9 ], [ %23, %14 ], [ %32, %26 ], [ %42, %35 ], [ %5, %43 ]
  %48 = fneg float %47
  %49 = icmp slt i32 %3, 0
  %50 = select i1 %49, float %48, float %47
  ret float %50
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare float @expm1f(float noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

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
