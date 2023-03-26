; ModuleID = 'src/network/ether.c'
source_filename = "src/network/ether.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ether_addr = type { [6 x i8] }

@ether_aton.a = internal global %struct.ether_addr zeroinitializer, align 1
@.str = private unnamed_addr constant [5 x i8] c"%.2X\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c":%.2X\00", align 1
@ether_ntoa.x = internal global [18 x i8] zeroinitializer, align 16

; Function Attrs: nounwind optsize strictfp
define %struct.ether_addr* @ether_aton_r(i8* noundef %0, %struct.ether_addr* noundef writeonly %1) local_unnamed_addr #0 {
  %3 = alloca %struct.ether_addr, align 1
  %4 = alloca i8*, align 8
  %5 = getelementptr inbounds %struct.ether_addr, %struct.ether_addr* %3, i64 0, i32 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 6, i8* nonnull %5) #5
  %6 = bitcast i8** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %6) #5
  br label %7

7:                                                ; preds = %2, %20
  %8 = phi i64 [ 0, %2 ], [ %24, %20 ]
  %9 = phi i8* [ %0, %2 ], [ %21, %20 ]
  %10 = icmp eq i64 %8, 0
  br i1 %10, label %16, label %11

11:                                               ; preds = %7
  %12 = load i8, i8* %9, align 1, !tbaa !3
  %13 = icmp eq i8 %12, 58
  br i1 %13, label %14, label %31

14:                                               ; preds = %11
  %15 = getelementptr inbounds i8, i8* %9, i64 1
  br label %16

16:                                               ; preds = %14, %7
  %17 = phi i8* [ %15, %14 ], [ %9, %7 ]
  %18 = call i64 @strtoul(i8* noundef %17, i8** noundef nonnull %4, i32 noundef 16) #6
  %19 = icmp ugt i64 %18, 255
  br i1 %19, label %31, label %20

20:                                               ; preds = %16
  %21 = load i8*, i8** %4, align 8, !tbaa !6
  %22 = trunc i64 %18 to i8
  %23 = getelementptr inbounds %struct.ether_addr, %struct.ether_addr* %3, i64 0, i32 0, i64 %8
  store i8 %22, i8* %23, align 1, !tbaa !3
  %24 = add nuw nsw i64 %8, 1
  %25 = icmp eq i64 %24, 6
  br i1 %25, label %26, label %7

26:                                               ; preds = %20
  %27 = load i8, i8* %21, align 1, !tbaa !3
  %28 = icmp eq i8 %27, 0
  br i1 %28, label %29, label %31

29:                                               ; preds = %26
  %30 = getelementptr %struct.ether_addr, %struct.ether_addr* %1, i64 0, i32 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(6) %30, i8* noundef nonnull align 1 dereferenceable(6) %5, i64 6, i1 false) #7, !tbaa.struct !8
  br label %31

31:                                               ; preds = %11, %16, %26, %29
  %32 = phi %struct.ether_addr* [ %1, %29 ], [ null, %26 ], [ null, %16 ], [ null, %11 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %6) #5
  call void @llvm.lifetime.end.p0i8(i64 6, i8* nonnull %5) #5
  ret %struct.ether_addr* %32
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strtoul(i8* noundef, i8** noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: nounwind optsize strictfp
define %struct.ether_addr* @ether_aton(i8* noundef %0) local_unnamed_addr #0 {
  %2 = tail call %struct.ether_addr* @ether_aton_r(i8* noundef %0, %struct.ether_addr* noundef nonnull @ether_aton.a) #8
  ret %struct.ether_addr* %2
}

; Function Attrs: nounwind optsize strictfp
define i8* @ether_ntoa_r(%struct.ether_addr* nocapture noundef readonly %0, i8* noundef returned %1) local_unnamed_addr #0 {
  br label %4

3:                                                ; preds = %4
  ret i8* %1

4:                                                ; preds = %2, %4
  %5 = phi i64 [ 0, %2 ], [ %15, %4 ]
  %6 = phi i8* [ %1, %2 ], [ %14, %4 ]
  %7 = icmp eq i64 %5, 0
  %8 = select i1 %7, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0)
  %9 = getelementptr inbounds %struct.ether_addr, %struct.ether_addr* %0, i64 0, i32 0, i64 %5
  %10 = load i8, i8* %9, align 1, !tbaa !3
  %11 = zext i8 %10 to i32
  %12 = tail call i32 (i8*, i8*, ...) @sprintf(i8* noundef %6, i8* noundef %8, i32 noundef %11) #6
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i8, i8* %6, i64 %13
  %15 = add nuw nsw i64 %5, 1
  %16 = icmp eq i64 %15, 6
  br i1 %16, label %3, label %4
}

; Function Attrs: optsize
declare i32 @sprintf(i8* noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define i8* @ether_ntoa(%struct.ether_addr* nocapture noundef readonly %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %2, %1
  %3 = phi i64 [ 0, %1 ], [ %13, %2 ]
  %4 = phi i8* [ getelementptr inbounds ([18 x i8], [18 x i8]* @ether_ntoa.x, i64 0, i64 0), %1 ], [ %12, %2 ]
  %5 = icmp eq i64 %3, 0
  %6 = select i1 %5, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0)
  %7 = getelementptr inbounds %struct.ether_addr, %struct.ether_addr* %0, i64 0, i32 0, i64 %3
  %8 = load i8, i8* %7, align 1, !tbaa !3
  %9 = zext i8 %8 to i32
  %10 = tail call i32 (i8*, i8*, ...) @sprintf(i8* noundef %4, i8* noundef %6, i32 noundef %9) #6
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i8, i8* %4, i64 %11
  %13 = add nuw nsw i64 %3, 1
  %14 = icmp eq i64 %13, 6
  br i1 %14, label %15, label %2

15:                                               ; preds = %2
  ret i8* getelementptr inbounds ([18 x i8], [18 x i8]* @ether_ntoa.x, i64 0, i64 0)
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @ether_line(i8* nocapture noundef readnone %0, %struct.ether_addr* nocapture noundef readnone %1, i8* nocapture noundef readnone %2) local_unnamed_addr #4 {
  ret i32 -1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @ether_ntohost(i8* nocapture noundef readnone %0, %struct.ether_addr* nocapture noundef readnone %1) local_unnamed_addr #4 {
  ret i32 -1
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @ether_hostton(i8* nocapture noundef readnone %0, %struct.ether_addr* nocapture noundef readnone %1) local_unnamed_addr #4 {
  ret i32 -1
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly mustprogress nofree nounwind willreturn }
attributes #4 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { strictfp }
attributes #8 = { nobuiltin optsize strictfp "no-builtins" }

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
!8 = !{i64 0, i64 6, !3}
