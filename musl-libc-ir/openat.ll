; ModuleID = 'src/fcntl/openat.c'
source_filename = "src/fcntl/openat.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@openat64 = weak alias i32 (i32, i8*, i32, ...), i32 (i32, i8*, i32, ...)* @openat

; Function Attrs: nounwind optsize strictfp
define i32 @openat(i32 noundef %0, i8* noundef %1, i32 noundef %2, ...) #0 {
  %4 = alloca [1 x %struct.__va_list_tag], align 16
  %5 = and i32 %2, 64
  %6 = icmp ne i32 %5, 0
  %7 = and i32 %2, 4259840
  %8 = icmp eq i32 %7, 4259840
  %9 = or i1 %6, %8
  br i1 %9, label %10, label %30

10:                                               ; preds = %3
  %11 = bitcast [1 x %struct.__va_list_tag]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %11) #4
  call void @llvm.va_start(i8* nonnull %11) #5
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %4, i64 0, i64 0, i32 0
  %13 = load i32, i32* %12, align 16
  %14 = icmp ult i32 %13, 41
  br i1 %14, label %15, label %21

15:                                               ; preds = %10
  %16 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %4, i64 0, i64 0, i32 3
  %17 = load i8*, i8** %16, align 16
  %18 = zext i32 %13 to i64
  %19 = getelementptr i8, i8* %17, i64 %18
  %20 = add nuw nsw i32 %13, 8
  store i32 %20, i32* %12, align 16
  br label %25

21:                                               ; preds = %10
  %22 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %4, i64 0, i64 0, i32 2
  %23 = load i8*, i8** %22, align 8
  %24 = getelementptr i8, i8* %23, i64 8
  store i8* %24, i8** %22, align 8
  br label %25

25:                                               ; preds = %21, %15
  %26 = phi i8* [ %19, %15 ], [ %23, %21 ]
  %27 = bitcast i8* %26 to i32*
  %28 = load i32, i32* %27, align 4
  call void @llvm.va_end(i8* nonnull %11) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %11) #4
  %29 = zext i32 %28 to i64
  br label %30

30:                                               ; preds = %3, %25
  %31 = phi i64 [ %29, %25 ], [ 0, %3 ]
  %32 = sext i32 %0 to i64
  %33 = ptrtoint i8* %1 to i64
  %34 = or i32 %2, 32768
  %35 = sext i32 %34 to i64
  %36 = call i64 @__syscall_cp(i64 noundef 257, i64 noundef %32, i64 noundef %33, i64 noundef %35, i64 noundef %31, i64 noundef 0, i64 noundef 0) #6
  %37 = call i64 @__syscall_ret(i64 noundef %36) #6
  %38 = trunc i64 %37 to i32
  ret i32 %38
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i64 @__syscall_cp(i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef) local_unnamed_addr #3

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
