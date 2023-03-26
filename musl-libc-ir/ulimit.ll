; ModuleID = 'src/legacy/ulimit.c'
source_filename = "src/legacy/ulimit.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.rlimit = type { i64, i64 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind optsize strictfp
define i64 @ulimit(i32 noundef %0, ...) local_unnamed_addr #0 {
  %2 = alloca %struct.rlimit, align 8
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = bitcast %struct.rlimit* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 16, i8* nonnull %4) #4
  %5 = call i32 @getrlimit(i32 noundef 1, %struct.rlimit* noundef nonnull %2) #5
  %6 = icmp eq i32 %0, 2
  br i1 %6, label %7, label %30

7:                                                ; preds = %1
  %8 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #4
  call void @llvm.va_start(i8* nonnull %8) #6
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 0
  %10 = load i32, i32* %9, align 16
  %11 = icmp ult i32 %10, 41
  br i1 %11, label %12, label %18

12:                                               ; preds = %7
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 3
  %14 = load i8*, i8** %13, align 16
  %15 = zext i32 %10 to i64
  %16 = getelementptr i8, i8* %14, i64 %15
  %17 = add nuw nsw i32 %10, 8
  store i32 %17, i32* %9, align 16
  br label %22

18:                                               ; preds = %7
  %19 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 2
  %20 = load i8*, i8** %19, align 8
  %21 = getelementptr i8, i8* %20, i64 8
  store i8* %21, i8** %19, align 8
  br label %22

22:                                               ; preds = %18, %12
  %23 = phi i8* [ %16, %12 ], [ %20, %18 ]
  %24 = bitcast i8* %23 to i64*
  %25 = load i64, i64* %24, align 8
  call void @llvm.va_end(i8* nonnull %8) #6
  %26 = shl i64 %25, 9
  %27 = getelementptr inbounds %struct.rlimit, %struct.rlimit* %2, i64 0, i32 0
  store i64 %26, i64* %27, align 8, !tbaa !3
  %28 = call i32 @setrlimit(i32 noundef 1, %struct.rlimit* noundef nonnull %2) #5
  %29 = icmp eq i32 %28, 0
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #4
  br i1 %29, label %30, label %34

30:                                               ; preds = %22, %1
  %31 = getelementptr inbounds %struct.rlimit, %struct.rlimit* %2, i64 0, i32 0
  %32 = load i64, i64* %31, align 8, !tbaa !3
  %33 = lshr i64 %32, 9
  br label %34

34:                                               ; preds = %22, %30
  %35 = phi i64 [ %33, %30 ], [ -1, %22 ]
  call void @llvm.lifetime.end.p0i8(i64 16, i8* nonnull %4) #4
  ret i64 %35
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @getrlimit(i32 noundef, %struct.rlimit* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #3

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #3

; Function Attrs: optsize
declare i32 @setrlimit(i32 noundef, %struct.rlimit* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind willreturn }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"rlimit", !5, i64 0, !5, i64 8}
!5 = !{!"long long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
