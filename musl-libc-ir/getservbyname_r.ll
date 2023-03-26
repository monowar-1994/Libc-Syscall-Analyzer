; ModuleID = 'src/network/getservbyname_r.c'
source_filename = "src/network/getservbyname_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.servent = type { i8*, i8**, i32, i8* }
%struct.service = type { i16, i8, i8 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"tcp\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"udp\00", align 1

; Function Attrs: nounwind optsize strictfp
define i32 @getservbyname_r(i8* noundef %0, i8* noundef %1, %struct.servent* noundef %2, i8* noundef %3, i64 noundef %4, %struct.servent** nocapture noundef writeonly %5) local_unnamed_addr #0 {
  %7 = alloca [2 x %struct.service], align 2
  %8 = alloca i8*, align 8
  %9 = bitcast [2 x %struct.service]* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %9) #3
  store %struct.servent* null, %struct.servent** %5, align 8, !tbaa !3
  %10 = bitcast i8** %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %10) #3
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i64 0, i64 0), i8** %8, align 8, !tbaa !3
  %11 = call i64 @strtoul(i8* noundef %0, i8** noundef nonnull %8, i32 noundef 10) #4
  %12 = load i8*, i8** %8, align 8, !tbaa !3
  %13 = load i8, i8* %12, align 1, !tbaa !7
  %14 = icmp eq i8 %13, 0
  br i1 %14, label %56, label %15

15:                                               ; preds = %6
  %16 = ptrtoint i8* %3 to i64
  %17 = sub i64 0, %16
  %18 = and i64 %17, 7
  %19 = or i64 %18, 16
  %20 = icmp ugt i64 %19, %4
  br i1 %20, label %56, label %21

21:                                               ; preds = %15
  %22 = getelementptr inbounds i8, i8* %3, i64 %18
  %23 = icmp eq i8* %1, null
  br i1 %23, label %30, label %24

24:                                               ; preds = %21
  %25 = call i32 @strcmp(i8* noundef nonnull %1, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)) #4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %30, label %27

27:                                               ; preds = %24
  %28 = call i32 @strcmp(i8* noundef nonnull %1, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0)) #4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %56

30:                                               ; preds = %27, %24, %21
  %31 = phi i32 [ 0, %21 ], [ 6, %24 ], [ 17, %27 ]
  %32 = getelementptr inbounds [2 x %struct.service], [2 x %struct.service]* %7, i64 0, i64 0
  %33 = call i32 @__lookup_serv(%struct.service* noundef nonnull %32, i8* noundef %0, i32 noundef %31, i32 noundef 0, i32 noundef 0) #4
  %34 = icmp slt i32 %33, 0
  br i1 %34, label %35, label %39

35:                                               ; preds = %30
  %36 = add nsw i32 %33, 11
  %37 = icmp ult i32 %36, 2
  %38 = select i1 %37, i32 12, i32 2
  br label %56

39:                                               ; preds = %30
  %40 = getelementptr inbounds %struct.servent, %struct.servent* %2, i64 0, i32 0
  store i8* %0, i8** %40, align 8, !tbaa !8
  %41 = bitcast i8* %22 to i8**
  %42 = getelementptr inbounds %struct.servent, %struct.servent* %2, i64 0, i32 1
  %43 = bitcast i8*** %42 to i8**
  store i8* %22, i8** %43, align 8, !tbaa !11
  store i8* %0, i8** %41, align 8, !tbaa !3
  %44 = load i8**, i8*** %42, align 8, !tbaa !11
  %45 = getelementptr inbounds i8*, i8** %44, i64 1
  store i8* null, i8** %45, align 8, !tbaa !3
  %46 = getelementptr inbounds [2 x %struct.service], [2 x %struct.service]* %7, i64 0, i64 0, i32 0
  %47 = load i16, i16* %46, align 2, !tbaa !12
  %48 = call zeroext i16 @htons(i16 noundef zeroext %47) #4
  %49 = zext i16 %48 to i32
  %50 = getelementptr inbounds %struct.servent, %struct.servent* %2, i64 0, i32 2
  store i32 %49, i32* %50, align 8, !tbaa !15
  %51 = getelementptr inbounds [2 x %struct.service], [2 x %struct.service]* %7, i64 0, i64 0, i32 1
  %52 = load i8, i8* %51, align 2, !tbaa !16
  %53 = icmp eq i8 %52, 6
  %54 = select i1 %53, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0)
  %55 = getelementptr inbounds %struct.servent, %struct.servent* %2, i64 0, i32 3
  store i8* %54, i8** %55, align 8, !tbaa !17
  store %struct.servent* %2, %struct.servent** %5, align 8, !tbaa !3
  br label %56

56:                                               ; preds = %35, %27, %15, %6, %39
  %57 = phi i32 [ 0, %39 ], [ 2, %6 ], [ 34, %15 ], [ 22, %27 ], [ %38, %35 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %10) #3
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %9) #3
  ret i32 %57
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i64 @strtoul(i8* noundef, i8** noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__lookup_serv(%struct.service* noundef, i8* noundef, i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare zeroext i16 @htons(i16 noundef zeroext) local_unnamed_addr #2

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
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!5, !5, i64 0}
!8 = !{!9, !4, i64 0}
!9 = !{!"servent", !4, i64 0, !4, i64 8, !10, i64 16, !4, i64 24}
!10 = !{!"int", !5, i64 0}
!11 = !{!9, !4, i64 8}
!12 = !{!13, !14, i64 0}
!13 = !{!"service", !14, i64 0, !5, i64 2, !5, i64 3}
!14 = !{!"short", !5, i64 0}
!15 = !{!9, !10, i64 16}
!16 = !{!13, !5, i64 2}
!17 = !{!9, !4, i64 24}
