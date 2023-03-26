; ModuleID = 'src/linux/eventfd.c'
source_filename = "src/linux/eventfd.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define i32 @eventfd(i32 noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = zext i32 %0 to i64
  %4 = sext i32 %1 to i64
  %5 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 290, i64 %3, i64 %4) #2, !srcloc !3
  %6 = trunc i64 %5 to i32
  %7 = icmp ne i32 %6, -38
  %8 = icmp ne i32 %1, 0
  %9 = or i1 %8, %7
  br i1 %9, label %12, label %10

10:                                               ; preds = %2
  %11 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 284, i64 %3) #2, !srcloc !4
  br label %12

12:                                               ; preds = %10, %2
  %13 = phi i64 [ %5, %2 ], [ %11, %10 ]
  %14 = shl i64 %13, 32
  %15 = ashr exact i64 %14, 32
  %16 = tail call i64 @__syscall_ret(i64 noundef %15) #3
  %17 = trunc i64 %16 to i32
  ret i32 %17
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @eventfd_read(i32 noundef %0, i64* noundef %1) local_unnamed_addr #0 {
  %3 = bitcast i64* %1 to i8*
  %4 = tail call i64 @read(i32 noundef %0, i8* noundef %3, i64 noundef 8) #3
  %5 = icmp ne i64 %4, 8
  %6 = sext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: optsize
declare i64 @read(i32 noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @eventfd_write(i32 noundef %0, i64 noundef %1) local_unnamed_addr #0 {
  %3 = alloca i64, align 8
  store i64 %1, i64* %3, align 8, !tbaa !5
  %4 = bitcast i64* %3 to i8*
  %5 = call i64 @write(i32 noundef %0, i8* noundef nonnull %4, i64 noundef 8) #3
  %6 = icmp ne i64 %5, 8
  %7 = sext i1 %6 to i32
  ret i32 %7
}

; Function Attrs: optsize
declare i64 @write(i32 noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind strictfp }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 107218}
!4 = !{i64 107032}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
