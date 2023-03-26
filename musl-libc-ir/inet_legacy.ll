; ModuleID = 'src/network/inet_legacy.c'
source_filename = "src/network/inet_legacy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @inet_network(i8* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i32 @inet_addr(i8* noundef %0) #3
  %3 = tail call i32 @ntohl(i32 noundef %2) #3
  ret i32 %3
}

; Function Attrs: optsize
declare i32 @ntohl(i32 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i32 @inet_addr(i8* noundef) local_unnamed_addr #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @inet_makeaddr(i32 noundef %0, i32 noundef %1) local_unnamed_addr #2 {
  %3 = icmp ult i32 %0, 256
  %4 = icmp ult i32 %0, 65536
  %5 = select i1 %4, i32 16, i32 8
  %6 = select i1 %3, i32 24, i32 %5
  %7 = shl i32 %0, %6
  %8 = or i32 %7, %1
  ret i32 %8
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @inet_lnaof(i32 %0) local_unnamed_addr #2 {
  %2 = icmp sgt i32 %0, -1
  %3 = icmp ult i32 %0, -1073741824
  %4 = select i1 %3, i32 65535, i32 255
  %5 = select i1 %2, i32 16777215, i32 %4
  %6 = and i32 %5, %0
  ret i32 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @inet_netof(i32 %0) local_unnamed_addr #2 {
  %2 = icmp sgt i32 %0, -1
  %3 = icmp ult i32 %0, -1073741824
  %4 = select i1 %3, i32 16, i32 8
  %5 = select i1 %2, i32 24, i32 %4
  %6 = lshr i32 %0, %5
  ret i32 %6
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
