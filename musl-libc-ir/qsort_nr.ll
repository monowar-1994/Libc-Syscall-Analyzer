; ModuleID = 'src/stdlib/qsort_nr.c'
source_filename = "src/stdlib/qsort_nr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define void @qsort(i8* noundef %0, i64 noundef %1, i64 noundef %2, i32 (i8*, i8*)* noundef %3) local_unnamed_addr #0 {
  %5 = bitcast i32 (i8*, i8*)* %3 to i8*
  tail call void @__qsort_r(i8* noundef %0, i64 noundef %1, i64 noundef %2, i32 (i8*, i8*, i8*)* noundef nonnull @wrapper_cmp, i8* noundef %5) #2
  ret void
}

; Function Attrs: optsize
declare hidden void @__qsort_r(i8* noundef, i64 noundef, i64 noundef, i32 (i8*, i8*, i8*)* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define internal i32 @wrapper_cmp(i8* noundef %0, i8* noundef %1, i8* nocapture noundef readonly %2) #0 {
  %4 = bitcast i8* %2 to i32 (i8*, i8*)*
  %5 = tail call i32 %4(i8* noundef %0, i8* noundef %1) #2
  ret i32 %5
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
