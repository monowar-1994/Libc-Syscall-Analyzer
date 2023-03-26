; ModuleID = 'src/unistd/faccessat.c'
source_filename = "src/unistd/faccessat.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__sigset_t = type { [16 x i64] }
%struct.ctx = type { i32, i8*, i32, i32 }

; Function Attrs: nounwind optsize strictfp
define i32 @faccessat(i32 noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = alloca [1024 x i8], align 16
  %6 = alloca %struct.__sigset_t, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [2 x i32], align 4
  %10 = alloca %struct.ctx, align 8
  %11 = icmp eq i32 %3, 0
  %12 = sext i32 %0 to i64
  %13 = ptrtoint i8* %1 to i64
  %14 = sext i32 %2 to i64
  br i1 %11, label %37, label %15

15:                                               ; preds = %4
  %16 = sext i32 %3 to i64
  %17 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 439, i64 %12, i64 %13, i64 %14, i64 %16) #3, !srcloc !3
  %18 = trunc i64 %17 to i32
  %19 = icmp eq i32 %18, -38
  br i1 %19, label %24, label %20

20:                                               ; preds = %15
  %21 = shl i64 %17, 32
  %22 = ashr exact i64 %21, 32
  %23 = tail call i64 @__syscall_ret(i64 noundef %22) #4
  br label %84

24:                                               ; preds = %15
  %25 = and i32 %3, -513
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %29, label %27

27:                                               ; preds = %24
  %28 = tail call i64 @__syscall_ret(i64 noundef -22) #4
  br label %84

29:                                               ; preds = %24
  %30 = tail call i32 @getuid() #4
  %31 = tail call i32 @geteuid() #4
  %32 = icmp eq i32 %30, %31
  br i1 %32, label %33, label %40

33:                                               ; preds = %29
  %34 = tail call i32 @getgid() #4
  %35 = tail call i32 @getegid() #4
  %36 = icmp eq i32 %34, %35
  br i1 %36, label %37, label %40

37:                                               ; preds = %4, %33
  %38 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 269, i64 %12, i64 %13, i64 %14) #3, !srcloc !4
  %39 = tail call i64 @__syscall_ret(i64 noundef %38) #4
  br label %84

40:                                               ; preds = %33, %29
  %41 = getelementptr inbounds [1024 x i8], [1024 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1024, i8* nonnull %41) #3
  %42 = bitcast %struct.__sigset_t* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 128, i8* nonnull %42) #3
  %43 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %43) #3
  %44 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %44) #3
  %45 = bitcast [2 x i32]* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %45) #3
  %46 = getelementptr inbounds [2 x i32], [2 x i32]* %9, i64 0, i64 0
  %47 = call i32 @pipe2(i32* noundef nonnull %46, i32 noundef 524288) #4
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %51, label %49

49:                                               ; preds = %40
  %50 = call i64 @__syscall_ret(i64 noundef -16) #4
  br label %82

51:                                               ; preds = %40
  %52 = bitcast %struct.ctx* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 24, i8* nonnull %52) #3
  %53 = getelementptr inbounds %struct.ctx, %struct.ctx* %10, i64 0, i32 0
  store i32 %0, i32* %53, align 8, !tbaa !5
  %54 = getelementptr inbounds %struct.ctx, %struct.ctx* %10, i64 0, i32 1
  store i8* %1, i8** %54, align 8, !tbaa !11
  %55 = getelementptr inbounds %struct.ctx, %struct.ctx* %10, i64 0, i32 2
  store i32 %2, i32* %55, align 8, !tbaa !12
  %56 = getelementptr inbounds %struct.ctx, %struct.ctx* %10, i64 0, i32 3
  %57 = getelementptr inbounds [2 x i32], [2 x i32]* %9, i64 0, i64 1
  %58 = load i32, i32* %57, align 4, !tbaa !13
  store i32 %58, i32* %56, align 4, !tbaa !14
  call void @__block_all_sigs(i8* noundef nonnull %42) #4
  %59 = getelementptr inbounds [1024 x i8], [1024 x i8]* %5, i64 0, i64 1024
  %60 = call i32 (i32 (i8*)*, i8*, i32, i8*, ...) @__clone(i32 (i8*)* noundef nonnull @checker, i8* noundef nonnull %59, i32 noundef 0, i8* noundef nonnull %52) #4
  %61 = load i32, i32* %57, align 4, !tbaa !13
  %62 = sext i32 %61 to i64
  %63 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %62) #3, !srcloc !15
  %64 = icmp slt i32 %60, 0
  br i1 %64, label %71, label %65

65:                                               ; preds = %51
  %66 = load i32, i32* %46, align 4, !tbaa !13
  %67 = sext i32 %66 to i64
  %68 = ptrtoint i32* %8 to i64
  %69 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %67, i64 %68, i64 4) #3, !srcloc !4
  %70 = icmp eq i64 %69, 4
  br i1 %70, label %72, label %71

71:                                               ; preds = %65, %51
  store i32 -16, i32* %8, align 4, !tbaa !13
  br label %72

72:                                               ; preds = %71, %65
  %73 = load i32, i32* %46, align 4, !tbaa !13
  %74 = sext i32 %73 to i64
  %75 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %74) #3, !srcloc !15
  %76 = sext i32 %60 to i64
  %77 = ptrtoint i32* %7 to i64
  %78 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 61, i64 %76, i64 %77, i64 2147483648, i64 0) #3, !srcloc !3
  call void @__restore_sigs(i8* noundef nonnull %42) #4
  %79 = load i32, i32* %8, align 4, !tbaa !13
  %80 = sext i32 %79 to i64
  %81 = call i64 @__syscall_ret(i64 noundef %80) #4
  call void @llvm.lifetime.end.p0i8(i64 24, i8* nonnull %52) #3
  br label %82

82:                                               ; preds = %72, %49
  %83 = phi i64 [ %50, %49 ], [ %81, %72 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %45) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %44) #3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %43) #3
  call void @llvm.lifetime.end.p0i8(i64 128, i8* nonnull %42) #3
  call void @llvm.lifetime.end.p0i8(i64 1024, i8* nonnull %41) #3
  br label %84

84:                                               ; preds = %20, %82, %37, %27
  %85 = phi i64 [ %23, %20 ], [ %28, %27 ], [ %39, %37 ], [ %83, %82 ]
  %86 = trunc i64 %85 to i32
  ret i32 %86
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @getuid() local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @geteuid() local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @getgid() local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @getegid() local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @pipe2(i32* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__block_all_sigs(i8* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__clone(i32 (i8*)* noundef, i8* noundef, i32 noundef, i8* noundef, ...) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define internal i32 @checker(i8* nocapture noundef readonly %0) #0 {
  %2 = alloca i32, align 4
  %3 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #3
  %4 = tail call i64 asm sideeffect "syscall", "={ax},{ax},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 108) #3, !srcloc !16
  %5 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 114, i64 %4, i64 -1) #3, !srcloc !17
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %7, label %11

7:                                                ; preds = %1
  %8 = tail call i64 asm sideeffect "syscall", "={ax},{ax},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 107) #3, !srcloc !16
  %9 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 113, i64 %8, i64 -1) #3, !srcloc !17
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

11:                                               ; preds = %7, %1
  %12 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 60, i64 1) #3, !srcloc !15
  br label %13

13:                                               ; preds = %11, %7
  %14 = bitcast i8* %0 to i32*
  %15 = load i32, i32* %14, align 8, !tbaa !5
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8, i8* %0, i64 8
  %18 = bitcast i8* %17 to i8**
  %19 = load i8*, i8** %18, align 8, !tbaa !11
  %20 = ptrtoint i8* %19 to i64
  %21 = getelementptr inbounds i8, i8* %0, i64 16
  %22 = bitcast i8* %21 to i32*
  %23 = load i32, i32* %22, align 8, !tbaa !12
  %24 = sext i32 %23 to i64
  %25 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 269, i64 %16, i64 %20, i64 %24, i64 0) #3, !srcloc !3
  %26 = trunc i64 %25 to i32
  store i32 %26, i32* %2, align 4, !tbaa !13
  %27 = getelementptr inbounds i8, i8* %0, i64 20
  %28 = bitcast i8* %27 to i32*
  %29 = load i32, i32* %28, align 4, !tbaa !14
  %30 = sext i32 %29 to i64
  %31 = ptrtoint i32* %2 to i64
  %32 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 1, i64 %30, i64 %31, i64 4) #3, !srcloc !4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #3
  ret i32 0
}

; Function Attrs: optsize
declare hidden void @__restore_sigs(i8* noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 129518}
!4 = !{i64 129248}
!5 = !{!6, !7, i64 0}
!6 = !{!"ctx", !7, i64 0, !10, i64 8, !7, i64 16, !7, i64 20}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"any pointer", !8, i64 0}
!11 = !{!6, !10, i64 8}
!12 = !{!6, !7, i64 16}
!13 = !{!7, !7, i64 0}
!14 = !{!6, !7, i64 20}
!15 = !{i64 128850}
!16 = !{i64 128682}
!17 = !{i64 129036}
