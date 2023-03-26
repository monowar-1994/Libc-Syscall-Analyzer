; ModuleID = 'src/network/res_send.c'
source_filename = "src/network/res_send.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@res_send = weak alias i32 (i8*, i32, i8*, i32), i32 (i8*, i32, i8*, i32)* @__res_send

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__res_send(i8* noundef %0, i32 noundef %1, i8* noundef %2, i32 noundef %3) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  store i8* %0, i8** %5, align 8, !tbaa !3
  store i32 %1, i32* %6, align 4, !tbaa !7
  store i8* %2, i8** %7, align 8, !tbaa !3
  store i32 %3, i32* %8, align 4, !tbaa !7
  %9 = call i32 @__res_msend(i32 noundef 1, i8** noundef nonnull %5, i32* noundef nonnull %6, i8** noundef nonnull %7, i32* noundef nonnull %8, i32 noundef %3) #2
  %10 = icmp sgt i32 %9, -1
  %11 = load i32, i32* %8, align 4
  %12 = icmp ne i32 %11, 0
  %13 = select i1 %10, i1 %12, i1 false
  %14 = select i1 %13, i32 %11, i32 -1
  ret i32 %14
}

; Function Attrs: optsize
declare hidden i32 @__res_msend(i32 noundef, i8** noundef, i32* noundef, i8** noundef, i32* noundef, i32 noundef) local_unnamed_addr #1

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
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
