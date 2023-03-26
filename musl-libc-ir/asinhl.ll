; ModuleID = 'src/math/asinhl.c'
source_filename = "src/math/asinhl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @asinhl(x86_fp80 noundef %0) local_unnamed_addr #0 {
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
  %12 = icmp ugt i32 %6, 16414
  br i1 %12, label %13, label %16

13:                                               ; preds = %1
  %14 = tail call x86_fp80 @logl(x86_fp80 noundef %11) #4
  %15 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %14, x86_fp80 0xK3FFEB17217F7D1CF79AC, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %44

16:                                               ; preds = %1
  %17 = icmp ugt i32 %6, 16383
  br i1 %17, label %18, label %28

18:                                               ; preds = %16
  %19 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %20 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %21 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %22 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %11, x86_fp80 %11, x86_fp80 %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %23 = tail call x86_fp80 @sqrtl(x86_fp80 noundef %22) #4
  %24 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %23, x86_fp80 %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %25 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %20, x86_fp80 %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %26 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %19, x86_fp80 %11, x86_fp80 %25, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %27 = tail call x86_fp80 @logl(x86_fp80 noundef %26) #4
  br label %44

28:                                               ; preds = %16
  %29 = icmp ugt i32 %6, 16350
  br i1 %29, label %30, label %40

30:                                               ; preds = %28
  %31 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %11, x86_fp80 %11, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %32 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %33 = tail call x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80 %11, x86_fp80 %11, x86_fp80 %32, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %34 = tail call x86_fp80 @sqrtl(x86_fp80 noundef %33) #4
  %35 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %36 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %34, x86_fp80 %35, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %37 = tail call x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80 %31, x86_fp80 %36, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %38 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %11, x86_fp80 %37, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %39 = tail call x86_fp80 @log1pl(x86_fp80 noundef %38) #4
  br label %44

40:                                               ; preds = %28
  %41 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x4770000000000000, metadata !"fpexcept.ignore") #5
  %42 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %11, x86_fp80 %41, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %43 = bitcast x86_fp80* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 10, i8* nonnull %43)
  store volatile x86_fp80 %42, x86_fp80* %2, align 16, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 10, i8* nonnull %43)
  br label %44

44:                                               ; preds = %18, %40, %30, %13
  %45 = phi x86_fp80 [ %15, %13 ], [ %27, %18 ], [ %39, %30 ], [ %11, %40 ]
  %46 = icmp ult i32 %5, 32768
  %47 = fneg x86_fp80 %45
  %48 = select i1 %46, x86_fp80 %45, x86_fp80 %47
  ret x86_fp80 %48
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare x86_fp80 @logl(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: optsize
declare x86_fp80 @sqrtl(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fmuladd.f80(x86_fp80, x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fdiv.f80(x86_fp80, x86_fp80, metadata, metadata) #3

; Function Attrs: optsize
declare x86_fp80 @log1pl(x86_fp80 noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float, metadata) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long double", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
