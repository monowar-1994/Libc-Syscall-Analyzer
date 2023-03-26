; ModuleID = 'src/legacy/ftw.c'
source_filename = "src/legacy/ftw.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.stat = type { i64, i64, i64, i32, i32, i32, i32, i64, i64, i64, i64, %struct.timespec, %struct.timespec, %struct.timespec, [3 x i64] }
%struct.timespec = type { i64, i64 }
%struct.FTW = type { i32, i32 }

@ftw64 = weak alias i32 (i8*, i32 (i8*, %struct.stat*, i32)*, i32), i32 (i8*, i32 (i8*, %struct.stat*, i32)*, i32)* @ftw

; Function Attrs: nounwind optsize strictfp
define i32 @ftw(i8* noundef %0, i32 (i8*, %struct.stat*, i32)* noundef %1, i32 noundef %2) #0 {
  %4 = bitcast i32 (i8*, %struct.stat*, i32)* %1 to i32 (i8*, %struct.stat*, i32, %struct.FTW*)*
  %5 = tail call i32 @nftw(i8* noundef %0, i32 (i8*, %struct.stat*, i32, %struct.FTW*)* noundef %4, i32 noundef %2, i32 noundef 1) #2
  ret i32 %5
}

; Function Attrs: optsize
declare i32 @nftw(i8* noundef, i32 (i8*, %struct.stat*, i32, %struct.FTW*)* noundef, i32 noundef, i32 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
