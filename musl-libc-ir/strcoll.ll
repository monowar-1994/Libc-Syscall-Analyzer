; ModuleID = 'src/locale/strcoll.c'
source_filename = "src/locale/strcoll.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }

@strcoll_l = weak alias i32 (i8*, i8*, %struct.__locale_struct*), i32 (i8*, i8*, %struct.__locale_struct*)* @__strcoll_l

; Function Attrs: nounwind optsize strictfp
define i32 @__strcoll_l(i8* noundef %0, i8* noundef %1, %struct.__locale_struct* nocapture readnone %2) #0 {
  %4 = tail call i32 @strcmp(i8* noundef %0, i8* noundef %1) #2
  ret i32 %4
}

; Function Attrs: optsize
declare i32 @strcmp(i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @strcoll(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !3
  %4 = tail call i32 @strcmp(i8* noundef %0, i8* noundef %1) #2
  ret i32 %4
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nounwind readnone strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 263928}
