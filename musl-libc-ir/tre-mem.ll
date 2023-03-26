; ModuleID = 'src/regex/tre-mem.c'
source_filename = "src/regex/tre-mem.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tre_mem_struct = type { %struct.tre_list*, %struct.tre_list*, i8*, i64, i32, i8** }
%struct.tre_list = type { i8*, %struct.tre_list* }

; Function Attrs: nounwind optsize strictfp
define hidden %struct.tre_mem_struct* @__tre_mem_new_impl(i32 noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = icmp eq i32 %0, 0
  br i1 %3, label %6, label %4

4:                                                ; preds = %2
  %5 = tail call i8* @memset(i8* noundef %1, i32 noundef 0, i64 noundef 48) #2
  br label %8

6:                                                ; preds = %2
  %7 = tail call i8* @calloc(i64 noundef 1, i64 noundef 48) #2
  br label %8

8:                                                ; preds = %6, %4
  %9 = phi i8* [ %1, %4 ], [ %7, %6 ]
  %10 = bitcast i8* %9 to %struct.tre_mem_struct*
  ret %struct.tre_mem_struct* %10
}

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare i8* @calloc(i64 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define hidden void @__tre_mem_destroy(%struct.tre_mem_struct* noundef %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tre_mem_struct, %struct.tre_mem_struct* %0, i64 0, i32 0
  %3 = load %struct.tre_list*, %struct.tre_list** %2, align 8, !tbaa !3
  %4 = icmp eq %struct.tre_list* %3, null
  br i1 %4, label %13, label %5

5:                                                ; preds = %1, %5
  %6 = phi %struct.tre_list* [ %10, %5 ], [ %3, %1 ]
  %7 = getelementptr inbounds %struct.tre_list, %struct.tre_list* %6, i64 0, i32 0
  %8 = load i8*, i8** %7, align 8, !tbaa !10
  tail call void @free(i8* noundef %8) #2
  %9 = getelementptr inbounds %struct.tre_list, %struct.tre_list* %6, i64 0, i32 1
  %10 = load %struct.tre_list*, %struct.tre_list** %9, align 8, !tbaa !12
  %11 = bitcast %struct.tre_list* %6 to i8*
  tail call void @free(i8* noundef nonnull %11) #2
  %12 = icmp eq %struct.tre_list* %10, null
  br i1 %12, label %13, label %5

13:                                               ; preds = %5, %1
  %14 = bitcast %struct.tre_mem_struct* %0 to i8*
  tail call void @free(i8* noundef %14) #2
  ret void
}

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #1

; Function Attrs: nounwind optsize strictfp
define hidden i8* @__tre_mem_alloc_impl(%struct.tre_mem_struct* nocapture noundef %0, i32 noundef %1, i8* noundef %2, i32 noundef %3, i64 noundef %4) local_unnamed_addr #0 {
  %6 = getelementptr inbounds %struct.tre_mem_struct, %struct.tre_mem_struct* %0, i64 0, i32 4
  %7 = load i32, i32* %6, align 8, !tbaa !13
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %68

9:                                                ; preds = %5
  %10 = getelementptr inbounds %struct.tre_mem_struct, %struct.tre_mem_struct* %0, i64 0, i32 3
  %11 = load i64, i64* %10, align 8, !tbaa !14
  %12 = icmp ult i64 %11, %4
  br i1 %12, label %16, label %13

13:                                               ; preds = %9
  %14 = getelementptr inbounds %struct.tre_mem_struct, %struct.tre_mem_struct* %0, i64 0, i32 2
  %15 = load i8*, i8** %14, align 8, !tbaa !15
  br label %52

16:                                               ; preds = %9
  %17 = icmp eq i32 %1, 0
  br i1 %17, label %21, label %18

18:                                               ; preds = %16
  %19 = icmp eq i8* %2, null
  br i1 %19, label %20, label %52

20:                                               ; preds = %18
  store i32 1, i32* %6, align 8, !tbaa !13
  br label %68

21:                                               ; preds = %16
  %22 = shl i64 %4, 3
  %23 = icmp ugt i64 %22, 1024
  %24 = shl i64 %4, 35
  %25 = ashr exact i64 %24, 32
  %26 = select i1 %23, i64 %25, i64 1024
  %27 = tail call i8* @malloc(i64 noundef 16) #2
  %28 = icmp eq i8* %27, null
  br i1 %28, label %29, label %30

29:                                               ; preds = %21
  store i32 1, i32* %6, align 8, !tbaa !13
  br label %68

30:                                               ; preds = %21
  %31 = tail call i8* @malloc(i64 noundef %26) #2
  %32 = bitcast i8* %27 to i8**
  store i8* %31, i8** %32, align 8, !tbaa !10
  %33 = icmp eq i8* %31, null
  br i1 %33, label %34, label %35

34:                                               ; preds = %30
  tail call void @free(i8* noundef nonnull %27) #2
  store i32 1, i32* %6, align 8, !tbaa !13
  br label %68

35:                                               ; preds = %30
  %36 = getelementptr inbounds i8, i8* %27, i64 8
  %37 = bitcast i8* %36 to %struct.tre_list**
  store %struct.tre_list* null, %struct.tre_list** %37, align 8, !tbaa !12
  %38 = getelementptr inbounds %struct.tre_mem_struct, %struct.tre_mem_struct* %0, i64 0, i32 1
  %39 = load %struct.tre_list*, %struct.tre_list** %38, align 8, !tbaa !16
  %40 = icmp eq %struct.tre_list* %39, null
  br i1 %40, label %44, label %41

41:                                               ; preds = %35
  %42 = getelementptr inbounds %struct.tre_list, %struct.tre_list* %39, i64 0, i32 1
  %43 = bitcast %struct.tre_list** %42 to i8**
  store i8* %27, i8** %43, align 8, !tbaa !12
  br label %44

44:                                               ; preds = %41, %35
  %45 = getelementptr inbounds %struct.tre_mem_struct, %struct.tre_mem_struct* %0, i64 0, i32 0
  %46 = load %struct.tre_list*, %struct.tre_list** %45, align 8, !tbaa !3
  %47 = icmp eq %struct.tre_list* %46, null
  br i1 %47, label %48, label %50

48:                                               ; preds = %44
  %49 = bitcast %struct.tre_mem_struct* %0 to i8**
  store i8* %27, i8** %49, align 8, !tbaa !3
  br label %50

50:                                               ; preds = %48, %44
  %51 = bitcast %struct.tre_list** %38 to i8**
  store i8* %27, i8** %51, align 8, !tbaa !16
  br label %52

52:                                               ; preds = %18, %13, %50
  %53 = phi i64 [ %11, %13 ], [ %26, %50 ], [ 1024, %18 ]
  %54 = phi i8* [ %15, %13 ], [ %31, %50 ], [ %2, %18 ]
  %55 = getelementptr inbounds %struct.tre_mem_struct, %struct.tre_mem_struct* %0, i64 0, i32 2
  %56 = ptrtoint i8* %54 to i64
  %57 = add i64 %56, %4
  %58 = and i64 %57, 7
  %59 = icmp eq i64 %58, 0
  %60 = sub nuw nsw i64 8, %58
  %61 = select i1 %59, i64 0, i64 %60
  %62 = add i64 %61, %4
  %63 = getelementptr inbounds i8, i8* %54, i64 %62
  store i8* %63, i8** %55, align 8, !tbaa !15
  %64 = sub i64 %53, %62
  store i64 %64, i64* %10, align 8, !tbaa !14
  %65 = icmp eq i32 %3, 0
  br i1 %65, label %68, label %66

66:                                               ; preds = %52
  %67 = tail call i8* @memset(i8* noundef %54, i32 noundef 0, i64 noundef %62) #2
  br label %68

68:                                               ; preds = %52, %66, %29, %34, %20, %5
  %69 = phi i8* [ null, %5 ], [ null, %20 ], [ null, %34 ], [ null, %29 ], [ %54, %66 ], [ %54, %52 ]
  ret i8* %69
}

; Function Attrs: optsize
declare i8* @malloc(i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !5, i64 0}
!4 = !{!"tre_mem_struct", !5, i64 0, !5, i64 8, !5, i64 16, !8, i64 24, !9, i64 32, !5, i64 40}
!5 = !{!"any pointer", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C/C++ TBAA"}
!8 = !{!"long", !6, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = !{!11, !5, i64 0}
!11 = !{!"tre_list", !5, i64 0, !5, i64 8}
!12 = !{!11, !5, i64 8}
!13 = !{!4, !9, i64 32}
!14 = !{!4, !8, i64 24}
!15 = !{!4, !5, i64 16}
!16 = !{!4, !5, i64 8}
