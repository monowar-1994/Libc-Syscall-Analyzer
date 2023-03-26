; ModuleID = 'src/stdio/__stdio_read.c'
source_filename = "src/stdio/__stdio_read.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, {}*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque
%struct.iovec = type { i8*, i64 }

; Function Attrs: nounwind optsize strictfp
define hidden i64 @__stdio_read(%struct._IO_FILE* nocapture noundef %0, i8* noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = alloca [2 x %struct.iovec], align 16
  %5 = bitcast [2 x %struct.iovec]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %5) #3
  %6 = getelementptr inbounds [2 x %struct.iovec], [2 x %struct.iovec]* %4, i64 0, i64 0, i32 0
  store i8* %1, i8** %6, align 16, !tbaa !3
  %7 = getelementptr inbounds [2 x %struct.iovec], [2 x %struct.iovec]* %4, i64 0, i64 0, i32 1
  %8 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 12
  %9 = load i64, i64* %8, align 8, !tbaa !9
  %10 = icmp ne i64 %9, 0
  %11 = sext i1 %10 to i64
  %12 = add i64 %11, %2
  store i64 %12, i64* %7, align 8, !tbaa !12
  %13 = getelementptr inbounds [2 x %struct.iovec], [2 x %struct.iovec]* %4, i64 0, i64 1, i32 0
  %14 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %15 = load i8*, i8** %14, align 8, !tbaa !13
  store i8* %15, i8** %13, align 16, !tbaa !3
  %16 = getelementptr inbounds [2 x %struct.iovec], [2 x %struct.iovec]* %4, i64 0, i64 1, i32 1
  store i64 %9, i64* %16, align 8, !tbaa !12
  %17 = icmp eq i64 %12, 0
  %18 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 15
  %19 = load i32, i32* %18, align 8, !tbaa !14
  %20 = sext i32 %19 to i64
  br i1 %17, label %25, label %21

21:                                               ; preds = %3
  %22 = ptrtoint [2 x %struct.iovec]* %4 to i64
  %23 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 19, i64 %20, i64 %22, i64 2) #3, !srcloc !15
  %24 = call i64 @__syscall_ret(i64 noundef %23) #4
  br label %29

25:                                               ; preds = %3
  %26 = ptrtoint i8* %15 to i64
  %27 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 0, i64 %20, i64 %26, i64 %9) #3, !srcloc !15
  %28 = tail call i64 @__syscall_ret(i64 noundef %27) #4
  br label %29

29:                                               ; preds = %25, %21
  %30 = phi i64 [ %24, %21 ], [ %28, %25 ]
  %31 = icmp slt i64 %30, 1
  br i1 %31, label %32, label %38

32:                                               ; preds = %29
  %33 = icmp eq i64 %30, 0
  %34 = select i1 %33, i32 16, i32 32
  %35 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %36 = load i32, i32* %35, align 8, !tbaa !16
  %37 = or i32 %36, %34
  store i32 %37, i32* %35, align 8, !tbaa !16
  br label %54

38:                                               ; preds = %29
  %39 = load i64, i64* %7, align 8, !tbaa !12
  %40 = icmp ugt i64 %30, %39
  br i1 %40, label %41, label %54

41:                                               ; preds = %38
  %42 = sub i64 %30, %39
  %43 = load i8*, i8** %14, align 8, !tbaa !13
  %44 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  store i8* %43, i8** %44, align 8, !tbaa !17
  %45 = getelementptr inbounds i8, i8* %43, i64 %42
  %46 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  store i8* %45, i8** %46, align 8, !tbaa !18
  %47 = load i64, i64* %8, align 8, !tbaa !9
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %54, label %49

49:                                               ; preds = %41
  %50 = getelementptr inbounds i8, i8* %43, i64 1
  store i8* %50, i8** %44, align 8, !tbaa !17
  %51 = load i8, i8* %43, align 1, !tbaa !19
  %52 = add i64 %2, -1
  %53 = getelementptr inbounds i8, i8* %1, i64 %52
  store i8 %51, i8* %53, align 1, !tbaa !19
  br label %54

54:                                               ; preds = %41, %49, %38, %32
  %55 = phi i64 [ 0, %32 ], [ %30, %38 ], [ %2, %49 ], [ %2, %41 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %5) #3
  ret i64 %55
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind strictfp }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"iovec", !5, i64 0, !8, i64 8}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!10, !8, i64 96}
!10 = !{!"_IO_FILE", !11, i64 0, !5, i64 8, !5, i64 16, !5, i64 24, !5, i64 32, !5, i64 40, !5, i64 48, !5, i64 56, !5, i64 64, !5, i64 72, !5, i64 80, !5, i64 88, !8, i64 96, !5, i64 104, !5, i64 112, !11, i64 120, !11, i64 124, !8, i64 128, !11, i64 136, !11, i64 140, !11, i64 144, !5, i64 152, !8, i64 160, !5, i64 168, !5, i64 176, !5, i64 184, !8, i64 192, !8, i64 200, !5, i64 208, !5, i64 216, !5, i64 224}
!11 = !{!"int", !6, i64 0}
!12 = !{!4, !8, i64 8}
!13 = !{!10, !5, i64 88}
!14 = !{!10, !11, i64 120}
!15 = !{i64 71212}
!16 = !{!10, !11, i64 0}
!17 = !{!10, !5, i64 8}
!18 = !{!10, !5, i64 16}
!19 = !{!6, !6, i64 0}
