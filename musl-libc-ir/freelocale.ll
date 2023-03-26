; ModuleID = 'src/locale/freelocale.c'
source_filename = "src/locale/freelocale.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }

@__freelocale = weak alias void (%struct.__locale_struct*), void (%struct.__locale_struct*)* @freelocale

; Function Attrs: nounwind optsize strictfp
define void @freelocale(%struct.__locale_struct* noundef %0) #0 {
  %2 = tail call i32 @__loc_is_allocated(%struct.__locale_struct* noundef %0) #2
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %6, label %4

4:                                                ; preds = %1
  %5 = bitcast %struct.__locale_struct* %0 to i8*
  tail call void @__libc_free(i8* noundef %5) #2
  br label %6

6:                                                ; preds = %4, %1
  ret void
}

; Function Attrs: optsize
declare hidden i32 @__loc_is_allocated(%struct.__locale_struct* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__libc_free(i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
