; ModuleID = 'src/stat/fchmodat.c'
source_filename = "src/stat/fchmodat.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.kstat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, [3 x i64] }

; Function Attrs: nounwind optsize strictfp
define i32 @fchmodat(i32 noundef %0, i8* noundef %1, i32 noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = alloca %struct.kstat, align 8
  %6 = alloca [27 x i8], align 16
  switch i32 %3, label %13 [
    i32 0, label %7
    i32 256, label %15
  ]

7:                                                ; preds = %4
  %8 = sext i32 %0 to i64
  %9 = ptrtoint i8* %1 to i64
  %10 = zext i32 %2 to i64
  %11 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 268, i64 %8, i64 %9, i64 %10, i64 0) #3, !srcloc !3
  %12 = tail call i64 @__syscall_ret(i64 noundef %11) #4
  br label %63

13:                                               ; preds = %4
  %14 = tail call i64 @__syscall_ret(i64 noundef -22) #4
  br label %63

15:                                               ; preds = %4
  %16 = bitcast %struct.kstat* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 144, i8* nonnull %16) #3
  %17 = getelementptr inbounds [27 x i8], [27 x i8]* %6, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 27, i8* nonnull %17) #3
  %18 = sext i32 %0 to i64
  %19 = ptrtoint i8* %1 to i64
  %20 = ptrtoint %struct.kstat* %5 to i64
  %21 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 262, i64 %18, i64 %19, i64 %20, i64 256) #3, !srcloc !3
  %22 = trunc i64 %21 to i32
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %27, label %24

24:                                               ; preds = %15
  %25 = shl i64 %21, 32
  %26 = ashr exact i64 %25, 32
  br label %60

27:                                               ; preds = %15
  %28 = getelementptr inbounds %struct.kstat, %struct.kstat* %5, i64 0, i32 3
  %29 = load i32, i32* %28, align 8, !tbaa !4
  %30 = and i32 %29, 61440
  %31 = icmp eq i32 %30, 40960
  br i1 %31, label %60, label %32

32:                                               ; preds = %27
  %33 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 257, i64 %18, i64 %19, i64 2752768) #3, !srcloc !10
  %34 = trunc i64 %33 to i32
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %36, label %41

36:                                               ; preds = %32
  %37 = icmp eq i32 %34, -40
  br i1 %37, label %60, label %38

38:                                               ; preds = %36
  %39 = shl i64 %33, 32
  %40 = ashr exact i64 %39, 32
  br label %60

41:                                               ; preds = %32
  call void @__procfdname(i8* noundef nonnull %17, i32 noundef %34) #4
  %42 = ptrtoint [27 x i8]* %6 to i64
  %43 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 262, i64 -100, i64 %42, i64 %20, i64 0) #3, !srcloc !3
  %44 = trunc i64 %43 to i32
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %53

46:                                               ; preds = %41
  %47 = load i32, i32* %28, align 8, !tbaa !4
  %48 = and i32 %47, 61440
  %49 = icmp eq i32 %48, 40960
  br i1 %49, label %53, label %50

50:                                               ; preds = %46
  %51 = zext i32 %2 to i64
  %52 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 268, i64 -100, i64 %42, i64 %51) #3, !srcloc !10
  br label %53

53:                                               ; preds = %46, %50, %41
  %54 = phi i64 [ %43, %41 ], [ %52, %50 ], [ -95, %46 ]
  %55 = shl i64 %33, 32
  %56 = ashr exact i64 %55, 32
  %57 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 3, i64 %56) #3, !srcloc !11
  %58 = shl i64 %54, 32
  %59 = ashr exact i64 %58, 32
  br label %60

60:                                               ; preds = %36, %27, %53, %38, %24
  %61 = phi i64 [ %59, %53 ], [ %40, %38 ], [ %26, %24 ], [ -95, %27 ], [ -95, %36 ]
  %62 = call i64 @__syscall_ret(i64 noundef %61) #4
  call void @llvm.lifetime.end.p0i8(i64 27, i8* nonnull %17) #3
  call void @llvm.lifetime.end.p0i8(i64 144, i8* nonnull %16) #3
  br label %63

63:                                               ; preds = %60, %13, %7
  %64 = phi i64 [ %14, %13 ], [ %62, %60 ], [ %12, %7 ]
  %65 = trunc i64 %64 to i32
  ret i32 %65
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: optsize
declare hidden void @__procfdname(i8* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 82603}
!4 = !{!5, !9, i64 24}
!5 = !{!"kstat", !6, i64 0, !6, i64 8, !6, i64 16, !9, i64 24, !9, i64 28, !9, i64 32, !9, i64 36, !6, i64 40, !6, i64 48, !6, i64 56, !6, i64 64, !6, i64 72, !6, i64 80, !6, i64 88, !6, i64 96, !6, i64 104, !6, i64 112, !7, i64 120}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{i64 82333}
!11 = !{i64 81935}
