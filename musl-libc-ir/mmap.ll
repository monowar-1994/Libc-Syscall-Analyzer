; ModuleID = 'src/mman/mmap.c'
source_filename = "src/mman/mmap.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__vm_wait = weak hidden alias void (), void ()* @dummy
@mmap = weak alias i8* (i8*, i64, i32, i32, i32, i64), i8* (i8*, i64, i32, i32, i32, i64)* @__mmap
@mmap64 = weak alias i8* (i8*, i64, i32, i32, i32, i64), i8* (i8*, i64, i32, i32, i32, i64)* @__mmap

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn
define internal void @dummy() #0 {
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden i8* @__mmap(i8* noundef %0, i64 noundef %1, i32 noundef %2, i32 noundef %3, i32 noundef %4, i64 noundef %5) #1 {
  %7 = and i64 %5, 4095
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %11, label %9

9:                                                ; preds = %6
  %10 = tail call i32* @___errno_location() #4
  store i32 22, i32* %10, align 4, !tbaa !3
  br label %35

11:                                               ; preds = %6
  %12 = icmp ugt i64 %1, 9223372036854775806
  br i1 %12, label %13, label %15

13:                                               ; preds = %11
  %14 = tail call i32* @___errno_location() #4
  store i32 12, i32* %14, align 4, !tbaa !3
  br label %35

15:                                               ; preds = %11
  %16 = and i32 %3, 16
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %19, label %18

18:                                               ; preds = %15
  tail call void @__vm_wait() #5
  br label %19

19:                                               ; preds = %18, %15
  %20 = phi i64 [ -1, %18 ], [ -12, %15 ]
  %21 = ptrtoint i8* %0 to i64
  %22 = sext i32 %2 to i64
  %23 = sext i32 %3 to i64
  %24 = sext i32 %4 to i64
  %25 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},{r9},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 9, i64 %21, i64 %1, i64 %22, i64 %23, i64 %24, i64 %5) #6, !srcloc !7
  %26 = icmp ne i64 %25, -1
  %27 = icmp ne i8* %0, null
  %28 = or i1 %27, %26
  %29 = and i32 %3, 32
  %30 = icmp eq i32 %29, 0
  %31 = select i1 %30, i64 -1, i64 %20
  %32 = select i1 %28, i64 %25, i64 %31
  %33 = tail call i64 @__syscall_ret(i64 noundef %32) #5
  %34 = inttoptr i64 %33 to i8*
  br label %35

35:                                               ; preds = %19, %13, %9
  %36 = phi i8* [ inttoptr (i64 -1 to i8*), %9 ], [ inttoptr (i64 -1 to i8*), %13 ], [ %34, %19 ]
  ret i8* %36
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #3

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize readnone strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 123078}
