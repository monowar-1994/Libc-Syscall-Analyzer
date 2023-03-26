; ModuleID = 'src/math/cosl.c'
source_filename = "src/math/cosl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @cosl(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = alloca [2 x x86_fp80], align 16
  %3 = bitcast [2 x x86_fp80]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %3) #4
  %4 = bitcast x86_fp80 %0 to i80
  %5 = and i80 %4, 604462909807314587353087
  %6 = bitcast i80 %5 to x86_fp80
  %7 = lshr i80 %5, 64
  %8 = trunc i80 %7 to i32
  %9 = icmp eq i32 %8, 32767
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %41

12:                                               ; preds = %1
  %13 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3FE921FB54442D18, metadata !"fpexcept.ignore") #5
  %14 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %6, x86_fp80 %13, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %14, label %15, label %23

15:                                               ; preds = %12
  %16 = icmp ult i32 %8, 16319
  br i1 %16, label %17, label %20

17:                                               ; preds = %15
  %18 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 1.000000e+00, metadata !"fpexcept.ignore") #5
  %19 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %18, x86_fp80 %6, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %41

20:                                               ; preds = %15
  %21 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %22 = tail call x86_fp80 @__cosl(x86_fp80 noundef %6, x86_fp80 noundef %21) #6
  br label %41

23:                                               ; preds = %12
  %24 = getelementptr inbounds [2 x x86_fp80], [2 x x86_fp80]* %2, i64 0, i64 0
  %25 = call i32 @__rem_pio2l(x86_fp80 noundef %6, x86_fp80* noundef nonnull %24) #6
  %26 = load x86_fp80, x86_fp80* %24, align 16, !tbaa !3
  %27 = getelementptr inbounds [2 x x86_fp80], [2 x x86_fp80]* %2, i64 0, i64 1
  %28 = load x86_fp80, x86_fp80* %27, align 16, !tbaa !3
  %29 = and i32 %25, 3
  switch i32 %29, label %38 [
    i32 0, label %30
    i32 1, label %32
    i32 2, label %35
    i32 3, label %39
  ]

30:                                               ; preds = %23
  %31 = call x86_fp80 @__cosl(x86_fp80 noundef %26, x86_fp80 noundef %28) #6
  br label %41

32:                                               ; preds = %23
  %33 = call x86_fp80 @__sinl(x86_fp80 noundef %26, x86_fp80 noundef %28, i32 noundef 1) #6
  %34 = fneg x86_fp80 %33
  br label %41

35:                                               ; preds = %23
  %36 = call x86_fp80 @__cosl(x86_fp80 noundef %26, x86_fp80 noundef %28) #6
  %37 = fneg x86_fp80 %36
  br label %41

38:                                               ; preds = %23
  unreachable

39:                                               ; preds = %23
  %40 = call x86_fp80 @__sinl(x86_fp80 noundef %26, x86_fp80 noundef %28, i32 noundef 1) #6
  br label %41

41:                                               ; preds = %39, %35, %32, %30, %20, %17, %10
  %42 = phi x86_fp80 [ %11, %10 ], [ %19, %17 ], [ %22, %20 ], [ %40, %39 ], [ %37, %35 ], [ %34, %32 ], [ %31, %30 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %3) #4
  ret x86_fp80 %42
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
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: optsize
declare hidden x86_fp80 @__cosl(x86_fp80 noundef, x86_fp80 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #2

; Function Attrs: optsize
declare hidden i32 @__rem_pio2l(x86_fp80 noundef, x86_fp80* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden x86_fp80 @__sinl(x86_fp80 noundef, x86_fp80 noundef, i32 noundef) local_unnamed_addr #3

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
