; ModuleID = 'src/stdio/__fdopen.c'
source_filename = "src/stdio/__fdopen.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__libc = type { i8, i8, i8, i8, i32, i64*, %struct.tls_module*, i64, i64, i64, i64, %struct.__locale_struct }
%struct.tls_module = type { %struct.tls_module*, i8*, i64, i64, i64, i64 }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque
%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.winsize = type { i16, i16, i16, i16 }

@.str = private unnamed_addr constant [4 x i8] c"rwa\00", align 1
@__libc = external hidden local_unnamed_addr global %struct.__libc, align 8

@fdopen = weak alias %struct._IO_FILE* (i32, i8*), %struct._IO_FILE* (i32, i8*)* @__fdopen

; Function Attrs: nounwind optsize strictfp
define hidden %struct._IO_FILE* @__fdopen(i32 noundef %0, i8* noundef %1) #0 {
  %3 = alloca %struct.winsize, align 2
  %4 = bitcast %struct.winsize* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %4) #4
  %5 = load i8, i8* %1, align 1, !tbaa !3
  %6 = sext i8 %5 to i32
  %7 = tail call i8* @strchr(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 noundef %6) #5
  %8 = icmp eq i8* %7, null
  br i1 %8, label %9, label %11

9:                                                ; preds = %2
  %10 = tail call i32* @___errno_location() #6
  store i32 22, i32* %10, align 4, !tbaa !6
  br label %85

11:                                               ; preds = %2
  %12 = tail call i8* @malloc(i64 noundef 1264) #5
  %13 = bitcast i8* %12 to %struct._IO_FILE*
  %14 = icmp eq i8* %12, null
  br i1 %14, label %85, label %15

15:                                               ; preds = %11
  %16 = tail call i8* @memset(i8* noundef nonnull %12, i32 noundef 0, i64 noundef 232) #5
  %17 = tail call i8* @strchr(i8* noundef nonnull %1, i32 noundef 43) #5
  %18 = icmp eq i8* %17, null
  br i1 %18, label %19, label %24

19:                                               ; preds = %15
  %20 = load i8, i8* %1, align 1, !tbaa !3
  %21 = icmp eq i8 %20, 114
  %22 = select i1 %21, i32 8, i32 4
  %23 = bitcast i8* %12 to i32*
  store i32 %22, i32* %23, align 8, !tbaa !8
  br label %24

24:                                               ; preds = %19, %15
  %25 = tail call i8* @strchr(i8* noundef nonnull %1, i32 noundef 101) #5
  %26 = icmp eq i8* %25, null
  br i1 %26, label %30, label %27

27:                                               ; preds = %24
  %28 = sext i32 %0 to i64
  %29 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %28, i64 2, i64 1) #4, !srcloc !12
  br label %30

30:                                               ; preds = %27, %24
  %31 = load i8, i8* %1, align 1, !tbaa !3
  %32 = icmp eq i8 %31, 97
  br i1 %32, label %36, label %33

33:                                               ; preds = %30
  %34 = bitcast i8* %12 to i32*
  %35 = load i32, i32* %34, align 8, !tbaa !8
  br label %50

36:                                               ; preds = %30
  %37 = sext i32 %0 to i64
  %38 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %37, i64 3) #4, !srcloc !13
  %39 = and i64 %38, 1024
  %40 = icmp eq i64 %39, 0
  br i1 %40, label %41, label %46

41:                                               ; preds = %36
  %42 = shl i64 %38, 32
  %43 = ashr exact i64 %42, 32
  %44 = or i64 %43, 1024
  %45 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 72, i64 %37, i64 4, i64 %44) #4, !srcloc !12
  br label %46

46:                                               ; preds = %41, %36
  %47 = bitcast i8* %12 to i32*
  %48 = load i32, i32* %47, align 8, !tbaa !8
  %49 = or i32 %48, 128
  store i32 %49, i32* %47, align 8, !tbaa !8
  br label %50

50:                                               ; preds = %33, %46
  %51 = phi i32 [ %35, %33 ], [ %49, %46 ]
  %52 = getelementptr inbounds i8, i8* %12, i64 120
  %53 = bitcast i8* %52 to i32*
  store i32 %0, i32* %53, align 8, !tbaa !14
  %54 = getelementptr inbounds i8, i8* %12, i64 240
  %55 = getelementptr inbounds i8, i8* %12, i64 88
  %56 = bitcast i8* %55 to i8**
  store i8* %54, i8** %56, align 8, !tbaa !15
  %57 = getelementptr inbounds i8, i8* %12, i64 96
  %58 = bitcast i8* %57 to i64*
  store i64 1024, i64* %58, align 8, !tbaa !16
  %59 = getelementptr inbounds i8, i8* %12, i64 144
  %60 = bitcast i8* %59 to i32*
  store i32 -1, i32* %60, align 8, !tbaa !17
  %61 = and i32 %51, 8
  %62 = icmp eq i32 %61, 0
  br i1 %62, label %63, label %69

63:                                               ; preds = %50
  %64 = sext i32 %0 to i64
  %65 = ptrtoint %struct.winsize* %3 to i64
  %66 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 16, i64 %64, i64 21523, i64 %65) #4, !srcloc !12
  %67 = icmp eq i64 %66, 0
  br i1 %67, label %68, label %69

68:                                               ; preds = %63
  store i32 10, i32* %60, align 8, !tbaa !17
  br label %69

69:                                               ; preds = %68, %63, %50
  %70 = getelementptr inbounds i8, i8* %12, i64 64
  %71 = bitcast i8* %70 to i64 (%struct._IO_FILE*, i8*, i64)**
  store i64 (%struct._IO_FILE*, i8*, i64)* @__stdio_read, i64 (%struct._IO_FILE*, i8*, i64)** %71, align 8, !tbaa !18
  %72 = getelementptr inbounds i8, i8* %12, i64 72
  %73 = bitcast i8* %72 to i64 (%struct._IO_FILE*, i8*, i64)**
  store i64 (%struct._IO_FILE*, i8*, i64)* @__stdio_write, i64 (%struct._IO_FILE*, i8*, i64)** %73, align 8, !tbaa !19
  %74 = getelementptr inbounds i8, i8* %12, i64 80
  %75 = bitcast i8* %74 to i64 (%struct._IO_FILE*, i64, i32)**
  store i64 (%struct._IO_FILE*, i64, i32)* @__stdio_seek, i64 (%struct._IO_FILE*, i64, i32)** %75, align 8, !tbaa !20
  %76 = getelementptr inbounds i8, i8* %12, i64 24
  %77 = bitcast i8* %76 to i32 (%struct._IO_FILE*)**
  store i32 (%struct._IO_FILE*)* @__stdio_close, i32 (%struct._IO_FILE*)** %77, align 8, !tbaa !21
  %78 = load i8, i8* getelementptr inbounds (%struct.__libc, %struct.__libc* @__libc, i64 0, i32 1), align 1, !tbaa !22
  %79 = icmp eq i8 %78, 0
  br i1 %79, label %80, label %83

80:                                               ; preds = %69
  %81 = getelementptr inbounds i8, i8* %12, i64 140
  %82 = bitcast i8* %81 to i32*
  store volatile i32 -1, i32* %82, align 4, !tbaa !25
  br label %83

83:                                               ; preds = %80, %69
  %84 = call %struct._IO_FILE* @__ofl_add(%struct._IO_FILE* noundef nonnull %13) #5
  br label %85

85:                                               ; preds = %11, %83, %9
  %86 = phi %struct._IO_FILE* [ %84, %83 ], [ null, %9 ], [ null, %11 ]
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %4) #4
  ret %struct._IO_FILE* %86
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i8* @strchr(i8* noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__stdio_read(%struct._IO_FILE* noundef, i8* noundef, i64 noundef) #2

; Function Attrs: optsize
declare hidden i64 @__stdio_write(%struct._IO_FILE* noundef, i8* noundef, i64 noundef) #2

; Function Attrs: optsize
declare hidden i64 @__stdio_seek(%struct._IO_FILE* noundef, i64 noundef, i32 noundef) #2

; Function Attrs: optsize
declare hidden i32 @__stdio_close(%struct._IO_FILE* noundef) #2

; Function Attrs: optsize
declare hidden %struct._IO_FILE* @__ofl_add(%struct._IO_FILE* noundef) local_unnamed_addr #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
!8 = !{!9, !7, i64 0}
!9 = !{!"_IO_FILE", !7, i64 0, !10, i64 8, !10, i64 16, !10, i64 24, !10, i64 32, !10, i64 40, !10, i64 48, !10, i64 56, !10, i64 64, !10, i64 72, !10, i64 80, !10, i64 88, !11, i64 96, !10, i64 104, !10, i64 112, !7, i64 120, !7, i64 124, !11, i64 128, !7, i64 136, !7, i64 140, !7, i64 144, !10, i64 152, !11, i64 160, !10, i64 168, !10, i64 176, !10, i64 184, !11, i64 192, !11, i64 200, !10, i64 208, !10, i64 216, !10, i64 224}
!10 = !{!"any pointer", !4, i64 0}
!11 = !{!"long", !4, i64 0}
!12 = !{i64 72071}
!13 = !{i64 71859}
!14 = !{!9, !7, i64 120}
!15 = !{!9, !10, i64 88}
!16 = !{!9, !11, i64 96}
!17 = !{!9, !7, i64 144}
!18 = !{!9, !10, i64 64}
!19 = !{!9, !10, i64 72}
!20 = !{!9, !10, i64 80}
!21 = !{!9, !10, i64 24}
!22 = !{!23, !4, i64 1}
!23 = !{!"__libc", !4, i64 0, !4, i64 1, !4, i64 2, !4, i64 3, !7, i64 4, !10, i64 8, !10, i64 16, !11, i64 24, !11, i64 32, !11, i64 40, !11, i64 48, !24, i64 56}
!24 = !{!"__locale_struct", !4, i64 0}
!25 = !{!9, !7, i64 140}
