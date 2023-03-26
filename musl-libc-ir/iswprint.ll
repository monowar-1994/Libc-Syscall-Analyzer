; ModuleID = 'src/ctype/iswprint.c'
source_filename = "src/ctype/iswprint.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type opaque

@iswprint_l = weak alias i32 (i32, %struct.__locale_struct*), i32 (i32, %struct.__locale_struct*)* @__iswprint_l

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @iswprint(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp ult i32 %0, 255
  br i1 %2, label %3, label %7

3:                                                ; preds = %1
  %4 = add nuw nsw i32 %0, 1
  %5 = and i32 %4, 127
  %6 = icmp ugt i32 %5, 32
  br label %21

7:                                                ; preds = %1
  %8 = icmp ult i32 %0, 8232
  %9 = add i32 %0, -8234
  %10 = icmp ult i32 %9, 47062
  %11 = or i1 %8, %10
  %12 = add i32 %0, -57344
  %13 = icmp ult i32 %12, 8185
  %14 = or i1 %13, %11
  br i1 %14, label %21, label %15

15:                                               ; preds = %7
  %16 = add i32 %0, -65532
  %17 = icmp ult i32 %16, 1048580
  %18 = and i32 %0, 65534
  %19 = icmp ne i32 %18, 65534
  %20 = and i1 %17, %19
  br label %21

21:                                               ; preds = %15, %7, %3
  %22 = phi i1 [ %6, %3 ], [ true, %7 ], [ %20, %15 ]
  %23 = zext i1 %22 to i32
  ret i32 %23
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define i32 @__iswprint_l(i32 noundef %0, %struct.__locale_struct* nocapture readnone %1) #0 {
  %3 = tail call i32 @iswprint(i32 noundef %0) #1
  ret i32 %3
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
