; ModuleID = 'src/dirent/alphasort.c'
source_filename = "src/dirent/alphasort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.dirent = type { i64, i64, i16, i8, [256 x i8] }

@alphasort64 = weak alias i32 (%struct.dirent**, %struct.dirent**), i32 (%struct.dirent**, %struct.dirent**)* @alphasort

; Function Attrs: nounwind optsize strictfp
define i32 @alphasort(%struct.dirent** nocapture noundef readonly %0, %struct.dirent** nocapture noundef readonly %1) #0 {
  %3 = load %struct.dirent*, %struct.dirent** %0, align 8, !tbaa !3
  %4 = getelementptr inbounds %struct.dirent, %struct.dirent* %3, i64 0, i32 4, i64 0
  %5 = load %struct.dirent*, %struct.dirent** %1, align 8, !tbaa !3
  %6 = getelementptr inbounds %struct.dirent, %struct.dirent* %5, i64 0, i32 4, i64 0
  %7 = tail call i32 @strcoll(i8* noundef nonnull %4, i8* noundef nonnull %6) #2
  ret i32 %7
}

; Function Attrs: optsize
declare i32 @strcoll(i8* noundef, i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
