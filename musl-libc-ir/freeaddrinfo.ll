; ModuleID = 'src/network/freeaddrinfo.c'
source_filename = "src/network/freeaddrinfo.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.addrinfo = type { i32, i32, i32, i32, i32, %struct.sockaddr*, i8*, %struct.addrinfo* }
%struct.sockaddr = type { i16, [14 x i8] }
%struct.aibuf = type { %struct.addrinfo, %union.sa, [1 x i32], i16, i16 }
%union.sa = type { %struct.sockaddr_in6 }
%struct.sockaddr_in6 = type { i16, i16, i32, %struct.in6_addr, i32 }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }

; Function Attrs: nounwind optsize strictfp
define void @freeaddrinfo(%struct.addrinfo* noundef %0) local_unnamed_addr #0 {
  br label %2

2:                                                ; preds = %2, %1
  %3 = phi %struct.addrinfo* [ %0, %1 ], [ %6, %2 ]
  %4 = phi i64 [ 1, %1 ], [ %8, %2 ]
  %5 = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %3, i64 0, i32 7
  %6 = load %struct.addrinfo*, %struct.addrinfo** %5, align 8, !tbaa !3
  %7 = icmp eq %struct.addrinfo* %6, null
  %8 = add i64 %4, 1
  br i1 %7, label %9, label %2

9:                                                ; preds = %2
  %10 = bitcast %struct.addrinfo* %3 to %struct.aibuf*
  %11 = getelementptr inbounds %struct.addrinfo, %struct.addrinfo* %3, i64 1, i32 6
  %12 = bitcast i8** %11 to i16*
  %13 = load i16, i16* %12, align 8, !tbaa !9
  %14 = sext i16 %13 to i64
  %15 = sub nsw i64 0, %14
  %16 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %10, i64 %15, i32 2, i64 0
  tail call void @__lock(i32* noundef nonnull %16) #2
  %17 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %10, i64 %15, i32 4
  %18 = load i16, i16* %17, align 2, !tbaa !12
  %19 = trunc i64 %4 to i16
  %20 = sub i16 %18, %19
  store i16 %20, i16* %17, align 2, !tbaa !12
  %21 = icmp eq i16 %20, 0
  br i1 %21, label %22, label %25

22:                                               ; preds = %9
  %23 = getelementptr inbounds %struct.aibuf, %struct.aibuf* %10, i64 %15
  %24 = bitcast %struct.aibuf* %23 to i8*
  tail call void @free(i8* noundef %24) #2
  br label %26

25:                                               ; preds = %9
  tail call void @__unlock(i32* noundef nonnull %16) #2
  br label %26

26:                                               ; preds = %25, %22
  ret void
}

; Function Attrs: optsize
declare hidden void @__lock(i32* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlock(i32* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 40}
!4 = !{!"addrinfo", !5, i64 0, !5, i64 4, !5, i64 8, !5, i64 12, !5, i64 16, !8, i64 24, !8, i64 32, !8, i64 40}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!10, !11, i64 80}
!10 = !{!"aibuf", !4, i64 0, !6, i64 48, !6, i64 76, !11, i64 80, !11, i64 82}
!11 = !{!"short", !6, i64 0}
!12 = !{!10, !11, i64 82}
