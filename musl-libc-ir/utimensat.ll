; ModuleID = 'src/stat/utimensat.c'
source_filename = "src/stat/utimensat.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timespec = type { i64, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @utimensat(i32 noundef %0, i8* noundef %1, %struct.timespec* noundef %2, i32 noundef %3) local_unnamed_addr #0 {
  %5 = alloca [4 x i64], align 16
  %6 = icmp eq %struct.timespec* %2, null
  br i1 %6, label %16, label %7

7:                                                ; preds = %4
  %8 = getelementptr inbounds %struct.timespec, %struct.timespec* %2, i64 0, i32 1
  %9 = load i64, i64* %8, align 8, !tbaa !3
  %10 = icmp eq i64 %9, 1073741823
  br i1 %10, label %11, label %16

11:                                               ; preds = %7
  %12 = getelementptr inbounds %struct.timespec, %struct.timespec* %2, i64 1, i32 1
  %13 = load i64, i64* %12, align 8, !tbaa !3
  %14 = icmp eq i64 %13, 1073741823
  %15 = select i1 %14, %struct.timespec* null, %struct.timespec* %2
  br label %16

16:                                               ; preds = %11, %7, %4
  %17 = phi %struct.timespec* [ %15, %11 ], [ %2, %7 ], [ null, %4 ]
  %18 = sext i32 %0 to i64
  %19 = ptrtoint i8* %1 to i64
  %20 = ptrtoint %struct.timespec* %17 to i64
  %21 = sext i32 %3 to i64
  %22 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 280, i64 %18, i64 %19, i64 %20, i64 %21) #3, !srcloc !8
  %23 = trunc i64 %22 to i32
  %24 = icmp ne i32 %23, -38
  %25 = icmp ne i32 %3, 0
  %26 = or i1 %25, %24
  br i1 %26, label %27, label %31

27:                                               ; preds = %16
  %28 = shl i64 %22, 32
  %29 = ashr exact i64 %28, 32
  %30 = tail call i64 @__syscall_ret(i64 noundef %29) #4
  br label %77

31:                                               ; preds = %16
  %32 = bitcast [4 x i64]* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %32) #3
  %33 = icmp eq %struct.timespec* %17, null
  br i1 %33, label %59, label %34

34:                                               ; preds = %31, %47
  %35 = phi i1 [ false, %47 ], [ true, %31 ]
  %36 = phi i64 [ 1, %47 ], [ 0, %31 ]
  %37 = getelementptr inbounds %struct.timespec, %struct.timespec* %17, i64 %36, i32 1
  %38 = load i64, i64* %37, align 8, !tbaa !3
  %39 = icmp ugt i64 %38, 999999999
  br i1 %39, label %40, label %47

40:                                               ; preds = %34
  %41 = and i64 %38, -2
  %42 = icmp eq i64 %41, 1073741822
  br i1 %42, label %43, label %45

43:                                               ; preds = %40
  %44 = tail call i64 @__syscall_ret(i64 noundef -38) #4
  br label %75

45:                                               ; preds = %40
  %46 = tail call i64 @__syscall_ret(i64 noundef -22) #4
  br label %75

47:                                               ; preds = %34
  %48 = getelementptr inbounds %struct.timespec, %struct.timespec* %17, i64 %36, i32 0
  %49 = load i64, i64* %48, align 8, !tbaa !9
  %50 = shl nuw nsw i64 %36, 1
  %51 = getelementptr inbounds [4 x i64], [4 x i64]* %5, i64 0, i64 %50
  store i64 %49, i64* %51, align 16, !tbaa !10
  %52 = trunc i64 %38 to i32
  %53 = udiv i32 %52, 1000
  %54 = zext i32 %53 to i64
  %55 = or i64 %50, 1
  %56 = getelementptr inbounds [4 x i64], [4 x i64]* %5, i64 0, i64 %55
  store i64 %54, i64* %56, align 8, !tbaa !10
  br i1 %35, label %34, label %57

57:                                               ; preds = %47
  %58 = ptrtoint [4 x i64]* %5 to i64
  br label %59

59:                                               ; preds = %57, %31
  %60 = phi i64 [ 0, %31 ], [ %58, %57 ]
  %61 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 261, i64 %18, i64 %19, i64 %60) #3, !srcloc !11
  %62 = trunc i64 %61 to i32
  %63 = icmp ne i32 %62, -38
  %64 = icmp ne i32 %0, -100
  %65 = or i1 %64, %63
  br i1 %65, label %66, label %70

66:                                               ; preds = %59
  %67 = shl i64 %61, 32
  %68 = ashr exact i64 %67, 32
  %69 = call i64 @__syscall_ret(i64 noundef %68) #4
  br label %75

70:                                               ; preds = %59
  %71 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 235, i64 %19, i64 %60) #3, !srcloc !12
  %72 = shl i64 %71, 32
  %73 = ashr exact i64 %72, 32
  %74 = call i64 @__syscall_ret(i64 noundef %73) #4
  br label %75

75:                                               ; preds = %45, %43, %70, %66
  %76 = phi i64 [ %69, %66 ], [ %74, %70 ], [ %46, %45 ], [ %44, %43 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %32) #3
  br label %77

77:                                               ; preds = %75, %27
  %78 = phi i64 [ %30, %27 ], [ %76, %75 ]
  %79 = trunc i64 %78 to i32
  ret i32 %79
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

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
!3 = !{!4, !5, i64 8}
!4 = !{!"timespec", !5, i64 0, !5, i64 8}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{i64 98709}
!9 = !{!4, !5, i64 0}
!10 = !{!5, !5, i64 0}
!11 = !{i64 98439}
!12 = !{i64 98227}
