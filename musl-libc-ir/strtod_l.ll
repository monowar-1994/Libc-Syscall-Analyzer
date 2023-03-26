; ModuleID = 'src/locale/strtod_l.c'
source_filename = "src/locale/strtod_l.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type opaque

@__strtof_l = weak alias float (i8*, i8**, %struct.__locale_struct*), float (i8*, i8**, %struct.__locale_struct*)* @strtof_l
@__strtod_l = weak alias double (i8*, i8**, %struct.__locale_struct*), double (i8*, i8**, %struct.__locale_struct*)* @strtod_l
@__strtold_l = weak alias x86_fp80 (i8*, i8**, %struct.__locale_struct*), x86_fp80 (i8*, i8**, %struct.__locale_struct*)* @strtold_l

; Function Attrs: nounwind optsize strictfp
define float @strtof_l(i8* noalias noundef %0, i8** noalias noundef %1, %struct.__locale_struct* nocapture readnone %2) #0 {
  %4 = tail call float @strtof(i8* noundef %0, i8** noundef %1) #2
  ret float %4
}

; Function Attrs: optsize
declare float @strtof(i8* noundef, i8** noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define double @strtod_l(i8* noalias noundef %0, i8** noalias noundef %1, %struct.__locale_struct* nocapture readnone %2) #0 {
  %4 = tail call double @strtod(i8* noundef %0, i8** noundef %1) #2
  ret double %4
}

; Function Attrs: optsize
declare double @strtod(i8* noundef, i8** noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define x86_fp80 @strtold_l(i8* noalias noundef %0, i8** noalias noundef %1, %struct.__locale_struct* nocapture readnone %2) #0 {
  %4 = tail call x86_fp80 @strtold(i8* noundef %0, i8** noundef %1) #2
  ret x86_fp80 %4
}

; Function Attrs: optsize
declare x86_fp80 @strtold(i8* noundef, i8** noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
