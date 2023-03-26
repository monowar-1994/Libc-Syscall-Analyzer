; ModuleID = 'src/multibyte/mbrlen.c'
source_filename = "src/multibyte/mbrlen.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__mbstate_t = type { i32, i32 }

@mbrlen.internal = internal global i32 0, align 4

; Function Attrs: nounwind optsize strictfp
define i64 @mbrlen(i8* noalias noundef %0, i64 noundef %1, %struct.__mbstate_t* noalias noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq %struct.__mbstate_t* %2, null
  %5 = select i1 %4, %struct.__mbstate_t* bitcast (i32* @mbrlen.internal to %struct.__mbstate_t*), %struct.__mbstate_t* %2
  %6 = tail call i64 @mbrtowc(i32* noundef null, i8* noundef %0, i64 noundef %1, %struct.__mbstate_t* noundef %5) #2
  ret i64 %6
}

; Function Attrs: optsize
declare i64 @mbrtowc(i32* noundef, i8* noundef, i64 noundef, %struct.__mbstate_t* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
