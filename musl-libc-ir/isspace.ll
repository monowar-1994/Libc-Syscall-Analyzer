; ModuleID = 'src/ctype/isspace.c'
source_filename = "src/ctype/isspace.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type opaque

@isspace_l = weak alias i32 (i32, %struct.__locale_struct*), i32 (i32, %struct.__locale_struct*)* @__isspace_l

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @isspace(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp eq i32 %0, 32
  %3 = add i32 %0, -9
  %4 = icmp ult i32 %3, 5
  %5 = or i1 %2, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @__isspace_l(i32 noundef %0, %struct.__locale_struct* nocapture readnone %1) #0 {
  %3 = icmp eq i32 %0, 32
  %4 = add i32 %0, -9
  %5 = icmp ult i32 %4, 5
  %6 = or i1 %3, %5
  %7 = zext i1 %6 to i32
  ret i32 %7
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
