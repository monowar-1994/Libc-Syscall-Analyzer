; ModuleID = 'src/conf/legacy.c'
source_filename = "src/conf/legacy.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @get_nprocs_conf() local_unnamed_addr #0 {
  %1 = tail call i64 @sysconf(i32 noundef 83) #2
  %2 = trunc i64 %1 to i32
  ret i32 %2
}

; Function Attrs: optsize
declare i64 @sysconf(i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @get_nprocs() local_unnamed_addr #0 {
  %1 = tail call i64 @sysconf(i32 noundef 84) #2
  %2 = trunc i64 %1 to i32
  ret i32 %2
}

; Function Attrs: nounwind optsize strictfp
define i64 @get_phys_pages() local_unnamed_addr #0 {
  %1 = tail call i64 @sysconf(i32 noundef 85) #2
  ret i64 %1
}

; Function Attrs: nounwind optsize strictfp
define i64 @get_avphys_pages() local_unnamed_addr #0 {
  %1 = tail call i64 @sysconf(i32 noundef 86) #2
  ret i64 %1
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
