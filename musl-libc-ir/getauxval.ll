; ModuleID = 'src/misc/getauxval.c'
source_filename = "src/misc/getauxval.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8

@getauxval = weak alias i64 (i64), i64 (i64)* @__getauxval

; Function Attrs: nofree nosync nounwind optsize strictfp
define hidden i64 @__getauxval(i64 noundef %0) #0 {
  %2 = load i64*, i64** getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 5), align 8, !tbaa !3
  %3 = icmp eq i64 %0, 23
  br i1 %3, label %7, label %4

4:                                                ; preds = %1
  %5 = load i64, i64* %2, align 8, !tbaa !11
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %21, label %10

7:                                                ; preds = %1
  %8 = load i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 2), align 2, !tbaa !12
  %9 = sext i8 %8 to i64
  br label %23

10:                                               ; preds = %4, %17
  %11 = phi i64 [ %19, %17 ], [ %5, %4 ]
  %12 = phi i64* [ %18, %17 ], [ %2, %4 ]
  %13 = icmp eq i64 %11, %0
  br i1 %13, label %14, label %17

14:                                               ; preds = %10
  %15 = getelementptr inbounds i64, i64* %12, i64 1
  %16 = load i64, i64* %15, align 8, !tbaa !11
  br label %23

17:                                               ; preds = %10
  %18 = getelementptr inbounds i64, i64* %12, i64 2
  %19 = load i64, i64* %18, align 8, !tbaa !11
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %21, label %10

21:                                               ; preds = %17, %4
  %22 = tail call i32* @___errno_location() #2
  store i32 2, i32* %22, align 4, !tbaa !13
  br label %23

23:                                               ; preds = %21, %14, %7
  %24 = phi i64 [ %9, %7 ], [ %16, %14 ], [ 0, %21 ]
  ret i64 %24
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

attributes #0 = { nofree nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 8}
!4 = !{!"__libc", !5, i64 0, !5, i64 1, !5, i64 2, !5, i64 3, !7, i64 4, !8, i64 8, !8, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !10, i64 56}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!"int", !5, i64 0}
!8 = !{!"any pointer", !5, i64 0}
!9 = !{!"long", !5, i64 0}
!10 = !{!"__locale_struct", !5, i64 0}
!11 = !{!9, !9, i64 0}
!12 = !{!4, !5, i64 2}
!13 = !{!7, !7, i64 0}
