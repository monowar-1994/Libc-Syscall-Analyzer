; ModuleID = 'src/stdio/fputc.c'
source_filename = "src/stdio/fputc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }

; Function Attrs: nounwind optsize strictfp
define i32 @fputc(i32 noundef %0, %struct._IO_FILE* noundef %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 19
  %4 = load volatile i32, i32* %3, align 4, !tbaa !3
  %5 = icmp slt i32 %4, 0
  br i1 %5, label %15, label %6

6:                                                ; preds = %2
  %7 = icmp eq i32 %4, 0
  br i1 %7, label %31, label %8

8:                                                ; preds = %6
  %9 = and i32 %4, -1073741825
  %10 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !10
  %11 = inttoptr i64 %10 to %struct.__pthread*
  %12 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %11, i64 0, i32 6
  %13 = load i32, i32* %12, align 8, !tbaa !11
  %14 = icmp eq i32 %9, %13
  br i1 %14, label %15, label %31

15:                                               ; preds = %8, %2
  %16 = trunc i32 %0 to i8
  %17 = and i32 %0, 255
  %18 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 20
  %19 = load i32, i32* %18, align 8, !tbaa !14
  %20 = icmp eq i32 %17, %19
  br i1 %20, label %29, label %21

21:                                               ; preds = %15
  %22 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 5
  %23 = load i8*, i8** %22, align 8, !tbaa !15
  %24 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 4
  %25 = load i8*, i8** %24, align 8, !tbaa !16
  %26 = icmp eq i8* %23, %25
  br i1 %26, label %29, label %27

27:                                               ; preds = %21
  %28 = getelementptr inbounds i8, i8* %23, i64 1
  store i8* %28, i8** %22, align 8, !tbaa !15
  store i8 %16, i8* %23, align 1, !tbaa !17
  br label %33

29:                                               ; preds = %21, %15
  %30 = tail call i32 @__overflow(%struct._IO_FILE* noundef nonnull %1, i32 noundef %17) #4
  br label %33

31:                                               ; preds = %8, %6
  %32 = tail call fastcc i32 @locking_putc(i32 noundef %0, %struct._IO_FILE* noundef nonnull %1) #4
  br label %33

33:                                               ; preds = %27, %29, %31
  %34 = phi i32 [ %32, %31 ], [ %17, %27 ], [ %30, %29 ]
  ret i32 %34
}

; Function Attrs: optsize
declare protected i32 @__overflow(%struct._IO_FILE* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: noinline nounwind optsize strictfp
define internal fastcc i32 @locking_putc(i32 noundef %0, %struct._IO_FILE* noundef %1) unnamed_addr #2 {
  %3 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 19
  %4 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %3, i32 0, i32 1073741823) #5, !srcloc !18
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %8, label %6

6:                                                ; preds = %2
  %7 = tail call i32 @__lockfile(%struct._IO_FILE* noundef %1) #4
  br label %8

8:                                                ; preds = %6, %2
  %9 = trunc i32 %0 to i8
  %10 = and i32 %0, 255
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 20
  %12 = load i32, i32* %11, align 8, !tbaa !14
  %13 = icmp eq i32 %10, %12
  br i1 %13, label %22, label %14

14:                                               ; preds = %8
  %15 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 5
  %16 = load i8*, i8** %15, align 8, !tbaa !15
  %17 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 4
  %18 = load i8*, i8** %17, align 8, !tbaa !16
  %19 = icmp eq i8* %16, %18
  br i1 %19, label %22, label %20

20:                                               ; preds = %14
  %21 = getelementptr inbounds i8, i8* %16, i64 1
  store i8* %21, i8** %15, align 8, !tbaa !15
  store i8 %9, i8* %16, align 1, !tbaa !17
  br label %24

22:                                               ; preds = %14, %8
  %23 = tail call i32 @__overflow(%struct._IO_FILE* noundef nonnull %1, i32 noundef %10) #4
  br label %24

24:                                               ; preds = %22, %20
  %25 = phi i32 [ %10, %20 ], [ %23, %22 ]
  %26 = tail call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %3, i32 0) #5, !srcloc !19
  %27 = and i32 %26, 1073741824
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %35, label %29

29:                                               ; preds = %24
  %30 = ptrtoint i32* %3 to i64
  %31 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %30, i64 129, i64 1) #5, !srcloc !20
  %32 = icmp eq i64 %31, -38
  br i1 %32, label %33, label %35

33:                                               ; preds = %29
  %34 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %30, i64 1, i64 1) #5, !srcloc !20
  br label %35

35:                                               ; preds = %33, %29, %24
  ret i32 %25
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
!10 = !{i64 238905}
!11 = !{!12, !5, i64 48}
!12 = !{!"__pthread", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !9, i64 32, !9, i64 40, !5, i64 48, !5, i64 52, !5, i64 56, !5, i64 60, !6, i64 64, !6, i64 65, !6, i64 66, !6, i64 66, !8, i64 72, !9, i64 80, !8, i64 88, !9, i64 96, !9, i64 104, !8, i64 112, !8, i64 120, !8, i64 128, !13, i64 136, !5, i64 160, !5, i64 164, !8, i64 168, !6, i64 176, !8, i64 184, !8, i64 192}
!13 = !{!"", !8, i64 0, !9, i64 8, !8, i64 16}
!14 = !{!4, !5, i64 144}
!15 = !{!4, !8, i64 40}
!16 = !{!4, !8, i64 32}
!17 = !{!6, !6, i64 0}
!18 = !{i64 235881}
!19 = !{i64 236281}
!20 = !{i64 71192}
