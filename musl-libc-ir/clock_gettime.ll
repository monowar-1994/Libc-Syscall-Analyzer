; ModuleID = 'src/time/clock_gettime.c'
source_filename = "src/time/clock_gettime.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.timespec = type { i64, i64 }

@vdso_func = internal global i8* bitcast (i32 (i32, %struct.timespec*)* @cgt_init to i8*), align 8
@.str = private unnamed_addr constant [10 x i8] c"LINUX_2.6\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"__vdso_clock_gettime\00", align 1

@clock_gettime = weak alias i32 (i32, %struct.timespec*), i32 (i32, %struct.timespec*)* @__clock_gettime

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__clock_gettime(i32 noundef %0, %struct.timespec* noundef %1) #0 {
  %3 = load volatile i8*, i8** @vdso_func, align 8, !tbaa !3
  %4 = icmp eq i8* %3, null
  br i1 %4, label %11, label %5

5:                                                ; preds = %2
  %6 = bitcast i8* %3 to i32 (i32, %struct.timespec*)*
  %7 = tail call i32 %6(i32 noundef %0, %struct.timespec* noundef %1) #2
  switch i32 %7, label %11 [
    i32 0, label %31
    i32 -22, label %8
  ]

8:                                                ; preds = %5
  %9 = tail call i64 @__syscall_ret(i64 noundef -22) #2
  %10 = trunc i64 %9 to i32
  br label %31

11:                                               ; preds = %5, %2
  %12 = sext i32 %0 to i64
  %13 = ptrtoint %struct.timespec* %1 to i64
  %14 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 228, i64 %12, i64 %13) #3, !srcloc !7
  %15 = trunc i64 %14 to i32
  %16 = icmp eq i32 %15, -38
  br i1 %16, label %17, label %25

17:                                               ; preds = %11
  %18 = icmp eq i32 %0, 0
  br i1 %18, label %19, label %25

19:                                               ; preds = %17
  %20 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 96, i64 %13, i64 0) #3, !srcloc !7
  %21 = getelementptr inbounds %struct.timespec, %struct.timespec* %1, i64 0, i32 1
  %22 = load i64, i64* %21, align 8, !tbaa !8
  %23 = mul i64 %22, 4294967296000
  %24 = ashr exact i64 %23, 32
  store i64 %24, i64* %21, align 8, !tbaa !8
  br label %31

25:                                               ; preds = %17, %11
  %26 = phi i64 [ %14, %11 ], [ -22, %17 ]
  %27 = shl i64 %26, 32
  %28 = ashr exact i64 %27, 32
  %29 = tail call i64 @__syscall_ret(i64 noundef %28) #2
  %30 = trunc i64 %29 to i32
  br label %31

31:                                               ; preds = %5, %25, %19, %8
  %32 = phi i32 [ %10, %8 ], [ 0, %19 ], [ %30, %25 ], [ %7, %5 ]
  ret i32 %32
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define internal i32 @cgt_init(i32 noundef %0, %struct.timespec* noundef %1) #0 {
  %3 = tail call i8* @__vdsosym(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i64 0, i64 0)) #2
  %4 = tail call i8* asm "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i8** nonnull elementtype(i8*) @vdso_func, i8* bitcast (i32 (i32, %struct.timespec*)* @cgt_init to i8*), i8* %3) #3, !srcloc !11
  %5 = icmp eq i8* %3, null
  br i1 %5, label %9, label %6

6:                                                ; preds = %2
  %7 = bitcast i8* %3 to i32 (i32, %struct.timespec*)*
  %8 = tail call i32 %7(i32 noundef %0, %struct.timespec* noundef %1) #2
  br label %9

9:                                                ; preds = %2, %6
  %10 = phi i32 [ %8, %6 ], [ -38, %2 ]
  ret i32 %10
}

; Function Attrs: optsize
declare hidden i8* @__vdsosym(i8* noundef, i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 83046}
!8 = !{!9, !10, i64 8}
!9 = !{!"timespec", !10, i64 0, !10, i64 8}
!10 = !{!"long", !5, i64 0}
!11 = !{i64 95888}
