; ModuleID = 'src/math/tanf.c'
source_filename = "src/math/tanf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @tanf(float noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = alloca double, align 8
  %4 = bitcast double* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #4
  %5 = bitcast float %0 to i32
  %6 = and i32 %5, 2147483647
  %7 = icmp ult i32 %6, 1061752795
  br i1 %7, label %8, label %22

8:                                                ; preds = %1
  %9 = icmp ult i32 %6, 964689920
  br i1 %9, label %10, label %19

10:                                               ; preds = %8
  %11 = icmp ult i32 %6, 8388608
  br i1 %11, label %12, label %14

12:                                               ; preds = %10
  %13 = tail call float @llvm.experimental.constrained.fdiv.f32(float %0, float 0x4770000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %16

14:                                               ; preds = %10
  %15 = tail call float @llvm.experimental.constrained.fadd.f32(float %0, float 0x4770000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi float [ %13, %12 ], [ %15, %14 ]
  %18 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %18)
  store volatile float %17, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %18)
  br label %75

19:                                               ; preds = %8
  %20 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  %21 = tail call float @__tandf(double noundef %20, i32 noundef 0) #6
  br label %75

22:                                               ; preds = %1
  %23 = icmp ult i32 %6, 1081824210
  br i1 %23, label %24, label %44

24:                                               ; preds = %22
  %25 = icmp ult i32 %6, 1075235812
  %26 = icmp sgt i32 %5, -1
  %27 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  br i1 %25, label %28, label %36

28:                                               ; preds = %24
  br i1 %26, label %31, label %29

29:                                               ; preds = %28
  %30 = tail call double @llvm.experimental.constrained.fadd.f64(double %27, double 0x3FF921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %33

31:                                               ; preds = %28
  %32 = tail call double @llvm.experimental.constrained.fsub.f64(double %27, double 0x3FF921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %33

33:                                               ; preds = %31, %29
  %34 = phi double [ %30, %29 ], [ %32, %31 ]
  %35 = tail call float @__tandf(double noundef %34, i32 noundef 1) #6
  br label %75

36:                                               ; preds = %24
  br i1 %26, label %39, label %37

37:                                               ; preds = %36
  %38 = tail call double @llvm.experimental.constrained.fadd.f64(double %27, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %41

39:                                               ; preds = %36
  %40 = tail call double @llvm.experimental.constrained.fsub.f64(double %27, double 0x400921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %41

41:                                               ; preds = %39, %37
  %42 = phi double [ %38, %37 ], [ %40, %39 ]
  %43 = tail call float @__tandf(double noundef %42, i32 noundef 0) #6
  br label %75

44:                                               ; preds = %22
  %45 = icmp ult i32 %6, 1088565718
  br i1 %45, label %46, label %66

46:                                               ; preds = %44
  %47 = icmp ult i32 %6, 1085271520
  %48 = icmp sgt i32 %5, -1
  %49 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.ignore") #5
  br i1 %47, label %50, label %58

50:                                               ; preds = %46
  br i1 %48, label %53, label %51

51:                                               ; preds = %50
  %52 = tail call double @llvm.experimental.constrained.fadd.f64(double %49, double 0x4012D97C7F3321D2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %55

53:                                               ; preds = %50
  %54 = tail call double @llvm.experimental.constrained.fsub.f64(double %49, double 0x4012D97C7F3321D2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %55

55:                                               ; preds = %53, %51
  %56 = phi double [ %52, %51 ], [ %54, %53 ]
  %57 = tail call float @__tandf(double noundef %56, i32 noundef 1) #6
  br label %75

58:                                               ; preds = %46
  br i1 %48, label %61, label %59

59:                                               ; preds = %58
  %60 = tail call double @llvm.experimental.constrained.fadd.f64(double %49, double 0x401921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %63

61:                                               ; preds = %58
  %62 = tail call double @llvm.experimental.constrained.fsub.f64(double %49, double 0x401921FB54442D18, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %63

63:                                               ; preds = %61, %59
  %64 = phi double [ %60, %59 ], [ %62, %61 ]
  %65 = tail call float @__tandf(double noundef %64, i32 noundef 0) #6
  br label %75

66:                                               ; preds = %44
  %67 = icmp ugt i32 %6, 2139095039
  br i1 %67, label %68, label %70

68:                                               ; preds = %66
  %69 = tail call float @llvm.experimental.constrained.fsub.f32(float %0, float %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %75

70:                                               ; preds = %66
  %71 = call i32 @__rem_pio2f(float noundef %0, double* noundef nonnull %3) #6
  %72 = load double, double* %3, align 8, !tbaa !7
  %73 = and i32 %71, 1
  %74 = call float @__tandf(double noundef %72, i32 noundef %73) #6
  br label %75

75:                                               ; preds = %70, %68, %63, %55, %41, %33, %19, %16
  %76 = phi float [ %0, %16 ], [ %21, %19 ], [ %35, %33 ], [ %43, %41 ], [ %57, %55 ], [ %65, %63 ], [ %69, %68 ], [ %74, %70 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #4
  ret float %76
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fdiv.f32(float, float, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fadd.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare hidden float @__tandf(double noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

; Function Attrs: optsize
declare hidden i32 @__rem_pio2f(float noundef, double* noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !5, i64 0}
