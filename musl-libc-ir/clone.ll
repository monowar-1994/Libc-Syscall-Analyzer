; ModuleID = 'src/linux/clone.c'
source_filename = "src/linux/clone.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind optsize strictfp
define i32 @clone(i32 (i8*)* noundef %0, i8* noundef %1, i32 noundef %2, i8* noundef %3, ...) local_unnamed_addr #0 {
  %5 = alloca [1 x %struct.__va_list_tag], align 16
  %6 = bitcast [1 x %struct.__va_list_tag]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %6) #4
  call void @llvm.va_start(i8* nonnull %6) #5
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0, i32 0
  %8 = load i32, i32* %7, align 16
  %9 = icmp ult i32 %8, 41
  br i1 %9, label %16, label %10

10:                                               ; preds = %4
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0, i32 2
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr i8, i8* %12, i64 8
  store i8* %13, i8** %11, align 8
  %14 = bitcast i8* %12 to i32**
  %15 = load i32*, i32** %14, align 8
  br label %25

16:                                               ; preds = %4
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0, i32 3
  %18 = load i8*, i8** %17, align 16
  %19 = zext i32 %8 to i64
  %20 = getelementptr i8, i8* %18, i64 %19
  %21 = add nuw nsw i32 %8, 8
  store i32 %21, i32* %7, align 16
  %22 = bitcast i8* %20 to i32**
  %23 = load i32*, i32** %22, align 8
  %24 = icmp ult i32 %8, 33
  br i1 %24, label %32, label %25

25:                                               ; preds = %16, %10
  %26 = phi i32* [ %15, %10 ], [ %23, %16 ]
  %27 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0, i32 2
  %28 = load i8*, i8** %27, align 8
  %29 = getelementptr i8, i8* %28, i64 8
  store i8* %29, i8** %27, align 8
  %30 = bitcast i8* %28 to i8**
  %31 = load i8*, i8** %30, align 8
  br label %47

32:                                               ; preds = %16
  %33 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0, i32 3
  %34 = load i8*, i8** %33, align 16
  %35 = zext i32 %21 to i64
  %36 = getelementptr i8, i8* %34, i64 %35
  %37 = add nuw nsw i32 %8, 16
  store i32 %37, i32* %7, align 16
  %38 = bitcast i8* %36 to i8**
  %39 = load i8*, i8** %38, align 8
  %40 = icmp ult i32 %8, 25
  br i1 %40, label %41, label %47

41:                                               ; preds = %32
  %42 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0, i32 3
  %43 = load i8*, i8** %42, align 16
  %44 = zext i32 %37 to i64
  %45 = getelementptr i8, i8* %43, i64 %44
  %46 = add nuw nsw i32 %8, 24
  store i32 %46, i32* %7, align 16
  br label %53

47:                                               ; preds = %25, %32
  %48 = phi i8* [ %31, %25 ], [ %39, %32 ]
  %49 = phi i32* [ %26, %25 ], [ %23, %32 ]
  %50 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i64 0, i64 0, i32 2
  %51 = load i8*, i8** %50, align 8
  %52 = getelementptr i8, i8* %51, i64 8
  store i8* %52, i8** %50, align 8
  br label %53

53:                                               ; preds = %47, %41
  %54 = phi i8* [ %39, %41 ], [ %48, %47 ]
  %55 = phi i32* [ %23, %41 ], [ %49, %47 ]
  %56 = phi i8* [ %45, %41 ], [ %51, %47 ]
  %57 = bitcast i8* %56 to i32**
  %58 = load i32*, i32** %57, align 8
  call void @llvm.va_end(i8* nonnull %6) #5
  %59 = call i32 (i32 (i8*)*, i8*, i32, i8*, ...) @__clone(i32 (i8*)* noundef %0, i8* noundef %1, i32 noundef %2, i8* noundef %3, i32* noundef %55, i8* noundef %54, i32* noundef %58) #6
  %60 = sext i32 %59 to i64
  %61 = call i64 @__syscall_ret(i64 noundef %60) #6
  %62 = trunc i64 %61 to i32
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %6) #4
  ret i32 %62
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #2

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i32 @__clone(i32 (i8*)* noundef, i8* noundef, i32 noundef, i8* noundef, ...) local_unnamed_addr #3

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
