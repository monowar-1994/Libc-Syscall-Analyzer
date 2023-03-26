; ModuleID = 'src/linux/prctl.c'
source_filename = "src/linux/prctl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind optsize strictfp
define i32 @prctl(i32 noundef %0, ...) local_unnamed_addr #0 {
  %2 = alloca [4 x i64], align 16
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = bitcast [4 x i64]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %4) #4
  %5 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %5) #4
  call void @llvm.va_start(i8* nonnull %5) #5
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 0
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 2
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 3
  %9 = load i8*, i8** %8, align 16
  %10 = load i32, i32* %6, align 16
  br label %11

11:                                               ; preds = %1, %22
  %12 = phi i32 [ %10, %1 ], [ %23, %22 ]
  %13 = phi i64 [ 0, %1 ], [ %28, %22 ]
  %14 = icmp ult i32 %12, 41
  br i1 %14, label %15, label %19

15:                                               ; preds = %11
  %16 = zext i32 %12 to i64
  %17 = getelementptr i8, i8* %9, i64 %16
  %18 = add nuw nsw i32 %12, 8
  store i32 %18, i32* %6, align 16
  br label %22

19:                                               ; preds = %11
  %20 = load i8*, i8** %7, align 8
  %21 = getelementptr i8, i8* %20, i64 8
  store i8* %21, i8** %7, align 8
  br label %22

22:                                               ; preds = %19, %15
  %23 = phi i32 [ %18, %15 ], [ %12, %19 ]
  %24 = phi i8* [ %17, %15 ], [ %20, %19 ]
  %25 = bitcast i8* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds [4 x i64], [4 x i64]* %2, i64 0, i64 %13
  store i64 %26, i64* %27, align 8, !tbaa !3
  %28 = add nuw nsw i64 %13, 1
  %29 = icmp eq i64 %28, 4
  br i1 %29, label %30, label %11

30:                                               ; preds = %22
  call void @llvm.va_end(i8* nonnull %5) #5
  %31 = sext i32 %0 to i64
  %32 = getelementptr inbounds [4 x i64], [4 x i64]* %2, i64 0, i64 0
  %33 = load i64, i64* %32, align 16, !tbaa !3
  %34 = getelementptr inbounds [4 x i64], [4 x i64]* %2, i64 0, i64 1
  %35 = load i64, i64* %34, align 8, !tbaa !3
  %36 = getelementptr inbounds [4 x i64], [4 x i64]* %2, i64 0, i64 2
  %37 = load i64, i64* %36, align 16, !tbaa !3
  %38 = getelementptr inbounds [4 x i64], [4 x i64]* %2, i64 0, i64 3
  %39 = load i64, i64* %38, align 8, !tbaa !3
  %40 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 157, i64 %31, i64 %33, i64 %35, i64 %37, i64 %39) #4, !srcloc !7
  %41 = call i64 @__syscall_ret(i64 noundef %40) #6
  %42 = trunc i64 %41 to i32
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %5) #4
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %4) #4
  ret i32 %42
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
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 81440}
