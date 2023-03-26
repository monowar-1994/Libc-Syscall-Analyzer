; ModuleID = 'src/stdio/__lockfile.c'
source_filename = "src/stdio/__lockfile.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, {}*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__lockfile(%struct._IO_FILE* noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %3 = load volatile i32, i32* %2, align 4, !tbaa !3
  %4 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !10
  %5 = inttoptr i64 %4 to %struct.__pthread*
  %6 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %5, i64 0, i32 6
  %7 = load i32, i32* %6, align 8, !tbaa !11
  %8 = and i32 %3, -1073741825
  %9 = icmp eq i32 %8, %7
  br i1 %9, label %36, label %10

10:                                               ; preds = %1
  %11 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %2, i32 0, i32 %7) #2, !srcloc !14
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %36, label %13

13:                                               ; preds = %10
  %14 = or i32 %7, 1073741824
  %15 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %2, i32 0, i32 %14) #2, !srcloc !14
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %36, label %17

17:                                               ; preds = %13
  %18 = ptrtoint i32* %2 to i64
  br label %19

19:                                               ; preds = %17, %33
  %20 = phi i32 [ %15, %17 ], [ %34, %33 ]
  %21 = and i32 %20, 1073741824
  %22 = icmp eq i32 %21, 0
  %23 = or i32 %20, 1073741824
  br i1 %22, label %24, label %27

24:                                               ; preds = %19
  %25 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %2, i32 %20, i32 %23) #2, !srcloc !14
  %26 = icmp eq i32 %25, %20
  br i1 %26, label %27, label %33

27:                                               ; preds = %19, %24
  %28 = sext i32 %23 to i64
  %29 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %18, i64 128, i64 %28, i64 0) #2, !srcloc !15
  %30 = icmp eq i64 %29, -38
  br i1 %30, label %31, label %33

31:                                               ; preds = %27
  %32 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %18, i64 0, i64 %28, i64 0) #2, !srcloc !15
  br label %33

33:                                               ; preds = %31, %27, %24
  %34 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %2, i32 0, i32 %14) #2, !srcloc !14
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %19

36:                                               ; preds = %33, %13, %10, %1
  %37 = phi i32 [ 0, %1 ], [ 1, %10 ], [ 1, %13 ], [ 1, %33 ]
  ret i32 %37
}

; Function Attrs: nounwind optsize strictfp
define hidden void @__unlockfile(%struct._IO_FILE* noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %3 = tail call i32 asm sideeffect "xchg $0, $1", "=r,=*m,0,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %2, i32 0) #2, !srcloc !16
  %4 = and i32 %3, 1073741824
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %12, label %6

6:                                                ; preds = %1
  %7 = ptrtoint i32* %2 to i64
  %8 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %7, i64 129, i64 1) #2, !srcloc !17
  %9 = icmp eq i64 %8, -38
  br i1 %9, label %10, label %12

10:                                               ; preds = %6
  %11 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 202, i64 %7, i64 1, i64 1) #2, !srcloc !17
  br label %12

12:                                               ; preds = %10, %6, %1
  ret void
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind readnone strictfp }
attributes #2 = { nounwind strictfp }

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
!10 = !{i64 238865}
!11 = !{!12, !5, i64 48}
!12 = !{!"__pthread", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !9, i64 32, !9, i64 40, !5, i64 48, !5, i64 52, !5, i64 56, !5, i64 60, !6, i64 64, !6, i64 65, !6, i64 66, !6, i64 66, !8, i64 72, !9, i64 80, !8, i64 88, !9, i64 96, !9, i64 104, !8, i64 112, !8, i64 120, !8, i64 128, !13, i64 136, !5, i64 160, !5, i64 164, !8, i64 168, !6, i64 176, !8, i64 184, !8, i64 192}
!13 = !{!"", !8, i64 0, !9, i64 8, !8, i64 16}
!14 = !{i64 235841}
!15 = !{i64 71422}
!16 = !{i64 236241}
!17 = !{i64 71152}
