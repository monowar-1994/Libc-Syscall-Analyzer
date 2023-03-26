; ModuleID = 'src/stdio/fgetwc.c'
source_filename = "src/stdio/fgetwc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }
%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__mbstate_t = type { i32, i32 }

@fgetwc_unlocked = weak alias i32 (%struct._IO_FILE*), i32 (%struct._IO_FILE*)* @__fgetwc_unlocked
@getwc_unlocked = weak alias i32 (%struct._IO_FILE*), i32 (%struct._IO_FILE*)* @__fgetwc_unlocked

; Function Attrs: nounwind optsize strictfp
define i32 @__fgetwc_unlocked(%struct._IO_FILE* noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i8, align 1
  %5 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #4, !srcloc !3
  %6 = inttoptr i64 %5 to %struct.__pthread*
  %7 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %6, i64 0, i32 24
  %8 = load %struct.__locale_struct*, %struct.__locale_struct** %7, align 8, !tbaa !4
  %9 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 18
  %10 = load i32, i32* %9, align 8, !tbaa !8
  %11 = icmp slt i32 %10, 1
  br i1 %11, label %12, label %14

12:                                               ; preds = %1
  %13 = tail call i32 @fwide(%struct._IO_FILE* noundef nonnull %0, i32 noundef 1) #5
  br label %14

14:                                               ; preds = %12, %1
  %15 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 30
  %16 = load %struct.__locale_struct*, %struct.__locale_struct** %15, align 8, !tbaa !12
  store %struct.__locale_struct* %16, %struct.__locale_struct** %7, align 8, !tbaa !4
  %17 = bitcast i64* %3 to %struct.__mbstate_t*
  %18 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %18) #6
  %19 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %20 = load i8*, i8** %19, align 8, !tbaa !13
  %21 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  %22 = load i8*, i8** %21, align 8, !tbaa !14
  %23 = icmp eq i8* %20, %22
  br i1 %23, label %38, label %24

24:                                               ; preds = %14
  %25 = ptrtoint i8* %22 to i64
  %26 = ptrtoint i8* %20 to i64
  %27 = sub i64 %25, %26
  %28 = call i32 @mbtowc(i32* noundef nonnull %2, i8* noundef %20, i64 noundef %27) #5
  %29 = icmp eq i32 %28, -1
  br i1 %29, label %38, label %30

30:                                               ; preds = %24
  %31 = sext i32 %28 to i64
  %32 = icmp eq i32 %28, 0
  %33 = zext i1 %32 to i64
  %34 = add nsw i64 %33, %31
  %35 = load i8*, i8** %19, align 8, !tbaa !13
  %36 = getelementptr inbounds i8, i8* %35, i64 %34
  store i8* %36, i8** %19, align 8, !tbaa !13
  %37 = load i32, i32* %2, align 4, !tbaa !15
  br label %72

38:                                               ; preds = %24, %14
  %39 = bitcast i64* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %39) #6
  store i64 0, i64* %3, align 8
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %4) #6
  br label %40

40:                                               ; preds = %58, %38
  %41 = phi i1 [ false, %38 ], [ true, %58 ]
  %42 = load i8*, i8** %19, align 8, !tbaa !13
  %43 = load i8*, i8** %21, align 8, !tbaa !14
  %44 = icmp eq i8* %42, %43
  br i1 %44, label %48, label %45

45:                                               ; preds = %40
  %46 = getelementptr inbounds i8, i8* %42, i64 1
  store i8* %46, i8** %19, align 8, !tbaa !13
  %47 = load i8, i8* %42, align 1, !tbaa !16
  store i8 %47, i8* %4, align 1, !tbaa !16
  br label %58

48:                                               ; preds = %40
  %49 = call i32 @__uflow(%struct._IO_FILE* noundef nonnull %0) #5
  %50 = trunc i32 %49 to i8
  store i8 %50, i8* %4, align 1, !tbaa !16
  %51 = icmp slt i32 %49, 0
  br i1 %51, label %52, label %58

52:                                               ; preds = %48
  br i1 %41, label %53, label %70

53:                                               ; preds = %52
  %54 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %55 = load i32, i32* %54, align 8, !tbaa !17
  %56 = or i32 %55, 32
  store i32 %56, i32* %54, align 8, !tbaa !17
  %57 = tail call i32* @___errno_location() #7
  store i32 84, i32* %57, align 4, !tbaa !15
  br label %70

58:                                               ; preds = %48, %45
  %59 = call i64 @mbrtowc(i32* noundef nonnull %2, i8* noundef nonnull %4, i64 noundef 1, %struct.__mbstate_t* noundef nonnull %17) #5
  switch i64 %59, label %68 [
    i64 -1, label %60
    i64 -2, label %40
  ]

60:                                               ; preds = %58
  br i1 %41, label %61, label %70

61:                                               ; preds = %60
  %62 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %63 = load i32, i32* %62, align 8, !tbaa !17
  %64 = or i32 %63, 32
  store i32 %64, i32* %62, align 8, !tbaa !17
  %65 = load i8, i8* %4, align 1, !tbaa !16
  %66 = zext i8 %65 to i32
  %67 = call i32 @ungetc(i32 noundef %66, %struct._IO_FILE* noundef nonnull %0) #5
  br label %70

68:                                               ; preds = %58
  %69 = load i32, i32* %2, align 4, !tbaa !15
  br label %70

70:                                               ; preds = %68, %61, %60, %53, %52
  %71 = phi i32 [ %69, %68 ], [ -1, %53 ], [ -1, %52 ], [ -1, %61 ], [ -1, %60 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %4) #6
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %39) #6
  br label %72

72:                                               ; preds = %30, %70
  %73 = phi i32 [ %37, %30 ], [ %71, %70 ]
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %18) #6
  store %struct.__locale_struct* %8, %struct.__locale_struct** %7, align 8, !tbaa !4
  ret i32 %73
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @fwide(%struct._IO_FILE* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: nounwind optsize strictfp
define i32 @fgetwc(%struct._IO_FILE* noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %3 = load volatile i32, i32* %2, align 4, !tbaa !18
  %4 = icmp sgt i32 %3, -1
  br i1 %4, label %7, label %5

5:                                                ; preds = %1
  %6 = tail call i32 @__fgetwc_unlocked(%struct._IO_FILE* noundef nonnull %0) #8
  br label %12

7:                                                ; preds = %1
  %8 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %0) #5
  %9 = icmp eq i32 %8, 0
  %10 = tail call i32 @__fgetwc_unlocked(%struct._IO_FILE* noundef nonnull %0) #8
  br i1 %9, label %12, label %11

11:                                               ; preds = %7
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %0) #5
  br label %12

12:                                               ; preds = %5, %11, %7
  %13 = phi i32 [ %6, %5 ], [ %10, %11 ], [ %10, %7 ]
  ret i32 %13
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @mbtowc(i32* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare protected i32 @__uflow(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i64 @mbrtowc(i32* noundef, i8* noundef, i64 noundef, %struct.__mbstate_t* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @ungetc(i32 noundef, %struct._IO_FILE* noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readnone strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nounwind strictfp }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #8 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 254055}
!4 = !{!5, !5, i64 0}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!9, !10, i64 136}
!9 = !{!"_IO_FILE", !10, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48, !5, i64 56, !5, i64 64, !5, i64 72, !5, i64 80, !5, i64 88, !11, i64 96, !5, i64 104, !5, i64 112, !10, i64 120, !10, i64 124, !11, i64 128, !10, i64 136, !10, i64 140, !10, i64 144, !5, i64 152, !11, i64 160, !5, i64 168, !5, i64 176, !5, i64 184, !11, i64 192, !11, i64 200, !5, i64 208, !5, i64 216, !5, i64 224}
!10 = !{!"int", !6, i64 0}
!11 = !{!"long", !6, i64 0}
!12 = !{!9, !5, i64 224}
!13 = !{!9, !5, i64 8}
!14 = !{!9, !5, i64 16}
!15 = !{!10, !10, i64 0}
!16 = !{!6, !6, i64 0}
!17 = !{!9, !10, i64 0}
!18 = !{!9, !10, i64 140}
