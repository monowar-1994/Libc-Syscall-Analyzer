; ModuleID = 'src/network/netlink.c'
source_filename = "src/network/netlink.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.nlmsghdr = type { i32, i16, i16, i32, i32 }
%union.anon = type { %struct.anon, [8172 x i8] }
%struct.anon = type { %struct.nlmsghdr, %struct.rtgenmsg }
%struct.rtgenmsg = type { i8 }

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__rtnetlink_enumerate(i32 noundef %0, i32 noundef %1, i32 (i8*, %struct.nlmsghdr*)* nocapture noundef readonly %2, i8* noundef %3) local_unnamed_addr #0 {
  %5 = tail call i32 @socket(i32 noundef 16, i32 noundef 524291, i32 noundef 0) #3
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %16, label %7

7:                                                ; preds = %4
  %8 = tail call fastcc i32 @__netlink_enumerate(i32 noundef %5, i32 noundef 1, i32 noundef 18, i32 noundef %0, i32 (i8*, %struct.nlmsghdr*)* noundef %2, i8* noundef %3) #4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

10:                                               ; preds = %7
  %11 = tail call fastcc i32 @__netlink_enumerate(i32 noundef %5, i32 noundef 2, i32 noundef 22, i32 noundef %1, i32 (i8*, %struct.nlmsghdr*)* noundef %2, i8* noundef %3) #4
  br label %12

12:                                               ; preds = %10, %7
  %13 = phi i32 [ %8, %7 ], [ %11, %10 ]
  %14 = zext i32 %5 to i64
  %15 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %14) #5, !srcloc !3
  br label %16

16:                                               ; preds = %4, %12
  %17 = phi i32 [ %13, %12 ], [ -1, %4 ]
  ret i32 %17
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @socket(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @__netlink_enumerate(i32 noundef %0, i32 noundef %1, i32 noundef %2, i32 noundef %3, i32 (i8*, %struct.nlmsghdr*)* nocapture noundef readonly %4, i8* noundef %5) unnamed_addr #0 {
  %7 = alloca %union.anon, align 4
  %8 = bitcast %union.anon* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8192, i8* nonnull %8) #5
  %9 = call i8* @memset(i8* noundef nonnull %8, i32 noundef 0, i64 noundef 20) #3
  %10 = getelementptr inbounds %union.anon, %union.anon* %7, i64 0, i32 0, i32 0, i32 0
  store i32 20, i32* %10, align 4, !tbaa !4
  %11 = trunc i32 %2 to i16
  %12 = getelementptr inbounds %union.anon, %union.anon* %7, i64 0, i32 0, i32 0, i32 1
  store i16 %11, i16* %12, align 4, !tbaa !4
  %13 = getelementptr inbounds %union.anon, %union.anon* %7, i64 0, i32 0, i32 0, i32 2
  store i16 769, i16* %13, align 2, !tbaa !4
  %14 = getelementptr inbounds %union.anon, %union.anon* %7, i64 0, i32 0, i32 0, i32 3
  store i32 %1, i32* %14, align 4, !tbaa !4
  %15 = trunc i32 %3 to i8
  %16 = getelementptr inbounds %union.anon, %union.anon* %7, i64 0, i32 0, i32 1, i32 0
  store i8 %15, i8* %16, align 4, !tbaa !4
  %17 = call i64 @send(i32 noundef %0, i8* noundef nonnull %8, i64 noundef 20, i32 noundef 0) #3
  %18 = trunc i64 %17 to i32
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %61, label %20

20:                                               ; preds = %6
  %21 = bitcast %union.anon* %7 to [8192 x i8]*
  %22 = call i64 @recv(i32 noundef %0, i8* noundef nonnull %8, i64 noundef 8192, i32 noundef 64) #3
  %23 = trunc i64 %22 to i32
  %24 = icmp slt i32 %23, 1
  br i1 %24, label %61, label %25

25:                                               ; preds = %20
  %26 = getelementptr inbounds %union.anon, %union.anon* %7, i64 0, i32 0, i32 0
  %27 = ptrtoint %union.anon* %7 to i64
  br label %32

28:                                               ; preds = %48, %32
  %29 = call i64 @recv(i32 noundef %0, i8* noundef nonnull %8, i64 noundef 8192, i32 noundef 64) #3
  %30 = trunc i64 %29 to i32
  %31 = icmp slt i32 %30, 1
  br i1 %31, label %61, label %32

32:                                               ; preds = %25, %28
  %33 = phi i64 [ %22, %25 ], [ %29, %28 ]
  %34 = shl i64 %33, 32
  %35 = ashr exact i64 %34, 32
  %36 = getelementptr inbounds [8192 x i8], [8192 x i8]* %21, i64 0, i64 %35
  %37 = ptrtoint i8* %36 to i64
  %38 = sub i64 %37, %27
  %39 = icmp ugt i64 %38, 15
  br i1 %39, label %40, label %28

40:                                               ; preds = %32, %48
  %41 = phi i8* [ %54, %48 ], [ %8, %32 ]
  %42 = phi %struct.nlmsghdr* [ %55, %48 ], [ %26, %32 ]
  %43 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %42, i64 0, i32 1
  %44 = load i16, i16* %43, align 4, !tbaa !7
  switch i16 %44, label %45 [
    i16 3, label %59
    i16 2, label %61
  ]

45:                                               ; preds = %40
  %46 = call i32 %4(i8* noundef %5, %struct.nlmsghdr* noundef nonnull %42) #3
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %59

48:                                               ; preds = %45
  %49 = getelementptr inbounds %struct.nlmsghdr, %struct.nlmsghdr* %42, i64 0, i32 0
  %50 = load i32, i32* %49, align 4, !tbaa !11
  %51 = add i32 %50, 3
  %52 = and i32 %51, -4
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8* %41, i64 %53
  %55 = bitcast i8* %54 to %struct.nlmsghdr*
  %56 = ptrtoint i8* %54 to i64
  %57 = sub i64 %37, %56
  %58 = icmp ugt i64 %57, 15
  br i1 %58, label %40, label %28

59:                                               ; preds = %40, %45
  %60 = phi i32 [ %46, %45 ], [ 0, %40 ]
  br label %61

61:                                               ; preds = %28, %40, %59, %20, %6
  %62 = phi i32 [ %18, %6 ], [ -1, %20 ], [ %60, %59 ], [ -1, %40 ], [ -1, %28 ]
  call void @llvm.lifetime.end.p0i8(i64 8192, i8* nonnull %8) #5
  ret i32 %62
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @send(i32 noundef, i8* noundef, i64 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @recv(i32 noundef, i8* noundef, i64 noundef, i32 noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 65378}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !10, i64 4}
!8 = !{!"nlmsghdr", !9, i64 0, !10, i64 4, !10, i64 6, !9, i64 8, !9, i64 12}
!9 = !{!"int", !5, i64 0}
!10 = !{!"short", !5, i64 0}
!11 = !{!8, !9, i64 0}
