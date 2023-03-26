; ModuleID = 'src/locale/strxfrm.c'
source_filename = "src/locale/strxfrm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }

@strxfrm_l = weak alias i64 (i8*, i8*, i64, %struct.__locale_struct*), i64 (i8*, i8*, i64, %struct.__locale_struct*)* @__strxfrm_l

; Function Attrs: nounwind optsize strictfp
define i64 @__strxfrm_l(i8* noalias noundef %0, i8* noalias noundef %1, i64 noundef %2, %struct.__locale_struct* nocapture readnone %3) #0 {
  %5 = tail call i64 @strlen(i8* noundef %1) #2
  %6 = icmp ult i64 %5, %2
  br i1 %6, label %7, label %9

7:                                                ; preds = %4
  %8 = tail call i8* @strcpy(i8* noundef %0, i8* noundef %1) #2
  br label %9

9:                                                ; preds = %7, %4
  ret i64 %5
}

; Function Attrs: optsize
declare i64 @strlen(i8* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @strcpy(i8* noundef, i8* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i64 @strxfrm(i8* noalias noundef %0, i8* noalias noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !3
  %5 = tail call i64 @strlen(i8* noundef %1) #2, !noalias !4
  %6 = icmp ult i64 %5, %2
  br i1 %6, label %7, label %9

7:                                                ; preds = %3
  %8 = tail call i8* @strcpy(i8* noundef %0, i8* noundef %1) #2
  br label %9

9:                                                ; preds = %3, %7
  ret i64 %5
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
!3 = !{i64 264075}
!4 = !{!5}
!5 = distinct !{!5, !6, !"__strxfrm_l: argument 0"}
!6 = distinct !{!6, !"__strxfrm_l"}
