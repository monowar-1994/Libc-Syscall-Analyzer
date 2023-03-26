; ModuleID = 'src/network/inet_ntoa.c'
source_filename = "src/network/inet_ntoa.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@inet_ntoa.buf = internal global [16 x i8] zeroinitializer, align 16
@.str = private unnamed_addr constant [12 x i8] c"%d.%d.%d.%d\00", align 1

; Function Attrs: nounwind optsize strictfp
define i8* @inet_ntoa(i32 %0) local_unnamed_addr #0 {
  %2 = lshr i32 %0, 8
  %3 = lshr i32 %0, 16
  %4 = lshr i32 %0, 24
  %5 = and i32 %0, 255
  %6 = and i32 %2, 255
  %7 = and i32 %3, 255
  %8 = tail call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @inet_ntoa.buf, i64 0, i64 0), i64 noundef 16, i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i64 0, i64 0), i32 noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %4) #2
  ret i8* getelementptr inbounds ([16 x i8], [16 x i8]* @inet_ntoa.buf, i64 0, i64 0)
}

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
