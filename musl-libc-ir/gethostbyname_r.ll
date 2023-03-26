; ModuleID = 'src/network/gethostbyname_r.c'
source_filename = "src/network/gethostbyname_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.hostent = type { i8*, i8**, i32, i32, i8** }

; Function Attrs: nounwind optsize strictfp
define i32 @gethostbyname_r(i8* noundef %0, %struct.hostent* noundef %1, i8* noundef %2, i64 noundef %3, %struct.hostent** noundef %4, i32* noundef %5) local_unnamed_addr #0 {
  %7 = tail call i32 @gethostbyname2_r(i8* noundef %0, i32 noundef 2, %struct.hostent* noundef %1, i8* noundef %2, i64 noundef %3, %struct.hostent** noundef %4, i32* noundef %5) #2
  ret i32 %7
}

; Function Attrs: optsize
declare i32 @gethostbyname2_r(i8* noundef, i32 noundef, %struct.hostent* noundef, i8* noundef, i64 noundef, %struct.hostent** noundef, i32* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
