; ModuleID = 'src/malloc/mallocng/donate.c'
source_filename = "src/malloc/mallocng/donate.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.malloc_context = type { i64, i32, i32, %struct.meta*, %struct.meta*, i64, i64, i64, %struct.meta_area*, %struct.meta_area*, i8*, [48 x %struct.meta*], [48 x i64], [32 x i8], [32 x i8], i8, i64 }
%struct.meta = type { %struct.meta*, %struct.meta*, %struct.group*, i32, i32, i64 }
%struct.group = type { %struct.meta*, i8, [7 x i8], [0 x i8] }
%struct.meta_area = type { i64, %struct.meta_area*, i32, [0 x %struct.meta] }

@__malloc_size_classes = external hidden local_unnamed_addr constant [0 x i16], align 2
@__malloc_context = external hidden local_unnamed_addr global %struct.malloc_context, align 8

; Function Attrs: nounwind optsize strictfp
define hidden void @__malloc_donate(i8* noundef %0, i8* noundef %1) local_unnamed_addr #0 {
  %3 = ptrtoint i8* %1 to i64
  %4 = ptrtoint i8* %0 to i64
  %5 = sub i64 %3, %4
  %6 = sub i64 0, %4
  %7 = and i64 %6, 15
  %8 = add i64 %7, %4
  %9 = and i64 %3, -16
  %10 = tail call i8* @memset(i8* noundef %0, i32 noundef 0, i64 noundef %5) #2
  %11 = icmp ugt i64 %9, %8
  br i1 %11, label %12, label %72

12:                                               ; preds = %2, %66
  %13 = phi i64 [ %68, %66 ], [ 47, %2 ]
  %14 = phi i64 [ %67, %66 ], [ %8, %2 ]
  %15 = sub i64 %9, %14
  %16 = getelementptr inbounds [0 x i16], [0 x i16]* @__malloc_size_classes, i64 0, i64 %13
  %17 = load i16, i16* %16, align 2, !tbaa !3
  %18 = zext i16 %17 to i64
  %19 = shl nuw nsw i64 %18, 4
  %20 = add nuw nsw i64 %19, 16
  %21 = icmp ult i64 %15, %20
  br i1 %21, label %66, label %22

22:                                               ; preds = %12
  %23 = tail call %struct.meta* @__malloc_alloc_meta() #2
  %24 = getelementptr inbounds %struct.meta, %struct.meta* %23, i64 0, i32 3
  store volatile i32 0, i32* %24, align 8, !tbaa !7
  %25 = getelementptr inbounds %struct.meta, %struct.meta* %23, i64 0, i32 4
  store volatile i32 1, i32* %25, align 4, !tbaa !12
  %26 = inttoptr i64 %14 to %struct.group*
  %27 = getelementptr inbounds %struct.meta, %struct.meta* %23, i64 0, i32 2
  store %struct.group* %26, %struct.group** %27, align 8, !tbaa !13
  %28 = getelementptr inbounds %struct.group, %struct.group* %26, i64 0, i32 0
  store %struct.meta* %23, %struct.meta** %28, align 8, !tbaa !14
  %29 = getelementptr inbounds %struct.meta, %struct.meta* %23, i64 0, i32 5
  %30 = shl nuw nsw i64 %13, 6
  %31 = and i64 %30, 4032
  store i64 %31, i64* %29, align 8
  %32 = bitcast %struct.group** %27 to i8**
  %33 = load i8*, i8** %32, align 8, !tbaa !13
  %34 = getelementptr inbounds i8, i8* %33, i64 12
  store i8 0, i8* %34, align 1, !tbaa !15
  %35 = load i8*, i8** %32, align 8, !tbaa !13
  %36 = getelementptr inbounds i8, i8* %35, i64 13
  store i8 -1, i8* %36, align 1, !tbaa !15
  %37 = load %struct.group*, %struct.group** %27, align 8, !tbaa !13
  %38 = zext i16 %17 to i32
  %39 = shl nuw nsw i32 %38, 4
  %40 = add nsw i32 %39, -4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds %struct.group, %struct.group* %37, i64 0, i32 3, i64 %41
  store i8 0, i8* %42, align 1, !tbaa !15
  %43 = getelementptr inbounds %struct.malloc_context, %struct.malloc_context* @__malloc_context, i64 0, i32 11, i64 %13
  %44 = getelementptr inbounds %struct.meta, %struct.meta* %23, i64 0, i32 1
  %45 = load %struct.meta*, %struct.meta** %44, align 8, !tbaa !16
  %46 = icmp eq %struct.meta* %45, null
  br i1 %46, label %48, label %47

47:                                               ; preds = %22
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %48

48:                                               ; preds = %47, %22
  %49 = getelementptr inbounds %struct.meta, %struct.meta* %23, i64 0, i32 0
  %50 = load %struct.meta*, %struct.meta** %49, align 8, !tbaa !18
  %51 = icmp eq %struct.meta* %50, null
  br i1 %51, label %53, label %52

52:                                               ; preds = %48
  tail call void asm sideeffect "hlt", "~{memory},~{dirflag},~{fpsr},~{flags}"() #3, !srcloc !17
  br label %53

53:                                               ; preds = %52, %48
  %54 = load %struct.meta*, %struct.meta** %43, align 8, !tbaa !14
  %55 = icmp eq %struct.meta* %54, null
  br i1 %55, label %62, label %56

56:                                               ; preds = %53
  store %struct.meta* %54, %struct.meta** %44, align 8, !tbaa !16
  %57 = getelementptr inbounds %struct.meta, %struct.meta* %54, i64 0, i32 0
  %58 = load %struct.meta*, %struct.meta** %57, align 8, !tbaa !18
  store %struct.meta* %58, %struct.meta** %49, align 8, !tbaa !18
  %59 = getelementptr inbounds %struct.meta, %struct.meta* %58, i64 0, i32 1
  store %struct.meta* %23, %struct.meta** %59, align 8, !tbaa !16
  %60 = load %struct.meta*, %struct.meta** %44, align 8, !tbaa !16
  %61 = getelementptr inbounds %struct.meta, %struct.meta* %60, i64 0, i32 0
  br label %63

62:                                               ; preds = %53
  store %struct.meta* %23, %struct.meta** %44, align 8, !tbaa !16
  store %struct.meta* %23, %struct.meta** %49, align 8, !tbaa !18
  br label %63

63:                                               ; preds = %62, %56
  %64 = phi %struct.meta** [ %43, %62 ], [ %61, %56 ]
  store %struct.meta* %23, %struct.meta** %64, align 8, !tbaa !14
  %65 = add i64 %20, %14
  br label %66

66:                                               ; preds = %63, %12
  %67 = phi i64 [ %14, %12 ], [ %65, %63 ]
  %68 = add nsw i64 %13, -4
  %69 = icmp ugt i64 %13, 4
  %70 = icmp ugt i64 %9, %67
  %71 = select i1 %69, i1 %70, i1 false
  br i1 %71, label %12, label %72

72:                                               ; preds = %66, %2
  ret void
}

; Function Attrs: optsize
declare i8* @memset(i8* noundef, i32 noundef, i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden %struct.meta* @__malloc_alloc_meta() local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #3 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"short", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !10, i64 24}
!8 = !{!"meta", !9, i64 0, !9, i64 8, !9, i64 16, !10, i64 24, !10, i64 28, !11, i64 32, !11, i64 32, !11, i64 32, !11, i64 33}
!9 = !{!"any pointer", !5, i64 0}
!10 = !{!"int", !5, i64 0}
!11 = !{!"long", !5, i64 0}
!12 = !{!8, !10, i64 28}
!13 = !{!8, !9, i64 16}
!14 = !{!9, !9, i64 0}
!15 = !{!5, !5, i64 0}
!16 = !{!8, !9, i64 8}
!17 = !{i64 276270}
!18 = !{!8, !9, i64 0}
