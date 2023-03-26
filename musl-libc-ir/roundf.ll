; ModuleID = 'src/math/roundf.c'
source_filename = "src/math/roundf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define float @roundf(float noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast float %0 to i32
  %4 = lshr i32 %3, 23
  %5 = and i32 %4, 255
  %6 = icmp ugt i32 %5, 149
  br i1 %6, label %35, label %7

7:                                                ; preds = %1
  %8 = icmp sgt i32 %3, -1
  %9 = fneg float %0
  %10 = select i1 %8, float %0, float %9
  %11 = icmp ult i32 %5, 126
  %12 = tail call float @llvm.experimental.constrained.fadd.f32(float %10, float 0x4160000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br i1 %11, label %13, label %17

13:                                               ; preds = %7
  %14 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %14)
  store volatile float %12, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %14)
  %15 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %16 = tail call float @llvm.experimental.constrained.fmul.f32(float %15, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %35

17:                                               ; preds = %7
  %18 = tail call float @llvm.experimental.constrained.fsub.f32(float %12, float 0x4160000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %19 = tail call float @llvm.experimental.constrained.fsub.f32(float %18, float %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %20 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %19, float 5.000000e-01, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %20, label %21, label %25

21:                                               ; preds = %17
  %22 = tail call float @llvm.experimental.constrained.fadd.f32(float %19, float %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %24 = tail call float @llvm.experimental.constrained.fsub.f32(float %22, float %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %31

25:                                               ; preds = %17
  %26 = tail call i1 @llvm.experimental.constrained.fcmps.f32(float %19, float -5.000000e-01, metadata !"ole", metadata !"fpexcept.ignore") #3
  %27 = tail call float @llvm.experimental.constrained.fadd.f32(float %19, float %10, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br i1 %26, label %28, label %31

28:                                               ; preds = %25
  %29 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %30 = tail call float @llvm.experimental.constrained.fadd.f32(float %27, float %29, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %31

31:                                               ; preds = %25, %28, %21
  %32 = phi float [ %24, %21 ], [ %30, %28 ], [ %27, %25 ]
  %33 = fneg float %32
  %34 = select i1 %8, float %32, float %33
  br label %35

35:                                               ; preds = %1, %31, %13
  %36 = phi float [ %16, %13 ], [ %34, %31 ], [ %0, %1 ]
  ret float %36
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f32(float, float, metadata, metadata) #2

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
