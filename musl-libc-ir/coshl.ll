; ModuleID = 'src/math/coshl.c'
source_filename = "src/math/coshl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @coshl(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = alloca x86_fp80, align 16
  %3 = bitcast x86_fp80 %0 to i80
  %4 = lshr i80 %3, 64
  %5 = trunc i80 %4 to i32
  %6 = and i32 %5, 32767
  %7 = zext i32 %6 to i80
  %8 = shl nuw nsw i80 %7, 64
  %9 = and i80 %3, 18446744073709551615
  %10 = or i80 %8, %9
  %11 = bitcast i80 %10 to x86_fp80
  %12 = icmp ult i32 %6, 16382
  br i1 %12, label %19, label %13

13:                                               ; preds = %1
  %14 = lshr i80 %3, 32
  %15 = trunc i80 %14 to i32
  %16 = icmp eq i32 %6, 16382
  %17 = icmp ult i32 %15, -1317922825
  %18 = and i1 %17, %16
  br i1 %18, label %26, label %36

19:                                               ; preds = %1
  %20 = icmp ult i32 %6, 16351
  br i1 %20, label %21, label %26

21:                                               ; preds = %19
  %22 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x4770000000000000, metadata !"fpexcept.ignore") #4
  %23 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %11, x86_fp80 %22, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %24 = bitcast x86_fp80* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 10, i8* nonnull %24)
  store volatile x86_fp80 %23, x86_fp80* %2, align 16, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 10, i8* nonnull %24)
  %25 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %55

26:                                               ; preds = %13, %19
  %27 = tail call x86_fp80 @expm1l(x86_fp80 noundef %11) #5
  %28 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %29 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %27, x86_fp80 %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %30 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %31 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %32 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %31, x86_fp80 %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %33 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %30, x86_fp80 %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %34 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %29, x86_fp80 %33, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %35 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %28, x86_fp80 %34, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %55

36:                                               ; preds = %13
  %37 = icmp ult i32 %6, 16396
  %38 = icmp eq i32 %6, 16396
  %39 = and i1 %17, %38
  %40 = or i1 %37, %39
  br i1 %40, label %41, label %48

41:                                               ; preds = %36
  %42 = tail call x86_fp80 @expl(x86_fp80 noundef %11) #5
  %43 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #4
  %44 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %45 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %44, x86_fp80 %42, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %46 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %42, x86_fp80 %45, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %47 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %43, x86_fp80 %46, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %55

48:                                               ; preds = %36
  %49 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #4
  %50 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %49, x86_fp80 %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %51 = tail call x86_fp80 @expl(x86_fp80 noundef %50) #5
  %52 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #4
  %53 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %52, x86_fp80 %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %54 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %53, x86_fp80 %51, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %55

55:                                               ; preds = %48, %41, %26, %21
  %56 = phi x86_fp80 [ %25, %21 ], [ %35, %26 ], [ %47, %41 ], [ %54, %48 ]
  ret x86_fp80 %56
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #2

; Function Attrs: optsize
declare x86_fp80 @expm1l(x86_fp80 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: optsize
declare x86_fp80 @expl(x86_fp80 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #2

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
!4 = !{!"long double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
