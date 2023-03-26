; ModuleID = 'src/legacy/cuserid.c'
source_filename = "src/legacy/cuserid.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.passwd = type { i8*, i8*, i32, i32, i8*, i8*, i8* }

@cuserid.usridbuf = internal global [20 x i8] zeroinitializer, align 16

; Function Attrs: nounwind optsize strictfp
define i8* @cuserid(i8* noundef %0) local_unnamed_addr #0 {
  %2 = alloca %struct.passwd, align 8
  %3 = alloca %struct.passwd*, align 8
  %4 = alloca [256 x i64], align 16
  %5 = bitcast %struct.passwd* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 48, i8* nonnull %5) #3
  %6 = bitcast %struct.passwd** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #3
  %7 = bitcast [256 x i64]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 2048, i8* nonnull %7) #3
  %8 = icmp eq i8* %0, null
  br i1 %8, label %10, label %9

9:                                                ; preds = %1
  store i8 0, i8* %0, align 1, !tbaa !3
  br label %10

10:                                               ; preds = %9, %1
  %11 = tail call i32 @geteuid() #4
  %12 = call i32 @getpwuid_r(i32 noundef %11, %struct.passwd* noundef nonnull %2, i8* noundef nonnull %7, i64 noundef 2048, %struct.passwd** noundef nonnull %3) #4
  %13 = load %struct.passwd*, %struct.passwd** %3, align 8, !tbaa !6
  %14 = icmp eq %struct.passwd* %13, null
  br i1 %14, label %25, label %15

15:                                               ; preds = %10
  %16 = getelementptr inbounds %struct.passwd, %struct.passwd* %2, i64 0, i32 0
  %17 = load i8*, i8** %16, align 8, !tbaa !8
  %18 = call i64 @strnlen(i8* noundef %17, i64 noundef 20) #4
  %19 = icmp eq i64 %18, 20
  br i1 %19, label %25, label %20

20:                                               ; preds = %15
  %21 = select i1 %8, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @cuserid.usridbuf, i64 0, i64 0), i8* %0
  %22 = load i8*, i8** %16, align 8, !tbaa !8
  %23 = add i64 %18, 1
  %24 = call i8* @memcpy(i8* noundef %21, i8* noundef %22, i64 noundef %23) #4
  br label %25

25:                                               ; preds = %20, %15, %10
  %26 = phi i8* [ %0, %10 ], [ %21, %20 ], [ %0, %15 ]
  call void @llvm.lifetime.end.p0i8(i64 2048, i8* nonnull %7) #3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %6) #3
  call void @llvm.lifetime.end.p0i8(i64 48, i8* nonnull %5) #3
  ret i8* %26
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @getpwuid_r(i32 noundef, %struct.passwd* noundef, i8* noundef, i64 noundef, %struct.passwd** noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @geteuid() local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strnlen(i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

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
!6 = !{!7, !7, i64 0}
!7 = !{!"any pointer", !4, i64 0}
!8 = !{!9, !7, i64 0}
!9 = !{!"passwd", !7, i64 0, !7, i64 8, !10, i64 16, !10, i64 20, !7, i64 24, !7, i64 32, !7, i64 40}
!10 = !{!"int", !4, i64 0}
