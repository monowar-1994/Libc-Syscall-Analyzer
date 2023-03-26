; ModuleID = 'src/stdio/ext.c'
source_filename = "src/stdio/ext.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, {}*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@fpurge = weak alias i32 (%struct._IO_FILE*), i32 (%struct._IO_FILE*)* @__fpurge

; Function Attrs: nounwind optsize strictfp
define void @_flushlbf() local_unnamed_addr #0 {
  %1 = tail call i32 @fflush(%struct._IO_FILE* noundef null) #5
  ret void
}

; Function Attrs: optsize
declare i32 @fflush(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @__fsetlocking(%struct._IO_FILE* nocapture noundef readnone %0, i32 noundef %1) local_unnamed_addr #2 {
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i32 @__fwriting(%struct._IO_FILE* nocapture noundef readonly %0) local_unnamed_addr #3 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %3 = load i32, i32* %2, align 8, !tbaa !3
  %4 = and i32 %3, 4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %11

6:                                                ; preds = %1
  %7 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  %8 = load i8*, i8** %7, align 8, !tbaa !10
  %9 = icmp ne i8* %8, null
  %10 = zext i1 %9 to i32
  br label %11

11:                                               ; preds = %6, %1
  %12 = phi i32 [ 1, %1 ], [ %10, %6 ]
  ret i32 %12
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i32 @__freading(%struct._IO_FILE* nocapture noundef readonly %0) local_unnamed_addr #3 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %3 = load i32, i32* %2, align 8, !tbaa !3
  %4 = and i32 %3, 8
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %11

6:                                                ; preds = %1
  %7 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  %8 = load i8*, i8** %7, align 8, !tbaa !11
  %9 = icmp ne i8* %8, null
  %10 = zext i1 %9 to i32
  br label %11

11:                                               ; preds = %6, %1
  %12 = phi i32 [ 1, %1 ], [ %10, %6 ]
  ret i32 %12
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i32 @__freadable(%struct._IO_FILE* nocapture noundef readonly %0) local_unnamed_addr #3 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %3 = load i32, i32* %2, align 8, !tbaa !3
  %4 = lshr i32 %3, 2
  %5 = and i32 %4, 1
  %6 = xor i32 %5, 1
  ret i32 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i32 @__fwritable(%struct._IO_FILE* nocapture noundef readonly %0) local_unnamed_addr #3 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %3 = load i32, i32* %2, align 8, !tbaa !3
  %4 = lshr i32 %3, 3
  %5 = and i32 %4, 1
  %6 = xor i32 %5, 1
  ret i32 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i32 @__flbf(%struct._IO_FILE* nocapture noundef readonly %0) local_unnamed_addr #3 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 20
  %3 = load i32, i32* %2, align 8, !tbaa !12
  %4 = xor i32 %3, -1
  %5 = lshr i32 %4, 31
  ret i32 %5
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i64 @__fbufsize(%struct._IO_FILE* nocapture noundef readonly %0) local_unnamed_addr #3 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 12
  %3 = load i64, i64* %2, align 8, !tbaa !13
  ret i64 %3
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn
define i64 @__fpending(%struct._IO_FILE* nocapture noundef readonly %0) local_unnamed_addr #3 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  %3 = load i8*, i8** %2, align 8, !tbaa !10
  %4 = icmp eq i8* %3, null
  br i1 %4, label %13, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  %7 = load i8*, i8** %6, align 8, !tbaa !14
  %8 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  %9 = load i8*, i8** %8, align 8, !tbaa !15
  %10 = ptrtoint i8* %7 to i64
  %11 = ptrtoint i8* %9 to i64
  %12 = sub i64 %10, %11
  br label %13

13:                                               ; preds = %1, %5
  %14 = phi i64 [ %12, %5 ], [ 0, %1 ]
  ret i64 %14
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly
define i32 @__fpurge(%struct._IO_FILE* nocapture noundef writeonly %0) #4 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  %3 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  store i8* null, i8** %3, align 8, !tbaa !15
  %4 = bitcast i8** %2 to <2 x i8*>*
  store <2 x i8*> zeroinitializer, <2 x i8*>* %4, align 8, !tbaa !16
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %6 = bitcast i8** %5 to <2 x i8*>*
  store <2 x i8*> zeroinitializer, <2 x i8*>* %6, align 8, !tbaa !16
  ret i32 0
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind optsize readonly strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn writeonly "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !8, i64 32}
!11 = !{!4, !8, i64 16}
!12 = !{!4, !5, i64 144}
!13 = !{!4, !9, i64 96}
!14 = !{!4, !8, i64 40}
!15 = !{!4, !8, i64 56}
!16 = !{!8, !8, i64 0}
