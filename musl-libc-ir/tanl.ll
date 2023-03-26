; ModuleID = 'src/math/tanl.c'
source_filename = "src/math/tanl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @tanl(x86_fp80 noundef %0) local_unnamed_addr #0 {
  %2 = alloca x86_fp80, align 16
  %3 = alloca [2 x x86_fp80], align 16
  %4 = bitcast [2 x x86_fp80]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %4) #4
  %5 = bitcast x86_fp80 %0 to i80
  %6 = and i80 %5, 604462909807314587353087
  %7 = lshr i80 %6, 64
  %8 = trunc i80 %7 to i32
  %9 = icmp eq i32 %8, 32767
  br i1 %9, label %10, label %12

10:                                               ; preds = %1
  %11 = tail call x86_fp80 @llvm.experimental.constrained.fsub.f80(x86_fp80 %0, x86_fp80 %0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %40

12:                                               ; preds = %1
  %13 = bitcast i80 %6 to x86_fp80
  %14 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f64(double 0x3FE921FB54442D18, metadata !"fpexcept.ignore") #5
  %15 = tail call i1 @llvm.experimental.constrained.fcmps.f80(x86_fp80 %13, x86_fp80 %14, metadata !"olt", metadata !"fpexcept.ignore") #5
  br i1 %15, label %16, label %32

16:                                               ; preds = %12
  %17 = icmp ult i32 %8, 16351
  br i1 %17, label %18, label %29

18:                                               ; preds = %16
  %19 = icmp eq i32 %8, 0
  br i1 %19, label %20, label %23

20:                                               ; preds = %18
  %21 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x3870000000000000, metadata !"fpexcept.ignore") #5
  %22 = tail call x86_fp80 @llvm.experimental.constrained.fmul.f80(x86_fp80 %0, x86_fp80 %21, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %26

23:                                               ; preds = %18
  %24 = tail call x86_fp80 @llvm.experimental.constrained.fpext.f80.f32(float 0x4770000000000000, metadata !"fpexcept.ignore") #5
  %25 = tail call x86_fp80 @llvm.experimental.constrained.fadd.f80(x86_fp80 %0, x86_fp80 %24, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  br label %26

26:                                               ; preds = %23, %20
  %27 = phi x86_fp80 [ %22, %20 ], [ %25, %23 ]
  %28 = bitcast x86_fp80* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 10, i8* nonnull %28)
  store volatile x86_fp80 %27, x86_fp80* %2, align 16, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 10, i8* nonnull %28)
  br label %40

29:                                               ; preds = %16
  %30 = tail call x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32 0, metadata !"round.dynamic", metadata !"fpexcept.ignore") #5
  %31 = tail call x86_fp80 @__tanl(x86_fp80 noundef %0, x86_fp80 noundef %30, i32 noundef 0) #6
  br label %40

32:                                               ; preds = %12
  %33 = getelementptr inbounds [2 x x86_fp80], [2 x x86_fp80]* %3, i64 0, i64 0
  %34 = call i32 @__rem_pio2l(x86_fp80 noundef %0, x86_fp80* noundef nonnull %33) #6
  %35 = load x86_fp80, x86_fp80* %33, align 16, !tbaa !3
  %36 = getelementptr inbounds [2 x x86_fp80], [2 x x86_fp80]* %3, i64 0, i64 1
  %37 = load x86_fp80, x86_fp80* %36, align 16, !tbaa !3
  %38 = and i32 %34, 1
  %39 = call x86_fp80 @__tanl(x86_fp80 noundef %35, x86_fp80 noundef %37, i32 noundef %38) #6
  br label %40

40:                                               ; preds = %32, %29, %26, %10
  %41 = phi x86_fp80 [ %11, %10 ], [ %0, %26 ], [ %31, %29 ], [ %39, %32 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %4) #4
  ret x86_fp80 %41
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
declare hidden x86_fp80 @__tanl(x86_fp80 noundef, x86_fp80 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare x86_fp80 @llvm.experimental.constrained.sitofp.f80.i32(i32, metadata, metadata) #2

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
