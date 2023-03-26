; ModuleID = 'src/stdio/putchar.c'
source_filename = "src/stdio/putchar.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }

@__stdout_FILE = external hidden global %struct._IO_FILE, align 8

; Function Attrs: nounwind optsize strictfp
define i32 @putchar(i32 noundef %0) local_unnamed_addr #0 {
  %2 = load volatile i32, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 19), align 4, !tbaa !3
  %3 = icmp slt i32 %2, 0
  br i1 %3, label %13, label %4

4:                                                ; preds = %1
  %5 = icmp eq i32 %2, 0
  br i1 %5, label %26, label %6

6:                                                ; preds = %4
  %7 = and i32 %2, -1073741825
  %8 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !10
  %9 = inttoptr i64 %8 to %struct.__pthread*
  %10 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %9, i64 0, i32 6
  %11 = load i32, i32* %10, align 8, !tbaa !11
  %12 = icmp eq i32 %7, %11
  br i1 %12, label %13, label %26

13:                                               ; preds = %6, %1
  %14 = trunc i32 %0 to i8
  %15 = and i32 %0, 255
  %16 = load i32, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 20), align 8, !tbaa !14
  %17 = icmp eq i32 %15, %16
  br i1 %17, label %24, label %18

18:                                               ; preds = %13
  %19 = load i8*, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 5), align 8, !tbaa !15
  %20 = load i8*, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 4), align 8, !tbaa !16
  %21 = icmp eq i8* %19, %20
  br i1 %21, label %24, label %22

22:                                               ; preds = %18
  %23 = getelementptr inbounds i8, i8* %19, i64 1
  store i8* %23, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 5), align 8, !tbaa !15
  store i8 %14, i8* %19, align 1, !tbaa !17
  br label %28

24:                                               ; preds = %18, %13
  %25 = tail call i32 @__overflow(%struct._IO_FILE* noundef nonnull @__stdout_FILE, i32 noundef %15) #4
  br label %28

26:                                               ; preds = %6, %4
  %27 = tail call fastcc i32 @locking_putc(i32 noundef %0) #4
  br label %28

28:                                               ; preds = %22, %24, %26
  %29 = phi i32 [ %27, %26 ], [ %15, %22 ], [ %25, %24 ]
  ret i32 %29
}

; Function Attrs: optsize
declare protected i32 @__overflow(%struct._IO_FILE* noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: noinline nounwind optsize strictfp
define internal fastcc i32 @locking_putc(i32 noundef %0) unnamed_addr #2 {
  %2 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 19), i32 0, i32 1073741823) #5, !srcloc !18
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %6, label %4

4:                                                ; preds = %1
  %5 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull @__stdout_FILE) #4
  br label %6

6:                                                ; preds = %4, %1
  %7 = trunc i32 %0 to i8
  %8 = and i32 %0, 255
  %9 = load i32, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 20), align 8, !tbaa !14
  %10 = icmp eq i32 %8, %9
  br i1 %10, label %17, label %11

11:                                               ; preds = %6
  %12 = load i8*, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 5), align 8, !tbaa !15
  %13 = load i8*, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 4), align 8, !tbaa !16
  %14 = icmp eq i8* %12, %13
  br i1 %14, label %17, label %15

15:                                               ; preds = %11
  %16 = getelementptr inbounds i8, i8* %12, i64 1
  store i8* %16, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 5), align 8, !tbaa !15
  store i8 %7, i8* %12, align 1, !tbaa !17
  br label %19

17:                                               ; preds = %11, %6
  %18 = tail call i32 @__overflow(%struct._IO_FILE* noundef nonnull @__stdout_FILE, i32 noundef %8) #4
  br label %19

19:                                               ; preds = %17, %15
  %20 = phi i32 [ %8, %15 ], [ %18, %17 ]
  %21 = tail call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 19), i32 0) #5, !srcloc !19
  %22 = and i32 %21, 1073741824
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %29, label %24

24:                                               ; preds = %19
  %25 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 ptrtoint (i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 19) to i64), i64 129, i64 1) #5, !srcloc !20
  %26 = icmp eq i64 %25, -38
  br i1 %26, label %27, label %29

27:                                               ; preds = %24
  %28 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 ptrtoint (i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdout_FILE, i64 0, i32 19) to i64), i64 1, i64 1) #5, !srcloc !20
  br label %29

29:                                               ; preds = %27, %24, %19
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
!10 = !{i64 238903}
!11 = !{!12, !5, i64 48}
!12 = !{!"__pthread", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !9, i64 32, !9, i64 40, !5, i64 48, !5, i64 52, !5, i64 56, !5, i64 60, !6, i64 64, !6, i64 65, !6, i64 66, !6, i64 66, !8, i64 72, !9, i64 80, !8, i64 88, !9, i64 96, !9, i64 104, !8, i64 112, !8, i64 120, !8, i64 128, !13, i64 136, !5, i64 160, !5, i64 164, !8, i64 168, !6, i64 176, !8, i64 184, !8, i64 192}
!13 = !{!"", !8, i64 0, !9, i64 8, !8, i64 16}
!14 = !{!4, !5, i64 144}
!15 = !{!4, !8, i64 40}
!16 = !{!4, !8, i64 32}
!17 = !{!6, !6, i64 0}
!18 = !{i64 235879}
!19 = !{i64 236279}
!20 = !{i64 71190}
