; ModuleID = 'src/linux/ptrace.c'
source_filename = "src/linux/ptrace.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind optsize strictfp
define i64 @ptrace(i32 noundef %0, ...) local_unnamed_addr #0 {
  %2 = alloca [1 x %struct.__va_list_tag], align 16
  %3 = alloca i64, align 8
  %4 = bitcast [1 x %struct.__va_list_tag]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %4) #4
  %5 = bitcast i64* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %5) #4
  call void @llvm.va_start(i8* nonnull %4) #5
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 0
  %7 = load i32, i32* %6, align 16
  %8 = icmp ult i32 %7, 41
  br i1 %8, label %15, label %9

9:                                                ; preds = %1
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr i8, i8* %11, i64 8
  store i8* %12, i8** %10, align 8
  %13 = bitcast i8* %11 to i32*
  %14 = load i32, i32* %13, align 4
  br label %24

15:                                               ; preds = %1
  %16 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %17 = load i8*, i8** %16, align 16
  %18 = zext i32 %7 to i64
  %19 = getelementptr i8, i8* %17, i64 %18
  %20 = add nuw nsw i32 %7, 8
  store i32 %20, i32* %6, align 16
  %21 = bitcast i8* %19 to i32*
  %22 = load i32, i32* %21, align 4
  %23 = icmp ult i32 %7, 33
  br i1 %23, label %31, label %24

24:                                               ; preds = %15, %9
  %25 = phi i32 [ %14, %9 ], [ %22, %15 ]
  %26 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %27 = load i8*, i8** %26, align 8
  %28 = getelementptr i8, i8* %27, i64 8
  store i8* %28, i8** %26, align 8
  %29 = bitcast i8* %27 to i8**
  %30 = load i8*, i8** %29, align 8
  br label %46

31:                                               ; preds = %15
  %32 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %33 = load i8*, i8** %32, align 16
  %34 = zext i32 %20 to i64
  %35 = getelementptr i8, i8* %33, i64 %34
  %36 = add nuw nsw i32 %7, 16
  store i32 %36, i32* %6, align 16
  %37 = bitcast i8* %35 to i8**
  %38 = load i8*, i8** %37, align 8
  %39 = icmp ult i32 %7, 25
  br i1 %39, label %40, label %46

40:                                               ; preds = %31
  %41 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 3
  %42 = load i8*, i8** %41, align 16
  %43 = zext i32 %36 to i64
  %44 = getelementptr i8, i8* %42, i64 %43
  %45 = add nuw nsw i32 %7, 24
  store i32 %45, i32* %6, align 16
  br label %52

46:                                               ; preds = %24, %31
  %47 = phi i8* [ %30, %24 ], [ %38, %31 ]
  %48 = phi i32 [ %25, %24 ], [ %22, %31 ]
  %49 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i64 0, i64 0, i32 2
  %50 = load i8*, i8** %49, align 8
  %51 = getelementptr i8, i8* %50, i64 8
  store i8* %51, i8** %49, align 8
  br label %52

52:                                               ; preds = %46, %40
  %53 = phi i8* [ %38, %40 ], [ %47, %46 ]
  %54 = phi i32 [ %22, %40 ], [ %48, %46 ]
  %55 = phi i8* [ %44, %40 ], [ %50, %46 ]
  %56 = bitcast i8* %55 to i8**
  %57 = load i8*, i8** %56, align 8
  call void @llvm.va_end(i8* nonnull %4) #5
  %58 = add i32 %0, -1
  %59 = icmp ult i32 %58, 3
  %60 = select i1 %59, i8* %5, i8* %57
  %61 = sext i32 %0 to i64
  %62 = sext i32 %54 to i64
  %63 = ptrtoint i8* %53 to i64
  %64 = ptrtoint i8* %60 to i64
  %65 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 101, i64 %61, i64 %62, i64 %63, i64 %64, i64 0) #4, !srcloc !3
  %66 = call i64 @__syscall_ret(i64 noundef %65) #6
  %67 = icmp slt i64 %66, 0
  %68 = icmp ugt i32 %58, 2
  %69 = or i1 %68, %67
  %70 = load i64, i64* %3, align 8
  %71 = select i1 %69, i64 %66, i64 %70
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %5) #4
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %4) #4
  ret i64 %71
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_start(i8*) #2

; Function Attrs: mustprogress nofree nosync nounwind willreturn
declare void @llvm.va_end(i8*) #2

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #3

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
!3 = !{i64 106539}
