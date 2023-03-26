; ModuleID = 'src/stdio/ungetwc.c'
source_filename = "src/stdio/ungetwc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__mbstate_t = type { i32, i32 }

; Function Attrs: nounwind optsize strictfp
define i32 @ungetwc(i32 noundef %0, %struct._IO_FILE* noundef %1) local_unnamed_addr #0 {
  %3 = alloca [4 x i8], align 1
  %4 = getelementptr inbounds [4 x i8], [4 x i8]* %3, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %4) #3
  %5 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !3
  %6 = inttoptr i64 %5 to %struct.__pthread*
  %7 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %6, i64 0, i32 24
  %8 = load %struct.__locale_struct*, %struct.__locale_struct** %7, align 8, !tbaa !4
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 19
  %10 = load volatile i32, i32* %9, align 4, !tbaa !8
  %11 = icmp sgt i32 %10, -1
  br i1 %11, label %12, label %14

12:                                               ; preds = %2
  %13 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %1) #5
  br label %14

14:                                               ; preds = %2, %12
  %15 = phi i32 [ %13, %12 ], [ 0, %2 ]
  %16 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 18
  %17 = load i32, i32* %16, align 8, !tbaa !12
  %18 = icmp slt i32 %17, 1
  br i1 %18, label %19, label %21

19:                                               ; preds = %14
  %20 = tail call i32 @fwide(%struct._IO_FILE* noundef nonnull %1, i32 noundef 1) #5
  br label %21

21:                                               ; preds = %19, %14
  %22 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 30
  %23 = load %struct.__locale_struct*, %struct.__locale_struct** %22, align 8, !tbaa !13
  store %struct.__locale_struct* %23, %struct.__locale_struct** %7, align 8, !tbaa !4
  %24 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 1
  %25 = load i8*, i8** %24, align 8, !tbaa !14
  %26 = icmp eq i8* %25, null
  br i1 %26, label %27, label %30

27:                                               ; preds = %21
  %28 = tail call i32 @__toread(%struct._IO_FILE* noundef nonnull %1) #5
  %29 = load i8*, i8** %24, align 8, !tbaa !14
  br label %30

30:                                               ; preds = %27, %21
  %31 = phi i8* [ %29, %27 ], [ %25, %21 ]
  %32 = icmp eq i8* %31, null
  %33 = icmp eq i32 %0, -1
  %34 = or i1 %33, %32
  br i1 %34, label %48, label %35

35:                                               ; preds = %30
  %36 = call i64 @wcrtomb(i8* noundef nonnull %4, i32 noundef %0, %struct.__mbstate_t* noundef null) #5
  %37 = and i64 %36, 2147483648
  %38 = icmp eq i64 %37, 0
  br i1 %38, label %39, label %48

39:                                               ; preds = %35
  %40 = load i8*, i8** %24, align 8, !tbaa !14
  %41 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 11
  %42 = load i8*, i8** %41, align 8, !tbaa !15
  %43 = getelementptr inbounds i8, i8* %42, i64 -8
  %44 = shl i64 %36, 32
  %45 = ashr exact i64 %44, 32
  %46 = getelementptr inbounds i8, i8* %43, i64 %45
  %47 = icmp ult i8* %40, %46
  br i1 %47, label %48, label %50

48:                                               ; preds = %30, %35, %39
  %49 = icmp eq i32 %15, 0
  br i1 %49, label %66, label %64

50:                                               ; preds = %39
  %51 = icmp ult i32 %0, 128
  br i1 %51, label %52, label %55

52:                                               ; preds = %50
  %53 = trunc i32 %0 to i8
  %54 = getelementptr inbounds i8, i8* %40, i64 -1
  store i8* %54, i8** %24, align 8, !tbaa !14
  store i8 %53, i8* %54, align 1, !tbaa !16
  br label %59

55:                                               ; preds = %50
  %56 = sub nsw i64 0, %45
  %57 = getelementptr inbounds i8, i8* %40, i64 %56
  store i8* %57, i8** %24, align 8, !tbaa !14
  %58 = call i8* @memcpy(i8* noundef %57, i8* noundef nonnull %4, i64 noundef %45) #5
  br label %59

59:                                               ; preds = %55, %52
  %60 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 0
  %61 = load i32, i32* %60, align 8, !tbaa !17
  %62 = and i32 %61, -17
  store i32 %62, i32* %60, align 8, !tbaa !17
  %63 = icmp eq i32 %15, 0
  br i1 %63, label %66, label %64

64:                                               ; preds = %59, %48
  %65 = phi i32 [ -1, %48 ], [ %0, %59 ]
  call void @__unlockfile(%struct._IO_FILE* noundef nonnull %1) #5
  br label %66

66:                                               ; preds = %64, %59, %48
  %67 = phi i32 [ -1, %48 ], [ %0, %59 ], [ %65, %64 ]
  store %struct.__locale_struct* %8, %struct.__locale_struct** %7, align 8, !tbaa !4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %4) #3
  ret i32 %67
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fwide(%struct._IO_FILE* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__toread(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @wcrtomb(i8* noundef, i32 noundef, %struct.__mbstate_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nounwind readnone strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 253468}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !10, i64 140}
!9 = !{!"_IO_FILE", !10, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48, !5, i64 56, !5, i64 64, !5, i64 72, !5, i64 80, !5, i64 88, !11, i64 96, !5, i64 104, !5, i64 112, !10, i64 120, !10, i64 124, !11, i64 128, !10, i64 136, !10, i64 140, !10, i64 144, !5, i64 152, !11, i64 160, !5, i64 168, !5, i64 176, !5, i64 184, !11, i64 192, !11, i64 200, !5, i64 208, !5, i64 216, !5, i64 224}
!10 = !{!"int", !6, i64 0}
!11 = !{!"long", !6, i64 0}
!12 = !{!9, !10, i64 136}
!13 = !{!9, !5, i64 224}
!14 = !{!9, !5, i64 8}
!15 = !{!9, !5, i64 88}
!16 = !{!6, !6, i64 0}
!17 = !{!9, !10, i64 0}
