; ModuleID = 'src/dirent/readdir.c'
source_filename = "src/dirent/readdir.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }
%struct.__dirstream = type { i64, i32, i32, i32, [1 x i32], [2048 x i8] }

@readdir64 = weak alias %struct.dirent* (%struct.__dirstream*), %struct.dirent* (%struct.__dirstream*)* @readdir

; Function Attrs: nounwind optsize strictfp
define %struct.dirent* @readdir(%struct.__dirstream* noundef %0) #0 {
  %2 = getelementptr inbounds %struct.__dirstream, %struct.__dirstream* %0, i64 0, i32 2
  %3 = load i32, i32* %2, align 4, !tbaa !3
  %4 = getelementptr inbounds %struct.__dirstream, %struct.__dirstream* %0, i64 0, i32 3
  %5 = load i32, i32* %4, align 8, !tbaa !9
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %21, label %7

7:                                                ; preds = %1
  %8 = getelementptr inbounds %struct.__dirstream, %struct.__dirstream* %0, i64 0, i32 1
  %9 = load i32, i32* %8, align 8, !tbaa !10
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds %struct.__dirstream, %struct.__dirstream* %0, i64 0, i32 5, i64 0
  %12 = ptrtoint i8* %11 to i64
  %13 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 217, i64 %10, i64 %12, i64 2048) #2, !srcloc !11
  %14 = trunc i64 %13 to i32
  %15 = icmp slt i32 %14, 1
  br i1 %15, label %16, label %20

16:                                               ; preds = %7
  switch i32 %14, label %17 [
    i32 -2, label %35
    i32 0, label %35
  ]

17:                                               ; preds = %16
  %18 = sub nsw i32 0, %14
  %19 = tail call i32* @___errno_location() #3
  store i32 %18, i32* %19, align 4, !tbaa !12
  br label %35

20:                                               ; preds = %7
  store i32 %14, i32* %4, align 8, !tbaa !9
  br label %21

21:                                               ; preds = %20, %1
  %22 = phi i32 [ 0, %20 ], [ %3, %1 ]
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds %struct.__dirstream, %struct.__dirstream* %0, i64 0, i32 5, i64 %23
  %25 = bitcast i8* %24 to %struct.dirent*
  %26 = getelementptr inbounds i8, i8* %24, i64 16
  %27 = bitcast i8* %26 to i16*
  %28 = load i16, i16* %27, align 8, !tbaa !13
  %29 = zext i16 %28 to i32
  %30 = add nsw i32 %22, %29
  store i32 %30, i32* %2, align 4, !tbaa !3
  %31 = getelementptr inbounds i8, i8* %24, i64 8
  %32 = bitcast i8* %31 to i64*
  %33 = load i64, i64* %32, align 8, !tbaa !16
  %34 = getelementptr inbounds %struct.__dirstream, %struct.__dirstream* %0, i64 0, i32 0
  store i64 %33, i64* %34, align 8, !tbaa !17
  br label %35

35:                                               ; preds = %16, %16, %17, %21
  %36 = phi %struct.dirent* [ %25, %21 ], [ null, %17 ], [ null, %16 ], [ null, %16 ]
  ret %struct.dirent* %36
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind strictfp }
attributes #3 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 12}
!4 = !{!"__dirstream", !5, i64 0, !8, i64 8, !8, i64 12, !8, i64 16, !6, i64 20, !6, i64 24}
!5 = !{!"long", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"int", !6, i64 0}
!9 = !{!4, !8, i64 16}
!10 = !{!4, !8, i64 8}
!11 = !{i64 75550}
!12 = !{!8, !8, i64 0}
!13 = !{!14, !15, i64 16}
!14 = !{!"dirent", !5, i64 0, !5, i64 8, !15, i64 16, !6, i64 18, !6, i64 19}
!15 = !{!"short", !6, i64 0}
!16 = !{!14, !5, i64 8}
!17 = !{!4, !5, i64 0}
