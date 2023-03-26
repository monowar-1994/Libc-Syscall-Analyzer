; ModuleID = 'src/network/getservbyport_r.c'
source_filename = "src/network/getservbyport_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.servent = type { i8*, i8**, i32, i8* }
%struct.sockaddr_in = type { i16, i16, %struct.in_addr, [8 x i8] }
%struct.in_addr = type { i32 }
%struct.sockaddr = type { i16, [14 x i8] }

@.str = private unnamed_addr constant [4 x i8] c"tcp\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"udp\00", align 1

; Function Attrs: nounwind optsize strictfp
define i32 @getservbyport_r(i32 noundef %0, i8* noundef %1, %struct.servent* noundef %2, i8* noundef %3, i64 noundef %4, %struct.servent** noundef %5) local_unnamed_addr #0 {
  %7 = alloca %struct.sockaddr_in, align 4
  %8 = bitcast %struct.sockaddr_in* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %8) #3
  %9 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %7, i64 0, i32 0
  store i16 2, i16* %9, align 4, !tbaa !3
  %10 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %7, i64 0, i32 1
  %11 = trunc i32 %0 to i16
  store i16 %11, i16* %10, align 2, !tbaa !10
  %12 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %7, i64 0, i32 2, i32 0
  store i32 0, i32* %12, align 4
  %13 = getelementptr inbounds %struct.sockaddr_in, %struct.sockaddr_in* %7, i64 0, i32 3, i64 0
  %14 = bitcast i8* %13 to i64*
  store i64 0, i64* %14, align 4
  %15 = icmp eq i8* %1, null
  br i1 %15, label %16, label %21

16:                                               ; preds = %6
  %17 = tail call i32 @getservbyport_r(i32 noundef %0, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), %struct.servent* noundef %2, i8* noundef %3, i64 noundef %4, %struct.servent** noundef %5) #4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %63, label %19

19:                                               ; preds = %16
  %20 = tail call i32 @getservbyport_r(i32 noundef %0, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0), %struct.servent* noundef %2, i8* noundef %3, i64 noundef %4, %struct.servent** noundef %5) #4
  br label %63

21:                                               ; preds = %6
  store %struct.servent* null, %struct.servent** %5, align 8, !tbaa !11
  %22 = ptrtoint i8* %3 to i64
  %23 = trunc i64 %22 to i32
  %24 = and i32 %23, 7
  %25 = icmp eq i32 %24, 0
  %26 = select i1 %25, i32 8, i32 %24
  %27 = zext i32 %26 to i64
  %28 = sub nuw nsw i64 24, %27
  %29 = icmp ugt i64 %28, %4
  br i1 %29, label %63, label %30

30:                                               ; preds = %21
  %31 = sub nuw nsw i64 8, %27
  %32 = getelementptr inbounds i8, i8* %3, i64 %31
  %33 = sub i64 %4, %31
  %34 = tail call i32 @strcmp(i8* noundef nonnull %1, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0)) #5
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %39, label %36

36:                                               ; preds = %30
  %37 = tail call i32 @strcmp(i8* noundef nonnull %1, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)) #5
  %38 = icmp eq i32 %37, 0
  br i1 %38, label %39, label %63

39:                                               ; preds = %36, %30
  %40 = getelementptr inbounds %struct.servent, %struct.servent* %2, i64 0, i32 2
  store i32 %0, i32* %40, align 8, !tbaa !13
  %41 = getelementptr inbounds %struct.servent, %struct.servent* %2, i64 0, i32 3
  store i8* %1, i8** %41, align 8, !tbaa !15
  %42 = getelementptr inbounds %struct.servent, %struct.servent* %2, i64 0, i32 1
  %43 = bitcast i8*** %42 to i8**
  store i8* %32, i8** %43, align 8, !tbaa !16
  %44 = getelementptr inbounds i8, i8* %32, i64 16
  %45 = getelementptr inbounds i8, i8* %32, i64 8
  %46 = bitcast i8* %45 to i8**
  store i8* null, i8** %46, align 8, !tbaa !11
  %47 = getelementptr inbounds %struct.servent, %struct.servent* %2, i64 0, i32 0
  store i8* %44, i8** %47, align 8, !tbaa !17
  %48 = load i8**, i8*** %42, align 8, !tbaa !16
  store i8* %44, i8** %48, align 8, !tbaa !11
  %49 = bitcast %struct.sockaddr_in* %7 to %struct.sockaddr*
  %50 = trunc i64 %33 to i32
  %51 = add i32 %50, -16
  %52 = tail call i32 @strcmp(i8* noundef nonnull %1, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i64 0, i64 0)) #5
  %53 = icmp eq i32 %52, 0
  %54 = select i1 %53, i32 16, i32 0
  %55 = call i32 @getnameinfo(%struct.sockaddr* noundef nonnull %49, i32 noundef 16, i8* noundef null, i32 noundef 0, i8* noundef nonnull %44, i32 noundef %51, i32 noundef %54) #5
  switch i32 %55, label %56 [
    i32 -10, label %63
    i32 -11, label %63
    i32 0, label %57
  ]

56:                                               ; preds = %39
  br label %63

57:                                               ; preds = %39
  %58 = call i64 @strtol(i8* noundef nonnull %44, i8** noundef null, i32 noundef 10) #5
  %59 = call zeroext i16 @ntohs(i16 noundef zeroext %11) #5
  %60 = zext i16 %59 to i64
  %61 = icmp eq i64 %58, %60
  br i1 %61, label %63, label %62

62:                                               ; preds = %57
  store %struct.servent* %2, %struct.servent** %5, align 8, !tbaa !11
  br label %63

63:                                               ; preds = %57, %39, %39, %36, %21, %16, %19, %62, %56
  %64 = phi i32 [ 2, %56 ], [ 0, %62 ], [ %20, %19 ], [ 0, %16 ], [ 34, %21 ], [ 22, %36 ], [ 12, %39 ], [ 12, %39 ], [ 2, %57 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %8) #3
  ret i32 %64
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @getnameinfo(%struct.sockaddr* noundef, i32 noundef, i8* noundef, i32 noundef, i8* noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @strtol(i8* noundef, i8** noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare zeroext i16 @ntohs(i16 noundef zeroext) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"sockaddr_in", !5, i64 0, !5, i64 2, !8, i64 4, !6, i64 8}
!5 = !{!"short", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"in_addr", !9, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{!4, !5, i64 2}
!11 = !{!12, !12, i64 0}
!12 = !{!"any pointer", !6, i64 0}
!13 = !{!14, !9, i64 16}
!14 = !{!"servent", !12, i64 0, !12, i64 8, !9, i64 16, !12, i64 24}
!15 = !{!14, !12, i64 24}
!16 = !{!14, !12, i64 8}
!17 = !{!14, !12, i64 0}
