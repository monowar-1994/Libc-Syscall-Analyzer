; ModuleID = 'src/fcntl/open.c'
source_filename = "src/fcntl/open.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@open64 = weak alias i32 (i8*, i32, ...), i32 (i8*, i32, ...)* @open

; Function Attrs: nounwind optsize strictfp
define i32 @open(i8* noundef %0, i32 noundef %1, ...) #0 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = and i32 %1, 64
  %5 = icmp ne i32 %4, 0
  %6 = and i32 %1, 4259840
  %7 = icmp eq i32 %6, 4259840
  %8 = or i1 %5, %7
  br i1 %8, label %9, label %29

9:                                                ; preds = %2
  %10 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %10) #4
  call void @llvm.va_start(i8* nonnull %10) #5
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 0
  %12 = load i32, i32* %11, align 16
  %13 = icmp ult i32 %12, 41
  br i1 %13, label %14, label %20

14:                                               ; preds = %9
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 3
  %16 = load i8*, i8** %15, align 16
  %17 = zext i32 %12 to i64
  %18 = getelementptr i8, i8* %16, i64 %17
  %19 = add nuw nsw i32 %12, 8
  store i32 %19, i32* %11, align 16
  br label %24

20:                                               ; preds = %9
  %21 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 2
  %22 = load i8*, i8** %21, align 8
  %23 = getelementptr i8, i8* %22, i64 8
  store i8* %23, i8** %21, align 8
  br label %24

24:                                               ; preds = %20, %14
  %25 = phi i8* [ %18, %14 ], [ %22, %20 ]
  %26 = bitcast i8* %25 to i32*
  %27 = load i32, i32* %26, align 4
  call void @llvm.va_end(i8* nonnull %10) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %10) #4
  %28 = zext i32 %27 to i64
  br label %29

29:                                               ; preds = %2, %24
  %30 = phi i64 [ %28, %24 ], [ 0, %2 ]
  %31 = ptrtoint i8* %0 to i64
  %32 = or i32 %1, 32768
  %33 = sext i32 %32 to i64
  %34 = call i64 @__syscall_cp(i64 noundef 2, i64 noundef %31, i64 noundef %33, i64 noundef %30, i64 noundef 0, i64 noundef 0, i64 noundef 0) #6
  %35 = and i64 %34, 2147483648
  %36 = icmp ne i64 %35, 0
  %37 = and i32 %1, 524288
  %38 = icmp eq i32 %37, 0
  %39 = or i1 %38, %36
  %40 = shl i64 %34, 32
  %41 = ashr exact i64 %40, 32
  br i1 %39, label %44, label %42

42:                                               ; preds = %29
  %43 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %41, i64 2, i64 1) #4, !srcloc !3
  br label %44

44:                                               ; preds = %29, %42
  %45 = call i64 @__syscall_ret(i64 noundef %41) #6
  %46 = trunc i64 %45 to i32
  ret i32 %46
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
declare hidden i64 @__syscall_cp(i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #3

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
!3 = !{i64 78560}
