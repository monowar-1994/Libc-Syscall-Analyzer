; ModuleID = 'src/math/sincosl.c'
source_filename = "src/math/sincosl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define void @sincosl(x86_fp80 noundef %0, x86_fp80* nocapture noundef writeonly %1, x86_fp80* nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = alloca x86_fp80, align 16
  %5 = alloca [2 x x86_fp80], align 16
  %6 = bitcast [2 x x86_fp80]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %6) #4
  %7 = bitcast x86_fp80 %0 to i80
  %8 = and i80 %7, 604462909807314587353087
  %9 = lshr i80 %8, 64
  %10 = trunc i80 %9 to i32
  %11 = icmp eq i32 %10, 32767
  br i1 %11, label %12, label %14

12:                                               ; preds = %3
  %13 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store x86_fp80 %13, x86_fp80* %2, align 16, !tbaa !3
  store x86_fp80 %13, x86_fp80* %1, align 16, !tbaa !3
  br label %54

14:                                               ; preds = %3
  %15 = bitcast i80 %8 to x86_fp80
  %16 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3FE921FB54442D18, metadata !"fpexcept.ignore") #5
  %17 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %15, x86_fp80 %16, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %17, label %18, label %34

18:                                               ; preds = %14
  %19 = icmp ult i32 %10, 16319
  br i1 %19, label %20, label %29

20:                                               ; preds = %18
  %21 = icmp eq i32 %10, 0
  br i1 %21, label %22, label %26

22:                                               ; preds = %20
  %23 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x3870000000000000, metadata !"fpexcept.ignore") #5
  %24 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 %23, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %25 = bitcast x86_fp80* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 10, i8* nonnull %25)
  store volatile x86_fp80 %24, x86_fp80* %4, align 16, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 10, i8* nonnull %25)
  br label %26

26:                                               ; preds = %22, %20
  store x86_fp80 %0, x86_fp80* %1, align 16, !tbaa !3
  %27 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #5
  %28 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %27, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  store x86_fp80 %28, x86_fp80* %2, align 16, !tbaa !3
  br label %54

29:                                               ; preds = %18
  %30 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %31 = tail call x86_fp80 @__sinl(x86_fp80 noundef %0, x86_fp80 noundef %30, i32 noundef 0) #6
  store x86_fp80 %31, x86_fp80* %1, align 16, !tbaa !3
  %32 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %33 = tail call x86_fp80 @__cosl(x86_fp80 noundef %0, x86_fp80 noundef %32) #6
  store x86_fp80 %33, x86_fp80* %2, align 16, !tbaa !3
  br label %54

34:                                               ; preds = %14
  %35 = getelementptr inbounds [2 x x86_fp80], [2 x x86_fp80]* %5, i64 0, i64 0
  %36 = call i32 @__rem_pio2l(x86_fp80 noundef %0, x86_fp80* noundef nonnull %35) #6
  %37 = load x86_fp80, x86_fp80* %35, align 16, !tbaa !3
  %38 = getelementptr inbounds [2 x x86_fp80], [2 x x86_fp80]* %5, i64 0, i64 1
  %39 = load x86_fp80, x86_fp80* %38, align 16, !tbaa !3
  %40 = call x86_fp80 @__sinl(x86_fp80 noundef %37, x86_fp80 noundef %39, i32 noundef 1) #6
  %41 = load x86_fp80, x86_fp80* %35, align 16, !tbaa !3
  %42 = load x86_fp80, x86_fp80* %38, align 16, !tbaa !3
  %43 = call x86_fp80 @__cosl(x86_fp80 noundef %41, x86_fp80 noundef %42) #6
  %44 = and i32 %36, 3
  switch i32 %44, label %51 [
    i32 0, label %45
    i32 1, label %46
    i32 2, label %48
    i32 3, label %52
  ]

45:                                               ; preds = %34
  store x86_fp80 %40, x86_fp80* %1, align 16, !tbaa !3
  store x86_fp80 %43, x86_fp80* %2, align 16, !tbaa !3
  br label %54

46:                                               ; preds = %34
  store x86_fp80 %43, x86_fp80* %1, align 16, !tbaa !3
  %47 = fneg x86_fp80 %40
  store x86_fp80 %47, x86_fp80* %2, align 16, !tbaa !3
  br label %54

48:                                               ; preds = %34
  %49 = fneg x86_fp80 %40
  store x86_fp80 %49, x86_fp80* %1, align 16, !tbaa !3
  %50 = fneg x86_fp80 %43
  store x86_fp80 %50, x86_fp80* %2, align 16, !tbaa !3
  br label %54

51:                                               ; preds = %34
  unreachable

52:                                               ; preds = %34
  %53 = fneg x86_fp80 %43
  store x86_fp80 %53, x86_fp80* %1, align 16, !tbaa !3
  store x86_fp80 %40, x86_fp80* %2, align 16, !tbaa !3
  br label %54

54:                                               ; preds = %45, %46, %48, %52, %29, %26, %12
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %6) #4
  ret void
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: optsize
declare hidden x86_fp80 @__sinl(x86_fp80 noundef, x86_fp80 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #2

; Function Attrs: optsize
declare hidden x86_fp80 @__cosl(x86_fp80 noundef, x86_fp80 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__rem_pio2l(x86_fp80 noundef, x86_fp80* noundef) local_unnamed_addr #3

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
!4 = !{!"long double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
