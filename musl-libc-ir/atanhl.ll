; ModuleID = 'src/math/atanhl.c'
source_filename = "src/math/atanhl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @atanhl(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  %3 = bitcast x86_fp80 %0 to i80
  %4 = lshr i80 %3, 64
  %5 = trunc i80 %4 to i32
  %6 = and i32 %5, 32767
  %7 = zext i32 %6 to i80
  %8 = shl nuw nsw i80 %7, 64
  %9 = and i80 %3, 18446744073709551615
  %10 = or i80 %8, %9
  %11 = bitcast i80 %10 to x86_fp80
  %12 = icmp ult i32 %6, 1022
  br i1 %12, label %13, label %32

13:                                               ; preds = %1
  %14 = icmp ult i32 %6, 991
  br i1 %14, label %15, label %20

15:                                               ; preds = %13
  %16 = icmp eq i32 %6, 0
  br i1 %16, label %17, label %41

17:                                               ; preds = %15
  %18 = tail call float @llvm.experimental.constrained.fptrunc.f32.f80(x86_fp80 %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %19 = bitcast float* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %19)
  store volatile float %18, float* %2, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %19)
  br label %41

20:                                               ; preds = %13
  %21 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #4
  %22 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %23 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %24 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %23, x86_fp80 %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %25 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %24, x86_fp80 %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %26 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %27 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %26, x86_fp80 %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %28 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %25, x86_fp80 %27, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %29 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %22, x86_fp80 %11, x86_fp80 %28, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %30 = tail call x86_fp80 @log1pl(x86_fp80 noundef %29) #5
  %31 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %21, x86_fp80 %30, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %41

32:                                               ; preds = %1
  %33 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 5.000000e-01, metadata !"fpexcept.ignore") #4
  %34 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %35 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %35, x86_fp80 %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %37 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %11, x86_fp80 %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %38 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %34, x86_fp80 %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %39 = tail call x86_fp80 @log1pl(x86_fp80 noundef %38) #5
  %40 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %33, x86_fp80 %39, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  br label %41

41:                                               ; preds = %20, %17, %15, %32
  %42 = phi x86_fp80 [ %11, %17 ], [ %11, %15 ], [ %31, %20 ], [ %40, %32 ]
  %43 = icmp ult i32 %5, 32768
  %44 = fneg x86_fp80 %42
  %45 = select i1 %43, x86_fp80 %42, x86_fp80 %44
  ret x86_fp80 %45
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fptrunc.f32.f80(x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double, metadata) #2

; Function Attrs: optsize
declare x86_fp80 @log1pl(x86_fp80 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #2

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
