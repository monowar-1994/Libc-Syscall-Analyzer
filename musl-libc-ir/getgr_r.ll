; ModuleID = 'src/passwd/getgr_r.c'
source_filename = "src/passwd/getgr_r.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.group = type { i8*, i8*, i32, i8** }

; Function Attrs: nounwind optsize strictfp
define i32 @getgrnam_r(i8* noundef %0, %struct.group* noundef %1, i8* noundef %2, i64 noundef %3, %struct.group** noundef %4) local_unnamed_addr #0 {
  %6 = tail call fastcc i32 @getgr_r(i8* noundef %0, i32 noundef 0, %struct.group* noundef %1, i8* noundef %2, i64 noundef %3, %struct.group** noundef %4) #4
  ret i32 %6
}

; Function Attrs: nounwind optsize strictfp
define internal fastcc i32 @getgr_r(i8* noundef %0, i32 noundef %1, %struct.group* noundef %2, i8* noundef %3, i64 noundef %4, %struct.group** noundef %5) unnamed_addr #0 {
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8**, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = bitcast i8** %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %12) #5
  store i8* null, i8** %7, align 8, !tbaa !3
  %13 = bitcast i64* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %13) #5
  store i64 0, i64* %8, align 8, !tbaa !7
  %14 = bitcast i8*** %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %14) #5
  store i8** null, i8*** %9, align 8, !tbaa !3
  %15 = bitcast i64* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* nonnull %15) #5
  store i64 0, i64* %10, align 8, !tbaa !7
  %16 = bitcast i32* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %16) #5
  %17 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %11) #6
  %18 = call i32 @__getgr_a(i8* noundef %0, i32 noundef %1, %struct.group* noundef %2, i8** noundef nonnull %7, i64* noundef nonnull %8, i8*** noundef nonnull %9, i64* noundef nonnull %10, %struct.group** noundef %5) #6
  %19 = load %struct.group*, %struct.group** %5, align 8, !tbaa !3
  %20 = icmp eq %struct.group* %19, null
  br i1 %20, label %84, label %21

21:                                               ; preds = %6
  %22 = load i64, i64* %8, align 8, !tbaa !7
  %23 = load i64, i64* %10, align 8, !tbaa !7
  %24 = shl i64 %23, 3
  %25 = add i64 %22, 40
  %26 = add i64 %25, %24
  %27 = icmp ugt i64 %26, %4
  br i1 %27, label %28, label %29

28:                                               ; preds = %21
  store %struct.group* null, %struct.group** %5, align 8, !tbaa !3
  br label %84

29:                                               ; preds = %21
  %30 = ptrtoint i8* %3 to i64
  %31 = sub i64 0, %30
  %32 = and i64 %31, 15
  %33 = getelementptr inbounds i8, i8* %3, i64 %32
  %34 = getelementptr inbounds %struct.group, %struct.group* %2, i64 0, i32 3
  %35 = bitcast i8*** %34 to i8**
  store i8* %33, i8** %35, align 8, !tbaa !9
  %36 = add i64 %24, 8
  %37 = getelementptr inbounds i8, i8* %33, i64 %36
  %38 = load i8*, i8** %7, align 8, !tbaa !3
  %39 = call i8* @memcpy(i8* noundef %37, i8* noundef %38, i64 noundef %22) #6
  %40 = getelementptr inbounds %struct.group, %struct.group* %2, i64 0, i32 0
  %41 = load i8*, i8** %40, align 8, !tbaa !12
  %42 = load i8*, i8** %7, align 8, !tbaa !3
  %43 = ptrtoint i8* %41 to i64
  %44 = ptrtoint i8* %42 to i64
  %45 = sub i64 %43, %44
  %46 = getelementptr inbounds i8, i8* %37, i64 %45
  store i8* %46, i8** %40, align 8, !tbaa !12
  %47 = getelementptr inbounds %struct.group, %struct.group* %2, i64 0, i32 1
  %48 = load i8*, i8** %47, align 8, !tbaa !13
  %49 = ptrtoint i8* %48 to i64
  %50 = sub i64 %49, %44
  %51 = getelementptr inbounds i8, i8* %37, i64 %50
  store i8* %51, i8** %47, align 8, !tbaa !13
  %52 = load i8**, i8*** %9, align 8, !tbaa !3
  %53 = load i8*, i8** %52, align 8, !tbaa !3
  %54 = icmp eq i8* %53, null
  br i1 %54, label %80, label %55

55:                                               ; preds = %29
  %56 = ptrtoint i8* %53 to i64
  %57 = ptrtoint i8* %42 to i64
  %58 = sub i64 %56, %57
  %59 = getelementptr inbounds i8, i8* %37, i64 %58
  %60 = load i8**, i8*** %34, align 8, !tbaa !9
  store i8* %59, i8** %60, align 8, !tbaa !3
  %61 = load i8**, i8*** %9, align 8, !tbaa !3
  %62 = getelementptr inbounds i8*, i8** %61, i64 1
  %63 = load i8*, i8** %62, align 8, !tbaa !3
  %64 = icmp eq i8* %63, null
  br i1 %64, label %80, label %65

65:                                               ; preds = %55, %65
  %66 = phi i8* [ %78, %65 ], [ %63, %55 ]
  %67 = phi i64 [ %75, %65 ], [ 1, %55 ]
  %68 = load i8*, i8** %7, align 8, !tbaa !3
  %69 = ptrtoint i8* %66 to i64
  %70 = ptrtoint i8* %68 to i64
  %71 = sub i64 %69, %70
  %72 = getelementptr inbounds i8, i8* %37, i64 %71
  %73 = load i8**, i8*** %34, align 8, !tbaa !9
  %74 = getelementptr inbounds i8*, i8** %73, i64 %67
  store i8* %72, i8** %74, align 8, !tbaa !3
  %75 = add i64 %67, 1
  %76 = load i8**, i8*** %9, align 8, !tbaa !3
  %77 = getelementptr inbounds i8*, i8** %76, i64 %75
  %78 = load i8*, i8** %77, align 8, !tbaa !3
  %79 = icmp eq i8* %78, null
  br i1 %79, label %80, label %65

80:                                               ; preds = %65, %55, %29
  %81 = phi i64 [ 0, %29 ], [ 1, %55 ], [ %75, %65 ]
  %82 = load i8**, i8*** %34, align 8, !tbaa !9
  %83 = getelementptr inbounds i8*, i8** %82, i64 %81
  store i8* null, i8** %83, align 8, !tbaa !3
  br label %84

84:                                               ; preds = %6, %28, %80
  %85 = phi i32 [ %18, %80 ], [ %18, %6 ], [ 34, %28 ]
  %86 = bitcast i8*** %9 to i8**
  %87 = load i8*, i8** %86, align 8, !tbaa !3
  call void @free(i8* noundef %87) #6
  %88 = load i8*, i8** %7, align 8, !tbaa !3
  call void @free(i8* noundef %88) #6
  %89 = load i32, i32* %11, align 4, !tbaa !14
  %90 = call i32 @pthread_setcancelstate(i32 noundef %89, i32* noundef null) #6
  %91 = icmp eq i32 %85, 0
  br i1 %91, label %94, label %92

92:                                               ; preds = %84
  %93 = tail call i32* @___errno_location() #7
  store i32 %85, i32* %93, align 4, !tbaa !14
  br label %94

94:                                               ; preds = %92, %84
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %16) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %15) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %14) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %13) #5
  call void @llvm.lifetime.end.p0i8(i64 8, i8* nonnull %12) #5
  ret i32 %85
}

; Function Attrs: nounwind optsize strictfp
define i32 @getgrgid_r(i32 noundef %0, %struct.group* noundef %1, i8* noundef %2, i64 noundef %3, %struct.group** noundef %4) local_unnamed_addr #0 {
  %6 = tail call fastcc i32 @getgr_r(i8* noundef null, i32 noundef %0, %struct.group* noundef %1, i8* noundef %2, i64 noundef %3, %struct.group** noundef %4) #4
  ret i32 %6
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare hidden i32 @__getgr_a(i8* noundef, i32 noundef, %struct.group* noundef, i8** noundef, i64* noundef, i8*** noundef, i64* noundef, %struct.group** noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #2

; Function Attrs: optsize
declare void @free(i8* noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nobuiltin optsize strictfp "no-builtins" }
attributes #5 = { nounwind strictfp }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #7 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"long", !5, i64 0}
!9 = !{!10, !4, i64 24}
!10 = !{!"group", !4, i64 0, !4, i64 8, !11, i64 16, !4, i64 24}
!11 = !{!"int", !5, i64 0}
!12 = !{!10, !4, i64 0}
!13 = !{!10, !4, i64 8}
!14 = !{!11, !11, i64 0}
