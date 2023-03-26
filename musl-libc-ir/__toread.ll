; ModuleID = 'src/stdio/__toread.c'
source_filename = "src/stdio/__toread.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, {}*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__toread(%struct._IO_FILE* noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 18
  %3 = load i32, i32* %2, align 8, !tbaa !3
  %4 = add nsw i32 %3, -1
  %5 = or i32 %4, %3
  store i32 %5, i32* %2, align 8, !tbaa !3
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  %7 = load i8*, i8** %6, align 8, !tbaa !10
  %8 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  %9 = load i8*, i8** %8, align 8, !tbaa !11
  %10 = icmp eq i8* %7, %9
  br i1 %10, label %15, label %11

11:                                               ; preds = %1
  %12 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 9
  %13 = load i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)** %12, align 8, !tbaa !12
  %14 = tail call i64 %13(%struct._IO_FILE* noundef nonnull %0, i8* noundef null, i64 noundef 0) #2
  br label %15

15:                                               ; preds = %11, %1
  %16 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  store i8* null, i8** %8, align 8, !tbaa !11
  %17 = bitcast i8** %16 to <2 x i8*>*
  store <2 x i8*> zeroinitializer, <2 x i8*>* %17, align 8, !tbaa !13
  %18 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %19 = load i32, i32* %18, align 8, !tbaa !14
  %20 = and i32 %19, 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %24, label %22

22:                                               ; preds = %15
  %23 = or i32 %19, 32
  store i32 %23, i32* %18, align 8, !tbaa !14
  br label %34

24:                                               ; preds = %15
  %25 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %26 = load i8*, i8** %25, align 8, !tbaa !15
  %27 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 12
  %28 = load i64, i64* %27, align 8, !tbaa !16
  %29 = getelementptr inbounds i8, i8* %26, i64 %28
  %30 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  store i8* %29, i8** %30, align 8, !tbaa !17
  %31 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  store i8* %29, i8** %31, align 8, !tbaa !18
  %32 = shl i32 %19, 27
  %33 = ashr i32 %32, 31
  br label %34

34:                                               ; preds = %24, %22
  %35 = phi i32 [ -1, %22 ], [ %33, %24 ]
  ret i32 %35
}

; Function Attrs: nounwind optsize strictfp
define hidden void @__toread_needs_stdio_exit() local_unnamed_addr #0 {
  tail call void @__stdio_exit_needed() #2
  ret void
}

; Function Attrs: optsize
declare hidden void @__stdio_exit_needed() local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 136}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 40}
!11 = !{!4, !8, i64 56}
!12 = !{!4, !8, i64 72}
!13 = !{!8, !8, i64 0}
!14 = !{!4, !5, i64 0}
!15 = !{!4, !8, i64 88}
!16 = !{!4, !9, i64 96}
!17 = !{!4, !8, i64 16}
!18 = !{!4, !8, i64 8}
