; ModuleID = 'src/ipc/semctl.c'
source_filename = "src/ipc/semctl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.semid_ds = type { %struct.ipc_perm, i64, i64, i64, i64, i16, [6 x i8], i64, i64 }
%struct.ipc_perm = type { i32, i32, i32, i32, i32, i32, i32, i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @semctl(i32 noundef %0, i32 noundef %1, i32 noundef %2, ...) local_unnamed_addr #0 {
  %4 = alloca [1 x %struct.__va_list_tag], align 16
  %5 = bitcast [1 x %struct.__va_list_tag]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %5) #4
  switch i32 %2, label %25 [
    i32 16, label %6
    i32 13, label %6
    i32 17, label %6
    i32 1, label %6
    i32 3, label %6
    i32 19, label %6
    i32 2, label %6
    i32 18, label %6
    i32 20, label %6
  ]

6:                                                ; preds = %3, %3, %3, %3, %3, %3, %3, %3, %3
  call void @llvm.va_start(i8* nonnull %5) #5
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %4, i64 0, i64 0, i32 0
  %8 = load i32, i32* %7, align 16
  %9 = icmp ult i32 %8, 41
  br i1 %9, label %10, label %16

10:                                               ; preds = %6
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %4, i64 0, i64 0, i32 3
  %12 = load i8*, i8** %11, align 16
  %13 = zext i32 %8 to i64
  %14 = getelementptr i8, i8* %12, i64 %13
  %15 = add nuw nsw i32 %8, 8
  store i32 %15, i32* %7, align 16
  br label %20

16:                                               ; preds = %6
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %4, i64 0, i64 0, i32 2
  %18 = load i8*, i8** %17, align 8
  %19 = getelementptr i8, i8* %18, i64 8
  store i8* %19, i8** %17, align 8
  br label %20

20:                                               ; preds = %16, %10
  %21 = phi i8* [ %14, %10 ], [ %18, %16 ]
  %22 = bitcast i8* %21 to %struct.semid_ds**
  %23 = load %struct.semid_ds*, %struct.semid_ds** %22, align 8, !tbaa.struct !3
  call void @llvm.va_end(i8* nonnull %5) #5
  %24 = ptrtoint %struct.semid_ds* %23 to i64
  br label %25

25:                                               ; preds = %20, %3
  %26 = phi i64 [ 0, %3 ], [ %24, %20 ]
  %27 = sext i32 %0 to i64
  %28 = sext i32 %1 to i64
  %29 = sext i32 %2 to i64
  %30 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 66, i64 %27, i64 %28, i64 %29, i64 %26) #4, !srcloc !10
  %31 = shl i64 %30, 32
  %32 = ashr exact i64 %31, 32
  %33 = call i64 @__syscall_ret(i64 noundef %32) #6
  %34 = trunc i64 %33 to i32
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %5) #4
  ret i32 %34
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
!3 = !{i64 0, i64 4, !4, i64 0, i64 8, !8, i64 0, i64 8, !8}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"any pointer", !6, i64 0}
!10 = !{i64 101312}
