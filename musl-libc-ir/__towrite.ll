; ModuleID = 'src/stdio/__towrite.c'
source_filename = "src/stdio/__towrite.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, {}*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define hidden i32 @__towrite(%struct._IO_FILE* nocapture noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 18
  %3 = load i32, i32* %2, align 8, !tbaa !3
  %4 = add nsw i32 %3, -1
  %5 = or i32 %4, %3
  store i32 %5, i32* %2, align 8, !tbaa !3
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %7 = load i32, i32* %6, align 8, !tbaa !10
  %8 = and i32 %7, 8
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %12, label %10

10:                                               ; preds = %1
  %11 = or i32 %7, 32
  store i32 %11, i32* %6, align 8, !tbaa !10
  br label %23

12:                                               ; preds = %1
  %13 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %14 = bitcast i8** %13 to <2 x i8*>*
  store <2 x i8*> zeroinitializer, <2 x i8*>* %14, align 8, !tbaa !11
  %15 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %16 = load i8*, i8** %15, align 8, !tbaa !12
  %17 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  store i8* %16, i8** %17, align 8, !tbaa !13
  %18 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  store i8* %16, i8** %18, align 8, !tbaa !14
  %19 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 12
  %20 = load i64, i64* %19, align 8, !tbaa !15
  %21 = getelementptr inbounds i8, i8* %16, i64 %20
  %22 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  store i8* %21, i8** %22, align 8, !tbaa !16
  br label %23

23:                                               ; preds = %12, %10
  %24 = phi i32 [ -1, %10 ], [ 0, %12 ]
  ret i32 %24
}

; Function Attrs: nounwind optsize strictfp
define hidden void @__towrite_needs_stdio_exit() local_unnamed_addr #1 {
  tail call void @__stdio_exit_needed() #3
  ret void
}

; Function Attrs: optsize
declare hidden void @__stdio_exit_needed() local_unnamed_addr #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

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
!10 = !{!4, !5, i64 0}
!11 = !{!8, !8, i64 0}
!12 = !{!4, !8, i64 88}
!13 = !{!4, !8, i64 56}
!14 = !{!4, !8, i64 40}
!15 = !{!4, !9, i64 96}
!16 = !{!4, !8, i64 32}
