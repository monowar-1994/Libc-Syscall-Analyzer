; ModuleID = 'src/signal/sigaltstack.c'
source_filename = "src/signal/sigaltstack.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sigaltstack = type { i8*, i32, i64 }

; Function Attrs: nounwind optsize strictfp
define i32 @sigaltstack(%struct.sigaltstack* noalias noundef %0, %struct.sigaltstack* noalias noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq %struct.sigaltstack* %0, null
  br i1 %3, label %20, label %4

4:                                                ; preds = %2
  %5 = getelementptr inbounds %struct.sigaltstack, %struct.sigaltstack* %0, i64 0, i32 1
  %6 = load i32, i32* %5, align 8, !tbaa !3
  %7 = and i32 %6, 2
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %15

9:                                                ; preds = %4
  %10 = getelementptr inbounds %struct.sigaltstack, %struct.sigaltstack* %0, i64 0, i32 2
  %11 = load i64, i64* %10, align 8, !tbaa !10
  %12 = icmp ult i64 %11, 2048
  br i1 %12, label %13, label %15

13:                                               ; preds = %9
  %14 = tail call i32* @___errno_location() #3
  store i32 12, i32* %14, align 4, !tbaa !11
  br label %26

15:                                               ; preds = %9, %4
  %16 = and i32 %6, 1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %20, label %18

18:                                               ; preds = %15
  %19 = tail call i32* @___errno_location() #3
  store i32 22, i32* %19, align 4, !tbaa !11
  br label %26

20:                                               ; preds = %15, %2
  %21 = ptrtoint %struct.sigaltstack* %0 to i64
  %22 = ptrtoint %struct.sigaltstack* %1 to i64
  %23 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 131, i64 %21, i64 %22) #4, !srcloc !12
  %24 = tail call i64 @__syscall_ret(i64 noundef %23) #5
  %25 = trunc i64 %24 to i32
  br label %26

26:                                               ; preds = %20, %18, %13
  %27 = phi i32 [ -1, %18 ], [ %25, %20 ], [ -1, %13 ]
  ret i32 %27
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !8, i64 8}
!4 = !{!"sigaltstack", !5, i64 0, !8, i64 8, !9, i64 16}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"int", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!4, !9, i64 16}
!11 = !{!8, !8, i64 0}
!12 = !{i64 72465}
