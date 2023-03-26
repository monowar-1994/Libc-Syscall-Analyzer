; ModuleID = 'src/stdio/getc.c'
source_filename = "src/stdio/getc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, {}*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }

@_IO_getc = weak alias i32 (%struct._IO_FILE*), i32 (%struct._IO_FILE*)* @getc

; Function Attrs: nounwind optsize strictfp
define i32 @getc(%struct._IO_FILE* noundef %0) #0 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %3 = load volatile i32, i32* %2, align 4, !tbaa !3
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %14, label %5

5:                                                ; preds = %1
  %6 = icmp eq i32 %3, 0
  br i1 %6, label %26, label %7

7:                                                ; preds = %5
  %8 = and i32 %3, -1073741825
  %9 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !10
  %10 = inttoptr i64 %9 to %struct.__pthread*
  %11 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %10, i64 0, i32 6
  %12 = load i32, i32* %11, align 8, !tbaa !11
  %13 = icmp eq i32 %8, %12
  br i1 %13, label %14, label %26

14:                                               ; preds = %7, %1
  %15 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %16 = load i8*, i8** %15, align 8, !tbaa !14
  %17 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  %18 = load i8*, i8** %17, align 8, !tbaa !15
  %19 = icmp eq i8* %16, %18
  br i1 %19, label %24, label %20

20:                                               ; preds = %14
  %21 = getelementptr inbounds i8, i8* %16, i64 1
  store i8* %21, i8** %15, align 8, !tbaa !14
  %22 = load i8, i8* %16, align 1, !tbaa !16
  %23 = zext i8 %22 to i32
  br label %28

24:                                               ; preds = %14
  %25 = tail call i32 @__uflow(%struct._IO_FILE* noundef nonnull %0) #4
  br label %28

26:                                               ; preds = %7, %5
  %27 = tail call fastcc i32 @locking_getc(%struct._IO_FILE* noundef nonnull %0) #4
  br label %28

28:                                               ; preds = %20, %24, %26
  %29 = phi i32 [ %27, %26 ], [ %23, %20 ], [ %25, %24 ]
  ret i32 %29
}

; Function Attrs: optsize
declare protected i32 @__uflow(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: noinline nounwind optsize strictfp
define internal fastcc i32 @locking_getc(%struct._IO_FILE* noundef %0) unnamed_addr #2 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %3 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %2, i32 0, i32 1073741823) #5, !srcloc !17
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %7, label %5

5:                                                ; preds = %1
  %6 = tail call i32 @__lockfile(%struct._IO_FILE* noundef %0) #4
  br label %7

7:                                                ; preds = %5, %1
  %8 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %9 = load i8*, i8** %8, align 8, !tbaa !14
  %10 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  %11 = load i8*, i8** %10, align 8, !tbaa !15
  %12 = icmp eq i8* %9, %11
  br i1 %12, label %17, label %13

13:                                               ; preds = %7
  %14 = getelementptr inbounds i8, i8* %9, i64 1
  store i8* %14, i8** %8, align 8, !tbaa !14
  %15 = load i8, i8* %9, align 1, !tbaa !16
  %16 = zext i8 %15 to i32
  br label %19

17:                                               ; preds = %7
  %18 = tail call i32 @__uflow(%struct._IO_FILE* noundef nonnull %0) #4
  br label %19

19:                                               ; preds = %17, %13
  %20 = phi i32 [ %16, %13 ], [ %18, %17 ]
  %21 = tail call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %2, i32 0) #5, !srcloc !18
  %22 = and i32 %21, 1073741824
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %30, label %24

24:                                               ; preds = %19
  %25 = ptrtoint i32* %2 to i64
  %26 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %25, i64 129, i64 1) #5, !srcloc !19
  %27 = icmp eq i64 %26, -38
  br i1 %27, label %28, label %30

28:                                               ; preds = %24
  %29 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %25, i64 1, i64 1) #5, !srcloc !19
  br label %30

30:                                               ; preds = %28, %24, %19
  ret i32 %20
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noinline nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readnone strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 140}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{i64 238904}
!11 = !{!12, !5, i64 48}
!12 = !{!"__pthread", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !9, i64 32, !9, i64 40, !5, i64 48, !5, i64 52, !5, i64 56, !5, i64 60, !6, i64 64, !6, i64 65, !6, i64 66, !6, i64 66, !8, i64 72, !9, i64 80, !8, i64 88, !9, i64 96, !9, i64 104, !8, i64 112, !8, i64 120, !8, i64 128, !13, i64 136, !5, i64 160, !5, i64 164, !8, i64 168, !6, i64 176, !8, i64 184, !8, i64 192}
!13 = !{!"", !8, i64 0, !9, i64 8, !8, i64 16}
!14 = !{!4, !8, i64 8}
!15 = !{!4, !8, i64 16}
!16 = !{!6, !6, i64 0}
!17 = !{i64 235880}
!18 = !{i64 236280}
!19 = !{i64 71191}
