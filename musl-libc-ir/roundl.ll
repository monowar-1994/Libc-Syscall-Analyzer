; ModuleID = 'src/math/roundl.c'
source_filename = "src/math/roundl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define x86_fp80 @roundl(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = alloca x86_fp80, align 16
  %3 = bitcast x86_fp80 %0 to i80
  %4 = lshr i80 %3, 64
  %5 = trunc i80 %4 to i32
  %6 = and i32 %5, 32767
  %7 = icmp ugt i32 %6, 16445
  br i1 %7, label %38, label %8

8:                                                ; preds = %1
  %9 = icmp ult i32 %5, 32768
  %10 = fneg x86_fp80 %0
  %11 = select i1 %9, x86_fp80 %0, x86_fp80 %10
  %12 = icmp ult i32 %6, 16382
  %13 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %11, x86_fp80 0xK403E8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br i1 %12, label %14, label %18

14:                                               ; preds = %8
  %15 = bitcast x86_fp80* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 10, i8* nonnull %15)
  store volatile x86_fp80 %13, x86_fp80* %2, align 16, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 10, i8* nonnull %15)
  %16 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %17 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %16, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %38

18:                                               ; preds = %8
  %19 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %13, x86_fp80 0xK403E8000000000000000, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %20 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %19, x86_fp80 %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %21 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #3
  %22 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %20, x86_fp80 %21, metadata !"ogt", metadata !"fpexcept.ignore") #3
  br i1 %22, label %23, label %27

23:                                               ; preds = %18
  %24 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %20, x86_fp80 %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %25 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %26 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %24, x86_fp80 %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %34

27:                                               ; preds = %18
  %28 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double -5.000000e-01, metadata !"fpexcept.ignore") #3
  %29 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %20, x86_fp80 %28, metadata !"ole", metadata !"fpexcept.ignore") #3
  %30 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %20, x86_fp80 %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br i1 %29, label %31, label %34

31:                                               ; preds = %27
  %32 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  %33 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %30, x86_fp80 %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  br label %34

34:                                               ; preds = %27, %31, %23
  %35 = phi x86_fp80 [ %26, %23 ], [ %33, %31 ], [ %30, %27 ]
  %36 = fneg x86_fp80 %35
  %37 = select i1 %9, x86_fp80 %35, x86_fp80 %36
  br label %38

38:                                               ; preds = %1, %34, %14
  %39 = phi x86_fp80 [ %17, %14 ], [ %37, %34 ], [ %0, %1 ]
  ret x86_fp80 %39
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80, x86_fp80, metadata, metadata) #2

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
!4 = !{!"long double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
