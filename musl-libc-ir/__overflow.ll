; ModuleID = 'src/stdio/__overflow.c'
source_filename = "src/stdio/__overflow.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i32 (%struct._IO_FILE*)*, i8*, i8*, i8*, i8*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i64, i32)*, i8*, i64, %struct._IO_FILE*, %struct._IO_FILE*, i32, i32, i64, i32, i32, i32, i8*, i64, i8*, i8*, i8*, i64, i64, %struct._IO_FILE*, %struct._IO_FILE*, %struct.__locale_struct* }
%struct.__locale_struct = type opaque

; Function Attrs: nounwind optsize strictfp
define protected i32 @__overflow(%struct._IO_FILE* noundef %0, i32 noundef %1) local_unnamed_addr #0 {
  %3 = alloca i8, align 1
  call void @llvm.lifetime.start.p0i8(i64 1, i8* nonnull %3) #3
  %4 = trunc i32 %1 to i8
  store i8 %4, i8* %3, align 1, !tbaa !3
  %5 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 4
  %6 = load i8*, i8** %5, align 8, !tbaa !6
  %7 = icmp eq i8* %6, null
  br i1 %7, label %8, label %13

8:                                                ; preds = %2
  %9 = tail call i32 @__towrite(%struct._IO_FILE* noundef nonnull %0) #4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %33

11:                                               ; preds = %8
  %12 = load i8*, i8** %5, align 8, !tbaa !6
  br label %13

13:                                               ; preds = %11, %2
  %14 = phi i8* [ %12, %11 ], [ %6, %2 ]
  %15 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 5
  %16 = load i8*, i8** %15, align 8, !tbaa !11
  %17 = icmp eq i8* %16, %14
  br i1 %17, label %25, label %18

18:                                               ; preds = %13
  %19 = and i32 %1, 255
  %20 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 20
  %21 = load i32, i32* %20, align 8, !tbaa !12
  %22 = icmp eq i32 %21, %19
  br i1 %22, label %25, label %23

23:                                               ; preds = %18
  %24 = getelementptr inbounds i8, i8* %16, i64 1
  store i8* %24, i8** %15, align 8, !tbaa !11
  store i8 %4, i8* %16, align 1, !tbaa !3
  br label %33

25:                                               ; preds = %18, %13
  %26 = getelementptr inbounds %struct._IO_FILE, %struct._IO_FILE* %0, i64 0, i32 9
  %27 = load i64 (%struct._IO_FILE*, i8*, i64)*, i64 (%struct._IO_FILE*, i8*, i64)** %26, align 8, !tbaa !13
  %28 = call i64 %27(%struct._IO_FILE* noundef nonnull %0, i8* noundef nonnull %3, i64 noundef 1) #4
  %29 = icmp eq i64 %28, 1
  br i1 %29, label %30, label %33

30:                                               ; preds = %25
  %31 = load i8, i8* %3, align 1, !tbaa !3
  %32 = zext i8 %31 to i32
  br label %33

33:                                               ; preds = %25, %8, %30, %23
  %34 = phi i32 [ %19, %23 ], [ %32, %30 ], [ -1, %8 ], [ -1, %25 ]
  call void @llvm.lifetime.end.p0i8(i64 1, i8* nonnull %3) #3
  ret i32 %34
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare hidden i32 @__towrite(%struct._IO_FILE* noundef) local_unnamed_addr #2

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
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !9, i64 32}
!7 = !{!"_IO_FILE", !8, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !9, i64 32, !9, i64 40, !9, i64 48, !9, i64 56, !9, i64 64, !9, i64 72, !9, i64 80, !9, i64 88, !10, i64 96, !9, i64 104, !9, i64 112, !8, i64 120, !8, i64 124, !10, i64 128, !8, i64 136, !8, i64 140, !8, i64 144, !9, i64 152, !10, i64 160, !9, i64 168, !9, i64 176, !9, i64 184, !10, i64 192, !10, i64 200, !9, i64 208, !9, i64 216, !9, i64 224}
!8 = !{!"int", !4, i64 0}
!9 = !{!"any pointer", !4, i64 0}
!10 = !{!"long", !4, i64 0}
!11 = !{!7, !9, i64 40}
!12 = !{!7, !8, i64 144}
!13 = !{!7, !9, i64 72}
