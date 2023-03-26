; ModuleID = 'src/sched/affinity.c'
source_filename = "src/sched/affinity.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.cpu_set_t = type { [16 x i64] }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

; Function Attrs: nounwind optsize strictfp
define i32 @sched_setaffinity(i32 noundef %0, i64 noundef %1, %struct.cpu_set_t* noundef %2) local_unnamed_addr #0 {
  %4 = sext i32 %0 to i64
  %5 = ptrtoint %struct.cpu_set_t* %2 to i64
  %6 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 203, i64 %4, i64 %1, i64 %5) #2, !srcloc !3
  %7 = tail call i64 @__syscall_ret(i64 noundef %6) #3
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_setaffinity_np(%struct.__pthread* nocapture noundef readonly %0, i64 noundef %1, %struct.cpu_set_t* noundef %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 6
  %5 = load i32, i32* %4, align 8, !tbaa !4
  %6 = sext i32 %5 to i64
  %7 = ptrtoint %struct.cpu_set_t* %2 to i64
  %8 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 203, i64 %6, i64 %1, i64 %7) #2, !srcloc !3
  %9 = trunc i64 %8 to i32
  %10 = sub i32 0, %9
  ret i32 %10
}

; Function Attrs: nounwind optsize strictfp
define i32 @sched_getaffinity(i32 noundef %0, i64 noundef %1, %struct.cpu_set_t* noundef %2) local_unnamed_addr #0 {
  %4 = tail call fastcc i32 @do_getaffinity(i32 noundef %0, i64 noundef %1, %struct.cpu_set_t* noundef %2) #4
  %5 = sext i32 %4 to i64
  %6 = tail call i64 @__syscall_ret(i64 noundef %5) #3
  %7 = trunc i64 %6 to i32
  ret i32 %7
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @do_getaffinity(i32 noundef %0, i64 noundef %1, %struct.cpu_set_t* noundef %2) unnamed_addr #0 {
  %4 = sext i32 %0 to i64
  %5 = ptrtoint %struct.cpu_set_t* %2 to i64
  %6 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 204, i64 %4, i64 %1, i64 %5) #2, !srcloc !3
  %7 = icmp slt i64 %6, 0
  br i1 %7, label %8, label %10

8:                                                ; preds = %3
  %9 = trunc i64 %6 to i32
  br label %17

10:                                               ; preds = %3
  %11 = icmp ult i64 %6, %1
  br i1 %11, label %12, label %17

12:                                               ; preds = %10
  %13 = bitcast %struct.cpu_set_t* %2 to i8*
  %14 = getelementptr inbounds i8, i8* %13, i64 %6
  %15 = sub i64 %1, %6
  %16 = tail call i8* @memset(i8* noundef %14, i32 noundef 0, i64 noundef %15) #3
  br label %17

17:                                               ; preds = %10, %12, %8
  %18 = phi i32 [ %9, %8 ], [ 0, %12 ], [ 0, %10 ]
  ret i32 %18
}

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_getaffinity_np(%struct.__pthread* nocapture noundef readonly %0, i64 noundef %1, %struct.cpu_set_t* noundef %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 6
  %5 = load i32, i32* %4, align 8, !tbaa !4
  %6 = tail call fastcc i32 @do_getaffinity(i32 noundef %5, i64 noundef %1, %struct.cpu_set_t* noundef %2) #4
  %7 = sub nsw i32 0, %6
  ret i32 %7
}

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind strictfp }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 249082}
!4 = !{!5, !10, i64 48}
!5 = !{!"__pthread", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !9, i64 32, !9, i64 40, !10, i64 48, !10, i64 52, !10, i64 56, !10, i64 60, !7, i64 64, !7, i64 65, !7, i64 66, !7, i64 66, !6, i64 72, !9, i64 80, !6, i64 88, !9, i64 96, !9, i64 104, !6, i64 112, !6, i64 120, !6, i64 128, !11, i64 136, !10, i64 160, !10, i64 164, !6, i64 168, !7, i64 176, !6, i64 184, !6, i64 192}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"long", !7, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!"", !6, i64 0, !9, i64 8, !6, i64 16}
