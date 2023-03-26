; ModuleID = 'src/misc/ioctl.c'
source_filename = "src/misc/ioctl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind optsize strictfp
define i32 @ioctl(i32 noundef %0, i32 noundef %1, ...) local_unnamed_addr #0 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %4) #4
  call void @llvm.va_start(i8* nonnull %4) #5
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 0
  %6 = load i32, i32* %5, align 16
  %7 = icmp ult i32 %6, 41
  br i1 %7, label %8, label %14

8:                                                ; preds = %2
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 3
  %10 = load i8*, i8** %9, align 16
  %11 = zext i32 %6 to i64
  %12 = getelementptr i8, i8* %10, i64 %11
  %13 = add nuw nsw i32 %6, 8
  store i32 %13, i32* %5, align 16
  br label %18

14:                                               ; preds = %2
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 2
  %16 = load i8*, i8** %15, align 8
  %17 = getelementptr i8, i8* %16, i64 8
  store i8* %17, i8** %15, align 8
  br label %18

18:                                               ; preds = %14, %8
  %19 = phi i8* [ %12, %8 ], [ %16, %14 ]
  %20 = bitcast i8* %19 to i8**
  %21 = load i8*, i8** %20, align 8
  call void @llvm.va_end(i8* nonnull %4) #5
  %22 = sext i32 %0 to i64
  %23 = sext i32 %1 to i64
  %24 = ptrtoint i8* %21 to i64
  %25 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 16, i64 %22, i64 %23, i64 %24) #4, !srcloc !3
  %26 = shl i64 %25, 32
  %27 = ashr exact i64 %26, 32
  %28 = call i64 @__syscall_ret(i64 noundef %27) #6
  %29 = trunc i64 %28 to i32
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %4) #4
  ret i32 %29
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
!3 = !{i64 171370}
