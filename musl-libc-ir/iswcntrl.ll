; ModuleID = 'src/ctype/iswcntrl.c'
source_filename = "src/ctype/iswcntrl.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type opaque

@iswcntrl_l = weak alias i32 (i32, %struct.__locale_struct*), i32 (i32, %struct.__locale_struct*)* @__iswcntrl_l

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @iswcntrl(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp ult i32 %0, 32
  %3 = add i32 %0, -127
  %4 = icmp ult i32 %3, 33
  %5 = or i1 %2, %4
  %6 = and i32 %0, -2
  %7 = icmp eq i32 %6, 8232
  %8 = or i1 %7, %5
  %9 = add i32 %0, -65529
  %10 = icmp ult i32 %9, 3
  %11 = or i1 %10, %8
  %12 = zext i1 %11 to i32
  ret i32 %12
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @__iswcntrl_l(i32 noundef %0, %struct.__locale_struct* nocapture readnone %1) #0 {
  %3 = icmp ult i32 %0, 32
  %4 = add i32 %0, -127
  %5 = icmp ult i32 %4, 33
  %6 = or i1 %3, %5
  %7 = and i32 %0, -2
  %8 = icmp eq i32 %7, 8232
  %9 = or i1 %8, %6
  %10 = add i32 %0, -65529
  %11 = icmp ult i32 %10, 3
  %12 = or i1 %11, %9
  %13 = zext i1 %12 to i32
  ret i32 %13
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
