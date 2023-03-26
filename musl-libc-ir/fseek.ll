; ModuleID = 'src/stdio/fseek.c'
source_filename = "src/stdio/fseek.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

@fseeko = weak alias i32 (%struct._IO_FILE*, i64, i32), i32 (%struct._IO_FILE*, i64, i32)* @__fseeko
@fseeko64 = weak alias i32 (%struct._IO_FILE*, i64, i32), i32 (%struct._IO_FILE*, i64, i32)* @__fseeko

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__fseeko_unlocked(%struct._IO_FILE* noundef %0, i64 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = icmp ugt i32 %2, 2
  br i1 %4, label %5, label %7

5:                                                ; preds = %3
  %6 = tail call i32* @___errno_location() #3
  store i32 22, i32* %6, align 4, !tbaa !3
  br label %46

7:                                                ; preds = %3
  %8 = icmp eq i32 %2, 1
  br i1 %8, label %9, label %20

9:                                                ; preds = %7
  %10 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 2
  %11 = load i8*, i8** %10, align 8, !tbaa !7
  %12 = icmp eq i8* %11, null
  br i1 %12, label %20, label %13

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %15 = load i8*, i8** %14, align 8, !tbaa !11
  %16 = ptrtoint i8* %11 to i64
  %17 = ptrtoint i8* %15 to i64
  %18 = sub i64 %1, %16
  %19 = add i64 %18, %17
  br label %20

20:                                               ; preds = %13, %9, %7
  %21 = phi i64 [ %19, %13 ], [ %1, %9 ], [ %1, %7 ]
  %22 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  %23 = load i8*, i8** %22, align 8, !tbaa !12
  %24 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 7
  %25 = load i8*, i8** %24, align 8, !tbaa !13
  %26 = icmp eq i8* %23, %25
  br i1 %26, label %33, label %27

27:                                               ; preds = %20
  %28 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 9
  %29 = load i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)** %28, align 8, !tbaa !14
  %30 = tail call i64 %29(%struct._IO_FILE* noundef nonnull %0, i8* noundef null, i64 noundef 0) #4
  %31 = load i8*, i8** %22, align 8, !tbaa !12
  %32 = icmp eq i8* %31, null
  br i1 %32, label %46, label %33

33:                                               ; preds = %27, %20
  %34 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  store i8* null, i8** %24, align 8, !tbaa !13
  %35 = bitcast i8** %34 to <2 x i8*>*
  store <2 x i8*> zeroinitializer, <2 x i8*>* %35, align 8, !tbaa !15
  %36 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 10
  %37 = load i64 (%struct._IO_FILE*, i64, i32)*, i64 (%struct._IO_FILE*, i64, i32)** %36, align 8, !tbaa !16
  %38 = tail call i64 %37(%struct._IO_FILE* noundef nonnull %0, i64 noundef %21, i32 noundef %2) #4
  %39 = icmp slt i64 %38, 0
  br i1 %39, label %46, label %40

40:                                               ; preds = %33
  %41 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 1
  %42 = bitcast i8** %41 to <2 x i8*>*
  store <2 x i8*> zeroinitializer, <2 x i8*>* %42, align 8, !tbaa !15
  %43 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 0
  %44 = load i32, i32* %43, align 8, !tbaa !17
  %45 = and i32 %44, -17
  store i32 %45, i32* %43, align 8, !tbaa !17
  br label %46

46:                                               ; preds = %33, %27, %40, %5
  %47 = phi i32 [ -1, %5 ], [ 0, %40 ], [ -1, %27 ], [ -1, %33 ]
  ret i32 %47
}

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__fseeko(%struct._IO_FILE* noundef %0, i64 noundef %1, i32 noundef %2) #0 {
  %4 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 19
  %5 = load volatile i32, i32* %4, align 4, !tbaa !18
  %6 = icmp sgt i32 %5, -1
  br i1 %6, label %9, label %7

7:                                                ; preds = %3
  %8 = tail call i32 @__fseeko_unlocked(%struct._IO_FILE* noundef nonnull %0, i64 noundef %1, i32 noundef %2) #5
  br label %14

9:                                                ; preds = %3
  %10 = tail call i32 @__lockfile(%struct._IO_FILE* noundef nonnull %0) #4
  %11 = icmp eq i32 %10, 0
  %12 = tail call i32 @__fseeko_unlocked(%struct._IO_FILE* noundef nonnull %0, i64 noundef %1, i32 noundef %2) #5
  br i1 %11, label %14, label %13

13:                                               ; preds = %9
  tail call void @__unlockfile(%struct._IO_FILE* noundef nonnull %0) #4
  br label %14

14:                                               ; preds = %7, %13, %9
  %15 = phi i32 [ %8, %7 ], [ %12, %13 ], [ %12, %9 ]
  ret i32 %15
}

; Function Attrs: optsize
declare hidden i32 @__lockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden void @__unlockfile(%struct._IO_FILE* noundef) local_unnamed_addr #2

; Function Attrs: nounwind optsize strictfp
define i32 @fseek(%struct._IO_FILE* noundef %0, i64 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = tail call i32 @__fseeko(%struct._IO_FILE* noundef %0, i64 noundef %1, i32 noundef %2) #5
  ret i32 %4
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #4 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #5 = { nobuiltin optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !9, i64 16}
!8 = !{!"_IO_FILE", !4, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !9, i64 56, !9, i64 64, !9, i64 72, !9, i64 80, !9, i64 88, !10, i64 96, !9, i64 104, !9, i64 112, !4, i64 120, !4, i64 124, !10, i64 128, !4, i64 136, !4, i64 140, !4, i64 144, !9, i64 152, !10, i64 160, !9, i64 168, !9, i64 176, !9, i64 184, !10, i64 192, !10, i64 200, !9, i64 208, !9, i64 216, !9, i64 224}
!9 = !{!"any pointer", !5, i64 0}
!10 = !{!"long", !5, i64 0}
!11 = !{!8, !9, i64 8}
!12 = !{!8, !9, i64 40}
!13 = !{!8, !9, i64 56}
!14 = !{!8, !9, i64 72}
!15 = !{!9, !9, i64 0}
!16 = !{!8, !9, i64 80}
!17 = !{!8, !4, i64 0}
!18 = !{!8, !4, i64 140}
