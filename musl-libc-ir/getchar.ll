; ModuleID = 'src/stdio/getchar.c'
source_filename = "src/stdio/getchar.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, {}*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }

@__stdin_FILE = external hidden global %struct._IO_FILE, align 8

; Function Attrs: nounwind optsize strictfp
define i32 @getchar() local_unnamed_addr #0 {
  %1 = load volatile i32, i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 19), align 4, !tbaa !3
  %2 = icmp slt i32 %1, 0
  br i1 %2, label %12, label %3

3:                                                ; preds = %0
  %4 = icmp eq i32 %1, 0
  br i1 %4, label %22, label %5

5:                                                ; preds = %3
  %6 = and i32 %1, -1073741825
  %7 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !10
  %8 = inttoptr i64 %7 to %struct.__pthread*
  %9 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %8, i64 0, i32 6
  %10 = load i32, i32* %9, align 8, !tbaa !11
  %11 = icmp eq i32 %6, %10
  br i1 %11, label %12, label %22

12:                                               ; preds = %5, %0
  %13 = load i8*, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 1), align 8, !tbaa !14
  %14 = load i8*, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 2), align 8, !tbaa !15
  %15 = icmp eq i8* %13, %14
  br i1 %15, label %20, label %16

16:                                               ; preds = %12
  %17 = getelementptr inbounds i8, i8* %13, i64 1
  store i8* %17, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 1), align 8, !tbaa !14
  %18 = load i8, i8* %13, align 1, !tbaa !16
  %19 = zext i8 %18 to i32
  br label %24

20:                                               ; preds = %12
  %21 = tail call i32 @__uflow(%struct._IO_FILE* noundef nonnull @__stdin_FILE) #4
  br label %24

22:                                               ; preds = %5, %3
  %23 = tail call fastcc i32 @locking_getc() #4
  br label %24

24:                                               ; preds = %16, %20, %22
  %25 = phi i32 [ %23, %22 ], [ %19, %16 ], [ %21, %20 ]
  ret i32 %25
}

; Function Attrs: optsize
declare protected i32 @__uflow(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: noinline nounwind optsize strictfp
define internal fastcc i32 @locking_getc() unnamed_addr #2 {
  %1 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 19), i32 0, i32 1073741823) #5, !srcloc !17
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %5, label %3

3:                                                ; preds = %0
  %4 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull @__stdin_FILE) #4
  br label %5

5:                                                ; preds = %3, %0
  %6 = load i8*, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 1), align 8, !tbaa !14
  %7 = load i8*, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 2), align 8, !tbaa !15
  %8 = icmp eq i8* %6, %7
  br i1 %8, label %13, label %9

9:                                                ; preds = %5
  %10 = getelementptr inbounds i8, i8* %6, i64 1
  store i8* %10, i8** getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 1), align 8, !tbaa !14
  %11 = load i8, i8* %6, align 1, !tbaa !16
  %12 = zext i8 %11 to i32
  br label %15

13:                                               ; preds = %5
  %14 = tail call i32 @__uflow(%struct._IO_FILE* noundef nonnull @__stdin_FILE) #4
  br label %15

15:                                               ; preds = %13, %9
  %16 = phi i32 [ %12, %9 ], [ %14, %13 ]
  %17 = tail call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* elementtype(i32) getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 19), i32 0) #5, !srcloc !18
  %18 = and i32 %17, 1073741824
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %25, label %20

20:                                               ; preds = %15
  %21 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 ptrtoint (i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 19) to i64), i64 129, i64 1) #5, !srcloc !19
  %22 = icmp eq i64 %21, -38
  br i1 %22, label %23, label %25

23:                                               ; preds = %20
  %24 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 ptrtoint (i32* getelementptr inbounds (%struct._IO_FILE, %struct._IO_FILE* @__stdin_FILE, i64 0, i32 19) to i64), i64 1, i64 1) #5, !srcloc !19
  br label %25

25:                                               ; preds = %23, %20, %15
  ret i32 %16
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
!10 = !{i64 238879}
!11 = !{!12, !5, i64 48}
!12 = !{!"__pthread", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !9, i64 32, !9, i64 40, !5, i64 48, !5, i64 52, !5, i64 56, !5, i64 60, !6, i64 64, !6, i64 65, !6, i64 66, !6, i64 66, !8, i64 72, !9, i64 80, !8, i64 88, !9, i64 96, !9, i64 104, !8, i64 112, !8, i64 120, !8, i64 128, !13, i64 136, !5, i64 160, !5, i64 164, !8, i64 168, !6, i64 176, !8, i64 184, !8, i64 192}
!13 = !{!"", !8, i64 0, !9, i64 8, !8, i64 16}
!14 = !{!4, !8, i64 8}
!15 = !{!4, !8, i64 16}
!16 = !{!6, !6, i64 0}
!17 = !{i64 235855}
!18 = !{i64 236255}
!19 = !{i64 71166}
