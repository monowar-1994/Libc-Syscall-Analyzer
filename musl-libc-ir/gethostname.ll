; ModuleID = 'src/unistd/gethostname.c'
source_filename = "src/unistd/gethostname.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.utsname = type { [65 x i8], [65 x i8], [65 x i8], [65 x i8], [65 x i8], [65 x i8] }

; Function Attrs: nounwind optsize strictfp
define i32 @gethostname(i8* nocapture noundef writeonly %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = alloca %struct.utsname, align 1
  %4 = getelementptr inbounds %struct.utsname, %struct.utsname* %3, i64 0, i32 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 390, i8* nonnull %4) #3
  %5 = call i32 @uname(%struct.utsname* noundef nonnull %3) #4
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %7, label %28

7:                                                ; preds = %2
  %8 = icmp ult i64 %1, 65
  %9 = select i1 %8, i64 %1, i64 65
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %28, label %11

11:                                               ; preds = %7, %17
  %12 = phi i64 [ %18, %17 ], [ 0, %7 ]
  %13 = getelementptr inbounds %struct.utsname, %struct.utsname* %3, i64 0, i32 1, i64 %12
  %14 = load i8, i8* %13, align 1, !tbaa !3
  %15 = getelementptr inbounds i8, i8* %0, i64 %12
  store i8 %14, i8* %15, align 1, !tbaa !3
  %16 = icmp eq i8 %14, 0
  br i1 %16, label %20, label %17

17:                                               ; preds = %11
  %18 = add nuw nsw i64 %12, 1
  %19 = icmp eq i64 %18, %9
  br i1 %19, label %20, label %11

20:                                               ; preds = %11, %17
  %21 = phi i64 [ %12, %11 ], [ %9, %17 ]
  %22 = icmp ne i64 %21, 0
  %23 = icmp eq i64 %21, %9
  %24 = and i1 %22, %23
  br i1 %24, label %25, label %28

25:                                               ; preds = %20
  %26 = add nsw i64 %9, -1
  %27 = getelementptr inbounds i8, i8* %0, i64 %26
  store i8 0, i8* %27, align 1, !tbaa !3
  br label %28

28:                                               ; preds = %7, %20, %25, %2
  %29 = phi i32 [ -1, %2 ], [ 0, %25 ], [ 0, %20 ], [ 0, %7 ]
  call void @llvm.lifetime.end.p0i8(i64 390, i8* nonnull %4) #3
  ret i32 %29
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @uname(%struct.utsname* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
