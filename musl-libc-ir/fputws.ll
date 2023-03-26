; ModuleID = 'src/stdio/fputws.c'
source_filename = "src/stdio/fputws.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__mbstate_t = type { i32, i32 }

@fputws_unlocked = weak alias i32 (i32*, %struct._IO_FILE*), i32 (i32*, %struct._IO_FILE*)* @fputws

; Function Attrs: nounwind optsize strictfp
define i32 @fputws(i32* noalias noundef %0, %struct._IO_FILE* noalias noundef %1) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca [1024 x i8], align 16
  store i32* %0, i32** %3, align 8, !tbaa !3
  %5 = getelementptr inbounds [1024 x i8], [1024 x i8]* %4, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 1024, i8* nonnull %5) #3
  %6 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !7
  %7 = inttoptr i64 %6 to %struct.__pthread*
  %8 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %7, i64 0, i32 24
  %9 = load %struct.__locale_struct*, %struct.__locale_struct** %8, align 8, !tbaa !3
  %10 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 19
  %11 = load volatile i32, i32* %10, align 4, !tbaa !8
  %12 = icmp sgt i32 %11, -1
  br i1 %12, label %13, label %15

13:                                               ; preds = %2
  %14 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %1) #5
  br label %15

15:                                               ; preds = %2, %13
  %16 = phi i32 [ %14, %13 ], [ 0, %2 ]
  %17 = tail call i32 @fwide(%struct._IO_FILE* noundef nonnull %1, i32 noundef 1) #5
  %18 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %1, i64 0, i32 30
  %19 = load %struct.__locale_struct*, %struct.__locale_struct** %18, align 8, !tbaa !12
  store %struct.__locale_struct* %19, %struct.__locale_struct** %8, align 8, !tbaa !3
  %20 = icmp eq i32* %0, null
  br i1 %20, label %35, label %24

21:                                               ; preds = %28
  %22 = load i32*, i32** %3, align 8, !tbaa !3
  %23 = icmp eq i32* %22, null
  br i1 %23, label %33, label %24

24:                                               ; preds = %15, %21
  %25 = call i64 @wcsrtombs(i8* noundef nonnull %5, i32** noundef nonnull %3, i64 noundef 1024, %struct.__mbstate_t* noundef null) #5
  %26 = add i64 %25, -1
  %27 = icmp ult i64 %26, -2
  br i1 %27, label %28, label %33

28:                                               ; preds = %24
  %29 = call i64 @__fwritex(i8* noundef nonnull %5, i64 noundef %25, %struct._IO_FILE* noundef %1) #5
  %30 = icmp ult i64 %29, %25
  br i1 %30, label %31, label %21

31:                                               ; preds = %28
  %32 = icmp eq i32 %16, 0
  br i1 %32, label %40, label %38

33:                                               ; preds = %24, %21
  %34 = trunc i64 %25 to i32
  br label %35

35:                                               ; preds = %33, %15
  %36 = phi i32 [ 0, %15 ], [ %34, %33 ]
  %37 = icmp eq i32 %16, 0
  br i1 %37, label %40, label %38

38:                                               ; preds = %35, %31
  %39 = phi i32 [ -1, %31 ], [ %36, %35 ]
  call void @__unlockfile(%struct._IO_FILE* noundef %1) #5
  br label %40

40:                                               ; preds = %38, %35, %31
  %41 = phi i32 [ -1, %31 ], [ %36, %35 ], [ %39, %38 ]
  store %struct.__locale_struct* %9, %struct.__locale_struct** %8, align 8, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 1024, i8* nonnull %5) #3
  ret i32 %41
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @fwide(%struct._IO_FILE* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i64 @wcsrtombs(i8* noundef, i32** noundef, i64 noundef, %struct.__mbstate_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i64 @__fwritex(i8* noundef, i64 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

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
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{i64 253354}
!8 = !{!9, !10, i64 140}
!9 = !{!"_IO_FILE", !10, i64 0, !4, i64 8, !4, i64 16, !4, i64 24, !4, i64 32, !4, i64 40, !4, i64 48, !4, i64 56, !4, i64 64, !4, i64 72, !4, i64 80, !4, i64 88, !11, i64 96, !4, i64 104, !4, i64 112, !10, i64 120, !10, i64 124, !11, i64 128, !10, i64 136, !10, i64 140, !10, i64 144, !4, i64 152, !11, i64 160, !4, i64 168, !4, i64 176, !4, i64 184, !11, i64 192, !11, i64 200, !4, i64 208, !4, i64 216, !4, i64 224}
!10 = !{!"int", !5, i64 0}
!11 = !{!"long", !5, i64 0}
!12 = !{!9, !4, i64 224}
