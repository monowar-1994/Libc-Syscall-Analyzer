; ModuleID = 'src/mq/mq_open.c'
source_filename = "src/mq/mq_open.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.mq_attr = type { i64, i64, i64, i64, [4 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @mq_open(i8* noundef %0, i32 noundef %1, ...) local_unnamed_addr #0 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = load i8, i8* %0, align 1, !tbaa !3
  %5 = and i32 %1, 64
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %45, label %7

7:                                                ; preds = %2
  %8 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %8) #4
  call void @llvm.va_start(i8* nonnull %8) #5
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 0
  %10 = load i32, i32* %9, align 16
  %11 = icmp ult i32 %10, 41
  br i1 %11, label %18, label %12

12:                                               ; preds = %7
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 2
  %14 = load i8*, i8** %13, align 8
  %15 = getelementptr i8, i8* %14, i64 8
  store i8* %15, i8** %13, align 8
  %16 = bitcast i8* %14 to i32*
  %17 = load i32, i32* %16, align 4
  br label %33

18:                                               ; preds = %7
  %19 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 3
  %20 = load i8*, i8** %19, align 16
  %21 = zext i32 %10 to i64
  %22 = getelementptr i8, i8* %20, i64 %21
  %23 = add nuw nsw i32 %10, 8
  store i32 %23, i32* %9, align 16
  %24 = bitcast i8* %22 to i32*
  %25 = load i32, i32* %24, align 4
  %26 = icmp ult i32 %10, 33
  br i1 %26, label %27, label %33

27:                                               ; preds = %18
  %28 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 3
  %29 = load i8*, i8** %28, align 16
  %30 = zext i32 %23 to i64
  %31 = getelementptr i8, i8* %29, i64 %30
  %32 = add nuw nsw i32 %10, 16
  store i32 %32, i32* %9, align 16
  br label %38

33:                                               ; preds = %12, %18
  %34 = phi i32 [ %17, %12 ], [ %25, %18 ]
  %35 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 2
  %36 = load i8*, i8** %35, align 8
  %37 = getelementptr i8, i8* %36, i64 8
  store i8* %37, i8** %35, align 8
  br label %38

38:                                               ; preds = %33, %27
  %39 = phi i32 [ %25, %27 ], [ %34, %33 ]
  %40 = phi i8* [ %31, %27 ], [ %36, %33 ]
  %41 = bitcast i8* %40 to %struct.mq_attr**
  %42 = load %struct.mq_attr*, %struct.mq_attr** %41, align 8
  call void @llvm.va_end(i8* nonnull %8) #5
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %8) #4
  %43 = zext i32 %39 to i64
  %44 = ptrtoint %struct.mq_attr* %42 to i64
  br label %45

45:                                               ; preds = %38, %2
  %46 = phi i64 [ %43, %38 ], [ 0, %2 ]
  %47 = phi i64 [ %44, %38 ], [ 0, %2 ]
  %48 = icmp eq i8 %4, 47
  %49 = zext i1 %48 to i64
  %50 = getelementptr i8, i8* %0, i64 %49
  %51 = ptrtoint i8* %50 to i64
  %52 = sext i32 %1 to i64
  %53 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 240, i64 %51, i64 %52, i64 %46, i64 %47) #4, !srcloc !6
  %54 = call i64 @__syscall_ret(i64 noundef %53) #6
  %55 = trunc i64 %54 to i32
  ret i32 %55
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
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{i64 91394}
