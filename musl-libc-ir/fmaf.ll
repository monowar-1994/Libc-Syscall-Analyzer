; ModuleID = 'src/math/x86_64/fmaf.c'
source_filename = "src/math/x86_64/fmaf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define float @fmaf(float noundef %0, float noundef %1, float noundef %2) local_unnamed_addr #0 {
  %4 = alloca float, align 4
  %5 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %0, metadata !"fpexcept.strict") #4
  %6 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %1, metadata !"fpexcept.strict") #4
  %7 = tail call double @llvm.experimental.constrained.fmul.f64(double %5, double %6, metadata !"round.dynamic", metadata !"fpexcept.strict") #4
  %8 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %2, metadata !"fpexcept.strict") #4
  %9 = tail call double @llvm.experimental.constrained.fadd.f64(double %7, double %8, metadata !"round.dynamic", metadata !"fpexcept.strict") #4
  %10 = bitcast double %9 to i64
  %11 = lshr i64 %10, 52
  %12 = trunc i64 %11 to i32
  %13 = and i32 %12, 2047
  %14 = and i64 %10, 536870911
  %15 = icmp ne i64 %14, 268435456
  %16 = icmp eq i32 %13, 2047
  %17 = select i1 %15, i1 true, i1 %16
  br i1 %17, label %29, label %18

18:                                               ; preds = %3
  %19 = tail call double @llvm.experimental.constrained.fsub.f64(double %9, double %7, metadata !"round.dynamic", metadata !"fpexcept.strict") #4
  %20 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %2, metadata !"fpexcept.strict") #4
  %21 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %19, double %20, metadata !"oeq", metadata !"fpexcept.strict") #4
  br i1 %21, label %22, label %26

22:                                               ; preds = %18
  %23 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %2, metadata !"fpexcept.strict") #4
  %24 = tail call double @llvm.experimental.constrained.fsub.f64(double %9, double %23, metadata !"round.dynamic", metadata !"fpexcept.strict") #4
  %25 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %24, double %7, metadata !"oeq", metadata !"fpexcept.strict") #4
  br i1 %25, label %29, label %26

26:                                               ; preds = %22, %18
  %27 = tail call i32 @fegetround() #5
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %45, label %29

29:                                               ; preds = %26, %22, %3
  %30 = add nsw i32 %13, -874
  %31 = icmp ult i32 %30, 23
  br i1 %31, label %32, label %69

32:                                               ; preds = %29
  %33 = tail call i32 @fetestexcept(i32 noundef 32) #5
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %69, label %35

35:                                               ; preds = %32
  %36 = tail call i32 @feclearexcept(i32 noundef 32) #5
  %37 = bitcast float* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %37)
  store volatile float %2, float* %4, align 4, !tbaa !3
  %38 = load volatile float, float* %4, align 4, !tbaa !3
  %39 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %38, metadata !"fpexcept.strict") #4
  %40 = tail call double @llvm.experimental.constrained.fadd.f64(double %7, double %39, metadata !"round.dynamic", metadata !"fpexcept.strict") #4
  %41 = tail call i32 @fetestexcept(i32 noundef 32) #5
  %42 = icmp eq i32 %41, 0
  %43 = select i1 %42, i32 32, i32 16
  %44 = tail call i32 @feraiseexcept(i32 noundef %43) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %37)
  br label %69

45:                                               ; preds = %26
  %46 = lshr i64 %10, 63
  %47 = trunc i64 %46 to i32
  %48 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %2, metadata !"fpexcept.strict") #4
  %49 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %48, double %7, metadata !"ogt", metadata !"fpexcept.strict") #4
  %50 = zext i1 %49 to i32
  %51 = icmp eq i32 %47, %50
  br i1 %51, label %52, label %56

52:                                               ; preds = %45
  %53 = tail call double @llvm.experimental.constrained.fsub.f64(double %7, double %9, metadata !"round.dynamic", metadata !"fpexcept.strict") #4
  %54 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %2, metadata !"fpexcept.strict") #4
  %55 = tail call double @llvm.experimental.constrained.fadd.f64(double %53, double %54, metadata !"round.dynamic", metadata !"fpexcept.strict") #4
  br label %60

56:                                               ; preds = %45
  %57 = tail call double @llvm.experimental.constrained.fpext.f64.f32(float %2, metadata !"fpexcept.strict") #4
  %58 = tail call double @llvm.experimental.constrained.fsub.f64(double %57, double %9, metadata !"round.dynamic", metadata !"fpexcept.strict") #4
  %59 = tail call double @llvm.experimental.constrained.fadd.f64(double %58, double %7, metadata !"round.dynamic", metadata !"fpexcept.strict") #4
  br label %60

60:                                               ; preds = %56, %52
  %61 = phi double [ %55, %52 ], [ %59, %56 ]
  %62 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.strict") #4
  %63 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %61, double %62, metadata !"olt", metadata !"fpexcept.strict") #4
  %64 = zext i1 %63 to i32
  %65 = icmp eq i32 %47, %64
  %66 = select i1 %65, i64 1, i64 -1
  %67 = add i64 %66, %10
  %68 = bitcast i64 %67 to double
  br label %69

69:                                               ; preds = %29, %32, %35, %60
  %70 = phi double [ %68, %60 ], [ %40, %35 ], [ %9, %32 ], [ %9, %29 ]
  %71 = tail call float @llvm.experimental.constrained.fptrunc.f32.f64(double %70, metadata !"round.dynamic", metadata !"fpexcept.strict") #4
  ret float %71
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fpext.f64.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fadd.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #2

; Function Attrs: optsize
declare i32 @fegetround() local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @fetestexcept(i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @feclearexcept(i32 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @feraiseexcept(i32 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f64(double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #2

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
