; ModuleID = 'src/stat/__xstat.c'
source_filename = "src/stat/__xstat.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }

@__fxstat64 = weak alias i32 (i32, i32, %struct.stat*), i32 (i32, i32, %struct.stat*)* @__fxstat
@__fxstatat64 = weak alias i32 (i32, i32, i8*, %struct.stat*, i32), i32 (i32, i32, i8*, %struct.stat*, i32)* @__fxstatat
@__lxstat64 = weak alias i32 (i32, i8*, %struct.stat*), i32 (i32, i8*, %struct.stat*)* @__lxstat
@__xstat64 = weak alias i32 (i32, i8*, %struct.stat*), i32 (i32, i8*, %struct.stat*)* @__xstat

; Function Attrs: nounwind optsize strictfp
define i32 @__fxstat(i32 %0, i32 noundef %1, %struct.stat* noundef %2) #0 {
  %4 = tail call i32 @fstat(i32 noundef %1, %struct.stat* noundef %2) #2
  ret i32 %4
}

; Function Attrs: optsize
declare i32 @fstat(i32 noundef, %struct.stat* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @__fxstatat(i32 %0, i32 noundef %1, i8* noundef %2, %struct.stat* noundef %3, i32 noundef %4) #0 {
  %6 = tail call i32 @fstatat(i32 noundef %1, i8* noundef %2, %struct.stat* noundef %3, i32 noundef %4) #2
  ret i32 %6
}

; Function Attrs: optsize
declare i32 @fstatat(i32 noundef, i8* noundef, %struct.stat* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @__lxstat(i32 %0, i8* noundef %1, %struct.stat* noundef %2) #0 {
  %4 = tail call i32 @lstat(i8* noundef %1, %struct.stat* noundef %2) #2
  ret i32 %4
}

; Function Attrs: optsize
declare i32 @lstat(i8* noundef, %struct.stat* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @__xstat(i32 %0, i8* noundef %1, %struct.stat* noundef %2) #0 {
  %4 = tail call i32 @stat(i8* noundef %1, %struct.stat* noundef %2) #2
  ret i32 %4
}

; Function Attrs: optsize
declare i32 @stat(i8* noundef, %struct.stat* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @__xmknod(i32 noundef %0, i8* noundef %1, i32 noundef %2, i64* nocapture noundef readonly %3) local_unnamed_addr #0 {
  %5 = load i64, i64* %3, align 8, !tbaa !3
  %6 = tail call i32 @mknod(i8* noundef %1, i32 noundef %2, i64 noundef %5) #2
  ret i32 %6
}

; Function Attrs: optsize
declare i32 @mknod(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @__xmknodat(i32 noundef %0, i32 noundef %1, i8* noundef %2, i32 noundef %3, i64* nocapture noundef readonly %4) local_unnamed_addr #0 {
  %6 = load i64, i64* %4, align 8, !tbaa !3
  %7 = tail call i32 @mknodat(i32 noundef %1, i8* noundef %2, i32 noundef %3, i64 noundef %6) #2
  ret i32 %7
}

; Function Attrs: optsize
declare i32 @mknodat(i32 noundef, i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
