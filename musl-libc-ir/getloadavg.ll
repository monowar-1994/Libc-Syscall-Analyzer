; ModuleID = 'src/legacy/getloadavg.c'
source_filename = "src/legacy/getloadavg.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sysinfo = type { i64, [3 x i64], i64, i64, i64, i64, i64, i64, i16, i16, i64, i64, i32, [256 x i8] }

; Function Attrs: nounwind optsize strictfp
define i32 @getloadavg(double* nocapture noundef writeonly %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.sysinfo, align 8
  %4 = bitcast %struct.sysinfo* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 368, i8* nonnull %4) #4
  %5 = icmp slt i32 %1, 1
  br i1 %5, label %6, label %9

6:                                                ; preds = %2
  %7 = icmp ne i32 %1, 0
  %8 = sext i1 %7 to i32
  br label %25

9:                                                ; preds = %2
  %10 = call i32 @sysinfo(%struct.sysinfo* noundef nonnull %3) #5
  %11 = icmp ult i32 %1, 3
  %12 = select i1 %11, i32 %1, i32 3
  %13 = zext i32 %12 to i64
  br label %14

14:                                               ; preds = %9, %14
  %15 = phi i64 [ 0, %9 ], [ %23, %14 ]
  %16 = call double @llvm.experimental.constrained.sitofp.f64.i32(i32 65536, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %17 = call double @llvm.experimental.constrained.fdiv.f64(double 1.000000e+00, double %16, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %18 = getelementptr inbounds %struct.sysinfo, %struct.sysinfo* %3, i64 0, i32 1, i64 %15
  %19 = load i64, i64* %18, align 8, !tbaa !3
  %20 = call double @llvm.experimental.constrained.uitofp.f64.i64(i64 %19, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %21 = call double @llvm.experimental.constrained.fmul.f64(double %17, double %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #6
  %22 = getelementptr inbounds double, double* %0, i64 %15
  store double %21, double* %22, align 8, !tbaa !7
  %23 = add nuw nsw i64 %15, 1
  %24 = icmp eq i64 %23, %13
  br i1 %24, label %25, label %14

25:                                               ; preds = %14, %6
  %26 = phi i32 [ %8, %6 ], [ %12, %14 ]
  call void @llvm.lifetime.end.p0i8(i64 368, i8* nonnull %4) #4
  ret i32 %26
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @sysinfo(%struct.sysinfo* noundef) local_unnamed_addr #2

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.uitofp.f64.i64(i64, metadata, metadata) #3

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !5, i64 0}
