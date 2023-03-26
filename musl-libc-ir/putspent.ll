; ModuleID = 'src/passwd/putspent.c'
source_filename = "src/passwd/putspent.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.spwd = type { i8*, i8*, i64, i64, i64, i64, i64, i64, i64 }
%struct._IO_FILE = type opaque

@.str = private unnamed_addr constant [49 x i8] c"%s:%s:%.*ld:%.*ld:%.*ld:%.*ld:%.*ld:%.*ld:%.*lu\0A\00", align 1
@.str.1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

; Function Attrs: nounwind optsize strictfp
define i32 @putspent(%struct.spwd* nocapture noundef readonly %0, %struct._IO_FILE* noundef %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.spwd, %struct.spwd* %0, i64 0, i32 0
  %4 = load i8*, i8** %3, align 8, !tbaa !3
  %5 = icmp eq i8* %4, null
  %6 = select i1 %5, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0), i8* %4
  %7 = getelementptr inbounds %struct.spwd, %struct.spwd* %0, i64 0, i32 1
  %8 = load i8*, i8** %7, align 8, !tbaa !9
  %9 = icmp eq i8* %8, null
  %10 = select i1 %9, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.1, i64 0, i64 0), i8* %8
  %11 = getelementptr inbounds %struct.spwd, %struct.spwd* %0, i64 0, i32 2
  %12 = load i64, i64* %11, align 8, !tbaa !10
  %13 = icmp eq i64 %12, -1
  %14 = select i1 %13, i64 0, i64 %12
  %15 = getelementptr inbounds %struct.spwd, %struct.spwd* %0, i64 0, i32 3
  %16 = load i64, i64* %15, align 8, !tbaa !11
  %17 = icmp eq i64 %16, -1
  %18 = select i1 %17, i64 0, i64 %16
  %19 = getelementptr inbounds %struct.spwd, %struct.spwd* %0, i64 0, i32 4
  %20 = load i64, i64* %19, align 8, !tbaa !12
  %21 = icmp eq i64 %20, -1
  %22 = select i1 %21, i64 0, i64 %20
  %23 = getelementptr inbounds %struct.spwd, %struct.spwd* %0, i64 0, i32 5
  %24 = load i64, i64* %23, align 8, !tbaa !13
  %25 = icmp eq i64 %24, -1
  %26 = select i1 %25, i64 0, i64 %24
  %27 = getelementptr inbounds %struct.spwd, %struct.spwd* %0, i64 0, i32 6
  %28 = load i64, i64* %27, align 8, !tbaa !14
  %29 = icmp eq i64 %28, -1
  %30 = select i1 %29, i64 0, i64 %28
  %31 = getelementptr inbounds %struct.spwd, %struct.spwd* %0, i64 0, i32 7
  %32 = load i64, i64* %31, align 8, !tbaa !15
  %33 = icmp eq i64 %32, -1
  %34 = select i1 %33, i64 0, i64 %32
  %35 = getelementptr inbounds %struct.spwd, %struct.spwd* %0, i64 0, i32 8
  %36 = load i64, i64* %35, align 8, !tbaa !16
  %37 = icmp eq i64 %36, -1
  %38 = select i1 %37, i64 0, i64 %36
  %39 = xor i1 %37, true
  %40 = sext i1 %39 to i32
  %41 = xor i1 %33, true
  %42 = sext i1 %41 to i32
  %43 = xor i1 %29, true
  %44 = sext i1 %43 to i32
  %45 = xor i1 %25, true
  %46 = sext i1 %45 to i32
  %47 = xor i1 %21, true
  %48 = sext i1 %47 to i32
  %49 = xor i1 %17, true
  %50 = sext i1 %49 to i32
  %51 = xor i1 %13, true
  %52 = sext i1 %51 to i32
  %53 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* noundef %1, i8* noundef getelementptr inbounds ([49 x i8], [49 x i8]* @.str, i64 0, i64 0), i8* noundef %6, i8* noundef %10, i32 noundef %52, i64 noundef %14, i32 noundef %50, i64 noundef %18, i32 noundef %48, i64 noundef %22, i32 noundef %46, i64 noundef %26, i32 noundef %44, i64 noundef %30, i32 noundef %42, i64 noundef %34, i32 noundef %40, i64 noundef %38) #2
  %54 = ashr i32 %53, 31
  ret i32 %54
}

; Function Attrs: optsize
declare i32 @fprintf(%struct._IO_FILE* noundef, i8* noundef, ...) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"spwd", !5, i64 0, !5, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!4, !5, i64 8}
!10 = !{!4, !8, i64 16}
!11 = !{!4, !8, i64 24}
!12 = !{!4, !8, i64 32}
!13 = !{!4, !8, i64 40}
!14 = !{!4, !8, i64 48}
!15 = !{!4, !8, i64 56}
!16 = !{!4, !8, i64 64}
