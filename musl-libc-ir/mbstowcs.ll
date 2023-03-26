; ModuleID = 'src/multibyte/mbstowcs.c'
source_filename = "src/multibyte/mbstowcs.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__mbstate_t = type { i32, i32 }

; Function Attrs: nounwind optsize strictfp
define i64 @mbstowcs(i32* noalias noundef %0, i8* noalias noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = alloca i8*, align 8
  store i8* %1, i8** %4, align 8, !tbaa !3
  %5 = call i64 @mbsrtowcs(i32* noundef %0, i8** noundef nonnull %4, i64 noundef %2, %struct.__mbstate_t* noundef null) #2
  ret i64 %5
}

; Function Attrs: optsize
declare i64 @mbsrtowcs(i32* noundef, i8** noundef, i64 noundef, %struct.__mbstate_t* noundef) local_unnamed_addr #1

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
