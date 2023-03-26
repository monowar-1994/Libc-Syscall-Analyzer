; ModuleID = 'src/stdio/fputwc.c'
source_filename = "src/stdio/fputwc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }

@fputwc_unlocked = weak alias i32 (i32, %struct._IO_FILE*), i32 (i32, %struct._IO_FILE*)* @__fputwc_unlocked
@putwc_unlocked = weak alias i32 (i32, %struct._IO_FILE*), i32 (i32, %struct._IO_FILE*)* @__fputwc_unlocked

; Function Attrs: nounwind optsize strictfp
define i32 @__fputwc_unlocked(i32 noundef %0, %struct._IO_FILE* noundef %1) #0 {
  %3 = alloca [4 x i8], align 1
  %4 = getelementptr inbounds [4 x i8], [4 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #3
  %5 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !3
  %6 = inttoptr i64 %5 to %struct.__pthread*
  %7 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %6, i64 0, i32 24
  %8 = load %struct.__locale_struct*, %struct.__locale_struct** %7, align 8, !tbaa !4
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 18
  %10 = load i32, i32* %9, align 8, !tbaa !8
  %11 = icmp slt i32 %10, 1
  br i1 %11, label %12, label %14

12:                                               ; preds = %2
  %13 = tail call i32 @fwide(%struct._IO_FILE* noundef nonnull %1, i32 noundef 1) #5
  br label %14

14:                                               ; preds = %12, %2
  %15 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 30
  %16 = load %struct.__locale_struct*, %struct.__locale_struct** %15, align 8, !tbaa !12
  store %struct.__locale_struct* %16, %struct.__locale_struct** %7, align 8, !tbaa !4
  %17 = icmp ult i32 %0, 128
  br i1 %17, label %18, label %33

18:                                               ; preds = %14
  %19 = trunc i32 %0 to i8
  %20 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 20
  %21 = load i32, i32* %20, align 8, !tbaa !13
  %22 = icmp eq i32 %21, %0
  br i1 %22, label %31, label %23

23:                                               ; preds = %18
  %24 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 5
  %25 = load i8*, i8** %24, align 8, !tbaa !14
  %26 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 4
  %27 = load i8*, i8** %26, align 8, !tbaa !15
  %28 = icmp eq i8* %25, %27
  br i1 %28, label %31, label %29

29:                                               ; preds = %23
  %30 = getelementptr inbounds i8, i8* %25, i64 1
  store i8* %30, i8** %24, align 8, !tbaa !14
  store i8 %19, i8* %25, align 1, !tbaa !16
  br label %61

31:                                               ; preds = %23, %18
  %32 = tail call i32 @__overflow(%struct._IO_FILE* noundef nonnull %1, i32 noundef %0) #5
  br label %54

33:                                               ; preds = %14
  %34 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 5
  %35 = load i8*, i8** %34, align 8, !tbaa !14
  %36 = getelementptr inbounds i8, i8* %35, i64 4
  %37 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 4
  %38 = load i8*, i8** %37, align 8, !tbaa !15
  %39 = icmp ult i8* %36, %38
  br i1 %39, label %40, label %47

40:                                               ; preds = %33
  %41 = tail call i32 @wctomb(i8* noundef %35, i32 noundef %0) #5
  %42 = icmp slt i32 %41, 0
  br i1 %42, label %57, label %43

43:                                               ; preds = %40
  %44 = load i8*, i8** %34, align 8, !tbaa !14
  %45 = zext i32 %41 to i64
  %46 = getelementptr inbounds i8, i8* %44, i64 %45
  store i8* %46, i8** %34, align 8, !tbaa !14
  br label %54

47:                                               ; preds = %33
  %48 = call i32 @wctomb(i8* noundef nonnull %4, i32 noundef %0) #5
  %49 = icmp slt i32 %48, 0
  br i1 %49, label %57, label %50

50:                                               ; preds = %47
  %51 = zext i32 %48 to i64
  %52 = call i64 @__fwritex(i8* noundef nonnull %4, i64 noundef %51, %struct._IO_FILE* noundef nonnull %1) #5
  %53 = icmp ult i64 %52, %51
  br i1 %53, label %57, label %54

54:                                               ; preds = %31, %43, %50
  %55 = phi i32 [ %0, %43 ], [ %0, %50 ], [ %32, %31 ]
  %56 = icmp eq i32 %55, -1
  br i1 %56, label %57, label %61

57:                                               ; preds = %47, %50, %40, %54
  %58 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 0
  %59 = load i32, i32* %58, align 8, !tbaa !17
  %60 = or i32 %59, 32
  store i32 %60, i32* %58, align 8, !tbaa !17
  br label %61

61:                                               ; preds = %29, %57, %54
  %62 = phi i32 [ -1, %57 ], [ %55, %54 ], [ %0, %29 ]
  store %struct.__locale_struct* %8, %struct.__locale_struct** %7, align 8, !tbaa !4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #3
  ret i32 %62
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @fwide(%struct._IO_FILE* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare protected i32 @__overflow(%struct._IO_FILE* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @wctomb(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i64 @__fwritex(i8* noundef, i64 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define i32 @fputwc(i32 noundef %0, %struct._IO_FILE* noundef %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 19
  %4 = load volatile i32, i32* %3, align 4, !tbaa !18
  %5 = icmp sgt i32 %4, -1
  br i1 %5, label %8, label %6

6:                                                ; preds = %2
  %7 = tail call i32 @__fputwc_unlocked(i32 noundef %0, %struct._IO_FILE* noundef nonnull %1) #6
  br label %13

8:                                                ; preds = %2
  %9 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %1) #5
  %10 = icmp eq i32 %9, 0
  %11 = tail call i32 @__fputwc_unlocked(i32 noundef %0, %struct._IO_FILE* noundef nonnull %1) #6
  br i1 %10, label %13, label %12

12:                                               ; preds = %8
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %1) #5
  br label %13

13:                                               ; preds = %6, %12, %8
  %14 = phi i32 [ %7, %6 ], [ %11, %12 ], [ %11, %8 ]
  ret i32 %14
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nounwind readnone strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 253647}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !10, i64 136}
!9 = !{!"_IO_FILE", !10, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48, !5, i64 56, !5, i64 64, !5, i64 72, !5, i64 80, !5, i64 88, !11, i64 96, !5, i64 104, !5, i64 112, !10, i64 120, !10, i64 124, !11, i64 128, !10, i64 136, !10, i64 140, !10, i64 144, !5, i64 152, !11, i64 160, !5, i64 168, !5, i64 176, !5, i64 184, !11, i64 192, !11, i64 200, !5, i64 208, !5, i64 216, !5, i64 224}
!10 = !{!"int", !6, i64 0}
!11 = !{!"long", !6, i64 0}
!12 = !{!9, !5, i64 224}
!13 = !{!9, !10, i64 144}
!14 = !{!9, !5, i64 40}
!15 = !{!9, !5, i64 32}
!16 = !{!6, !6, i64 0}
!17 = !{!9, !10, i64 0}
!18 = !{!9, !10, i64 140}
