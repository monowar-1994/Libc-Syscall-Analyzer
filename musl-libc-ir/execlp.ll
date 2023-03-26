; ModuleID = 'src/process/execlp.c'
source_filename = "src/process/execlp.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind optsize strictfp
define i32 @execlp(i8* noundef %0, i8* noundef %1, ...) local_unnamed_addr #0 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %4) #4
  call void @llvm.va_start(i8* nonnull %4) #5
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 0
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 2
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 3
  %8 = load i8*, i8** %7, align 16
  %9 = load i32, i32* %5, align 16
  br label %10

10:                                               ; preds = %21, %2
  %11 = phi i32 [ %9, %2 ], [ %22, %21 ]
  %12 = phi i32 [ 1, %2 ], [ %27, %21 ]
  %13 = icmp ult i32 %11, 41
  br i1 %13, label %14, label %18

14:                                               ; preds = %10
  %15 = zext i32 %11 to i64
  %16 = getelementptr i8, i8* %8, i64 %15
  %17 = add nuw nsw i32 %11, 8
  store i32 %17, i32* %5, align 16
  br label %21

18:                                               ; preds = %10
  %19 = load i8*, i8** %6, align 8
  %20 = getelementptr i8, i8* %19, i64 8
  store i8* %20, i8** %6, align 8
  br label %21

21:                                               ; preds = %18, %14
  %22 = phi i32 [ %17, %14 ], [ %11, %18 ]
  %23 = phi i8* [ %16, %14 ], [ %19, %18 ]
  %24 = bitcast i8* %23 to i8**
  %25 = load i8*, i8** %24, align 8
  %26 = icmp eq i8* %25, null
  %27 = add nuw nsw i32 %12, 1
  br i1 %26, label %28, label %10

28:                                               ; preds = %21
  call void @llvm.va_end(i8* nonnull %4) #5
  %29 = zext i32 %27 to i64
  %30 = call i8* @llvm.stacksave() #5
  %31 = alloca i8*, i64 %29, align 16
  call void @llvm.va_start(i8* nonnull %4) #5
  store i8* %1, i8** %31, align 16, !tbaa !3
  %32 = icmp ugt i32 %12, 1
  br i1 %32, label %33, label %56

33:                                               ; preds = %28
  %34 = load i8*, i8** %7, align 16
  %35 = zext i32 %12 to i64
  %36 = load i32, i32* %5, align 16
  br label %37

37:                                               ; preds = %33, %48
  %38 = phi i32 [ %36, %33 ], [ %49, %48 ]
  %39 = phi i64 [ 1, %33 ], [ %54, %48 ]
  %40 = icmp ult i32 %38, 41
  br i1 %40, label %41, label %45

41:                                               ; preds = %37
  %42 = zext i32 %38 to i64
  %43 = getelementptr i8, i8* %34, i64 %42
  %44 = add nuw nsw i32 %38, 8
  store i32 %44, i32* %5, align 16
  br label %48

45:                                               ; preds = %37
  %46 = load i8*, i8** %6, align 8
  %47 = getelementptr i8, i8* %46, i64 8
  store i8* %47, i8** %6, align 8
  br label %48

48:                                               ; preds = %45, %41
  %49 = phi i32 [ %44, %41 ], [ %38, %45 ]
  %50 = phi i8* [ %43, %41 ], [ %46, %45 ]
  %51 = bitcast i8* %50 to i8**
  %52 = load i8*, i8** %51, align 8
  %53 = getelementptr inbounds i8*, i8** %31, i64 %39
  store i8* %52, i8** %53, align 8, !tbaa !3
  %54 = add nuw nsw i64 %39, 1
  %55 = icmp eq i64 %54, %35
  br i1 %55, label %56, label %37

56:                                               ; preds = %48, %28
  %57 = zext i32 %12 to i64
  %58 = getelementptr inbounds i8*, i8** %31, i64 %57
  store i8* null, i8** %58, align 8, !tbaa !3
  call void @llvm.va_end(i8* nonnull %4) #5
  %59 = call i32 @execvp(i8* noundef %0, i8** noundef nonnull %31) #6
  call void @llvm.stackrestore(i8* %30) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %4) #4
  ret i32 %59
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare i8* @llvm.stacksave() #2

; Function Attrs: optsize
declare i32 @execvp(i8* noundef, i8** noundef) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.stackrestore(i8*) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind willreturn }
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
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
