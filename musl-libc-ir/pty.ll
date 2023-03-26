; ModuleID = 'src/misc/pty.c'
source_filename = "src/misc/pty.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"/dev/ptmx\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"/dev/pts/%d\00", align 1

@ptsname_r = weak alias i32 (i32, i8*, i64), i32 (i32, i8*, i64)* @__ptsname_r

; Function Attrs: nounwind optsize strictfp
define i32 @posix_openpt(i32 noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 (i8*, i32, ...) @open(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i32 noundef %0) #5
  %3 = icmp slt i32 %2, 0
  br i1 %3, label %4, label %9

4:                                                ; preds = %1
  %5 = tail call i32* @___errno_location() #6
  %6 = load i32, i32* %5, align 4, !tbaa !3
  %7 = icmp eq i32 %6, 28
  br i1 %7, label %8, label %9

8:                                                ; preds = %4
  store i32 11, i32* %5, align 4, !tbaa !3
  br label %9

9:                                                ; preds = %8, %4, %1
  ret i32 %2
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @open(i8* noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @grantpt(i32 noundef %0) local_unnamed_addr #4 {
  ret i32 0
}

; Function Attrs: nounwind optsize strictfp
define i32 @unlockpt(i32 noundef %0) local_unnamed_addr #0 {
  %2 = alloca i32, align 4
  %3 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %3) #7
  store i32 0, i32* %2, align 4, !tbaa !3
  %4 = call i32 (i32, i32, ...) @ioctl(i32 noundef %0, i32 noundef 1074025521, i32* noundef nonnull %2) #5
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %3) #7
  ret i32 %4
}

; Function Attrs: optsize
declare i32 @ioctl(i32 noundef, i32 noundef, ...) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__ptsname_r(i32 noundef %0, i8* noundef %1, i64 noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %5) #7
  %6 = icmp eq i8* %1, null
  %7 = select i1 %6, i64 0, i64 %2
  %8 = sext i32 %0 to i64
  %9 = ptrtoint i32* %4 to i64
  %10 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 16, i64 %8, i64 2147767344, i64 %9) #7, !srcloc !7
  %11 = trunc i64 %10 to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %15, label %13

13:                                               ; preds = %3
  %14 = sub nsw i32 0, %11
  br label %21

15:                                               ; preds = %3
  %16 = load i32, i32* %4, align 4, !tbaa !3
  %17 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef %1, i64 noundef %7, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 noundef %16) #5
  %18 = sext i32 %17 to i64
  %19 = icmp ugt i64 %7, %18
  %20 = select i1 %19, i32 0, i32 34
  br label %21

21:                                               ; preds = %15, %13
  %22 = phi i32 [ %14, %13 ], [ %20, %15 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %5) #7
  ret i32 %22
}

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #7 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 120570}
