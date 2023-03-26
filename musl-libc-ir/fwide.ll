; ModuleID = 'src/stdio/fwide.c'
source_filename = "src/stdio/fwide.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }

@__c_locale = external hidden constant %struct.__locale_struct, align 8
@__c_dot_utf8_locale = external hidden constant %struct.__locale_struct, align 8

; Function Attrs: nounwind optsize strictfp
define i32 @fwide(%struct._IO_FILE* noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %4 = load volatile i32, i32* %3, align 4, !tbaa !3
  %5 = icmp sgt i32 %4, -1
  br i1 %5, label %6, label %8

6:                                                ; preds = %2
  %7 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %0) #2
  br label %8

8:                                                ; preds = %2, %6
  %9 = phi i32 [ %7, %6 ], [ 0, %2 ]
  %10 = icmp eq i32 %1, 0
  br i1 %10, label %11, label %14

11:                                               ; preds = %8
  %12 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 18
  %13 = load i32, i32* %12, align 8, !tbaa !10
  br label %34

14:                                               ; preds = %8
  %15 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 30
  %16 = load %struct.__locale_struct*, %struct.__locale_struct** %15, align 8, !tbaa !11
  %17 = icmp eq %struct.__locale_struct* %16, null
  br i1 %17, label %18, label %27

18:                                               ; preds = %14
  %19 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !12
  %20 = inttoptr i64 %19 to %struct.__pthread*
  %21 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %20, i64 0, i32 24
  %22 = load %struct.__locale_struct*, %struct.__locale_struct** %21, align 8, !tbaa !13
  %23 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %22, i64 0, i32 0, i64 0
  %24 = load %struct.__locale_map*, %struct.__locale_map** %23, align 8, !tbaa !16
  %25 = icmp eq %struct.__locale_map* %24, null
  %26 = select i1 %25, %struct.__locale_struct* @__c_locale, %struct.__locale_struct* @__c_dot_utf8_locale
  store %struct.__locale_struct* %26, %struct.__locale_struct** %15, align 8, !tbaa !11
  br label %27

27:                                               ; preds = %18, %14
  %28 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 18
  %29 = load i32, i32* %28, align 8, !tbaa !10
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %34

31:                                               ; preds = %27
  %32 = icmp slt i32 %1, 1
  %33 = select i1 %32, i32 -1, i32 1
  store i32 %33, i32* %28, align 8, !tbaa !10
  br label %34

34:                                               ; preds = %11, %27, %31
  %35 = phi i32 [ %13, %11 ], [ %29, %27 ], [ %33, %31 ]
  %36 = icmp eq i32 %9, 0
  br i1 %36, label %38, label %37

37:                                               ; preds = %34
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %0) #2
  br label %38

38:                                               ; preds = %37, %34
  ret i32 %35
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nounwind readnone strictfp }

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
!10 = !{!4, !5, i64 136}
!11 = !{!4, !8, i64 224}
!12 = !{i64 272315}
!13 = !{!14, !8, i64 168}
!14 = !{!"__pthread", !8, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !9, i64 32, !9, i64 40, !5, i64 48, !5, i64 52, !5, i64 56, !5, i64 60, !6, i64 64, !6, i64 65, !6, i64 66, !6, i64 66, !8, i64 72, !9, i64 80, !8, i64 88, !9, i64 96, !9, i64 104, !8, i64 112, !8, i64 120, !8, i64 128, !15, i64 136, !5, i64 160, !5, i64 164, !8, i64 168, !6, i64 176, !8, i64 184, !8, i64 192}
!15 = !{!"", !8, i64 0, !9, i64 8, !8, i64 16}
!16 = !{!8, !8, i64 0}
