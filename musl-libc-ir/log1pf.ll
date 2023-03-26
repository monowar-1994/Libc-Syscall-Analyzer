; ModuleID = 'src/math/log1pf.c'
source_filename = "src/math/log1pf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define float @log1pf(float noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast float %0 to i32
  %4 = icmp sgt i32 %3, 1054086095
  br i1 %4, label %26, label %5

5:                                                ; preds = %1
  %6 = icmp ugt i32 %3, -1082130433
  br i1 %6, label %7, label %15

7:                                                ; preds = %5
  %8 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 -1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %9 = tail call i1 @llvm.experimental.constrained.fcmp.f32(float %0, float %8, metadata !"oeq", metadata !"fpexcept.ignore") #3
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  %11 = tail call float @llvm.experimental.constrained.fdiv.f32(float %0, float 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %77

12:                                               ; preds = %7
  %13 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %14 = tail call float @llvm.experimental.constrained.fdiv.f32(float %13, float 0.000000e+00, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %77

15:                                               ; preds = %5
  %16 = shl i32 %3, 1
  %17 = icmp ult i32 %16, 1728053248
  br i1 %17, label %18, label %24

18:                                               ; preds = %15
  %19 = and i32 %3, 2139095040
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %77

21:                                               ; preds = %18
  %22 = tail call float @llvm.experimental.constrained.fmul.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %23 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %23)
  store volatile float %22, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %23)
  br label %77

24:                                               ; preds = %15
  %25 = icmp ult i32 %3, -1097468390
  br i1 %25, label %28, label %30

26:                                               ; preds = %1
  %27 = icmp ugt i32 %3, 2139095039
  br i1 %27, label %77, label %30

28:                                               ; preds = %24
  %29 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %55

30:                                               ; preds = %24, %26
  %31 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %32 = tail call float @llvm.experimental.constrained.fadd.f32(float %31, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = bitcast float %32 to i32
  %34 = add i32 %33, 4913933
  %35 = lshr i32 %34, 23
  %36 = add nsw i32 %35, -127
  %37 = icmp ult i32 %34, 1275068416
  br i1 %37, label %38, label %46

38:                                               ; preds = %30
  %39 = icmp ugt i32 %34, 1082130431
  %40 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %41 = select i1 %39, float %0, float %40
  %42 = select i1 %39, float %40, float %0
  %43 = tail call float @llvm.experimental.constrained.fsub.f32(float %32, float %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %44 = tail call float @llvm.experimental.constrained.fsub.f32(float %42, float %43, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %45 = tail call float @llvm.experimental.constrained.fdiv.f32(float %44, float %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %48

46:                                               ; preds = %30
  %47 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %48

48:                                               ; preds = %46, %38
  %49 = phi float [ %45, %38 ], [ %47, %46 ]
  %50 = and i32 %34, 8388607
  %51 = add nuw nsw i32 %50, 1060439283
  %52 = bitcast i32 %51 to float
  %53 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %54 = tail call float @llvm.experimental.constrained.fsub.f32(float %52, float %53, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %55

55:                                               ; preds = %28, %48
  %56 = phi float [ %49, %48 ], [ %29, %28 ]
  %57 = phi float [ %54, %48 ], [ %0, %28 ]
  %58 = phi i32 [ %36, %48 ], [ 0, %28 ]
  %59 = tail call float @llvm.experimental.constrained.fadd.f32(float 2.000000e+00, float %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %60 = tail call float @llvm.experimental.constrained.fdiv.f32(float %57, float %59, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %61 = tail call float @llvm.experimental.constrained.fmul.f32(float %60, float %60, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %62 = tail call float @llvm.experimental.constrained.fmul.f32(float %61, float %61, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %63 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %62, float 0x3FCF13C4C0000000, float 0x3FD999C260000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %64 = tail call float @llvm.experimental.constrained.fmul.f32(float %62, float %63, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %65 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %62, float 0x3FD23D3DC0000000, float 0x3FE5555540000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %66 = tail call float @llvm.experimental.constrained.fmul.f32(float %61, float %65, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %67 = tail call float @llvm.experimental.constrained.fadd.f32(float %66, float %64, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %68 = tail call float @llvm.experimental.constrained.fmul.f32(float 5.000000e-01, float %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %69 = tail call float @llvm.experimental.constrained.fmul.f32(float %68, float %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %70 = tail call float @llvm.experimental.constrained.sitofp.f32.i32(i32 %58, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %71 = tail call float @llvm.experimental.constrained.fadd.f32(float %69, float %67, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %72 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %70, float 0x3EE2FEFA20000000, float %56, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %73 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %60, float %71, float %72, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %74 = tail call float @llvm.experimental.constrained.fsub.f32(float %73, float %69, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %75 = tail call float @llvm.experimental.constrained.fadd.f32(float %74, float %57, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %76 = tail call float @llvm.experimental.constrained.fmuladd.f32(float %70, float 0x3FE62E3000000000, float %75, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %77

77:                                               ; preds = %26, %18, %21, %55, %12, %10
  %78 = phi float [ %11, %10 ], [ %14, %12 ], [ %76, %55 ], [ %0, %21 ], [ %0, %18 ], [ %0, %26 ]
  ret float %78
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.sitofp.f32.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmuladd.f32(float, float, float, metadata, metadata) #2

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
