; ModuleID = 'src/stdio/__stdio_write.c'
source_filename = "src/stdio/__stdio_write.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, {}*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque
%struct.iovec = type { i8*, i64 }

; Function Attrs: nounwind optsize strictfp
define hidden i64 @__stdio_write(%struct._IO_FILE* nocapture noundef %0, i8* noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = alloca [2 x %struct.iovec], align 16
  %5 = bitcast [2 x %struct.iovec]* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 32, i8* nonnull %5) #3
  %6 = getelementptr inbounds [2 x %struct.iovec], [2 x %struct.iovec]* %4, i64 0, i64 0, i32 0
  %7 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  %8 = load i8*, i8** %7, align 8, !tbaa !3
  store i8* %8, i8** %6, align 16, !tbaa !10
  %9 = getelementptr inbounds [2 x %struct.iovec], [2 x %struct.iovec]* %4, i64 0, i64 0, i32 1
  %10 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  %11 = load i8*, i8** %10, align 8, !tbaa !12
  %12 = ptrtoint i8* %11 to i64
  %13 = ptrtoint i8* %8 to i64
  %14 = sub i64 %12, %13
  store i64 %14, i64* %9, align 8, !tbaa !13
  %15 = getelementptr inbounds [2 x %struct.iovec], [2 x %struct.iovec]* %4, i64 0, i64 1, i32 0
  store i8* %1, i8** %15, align 16, !tbaa !10
  %16 = getelementptr inbounds [2 x %struct.iovec], [2 x %struct.iovec]* %4, i64 0, i64 1, i32 1
  store i64 %2, i64* %16, align 8, !tbaa !13
  %17 = add i64 %14, %2
  %18 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 15
  %19 = load i32, i32* %18, align 8, !tbaa !14
  %20 = sext i32 %19 to i64
  %21 = ptrtoint [2 x %struct.iovec]* %4 to i64
  %22 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 20, i64 %20, i64 %21, i64 2) #3, !srcloc !15
  %23 = call i64 @__syscall_ret(i64 noundef %22) #4
  %24 = icmp eq i64 %17, %23
  br i1 %24, label %27, label %25

25:                                               ; preds = %3
  %26 = getelementptr inbounds [2 x %struct.iovec], [2 x %struct.iovec]* %4, i64 0, i64 0
  br label %34

27:                                               ; preds = %51, %3
  %28 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 11
  %29 = load i8*, i8** %28, align 8, !tbaa !16
  %30 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 12
  %31 = load i64, i64* %30, align 8, !tbaa !17
  %32 = getelementptr inbounds i8, i8* %29, i64 %31
  %33 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  store i8* %32, i8** %33, align 8, !tbaa !18
  store i8* %29, i8** %7, align 8, !tbaa !3
  store i8* %29, i8** %10, align 8, !tbaa !12
  br label %78

34:                                               ; preds = %25, %51
  %35 = phi i64 [ %76, %51 ], [ %23, %25 ]
  %36 = phi i32 [ %59, %51 ], [ 2, %25 ]
  %37 = phi i64 [ %52, %51 ], [ %17, %25 ]
  %38 = phi %struct.iovec* [ %57, %51 ], [ %26, %25 ]
  %39 = icmp slt i64 %35, 0
  br i1 %39, label %40, label %51

40:                                               ; preds = %34
  %41 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  store i8* null, i8** %7, align 8, !tbaa !3
  %42 = bitcast i8** %41 to <2 x i8*>*
  store <2 x i8*> zeroinitializer, <2 x i8*>* %42, align 8, !tbaa !19
  %43 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %44 = load i32, i32* %43, align 8, !tbaa !20
  %45 = or i32 %44, 32
  store i32 %45, i32* %43, align 8, !tbaa !20
  %46 = icmp eq i32 %36, 2
  br i1 %46, label %78, label %47

47:                                               ; preds = %40
  %48 = getelementptr inbounds %struct.iovec, %struct.iovec* %38, i64 0, i32 1
  %49 = load i64, i64* %48, align 8, !tbaa !13
  %50 = sub i64 %2, %49
  br label %78

51:                                               ; preds = %34
  %52 = sub i64 %37, %35
  %53 = getelementptr inbounds %struct.iovec, %struct.iovec* %38, i64 0, i32 1
  %54 = load i64, i64* %53, align 8, !tbaa !13
  %55 = icmp ugt i64 %35, %54
  %56 = getelementptr inbounds %struct.iovec, %struct.iovec* %38, i64 1
  %57 = select i1 %55, %struct.iovec* %56, %struct.iovec* %38
  %58 = sext i1 %55 to i32
  %59 = add nsw i32 %36, %58
  %60 = select i1 %55, i64 %54, i64 0
  %61 = sub i64 %35, %60
  %62 = getelementptr inbounds %struct.iovec, %struct.iovec* %56, i64 0, i32 0
  %63 = getelementptr inbounds %struct.iovec, %struct.iovec* %38, i64 0, i32 0
  %64 = select i1 %55, i8** %62, i8** %63
  %65 = load i8*, i8** %64, align 8, !tbaa !10
  %66 = getelementptr inbounds i8, i8* %65, i64 %61
  store i8* %66, i8** %64, align 8, !tbaa !10
  %67 = getelementptr inbounds %struct.iovec, %struct.iovec* %38, i64 1, i32 1
  %68 = select i1 %55, i64* %67, i64* %53
  %69 = load i64, i64* %68, align 8, !tbaa !13
  %70 = sub i64 %69, %61
  store i64 %70, i64* %68, align 8, !tbaa !13
  %71 = load i32, i32* %18, align 8, !tbaa !14
  %72 = sext i32 %71 to i64
  %73 = ptrtoint %struct.iovec* %57 to i64
  %74 = sext i32 %59 to i64
  %75 = call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 20, i64 %72, i64 %73, i64 %74) #3, !srcloc !15
  %76 = call i64 @__syscall_ret(i64 noundef %75) #4
  %77 = icmp eq i64 %52, %76
  br i1 %77, label %27, label %34

78:                                               ; preds = %47, %40, %27
  %79 = phi i64 [ %2, %27 ], [ %50, %47 ], [ 0, %40 ]
  call void @llvm.lifetime.end.p0i8(i64 32, i8* nonnull %5) #3
  ret i64 %79
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
!3 = !{!4, !8, i64 56}
!4 = !{!"_IO_FILE", !5, i64 0, !8, i64 8, !8, i64 16, !8, i64 24, !8, i64 32, !8, i64 40, !8, i64 48, !8, i64 56, !8, i64 64, !8, i64 72, !8, i64 80, !8, i64 88, !9, i64 96, !8, i64 104, !8, i64 112, !5, i64 120, !5, i64 124, !9, i64 128, !5, i64 136, !5, i64 140, !5, i64 144, !8, i64 152, !9, i64 160, !8, i64 168, !8, i64 176, !8, i64 184, !9, i64 192, !9, i64 200, !8, i64 208, !8, i64 216, !8, i64 224}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"any pointer", !6, i64 0}
!9 = !{!"long", !6, i64 0}
!10 = !{!11, !8, i64 0}
!11 = !{!"iovec", !8, i64 0, !9, i64 8}
!12 = !{!4, !8, i64 40}
!13 = !{!11, !9, i64 8}
!14 = !{!4, !5, i64 120}
!15 = !{i64 71425}
!16 = !{!4, !8, i64 88}
!17 = !{!4, !9, i64 96}
!18 = !{!4, !8, i64 32}
!19 = !{!8, !8, i64 0}
!20 = !{!4, !5, i64 0}
