; ModuleID = 'src/fcntl/fcntl.c'
source_filename = "src/fcntl/fcntl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.f_owner_ex = type { i32, i32 }

; Function Attrs: nounwind optsize strictfp
define i32 @fcntl(i32 noundef %0, i32 noundef %1, ...) local_unnamed_addr #0 {
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = alloca %struct.f_owner_ex, align 4
  %5 = bitcast [1 x %struct.__va_list_tag]* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %5) #4
  call void @llvm.va_start(i8* nonnull %5) #5
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 0
  %7 = load i32, i32* %6, align 16
  %8 = icmp ult i32 %7, 41
  br i1 %8, label %9, label %15

9:                                                ; preds = %2
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 3
  %11 = load i8*, i8** %10, align 16
  %12 = zext i32 %7 to i64
  %13 = getelementptr i8, i8* %11, i64 %12
  %14 = add nuw nsw i32 %7, 8
  store i32 %14, i32* %6, align 16
  br label %19

15:                                               ; preds = %2
  %16 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i64 0, i64 0, i32 2
  %17 = load i8*, i8** %16, align 8
  %18 = getelementptr i8, i8* %17, i64 8
  store i8* %18, i8** %16, align 8
  br label %19

19:                                               ; preds = %15, %9
  %20 = phi i8* [ %13, %9 ], [ %17, %15 ]
  %21 = bitcast i8* %20 to i64*
  %22 = load i64, i64* %21, align 8
  call void @llvm.va_end(i8* nonnull %5) #5
  %23 = icmp eq i32 %1, 4
  %24 = or i64 %22, 32768
  %25 = select i1 %23, i64 %24, i64 %22
  switch i32 %1, label %94 [
    i32 7, label %26
    i32 9, label %31
    i32 1030, label %55
    i32 6, label %88
    i32 5, label %88
    i32 16, label %88
    i32 15, label %88
  ]

26:                                               ; preds = %19
  %27 = sext i32 %0 to i64
  %28 = call i64 @__syscall_cp(i64 noundef 72, i64 noundef %27, i64 noundef 7, i64 noundef %25, i64 noundef 0, i64 noundef 0, i64 noundef 0) #6
  %29 = call i64 @__syscall_ret(i64 noundef %28) #6
  %30 = trunc i64 %29 to i32
  br label %100

31:                                               ; preds = %19
  %32 = bitcast %struct.f_owner_ex* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %32) #4
  %33 = sext i32 %0 to i64
  %34 = ptrtoint %struct.f_owner_ex* %4 to i64
  %35 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %33, i64 16, i64 %34) #4, !srcloc !3
  %36 = trunc i64 %35 to i32
  switch i32 %36, label %40 [
    i32 -22, label %37
    i32 0, label %45
  ]

37:                                               ; preds = %31
  %38 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %33, i64 9, i64 %25) #4, !srcloc !3
  %39 = trunc i64 %38 to i32
  br label %53

40:                                               ; preds = %31
  %41 = shl i64 %35, 32
  %42 = ashr exact i64 %41, 32
  %43 = call i64 @__syscall_ret(i64 noundef %42) #6
  %44 = trunc i64 %43 to i32
  br label %53

45:                                               ; preds = %31
  %46 = getelementptr inbounds %struct.f_owner_ex, %struct.f_owner_ex* %4, i64 0, i32 0
  %47 = load i32, i32* %46, align 4, !tbaa !4
  %48 = icmp eq i32 %47, 2
  %49 = getelementptr inbounds %struct.f_owner_ex, %struct.f_owner_ex* %4, i64 0, i32 1
  %50 = load i32, i32* %49, align 4
  %51 = sub nsw i32 0, %50
  %52 = select i1 %48, i32 %51, i32 %50
  br label %53

53:                                               ; preds = %45, %40, %37
  %54 = phi i32 [ %39, %37 ], [ %44, %40 ], [ %52, %45 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %32) #4
  br label %100

55:                                               ; preds = %19
  %56 = sext i32 %0 to i64
  %57 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %56, i64 1030, i64 %25) #4, !srcloc !3
  %58 = trunc i64 %57 to i32
  %59 = icmp eq i32 %58, -22
  br i1 %59, label %66, label %60

60:                                               ; preds = %55
  %61 = icmp sgt i32 %58, -1
  %62 = shl i64 %57, 32
  %63 = ashr exact i64 %62, 32
  br i1 %61, label %64, label %84

64:                                               ; preds = %60
  %65 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %63, i64 2, i64 1) #4, !srcloc !3
  br label %84

66:                                               ; preds = %55
  %67 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %56, i64 1030, i64 0) #4, !srcloc !3
  %68 = trunc i64 %67 to i32
  %69 = icmp eq i32 %68, -22
  br i1 %69, label %76, label %70

70:                                               ; preds = %66
  %71 = icmp sgt i32 %68, -1
  br i1 %71, label %72, label %84

72:                                               ; preds = %70
  %73 = shl i64 %67, 32
  %74 = ashr exact i64 %73, 32
  %75 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %74) #4, !srcloc !9
  br label %84

76:                                               ; preds = %66
  %77 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %56, i64 0, i64 %25) #4, !srcloc !3
  %78 = and i64 %77, 2147483648
  %79 = icmp eq i64 %78, 0
  %80 = shl i64 %77, 32
  %81 = ashr exact i64 %80, 32
  br i1 %79, label %82, label %84

82:                                               ; preds = %76
  %83 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %81, i64 2, i64 1) #4, !srcloc !3
  br label %84

84:                                               ; preds = %82, %76, %70, %72, %64, %60
  %85 = phi i64 [ %63, %60 ], [ %63, %64 ], [ -22, %72 ], [ -22, %70 ], [ %81, %76 ], [ %81, %82 ]
  %86 = call i64 @__syscall_ret(i64 noundef %85) #6
  %87 = trunc i64 %86 to i32
  br label %100

88:                                               ; preds = %19, %19, %19, %19
  %89 = sext i32 %0 to i64
  %90 = zext i32 %1 to i64
  %91 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %89, i64 %90, i64 %25) #4, !srcloc !3
  %92 = call i64 @__syscall_ret(i64 noundef %91) #6
  %93 = trunc i64 %92 to i32
  br label %100

94:                                               ; preds = %19
  %95 = sext i32 %0 to i64
  %96 = sext i32 %1 to i64
  %97 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %95, i64 %96, i64 %25) #4, !srcloc !3
  %98 = call i64 @__syscall_ret(i64 noundef %97) #6
  %99 = trunc i64 %98 to i32
  br label %100

100:                                              ; preds = %94, %88, %84, %53, %26
  %101 = phi i32 [ %30, %26 ], [ %54, %53 ], [ %87, %84 ], [ %99, %94 ], [ %93, %88 ]
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %5) #4
  ret i32 %101
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
declare hidden i64 @__syscall_cp(i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef) local_unnamed_addr #3

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
!3 = !{i64 79441}
!4 = !{!5, !6, i64 0}
!5 = !{!"f_owner_ex", !6, i64 0, !6, i64 4}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{i64 79043}
