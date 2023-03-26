; ModuleID = 'src/stdio/ftrylockfile.c'
source_filename = "src/stdio/ftrylockfile.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }

; Function Attrs: nounwind optsize strictfp
define hidden void @__do_orphaned_stdio_locks() local_unnamed_addr #0 {
  %1 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #2, !srcloc !3
  %2 = inttoptr i64 %1 to %struct.__pthread*
  %3 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %2, i64 0, i32 27
  %4 = bitcast i8** %3 to %struct._IO_FILE**
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8, !tbaa !4
  %6 = icmp eq %struct._IO_FILE* %5, null
  br i1 %6, label %13, label %7

7:                                                ; preds = %0, %7
  %8 = phi %struct._IO_FILE* [ %11, %7 ], [ %5, %0 ]
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %8, i64 0, i32 19
  tail call void asm sideeffect "mov $1, $0 ; lock ; orl $$0,(%rsp)", "=*m,r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %9, i32 1073741824) #3, !srcloc !8
  %10 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %8, i64 0, i32 29
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8, !tbaa !4
  %12 = icmp eq %struct._IO_FILE* %11, null
  br i1 %12, label %13, label %7

13:                                               ; preds = %7, %0
  ret void
}

; Function Attrs: nounwind optsize strictfp
define hidden void @__unlist_locked_file(%struct._IO_FILE* nocapture noundef readonly %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 17
  %3 = load i64, i64* %2, align 8, !tbaa !9
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %26, label %5

5:                                                ; preds = %1
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 29
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8, !tbaa !13
  %8 = icmp eq %struct._IO_FILE* %7, null
  br i1 %8, label %13, label %9

9:                                                ; preds = %5
  %10 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 28
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** %10, align 8, !tbaa !14
  %12 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %7, i64 0, i32 28
  store %struct._IO_FILE* %11, %struct._IO_FILE** %12, align 8, !tbaa !14
  br label %13

13:                                               ; preds = %9, %5
  %14 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 28
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** %14, align 8, !tbaa !14
  %16 = icmp eq %struct._IO_FILE* %15, null
  br i1 %16, label %19, label %17

17:                                               ; preds = %13
  %18 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %15, i64 0, i32 29
  br label %24

19:                                               ; preds = %13
  %20 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #2, !srcloc !3
  %21 = inttoptr i64 %20 to %struct.__pthread*
  %22 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %21, i64 0, i32 27
  %23 = bitcast i8** %22 to %struct._IO_FILE**
  br label %24

24:                                               ; preds = %19, %17
  %25 = phi %struct._IO_FILE** [ %18, %17 ], [ %23, %19 ]
  store %struct._IO_FILE* %7, %struct._IO_FILE** %25, align 8, !tbaa !4
  br label %26

26:                                               ; preds = %24, %1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define hidden void @__register_locked_file(%struct._IO_FILE* noundef %0, %struct.__pthread* nocapture noundef %1) local_unnamed_addr #1 {
  %3 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 17
  store i64 1, i64* %3, align 8, !tbaa !9
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 28
  store %struct._IO_FILE* null, %struct._IO_FILE** %4, align 8, !tbaa !14
  %5 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %1, i64 0, i32 27
  %6 = bitcast i8** %5 to %struct._IO_FILE**
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8, !tbaa !15
  %8 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 29
  store %struct._IO_FILE* %7, %struct._IO_FILE** %8, align 8, !tbaa !13
  %9 = icmp eq %struct._IO_FILE* %7, null
  br i1 %9, label %12, label %10

10:                                               ; preds = %2
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %7, i64 0, i32 28
  store %struct._IO_FILE* %0, %struct._IO_FILE** %11, align 8, !tbaa !14
  br label %12

12:                                               ; preds = %10, %2
  store %struct._IO_FILE* %0, %struct._IO_FILE** %6, align 8, !tbaa !15
  ret void
}

; Function Attrs: nounwind optsize strictfp
define i32 @ftrylockfile(%struct._IO_FILE* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #2, !srcloc !3
  %3 = inttoptr i64 %2 to %struct.__pthread*
  %4 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %3, i64 0, i32 6
  %5 = load i32, i32* %4, align 8, !tbaa !18
  %6 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %7 = load volatile i32, i32* %6, align 4, !tbaa !19
  %8 = and i32 %7, -1073741825
  %9 = icmp eq i32 %8, %5
  br i1 %9, label %10, label %16

10:                                               ; preds = %1
  %11 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 17
  %12 = load i64, i64* %11, align 8, !tbaa !9
  %13 = icmp eq i64 %12, 9223372036854775807
  br i1 %13, label %35, label %14

14:                                               ; preds = %10
  %15 = add nsw i64 %12, 1
  store i64 %15, i64* %11, align 8, !tbaa !9
  br label %35

16:                                               ; preds = %1
  %17 = icmp slt i32 %7, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %16
  store volatile i32 0, i32* %6, align 4, !tbaa !19
  br label %21

19:                                               ; preds = %16
  %20 = icmp eq i32 %7, 0
  br i1 %20, label %21, label %35

21:                                               ; preds = %18, %19
  %22 = tail call i32 asm sideeffect "lock ; cmpxchg $3, $1", "={ax},=*m,{ax},r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32* nonnull elementtype(i32) %6, i32 0, i32 %5) #3, !srcloc !20
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %35

24:                                               ; preds = %21
  %25 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 17
  store i64 1, i64* %25, align 8, !tbaa !9
  %26 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 28
  store %struct._IO_FILE* null, %struct._IO_FILE** %26, align 8, !tbaa !14
  %27 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %3, i64 0, i32 27
  %28 = bitcast i8** %27 to %struct._IO_FILE**
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** %28, align 8, !tbaa !15
  %30 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 29
  store %struct._IO_FILE* %29, %struct._IO_FILE** %30, align 8, !tbaa !13
  %31 = icmp eq %struct._IO_FILE* %29, null
  br i1 %31, label %34, label %32

32:                                               ; preds = %24
  %33 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %29, i64 0, i32 28
  store %struct._IO_FILE* %0, %struct._IO_FILE** %33, align 8, !tbaa !14
  br label %34

34:                                               ; preds = %24, %32
  store %struct._IO_FILE* %0, %struct._IO_FILE** %28, align 8, !tbaa !15
  br label %35

35:                                               ; preds = %19, %21, %10, %34, %14
  %36 = phi i32 [ 0, %14 ], [ 0, %34 ], [ -1, %10 ], [ -1, %21 ], [ -1, %19 ]
  ret i32 %36
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind readnone strictfp }
attributes #3 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 239357}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{i64 238043}
!9 = !{!10, !12, i64 128}
!10 = !{!"_IO_FILE", !11, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48, !5, i64 56, !5, i64 64, !5, i64 72, !5, i64 80, !5, i64 88, !12, i64 96, !5, i64 104, !5, i64 112, !11, i64 120, !11, i64 124, !12, i64 128, !11, i64 136, !11, i64 140, !11, i64 144, !5, i64 152, !12, i64 160, !5, i64 168, !5, i64 176, !5, i64 184, !12, i64 192, !12, i64 200, !5, i64 208, !5, i64 216, !5, i64 224}
!11 = !{!"int", !6, i64 0}
!12 = !{!"long", !6, i64 0}
!13 = !{!10, !5, i64 216}
!14 = !{!10, !5, i64 208}
!15 = !{!16, !5, i64 192}
!16 = !{!"__pthread", !5, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !12, i64 32, !12, i64 40, !11, i64 48, !11, i64 52, !11, i64 56, !11, i64 60, !6, i64 64, !6, i64 65, !6, i64 66, !6, i64 66, !5, i64 72, !12, i64 80, !5, i64 88, !12, i64 96, !12, i64 104, !5, i64 112, !5, i64 120, !5, i64 128, !17, i64 136, !11, i64 160, !11, i64 164, !5, i64 168, !6, i64 176, !5, i64 184, !5, i64 192}
!17 = !{!"", !5, i64 0, !12, i64 8, !5, i64 16}
!18 = !{!16, !11, i64 48}
!19 = !{!10, !11, i64 140}
!20 = !{i64 236333}
